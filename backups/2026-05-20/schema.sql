


SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;


COMMENT ON SCHEMA "public" IS 'standard public schema';



CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions";






CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault";






CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions";






CREATE OR REPLACE FUNCTION "public"."admin_stats"() RETURNS json
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
declare
  caller_admin boolean;
  result json;
begin
  select coalesce(is_admin, false) into caller_admin
  from profiles where id = auth.uid();
  if not coalesce(caller_admin, false) then
    raise exception 'not authorized';
  end if;

  select json_build_object(
    'total_users',           (select count(*) from auth.users),
    'new_users_7d',          (select count(*) from auth.users where created_at >= now() - interval '7 days'),
    'new_users_30d',         (select count(*) from auth.users where created_at >= now() - interval '30 days'),
    'paying_plus_monthly',   (select count(*) from profiles
                                where lower(coalesce(tier,'free')) = 'plus'
                                  and coalesce(billing_interval,'monthly') = 'monthly'
                                  and (premium_until is null or premium_until > now())),
    'paying_plus_yearly',    (select count(*) from profiles
                                where lower(coalesce(tier,'free')) = 'plus'
                                  and coalesce(billing_interval,'monthly') = 'yearly'
                                  and (premium_until is null or premium_until > now())),
    'paying_scholar_monthly',(select count(*) from profiles
                                where lower(coalesce(tier,'free')) = 'scholar'
                                  and coalesce(billing_interval,'monthly') = 'monthly'
                                  and (premium_until is null or premium_until > now())),
    'paying_scholar_yearly', (select count(*) from profiles
                                where lower(coalesce(tier,'free')) = 'scholar'
                                  and coalesce(billing_interval,'monthly') = 'yearly'
                                  and (premium_until is null or premium_until > now())),
    'free_users',            (select count(*) from profiles
                                where lower(coalesce(tier,'free')) = 'free'
                                   or (premium_until is not null and premium_until <= now())),
    'admins',                (select count(*) from profiles where is_admin = true),
    'active_7d',             (select count(distinct user_id) from practice_sessions
                                where started_at >= now() - interval '7 days'),
    'active_30d',            (select count(distinct user_id) from practice_sessions
                                where started_at >= now() - interval '30 days')
  ) into result;
  return result;
end;
$$;


ALTER FUNCTION "public"."admin_stats"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."delete_user"() RETURNS "void"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
begin
  delete from auth.users where id = auth.uid();
end; $$;


ALTER FUNCTION "public"."delete_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."handle_new_user"() RETURNS "trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
begin
  insert into profiles (id, full_name)
  values (new.id, coalesce(new.raw_user_meta_data->>'full_name', new.raw_user_meta_data->>'name'))
  on conflict (id) do nothing;
  return new;
end; $$;


ALTER FUNCTION "public"."handle_new_user"() OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."log_mistake"("p_topic_id" "uuid", "p_paragraph_id" "uuid", "p_word_index" integer, "p_word_text" "text") RETURNS "void"
    LANGUAGE "sql" SECURITY DEFINER
    SET "search_path" TO 'public'
    AS $$
  insert into mistakes (user_id, topic_id, paragraph_id, word_index, word_text)
  values (auth.uid(), p_topic_id, p_paragraph_id, p_word_index, p_word_text)
  on conflict (user_id, paragraph_id, word_index) where mastered_at is null
  do nothing;
$$;


ALTER FUNCTION "public"."log_mistake"("p_topic_id" "uuid", "p_paragraph_id" "uuid", "p_word_index" integer, "p_word_text" "text") OWNER TO "postgres";


CREATE OR REPLACE FUNCTION "public"."rls_auto_enable"() RETURNS "event_trigger"
    LANGUAGE "plpgsql" SECURITY DEFINER
    SET "search_path" TO 'pg_catalog'
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN
    SELECT *
    FROM pg_event_trigger_ddl_commands()
    WHERE command_tag IN ('CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO')
      AND object_type IN ('table','partitioned table')
  LOOP
     IF cmd.schema_name IS NOT NULL AND cmd.schema_name IN ('public') AND cmd.schema_name NOT IN ('pg_catalog','information_schema') AND cmd.schema_name NOT LIKE 'pg_toast%' AND cmd.schema_name NOT LIKE 'pg_temp%' THEN
      BEGIN
        EXECUTE format('alter table if exists %s enable row level security', cmd.object_identity);
        RAISE LOG 'rls_auto_enable: enabled RLS on %', cmd.object_identity;
      EXCEPTION
        WHEN OTHERS THEN
          RAISE LOG 'rls_auto_enable: failed to enable RLS on %', cmd.object_identity;
      END;
     ELSE
        RAISE LOG 'rls_auto_enable: skip % (either system schema or not in enforced list: %.)', cmd.object_identity, cmd.schema_name;
     END IF;
  END LOOP;
END;
$$;


ALTER FUNCTION "public"."rls_auto_enable"() OWNER TO "postgres";

SET default_tablespace = '';

SET default_table_access_method = "heap";


CREATE TABLE IF NOT EXISTS "public"."admin_expenses" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "label" "text" DEFAULT 'New expense'::"text" NOT NULL,
    "amount_pence" integer DEFAULT 0 NOT NULL,
    "notes" "text",
    "created_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "period_months" integer DEFAULT 1 NOT NULL,
    CONSTRAINT "admin_expenses_period_months_check" CHECK (("period_months" >= 0))
);


ALTER TABLE "public"."admin_expenses" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."admin_metric_snapshots" (
    "user_id" "uuid" NOT NULL,
    "snapshot_date" "date" DEFAULT CURRENT_DATE NOT NULL,
    "mrr_pence" integer DEFAULT 0 NOT NULL,
    "expenses_pence" integer DEFAULT 0 NOT NULL,
    "total_users" integer DEFAULT 0 NOT NULL,
    "paying_users" integer DEFAULT 0 NOT NULL
);


ALTER TABLE "public"."admin_metric_snapshots" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."billing" (
    "user_id" "uuid" NOT NULL,
    "stripe_customer_id" "text",
    "stripe_subscription_id" "text",
    "stripe_status" "text",
    "updated_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."billing" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."folders" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "name" "text" DEFAULT ''::"text" NOT NULL,
    "icon" "text" DEFAULT '◫'::"text",
    "position" integer DEFAULT 0 NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "parent_folder_id" "uuid",
    "color" "text"
);


ALTER TABLE "public"."folders" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."friendships" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "requester_id" "uuid" NOT NULL,
    "recipient_id" "uuid" NOT NULL,
    "status" "text" DEFAULT 'pending'::"text" NOT NULL,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "responded_at" timestamp with time zone,
    CONSTRAINT "friendships_check" CHECK (("requester_id" <> "recipient_id"))
);


ALTER TABLE "public"."friendships" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."mistakes" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "topic_id" "uuid",
    "paragraph_id" "uuid" NOT NULL,
    "word_index" integer NOT NULL,
    "word_text" "text" NOT NULL,
    "miss_count" integer DEFAULT 1 NOT NULL,
    "first_seen_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "last_seen_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "mastered_at" timestamp with time zone
);


ALTER TABLE "public"."mistakes" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."paragraphs" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "topic_id" "uuid" NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    "title" "text" DEFAULT ''::"text",
    "question" "text" DEFAULT ''::"text",
    "text" "text" DEFAULT ''::"text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "kind" "text" DEFAULT 'text'::"text" NOT NULL,
    "image_url" "text",
    "annotations" "jsonb"
);


ALTER TABLE "public"."paragraphs" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."practice_sessions" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "topic_id" "uuid",
    "started_at" timestamp with time zone DEFAULT "now"() NOT NULL
);


ALTER TABLE "public"."practice_sessions" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."profiles" (
    "id" "uuid" NOT NULL,
    "username" "text",
    "full_name" "text",
    "created_at" timestamp with time zone DEFAULT "now"(),
    "is_admin" boolean DEFAULT false,
    "tier" "text" DEFAULT 'free'::"text" NOT NULL,
    "premium_until" timestamp with time zone,
    "billing_interval" "text" DEFAULT 'monthly'::"text",
    "accent_color" "text" DEFAULT 'green'::"text",
    "font_family" "text" DEFAULT 'default'::"text",
    "font_size" "text" DEFAULT 'md'::"text",
    "para_spacing" "text" DEFAULT 'normal'::"text",
    CONSTRAINT "profiles_billing_interval_check" CHECK (("billing_interval" = ANY (ARRAY['monthly'::"text", 'yearly'::"text"]))),
    CONSTRAINT "profiles_tier_check" CHECK (("tier" = ANY (ARRAY['free'::"text", 'plus'::"text", 'scholar'::"text"])))
);


ALTER TABLE "public"."profiles" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."review_state" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "paragraph_id" "uuid" NOT NULL,
    "ease" real DEFAULT 2.5 NOT NULL,
    "interval_days" integer DEFAULT 0 NOT NULL,
    "repetitions" integer DEFAULT 0 NOT NULL,
    "due_at" timestamp with time zone DEFAULT "now"() NOT NULL,
    "last_reviewed_at" timestamp with time zone
);


ALTER TABLE "public"."review_state" OWNER TO "postgres";


CREATE TABLE IF NOT EXISTS "public"."topics" (
    "id" "uuid" DEFAULT "gen_random_uuid"() NOT NULL,
    "user_id" "uuid" NOT NULL,
    "name" "text" DEFAULT ''::"text" NOT NULL,
    "icon" "text" DEFAULT '◌'::"text",
    "ignore_diacritics" boolean DEFAULT false,
    "created_at" timestamp with time zone DEFAULT "now"(),
    "updated_at" timestamp with time zone DEFAULT "now"(),
    "folder_id" "uuid",
    "lang" "text" DEFAULT 'en-GB'::"text",
    "position" integer,
    "default_cover" integer DEFAULT 50,
    "hint_policy" "text" DEFAULT 'first_letter'::"text",
    "randomize" boolean DEFAULT false,
    CONSTRAINT "topics_default_cover_check" CHECK ((("default_cover" >= 0) AND ("default_cover" <= 100))),
    CONSTRAINT "topics_hint_policy_check" CHECK (("hint_policy" = ANY (ARRAY['first_letter'::"text", 'random'::"text", 'reveal'::"text"])))
);


ALTER TABLE "public"."topics" OWNER TO "postgres";


ALTER TABLE ONLY "public"."admin_expenses"
    ADD CONSTRAINT "admin_expenses_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."admin_metric_snapshots"
    ADD CONSTRAINT "admin_metric_snapshots_pkey" PRIMARY KEY ("user_id", "snapshot_date");



ALTER TABLE ONLY "public"."billing"
    ADD CONSTRAINT "billing_pkey" PRIMARY KEY ("user_id");



ALTER TABLE ONLY "public"."folders"
    ADD CONSTRAINT "folders_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."friendships"
    ADD CONSTRAINT "friendships_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."friendships"
    ADD CONSTRAINT "friendships_requester_id_recipient_id_key" UNIQUE ("requester_id", "recipient_id");



ALTER TABLE ONLY "public"."mistakes"
    ADD CONSTRAINT "mistakes_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."mistakes"
    ADD CONSTRAINT "mistakes_user_id_paragraph_id_word_index_key" UNIQUE ("user_id", "paragraph_id", "word_index");



ALTER TABLE ONLY "public"."paragraphs"
    ADD CONSTRAINT "paragraphs_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."practice_sessions"
    ADD CONSTRAINT "practice_sessions_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "profiles_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "profiles_username_key" UNIQUE ("username");



ALTER TABLE ONLY "public"."review_state"
    ADD CONSTRAINT "review_state_pkey" PRIMARY KEY ("id");



ALTER TABLE ONLY "public"."review_state"
    ADD CONSTRAINT "review_state_user_id_paragraph_id_key" UNIQUE ("user_id", "paragraph_id");



ALTER TABLE ONLY "public"."topics"
    ADD CONSTRAINT "topics_pkey" PRIMARY KEY ("id");



CREATE INDEX "idx_admin_expenses_user_id" ON "public"."admin_expenses" USING "btree" ("user_id");



CREATE INDEX "idx_folders_parent" ON "public"."folders" USING "btree" ("parent_folder_id");



CREATE INDEX "idx_folders_user_id" ON "public"."folders" USING "btree" ("user_id");



CREATE INDEX "idx_folders_user_position" ON "public"."folders" USING "btree" ("user_id", "position");



CREATE INDEX "idx_friendships_recipient" ON "public"."friendships" USING "btree" ("recipient_id");



CREATE INDEX "idx_friendships_recipient_id" ON "public"."friendships" USING "btree" ("recipient_id");



CREATE INDEX "idx_friendships_requester" ON "public"."friendships" USING "btree" ("requester_id");



CREATE INDEX "idx_mistakes_paragraph_id" ON "public"."mistakes" USING "btree" ("paragraph_id");



CREATE INDEX "idx_mistakes_topic_id" ON "public"."mistakes" USING "btree" ("topic_id");



CREATE UNIQUE INDEX "idx_mistakes_unique_open" ON "public"."mistakes" USING "btree" ("user_id", "paragraph_id", "word_index") WHERE ("mastered_at" IS NULL);



CREATE INDEX "idx_mistakes_user_unmastered" ON "public"."mistakes" USING "btree" ("user_id", "last_seen_at" DESC) WHERE ("mastered_at" IS NULL);



CREATE INDEX "idx_paragraphs_topic_id" ON "public"."paragraphs" USING "btree" ("topic_id");



CREATE INDEX "idx_paragraphs_topic_position" ON "public"."paragraphs" USING "btree" ("topic_id", "position");



CREATE INDEX "idx_practice_sessions_topic_id" ON "public"."practice_sessions" USING "btree" ("topic_id");



CREATE INDEX "idx_practice_sessions_user_id" ON "public"."practice_sessions" USING "btree" ("user_id");



CREATE INDEX "idx_practice_sessions_user_started" ON "public"."practice_sessions" USING "btree" ("user_id", "started_at" DESC);



CREATE INDEX "idx_review_state_paragraph_id" ON "public"."review_state" USING "btree" ("paragraph_id");



CREATE INDEX "idx_review_state_user_due" ON "public"."review_state" USING "btree" ("user_id", "due_at");



CREATE INDEX "idx_topics_folder_id" ON "public"."topics" USING "btree" ("folder_id");



CREATE INDEX "idx_topics_user_created" ON "public"."topics" USING "btree" ("user_id", "created_at" DESC);



CREATE INDEX "idx_topics_user_id" ON "public"."topics" USING "btree" ("user_id");



CREATE INDEX "idx_topics_user_position" ON "public"."topics" USING "btree" ("user_id", "position");



ALTER TABLE ONLY "public"."admin_expenses"
    ADD CONSTRAINT "admin_expenses_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."admin_metric_snapshots"
    ADD CONSTRAINT "admin_metric_snapshots_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."billing"
    ADD CONSTRAINT "billing_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."folders"
    ADD CONSTRAINT "folders_parent_folder_id_fkey" FOREIGN KEY ("parent_folder_id") REFERENCES "public"."folders"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."folders"
    ADD CONSTRAINT "folders_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."friendships"
    ADD CONSTRAINT "friendships_recipient_id_fkey" FOREIGN KEY ("recipient_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."friendships"
    ADD CONSTRAINT "friendships_requester_id_fkey" FOREIGN KEY ("requester_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."mistakes"
    ADD CONSTRAINT "mistakes_paragraph_id_fkey" FOREIGN KEY ("paragraph_id") REFERENCES "public"."paragraphs"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."mistakes"
    ADD CONSTRAINT "mistakes_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."mistakes"
    ADD CONSTRAINT "mistakes_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."paragraphs"
    ADD CONSTRAINT "paragraphs_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."practice_sessions"
    ADD CONSTRAINT "practice_sessions_topic_id_fkey" FOREIGN KEY ("topic_id") REFERENCES "public"."topics"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."practice_sessions"
    ADD CONSTRAINT "practice_sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."profiles"
    ADD CONSTRAINT "profiles_id_fkey" FOREIGN KEY ("id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."review_state"
    ADD CONSTRAINT "review_state_paragraph_id_fkey" FOREIGN KEY ("paragraph_id") REFERENCES "public"."paragraphs"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."review_state"
    ADD CONSTRAINT "review_state_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE ONLY "public"."topics"
    ADD CONSTRAINT "topics_folder_id_fkey" FOREIGN KEY ("folder_id") REFERENCES "public"."folders"("id") ON DELETE SET NULL;



ALTER TABLE ONLY "public"."topics"
    ADD CONSTRAINT "topics_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users"("id") ON DELETE CASCADE;



ALTER TABLE "public"."admin_expenses" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "admin_expenses owner all" ON "public"."admin_expenses" USING (((( SELECT "auth"."uid"() AS "uid") = "user_id") AND (EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = ( SELECT "auth"."uid"() AS "uid")) AND ("profiles"."is_admin" = true)))))) WITH CHECK (((( SELECT "auth"."uid"() AS "uid") = "user_id") AND (EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = ( SELECT "auth"."uid"() AS "uid")) AND ("profiles"."is_admin" = true))))));



ALTER TABLE "public"."admin_metric_snapshots" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."billing" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "billing_own_select" ON "public"."billing" FOR SELECT USING (("user_id" = ( SELECT "auth"."uid"() AS "uid")));



ALTER TABLE "public"."folders" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."friendships" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "friendships create" ON "public"."friendships" FOR INSERT WITH CHECK (("requester_id" = ( SELECT "auth"."uid"() AS "uid")));



CREATE POLICY "friendships delete" ON "public"."friendships" FOR DELETE USING ((("requester_id" = ( SELECT "auth"."uid"() AS "uid")) OR ("recipient_id" = ( SELECT "auth"."uid"() AS "uid"))));



CREATE POLICY "friendships read" ON "public"."friendships" FOR SELECT USING ((("requester_id" = ( SELECT "auth"."uid"() AS "uid")) OR ("recipient_id" = ( SELECT "auth"."uid"() AS "uid"))));



CREATE POLICY "friendships update" ON "public"."friendships" FOR UPDATE USING (("recipient_id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("recipient_id" = ( SELECT "auth"."uid"() AS "uid")));



CREATE POLICY "metrics owner all" ON "public"."admin_metric_snapshots" USING (((( SELECT "auth"."uid"() AS "uid") = "user_id") AND (EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = ( SELECT "auth"."uid"() AS "uid")) AND ("profiles"."is_admin" = true)))))) WITH CHECK (((( SELECT "auth"."uid"() AS "uid") = "user_id") AND (EXISTS ( SELECT 1
   FROM "public"."profiles"
  WHERE (("profiles"."id" = ( SELECT "auth"."uid"() AS "uid")) AND ("profiles"."is_admin" = true))))));



ALTER TABLE "public"."mistakes" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "mistakes_own_all" ON "public"."mistakes" USING (("user_id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("user_id" = ( SELECT "auth"."uid"() AS "uid")));



CREATE POLICY "own folders" ON "public"."folders" USING (("user_id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("user_id" = ( SELECT "auth"."uid"() AS "uid")));



CREATE POLICY "own paragraphs" ON "public"."paragraphs" USING ((EXISTS ( SELECT 1
   FROM "public"."topics" "t"
  WHERE (("t"."id" = "paragraphs"."topic_id") AND ("t"."user_id" = ( SELECT "auth"."uid"() AS "uid")))))) WITH CHECK ((EXISTS ( SELECT 1
   FROM "public"."topics" "t"
  WHERE (("t"."id" = "paragraphs"."topic_id") AND ("t"."user_id" = ( SELECT "auth"."uid"() AS "uid"))))));



CREATE POLICY "own topics" ON "public"."topics" USING (("user_id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("user_id" = ( SELECT "auth"."uid"() AS "uid")));



ALTER TABLE "public"."paragraphs" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."practice_sessions" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "practice_sessions insert" ON "public"."practice_sessions" FOR INSERT WITH CHECK (("user_id" = ( SELECT "auth"."uid"() AS "uid")));



CREATE POLICY "practice_sessions read" ON "public"."practice_sessions" FOR SELECT USING ((("user_id" = ( SELECT "auth"."uid"() AS "uid")) OR (EXISTS ( SELECT 1
   FROM "public"."friendships" "f"
  WHERE (("f"."status" = 'accepted'::"text") AND ((("f"."requester_id" = ( SELECT "auth"."uid"() AS "uid")) AND ("f"."recipient_id" = "practice_sessions"."user_id")) OR (("f"."recipient_id" = ( SELECT "auth"."uid"() AS "uid")) AND ("f"."requester_id" = "practice_sessions"."user_id"))))))));



ALTER TABLE "public"."profiles" ENABLE ROW LEVEL SECURITY;


CREATE POLICY "profiles insert self" ON "public"."profiles" FOR INSERT WITH CHECK (("id" = ( SELECT "auth"."uid"() AS "uid")));



CREATE POLICY "profiles read all" ON "public"."profiles" FOR SELECT USING ((( SELECT "auth"."role"() AS "role") = 'authenticated'::"text"));



CREATE POLICY "profiles update self" ON "public"."profiles" FOR UPDATE USING (("id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("id" = ( SELECT "auth"."uid"() AS "uid")));



CREATE POLICY "review_own_all" ON "public"."review_state" USING (("user_id" = ( SELECT "auth"."uid"() AS "uid"))) WITH CHECK (("user_id" = ( SELECT "auth"."uid"() AS "uid")));



ALTER TABLE "public"."review_state" ENABLE ROW LEVEL SECURITY;


ALTER TABLE "public"."topics" ENABLE ROW LEVEL SECURITY;




ALTER PUBLICATION "supabase_realtime" OWNER TO "postgres";


GRANT USAGE ON SCHEMA "public" TO "postgres";
GRANT USAGE ON SCHEMA "public" TO "anon";
GRANT USAGE ON SCHEMA "public" TO "authenticated";
GRANT USAGE ON SCHEMA "public" TO "service_role";






















































































































































REVOKE ALL ON FUNCTION "public"."admin_stats"() FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."admin_stats"() TO "authenticated";



REVOKE ALL ON FUNCTION "public"."delete_user"() FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."delete_user"() TO "authenticated";



REVOKE ALL ON FUNCTION "public"."handle_new_user"() FROM PUBLIC;



REVOKE ALL ON FUNCTION "public"."log_mistake"("p_topic_id" "uuid", "p_paragraph_id" "uuid", "p_word_index" integer, "p_word_text" "text") FROM PUBLIC;
GRANT ALL ON FUNCTION "public"."log_mistake"("p_topic_id" "uuid", "p_paragraph_id" "uuid", "p_word_index" integer, "p_word_text" "text") TO "authenticated";



REVOKE ALL ON FUNCTION "public"."rls_auto_enable"() FROM PUBLIC;


















GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."admin_expenses" TO "anon";
GRANT ALL ON TABLE "public"."admin_expenses" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."admin_expenses" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."admin_metric_snapshots" TO "anon";
GRANT ALL ON TABLE "public"."admin_metric_snapshots" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."admin_metric_snapshots" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."billing" TO "anon";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."billing" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."billing" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."folders" TO "anon";
GRANT ALL ON TABLE "public"."folders" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."folders" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."friendships" TO "anon";
GRANT ALL ON TABLE "public"."friendships" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."friendships" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."mistakes" TO "anon";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."mistakes" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."mistakes" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."paragraphs" TO "anon";
GRANT ALL ON TABLE "public"."paragraphs" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."paragraphs" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."practice_sessions" TO "anon";
GRANT ALL ON TABLE "public"."practice_sessions" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."practice_sessions" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."profiles" TO "anon";
GRANT SELECT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."profiles" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."profiles" TO "service_role";



GRANT INSERT("id") ON TABLE "public"."profiles" TO "authenticated";



GRANT INSERT("username"),UPDATE("username") ON TABLE "public"."profiles" TO "authenticated";



GRANT INSERT("full_name"),UPDATE("full_name") ON TABLE "public"."profiles" TO "authenticated";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."review_state" TO "anon";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."review_state" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."review_state" TO "service_role";



GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."topics" TO "anon";
GRANT ALL ON TABLE "public"."topics" TO "authenticated";
GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLE "public"."topics" TO "service_role";









ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON SEQUENCES TO "postgres";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON FUNCTIONS TO "postgres";






ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT ALL ON TABLES TO "postgres";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLES TO "anon";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLES TO "authenticated";
ALTER DEFAULT PRIVILEGES FOR ROLE "postgres" IN SCHEMA "public" GRANT REFERENCES,TRIGGER,TRUNCATE,MAINTAIN ON TABLES TO "service_role";



































