SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- \restrict bjGNiEfrNWS2VXbHGtGmDrr6RRCDvrxU8cqFyeaRkaOZSYimfV1j4GgHawV1Qbb

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: custom_oauth_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."flow_state" ("id", "user_id", "auth_code", "code_challenge_method", "code_challenge", "provider_type", "provider_access_token", "provider_refresh_token", "created_at", "updated_at", "authentication_method", "auth_code_issued_at", "invite_token", "referrer", "oauth_client_state_id", "linking_target_id", "email_optional") VALUES
	('d6bc1849-fccf-4224-80b3-242f75ab5b82', NULL, NULL, NULL, NULL, 'google', '', '', '2026-05-10 08:09:23.002842+00', '2026-05-10 08:09:23.002842+00', 'oauth', NULL, NULL, 'https://clozenotes.co.uk/app/', NULL, NULL, false),
	('b1a45c64-4c75-40e6-b7ec-3acc9a5c4024', NULL, NULL, NULL, NULL, 'google', '', '', '2026-05-10 08:34:43.471056+00', '2026-05-10 08:34:43.471056+00', 'oauth', NULL, NULL, 'https://clozenotes.co.uk/app/', NULL, NULL, false),
	('013f0b0d-0294-42f4-8d16-ea5fc55f1441', NULL, NULL, NULL, NULL, 'google', '', '', '2026-05-10 09:11:25.320549+00', '2026-05-10 09:11:25.320549+00', 'oauth', NULL, NULL, 'https://clozenotes.co.uk/app/', NULL, NULL, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."users" ("instance_id", "id", "aud", "role", "email", "encrypted_password", "email_confirmed_at", "invited_at", "confirmation_token", "confirmation_sent_at", "recovery_token", "recovery_sent_at", "email_change_token_new", "email_change", "email_change_sent_at", "last_sign_in_at", "raw_app_meta_data", "raw_user_meta_data", "is_super_admin", "created_at", "updated_at", "phone", "phone_confirmed_at", "phone_change", "phone_change_token", "phone_change_sent_at", "email_change_token_current", "email_change_confirm_status", "banned_until", "reauthentication_token", "reauthentication_sent_at", "is_sso_user", "deleted_at", "is_anonymous") VALUES
	('00000000-0000-0000-0000-000000000000', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'authenticated', 'authenticated', 'isaacchenyl@gmail.com', NULL, '2026-05-09 20:49:19.41664+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-05-20 21:16:19.736773+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "117503212768776602736", "name": "yilong chen", "email": "isaacchenyl@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIGFdNGrQjCjWkkOltt1CEXEraV56DP24Zr2Wu3-F1obDo5fw=s96-c", "full_name": "yilong chen", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIGFdNGrQjCjWkkOltt1CEXEraV56DP24Zr2Wu3-F1obDo5fw=s96-c", "provider_id": "117503212768776602736", "tutorial_seen": true, "email_verified": true, "phone_verified": false}', NULL, '2026-05-09 20:49:19.397089+00', '2026-05-20 21:16:19.748619+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '707c0818-a555-41d0-b026-2176e3cbdc91', 'authenticated', 'authenticated', 'simontulip@gmail.com', '$2a$10$EGZTTW5ukueK01nadFM3t.0mgagKT1rg4SimY6BxxcPDovNGMrYxW', '2026-05-12 18:39:06.392961+00', NULL, '', '2026-05-12 18:38:39.835482+00', '', NULL, '', '', NULL, '2026-05-12 18:39:06.396532+00', '{"provider": "email", "providers": ["email"]}', '{"sub": "707c0818-a555-41d0-b026-2176e3cbdc91", "email": "simontulip@gmail.com", "email_verified": true, "phone_verified": false}', NULL, '2026-05-12 18:38:39.813071+00', '2026-05-12 18:39:06.40411+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', 'edddd94a-f428-4229-a4cb-02948c678e40', 'authenticated', 'authenticated', 'ejin165@gmail.com', NULL, '2026-05-16 12:08:46.239358+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-05-16 12:08:46.245987+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "100399182473522441733", "name": "Elan Jin", "email": "ejin165@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJrIOqMmaCQQjtL2OFt75o3h5YRVnQhlr7MTH1qUo0Ss5WjNA=s96-c", "full_name": "Elan Jin", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJrIOqMmaCQQjtL2OFt75o3h5YRVnQhlr7MTH1qUo0Ss5WjNA=s96-c", "provider_id": "100399182473522441733", "tutorial_seen": true, "email_verified": true, "phone_verified": false}', NULL, '2026-05-16 12:08:46.200329+00', '2026-05-16 13:29:57.403463+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false),
	('00000000-0000-0000-0000-000000000000', '5f0264b9-8f37-42bb-bcc1-3494b5230954', 'authenticated', 'authenticated', 'tulipsimon@gmail.com', NULL, '2026-05-09 22:00:02.361452+00', NULL, '', NULL, '', NULL, '', '', NULL, '2026-05-15 06:50:50.115012+00', '{"provider": "google", "providers": ["google"]}', '{"iss": "https://accounts.google.com", "sub": "100402093471783043400", "name": "Jessie Kim", "email": "tulipsimon@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIG9BxSmVeh210_gCAa6cLH_ltUsgUDdtDPWSAZsfrharX_hMwrIg=s96-c", "full_name": "Jessie Kim", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIG9BxSmVeh210_gCAa6cLH_ltUsgUDdtDPWSAZsfrharX_hMwrIg=s96-c", "provider_id": "100402093471783043400", "tutorial_seen": true, "email_verified": true, "phone_verified": false}', NULL, '2026-05-09 22:00:02.328126+00', '2026-05-15 06:50:50.14437+00', NULL, NULL, '', '', NULL, '', 0, NULL, '', NULL, false, NULL, false);


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."identities" ("provider_id", "user_id", "identity_data", "provider", "last_sign_in_at", "created_at", "updated_at", "id") VALUES
	('707c0818-a555-41d0-b026-2176e3cbdc91', '707c0818-a555-41d0-b026-2176e3cbdc91', '{"sub": "707c0818-a555-41d0-b026-2176e3cbdc91", "email": "simontulip@gmail.com", "email_verified": true, "phone_verified": false}', 'email', '2026-05-12 18:38:39.831868+00', '2026-05-12 18:38:39.831914+00', '2026-05-12 18:38:39.831914+00', 'a224278d-d2f1-4237-807e-614d302b6a6f'),
	('117503212768776602736', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '{"iss": "https://accounts.google.com", "sub": "117503212768776602736", "name": "yilong chen", "email": "isaacchenyl@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIGFdNGrQjCjWkkOltt1CEXEraV56DP24Zr2Wu3-F1obDo5fw=s96-c", "full_name": "yilong chen", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIGFdNGrQjCjWkkOltt1CEXEraV56DP24Zr2Wu3-F1obDo5fw=s96-c", "provider_id": "117503212768776602736", "email_verified": true, "phone_verified": false}', 'google', '2026-05-09 20:49:19.411718+00', '2026-05-09 20:49:19.41177+00', '2026-05-20 21:16:19.72425+00', 'd8bae175-51d9-4d0e-a4fd-b122a6f9fa63'),
	('100402093471783043400', '5f0264b9-8f37-42bb-bcc1-3494b5230954', '{"iss": "https://accounts.google.com", "sub": "100402093471783043400", "name": "Jessie Kim", "email": "tulipsimon@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocIG9BxSmVeh210_gCAa6cLH_ltUsgUDdtDPWSAZsfrharX_hMwrIg=s96-c", "full_name": "Jessie Kim", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocIG9BxSmVeh210_gCAa6cLH_ltUsgUDdtDPWSAZsfrharX_hMwrIg=s96-c", "provider_id": "100402093471783043400", "email_verified": true, "phone_verified": false}', 'google', '2026-05-09 22:00:02.356059+00', '2026-05-09 22:00:02.356111+00', '2026-05-15 06:50:50.102228+00', 'b76b7da6-9220-40f5-b204-fe9e0da3282b'),
	('100399182473522441733', 'edddd94a-f428-4229-a4cb-02948c678e40', '{"iss": "https://accounts.google.com", "sub": "100399182473522441733", "name": "Elan Jin", "email": "ejin165@gmail.com", "picture": "https://lh3.googleusercontent.com/a/ACg8ocJrIOqMmaCQQjtL2OFt75o3h5YRVnQhlr7MTH1qUo0Ss5WjNA=s96-c", "full_name": "Elan Jin", "avatar_url": "https://lh3.googleusercontent.com/a/ACg8ocJrIOqMmaCQQjtL2OFt75o3h5YRVnQhlr7MTH1qUo0Ss5WjNA=s96-c", "provider_id": "100399182473522441733", "email_verified": true, "phone_verified": false}', 'google', '2026-05-16 12:08:46.229254+00', '2026-05-16 12:08:46.229306+00', '2026-05-16 12:08:46.229306+00', 'e529cc01-f0a2-4cb8-b42f-87df9cf3855f');


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."sessions" ("id", "user_id", "created_at", "updated_at", "factor_id", "aal", "not_after", "refreshed_at", "user_agent", "ip", "tag", "oauth_client_id", "refresh_token_hmac_key", "refresh_token_counter", "scopes") VALUES
	('c4ae4756-6067-49ea-aac7-39a07cdc4e5f', '707c0818-a555-41d0-b026-2176e3cbdc91', '2026-05-12 18:39:06.396609+00', '2026-05-12 18:39:06.396609+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3.1 Safari/605.1.15', '109.180.33.188', NULL, NULL, NULL, NULL, NULL),
	('b647be9f-3152-43ea-8fa7-ec21ddd56bff', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-20 15:42:53.687174+00', '2026-05-20 21:00:17.902139+00', NULL, 'aal1', NULL, '2026-05-20 21:00:17.902034', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3.1 Safari/605.1.15', '109.180.33.188', NULL, NULL, NULL, NULL, NULL),
	('7a9469a2-ba59-4e8d-8acc-317592b0ba9c', '5f0264b9-8f37-42bb-bcc1-3494b5230954', '2026-05-15 06:50:50.116949+00', '2026-05-15 06:50:50.116949+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '109.180.33.188', NULL, NULL, NULL, NULL, NULL),
	('0eaee849-ab72-42fd-ae9e-8686dc9d11e3', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-20 21:16:19.738779+00', '2026-05-20 21:16:19.738779+00', NULL, 'aal1', NULL, NULL, 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3.1 Safari/605.1.15', '109.180.33.188', NULL, NULL, NULL, NULL, NULL),
	('99758f75-2287-4363-b7ac-fcd115647742', 'edddd94a-f428-4229-a4cb-02948c678e40', '2026-05-16 12:08:46.248231+00', '2026-05-16 13:29:57.416746+00', NULL, 'aal1', NULL, '2026-05-16 13:29:57.416646', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Mobile/15E148 Safari/604.1', '109.180.33.188', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."mfa_amr_claims" ("session_id", "created_at", "updated_at", "authentication_method", "id") VALUES
	('c4ae4756-6067-49ea-aac7-39a07cdc4e5f', '2026-05-12 18:39:06.404663+00', '2026-05-12 18:39:06.404663+00', 'otp', 'e632b684-04be-4395-8618-cb42e3142c37'),
	('7a9469a2-ba59-4e8d-8acc-317592b0ba9c', '2026-05-15 06:50:50.155392+00', '2026-05-15 06:50:50.155392+00', 'oauth', 'a36bbd0f-3480-41ea-b9fc-22bc8a22c579'),
	('99758f75-2287-4363-b7ac-fcd115647742', '2026-05-16 12:08:46.273735+00', '2026-05-16 12:08:46.273735+00', 'oauth', 'ce4e8fa8-ba17-44d1-b39c-a6a4dfed4b1a'),
	('b647be9f-3152-43ea-8fa7-ec21ddd56bff', '2026-05-20 15:42:53.704902+00', '2026-05-20 15:42:53.704902+00', 'oauth', '2a1683fb-5d98-4165-a411-8baf08b99b65'),
	('0eaee849-ab72-42fd-ae9e-8686dc9d11e3', '2026-05-20 21:16:19.757484+00', '2026-05-20 21:16:19.757484+00', 'oauth', '801139eb-392f-4ca9-ad93-830edbc5cdf2');


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_client_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

INSERT INTO "auth"."refresh_tokens" ("instance_id", "id", "token", "user_id", "revoked", "created_at", "updated_at", "parent", "session_id") VALUES
	('00000000-0000-0000-0000-000000000000', 43, '6q5qfk3vuhhx', '5f0264b9-8f37-42bb-bcc1-3494b5230954', false, '2026-05-15 06:50:50.132221+00', '2026-05-15 06:50:50.132221+00', NULL, '7a9469a2-ba59-4e8d-8acc-317592b0ba9c'),
	('00000000-0000-0000-0000-000000000000', 50, 'id3w2x7ak5of', 'edddd94a-f428-4229-a4cb-02948c678e40', true, '2026-05-16 12:08:46.260748+00', '2026-05-16 13:29:57.361471+00', NULL, '99758f75-2287-4363-b7ac-fcd115647742'),
	('00000000-0000-0000-0000-000000000000', 51, 'hfdy5yw6ktio', 'edddd94a-f428-4229-a4cb-02948c678e40', false, '2026-05-16 13:29:57.389207+00', '2026-05-16 13:29:57.389207+00', 'id3w2x7ak5of', '99758f75-2287-4363-b7ac-fcd115647742'),
	('00000000-0000-0000-0000-000000000000', 27, 'qcw3y3ntnzyk', '707c0818-a555-41d0-b026-2176e3cbdc91', false, '2026-05-12 18:39:06.400038+00', '2026-05-12 18:39:06.400038+00', NULL, 'c4ae4756-6067-49ea-aac7-39a07cdc4e5f'),
	('00000000-0000-0000-0000-000000000000', 69, 'euin7e4ezbtv', 'e942fba8-e099-4bc9-a78f-e974cfc81557', true, '2026-05-20 15:42:53.695535+00', '2026-05-20 21:00:17.848557+00', NULL, 'b647be9f-3152-43ea-8fa7-ec21ddd56bff'),
	('00000000-0000-0000-0000-000000000000', 70, 'ulti3xpq66g2', 'e942fba8-e099-4bc9-a78f-e974cfc81557', false, '2026-05-20 21:00:17.875122+00', '2026-05-20 21:00:17.875122+00', 'euin7e4ezbtv', 'b647be9f-3152-43ea-8fa7-ec21ddd56bff'),
	('00000000-0000-0000-0000-000000000000', 71, 'idbaaljkoimz', 'e942fba8-e099-4bc9-a78f-e974cfc81557', false, '2026-05-20 21:16:19.746566+00', '2026-05-20 21:16:19.746566+00', NULL, '0eaee849-ab72-42fd-ae9e-8686dc9d11e3');


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: webauthn_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: webauthn_credentials; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: admin_expenses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."admin_expenses" ("id", "user_id", "label", "amount_pence", "notes", "created_at", "period_months") VALUES
	('9711656b-3304-4433-be94-dc5bf3800f86', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'domain', 3, NULL, '2026-05-19 06:28:41.602019+00', 0);


--
-- Data for Name: admin_metric_snapshots; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."admin_metric_snapshots" ("user_id", "snapshot_date", "mrr_pence", "expenses_pence", "total_users", "paying_users") VALUES
	('e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-15', 0, 0, 3, 0),
	('e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-17', 0, 0, 4, 0),
	('e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-19', 0, 0, 4, 0),
	('e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-20', 0, 0, 4, 0);


--
-- Data for Name: billing; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: folders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."folders" ("id", "user_id", "name", "icon", "position", "created_at", "parent_folder_id", "color") VALUES
	('285ddba4-c35e-4153-9fbe-4f7d76f68ef3', '5f0264b9-8f37-42bb-bcc1-3494b5230954', 'sdad', '◫', 0, '2026-05-15 06:51:19.141644+00', NULL, NULL),
	('08b5202d-1865-45b0-b855-de4b2257403b', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'french', 'book', 0, '2026-05-09 21:29:55.993102+00', NULL, 'pink'),
	('9b61e5f8-2687-4de6-8876-1a853b8c6cb8', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'History', 'book', 0, '2026-05-18 16:41:51.319195+00', NULL, 'blue');


--
-- Data for Name: friendships; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."friendships" ("id", "requester_id", "recipient_id", "status", "created_at", "responded_at") VALUES
	('31a90feb-564d-4777-87f1-128f82d1a6f3', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '5f0264b9-8f37-42bb-bcc1-3494b5230954', 'accepted', '2026-05-09 22:01:15.980209+00', '2026-05-09 22:01:23.666+00');


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."topics" ("id", "user_id", "name", "icon", "ignore_diacritics", "created_at", "updated_at", "folder_id", "lang", "position", "default_cover", "hint_policy", "randomize") VALUES
	('f530fb13-39b5-4546-9e8c-56d65c659e98', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'School', '◌', true, '2026-05-10 13:00:13.723494+00', '2026-05-14 20:14:43.268+00', '08b5202d-1865-45b0-b855-de4b2257403b', 'fr-FR', NULL, 50, 'first_letter', false),
	('06cba967-f32d-47e2-97a1-791cd4e66376', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'House', '◌', true, '2026-05-09 21:23:43.971334+00', '2026-05-14 20:14:52.602+00', '08b5202d-1865-45b0-b855-de4b2257403b', 'fr-FR', NULL, 50, 'first_letter', false),
	('342cae4e-b5da-460c-9d04-5c0efe014f75', 'edddd94a-f428-4229-a4cb-02948c678e40', 'Untitled topic', '◌', false, '2026-05-16 12:09:41.689986+00', '2026-05-16 12:09:41.937+00', NULL, 'en-GB', NULL, 50, 'first_letter', false),
	('0155a33b-88d3-4562-b6c1-f981f737f224', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'Wolsey', '◌', true, '2026-05-18 16:33:37.567095+00', '2026-05-18 16:41:57.703+00', '9b61e5f8-2687-4de6-8876-1a853b8c6cb8', 'en-GB', NULL, 50, 'first_letter', false);


--
-- Data for Name: paragraphs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."paragraphs" ("id", "topic_id", "position", "title", "question", "text", "created_at", "kind", "image_url", "annotations") VALUES
	('f8f29b36-6b5f-4c58-8187-9278d20f959a', '06cba967-f32d-47e2-97a1-791cd4e66376', 4, 'describe your ideal house?', 'Décris ta maison idéale?', '  Ma [maison] [idéale] [serait] [située] au [Japon], à la [compagne] car c''est [tranquille]. La      [maison] [serait] [moyenne] avec [deux] [étages] et [neuf] [pièces] [Au] [rez-de] [chaussée] il y [aurait] une [grande] [salle] de [jeux] et un [bureau] [moyen]. [Aussi] il y [aurait] une [cuisine] bien [équipée] et une [salle] de [bains] [confortable]. [Au] [premier] [étage], il y [aurait] une [grande] [chambre] et deux [chambres] de [taille] [moyenne]. [Il] y [aurait] [aussi] deux [salles] de [bains] [modernes]. [Derrière] la [maison], il y [aurait] un [grand] [jardin] avec [beaucoup] de [jolies] [fleurs] et des [arbres].', '2026-05-09 21:33:10.441808+00', 'text', NULL, NULL),
	('c6d70144-8754-4eab-ae72-cadae338f3b2', '06cba967-f32d-47e2-97a1-791cd4e66376', 2, 'what''s there to do?', 'Qu''est-ce u''il y a dans ta ville?', 'Dans ma [vile] il y a [beaucoup] á [faire], [aller] au [cinéma] et [manger] dans les [restaurants] [cependant] c’est [cher]. Il n''y a pas de [patinoire] ', '2026-05-09 21:32:46.543207+00', 'text', NULL, NULL),
	('85436351-afeb-418e-a4c7-331594d8675d', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 1, '', '2 Quelles sont tes matières préférées ? (Qu''est-ce que tu n''aimes pas ?) What are your favourite subjects? / What don''t you like?', 'J''aime [l''informatique] car c''est [intéressant] et très [facile] [cependant] la [prof] est [barbante] et [assez] [nulle]. Aussi [j''adore] les [sciences] car [c''est] [utile] et très [intéressant]. [Cependant] j''ai [horreur] de [l''anglais] [parce] que', '2026-05-10 13:00:37.093501+00', 'text', NULL, NULL),
	('3a9dfb52-a2ba-49a7-ac77-85839fe2acde', '06cba967-f32d-47e2-97a1-791cd4e66376', 7, 'do you gt pocket money?', 'Est-ce que tu gagnes de l''argent de poche?', 'Ma [mère] me [donne] dix [livres] par [semaine].  [Aussi], je [gagne] dix [livres] en [laver] la [voiture]. [Avec] mon [argent], [j’acheté] des [romans] et des [cadeaux]. [Je] fais des [économies] pour [acheter] des jeux [vidéo]. ', '2026-05-09 21:34:52.70937+00', 'text', NULL, NULL),
	('44667f8a-a9d4-4969-9a8b-213d6dd8e5da', '06cba967-f32d-47e2-97a1-791cd4e66376', 3, 'describe your house?', 'Décris ta maison?', 'J’habite une [maison] [moyenne] qui se [trouve] dans une [rue] [tranquille]. C''est [très] [joli] mais c’est [assez] [vieux]. C’est une [maison] [individuelle] à [deux] [étages]. En [bas] il y a [trois] [moyenne] [bureau]. En [face] du [petit] [bureau] il y a la [salle] de [bains]. A [côté] de [l’escalier] il y a la [cuisine] bien [équipée]. Aussi il y a la une [salle] à [manger] [moyenne] et un [grand] [salon]. En [haut], il y a [trois] [chambres] et deux [petites] [salles] de [bains]. [Aussi] il y a un [vieux] [balcon] et [derrière] la [maison] il y a un [grand] [jardin].  ', '2026-05-09 21:33:03.93621+00', 'text', NULL, NULL),
	('034f9a7f-1f4a-44cc-b16d-4e583c2860e6', '06cba967-f32d-47e2-97a1-791cd4e66376', 1, 'do you like your town?', 'Est-ce que tu aimes ta ville?', 'J''aime ma [ville] [londrès] car c’est très [animé] et il y a [plein] de [choses] à [faire] mais c’est très [bruyant] et trop [pollué]. J''adore dans mon [quartier] parce que c’est [tranquille] et [assez] [propre] [cependant] de [temps] en [temps] [c''est] [barbant]', '2026-05-09 21:32:32.533588+00', 'text', NULL, NULL),
	('a7cec89e-4956-4a8b-93c5-55e88d76e3bf', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 2, '', '4 Tu dois porter un uniforme scolaire ? Do you have to wear a school uniform? ', 'À Newland House on [porte] un [uniforme] [scolaire]. Je [porte] une [chemise] [blanche] et un [blazer] gris. Aussi, je [porte] une [cravate] à [rayures] [noires] et [rouges]. Je [porte] un [short] gris et des [chaussures] [noires]. À mon avis [c''est] [inconfortable]. [Je] [pense] que [c''est] [inconfortable] et [c''est] cher. [Dans] [l''avenir] [j''aimerais] [porter] mes [propres] [vêtements].', '2026-05-10 13:01:21.55604+00', 'text', NULL, NULL),
	('a987556e-51b0-4d7b-91a4-1847aa8b7168', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 0, '', '2 Fais-moi une déscription de ton collège. Describe your school – name, type, where it is ', 'Mon [collège] [s''appelle] Newland House et il est [situé] à [Twickenham]. C''est un [collège] [mixte] et il y a [environ] [400] [élèves] et [40] [professeurs]. [Le] [bâtiment] est joli et [assez] [moderne]. [Le] [collège] a une [salle] [EMT] bien [équipée] et [récemment] ils ont [construit] une [salle] de [cuisine] [moderne]
', '2026-05-10 13:00:13.769369+00', 'text', NULL, NULL),
	('3dfdc3a3-3e9b-4c9f-9b8c-f25b44560532', '06cba967-f32d-47e2-97a1-791cd4e66376', 0, 'where do you live?', 'Où habites-tu?', 'J’habite dans le [sud-est] de [l’Angleterre] à [Twickenham] dans une [maison] [individuelle] en [banlieue]. Mon [ville] est [assez] [animée]. Mon [quartier] est [joli] et [tranquille] cependant [assez] [barbant].', '2026-05-09 21:23:44.043226+00', 'text', NULL, NULL),
	('753955ba-b77e-4945-928c-1e0d516a25b6', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 3, '', '', '', '2026-05-14 20:13:41.138743+00', 'text', NULL, NULL),
	('7b2ad257-8e09-4e55-a126-9b88f8d285e9', '06cba967-f32d-47e2-97a1-791cd4e66376', 5, 'describe your bedroom?', 'Décris ta chambre?', '[J''ai] ma [propre] [chambre] et [c’est] [assez] [grand] et [c’est] très [confortable]. [Il] y a un lit [moyen] et une [armoire] [bleue].  A côté du lit [Il] y a une [petite] [commode].  [Sur] le [mur] Il y a [trois] [posters]. [Malheureusement], ma [chambre] est [souvent] en [désordre]. ', '2026-05-09 21:33:29.911895+00', 'text', NULL, NULL),
	('6f5caa4f-b539-4760-927a-d9ac4eb028af', '06cba967-f32d-47e2-97a1-791cd4e66376', 6, 'what o you do to hep arund the house?', 'qu''et-ce que ta faire pour aider à a maison?', 'Une fois par [semaine] je [range] ma [chambre] et je fais du [jardinage] [cependant], [c’est] très nul. [Avant] les [repas], je mets la [table] et [c’est] [ennuyeux]. [Je] [déteste] [sortir] la [poubelle] car ça pue.  ', '2026-05-09 21:34:18.541967+00', 'text', NULL, NULL),
	('7a9820a9-af45-4e5f-b6aa-d9414788661e', '342cae4e-b5da-460c-9d04-5c0efe014f75', 0, '', 'korean war', '[25th] [June] [1960] ', '2026-05-16 12:09:41.862756+00', 'text', NULL, NULL),
	('7257369b-40c1-4b1a-8221-a29126d7f317', '0155a33b-88d3-4562-b6c1-f981f737f224', 1, '', '', 'In [1502], he became a [chaplain] to [Henry] [Deane], the [Archbishop] [of] [Canterbury]. [After] [Deane] died the [following] [year], Wolsey [moved] into [royal] [service]. In [1507], he was appointed [Royal] [Chaplain] by [Henry] [VII]. Later, in [1509], he was appointed [Royal] [Almoner] when [Henry] [VIII] came to the [throne], which gave him a [seat] [on] [the] [Privy] [Council]. He also held many [other] [roles], including [multiple] [church] [jobs] at once; this was [technically] [not] [allowed] and was called [pluralism]. ', '2026-05-18 16:38:08.18237+00', 'text', NULL, NULL),
	('61a72189-6f9b-469a-860b-2dc3c46b5869', '0155a33b-88d3-4562-b6c1-f981f737f224', 4, '', '', 'However, things started to [turn] for the [worse] when he introduced the [Amicable] [Grant] in [1525]. It was so [unpopular] that it was [quickly] [dropped] and even [though] [both] Henry and Thomas had [worked] [together] on it, [henry] [blamed] [Wolsey]. This [worsened] [his] [relationship] with the [barons], which was already [poor] [due] to his [middle-class] [background] and his [immense] [power] and [money].  ', '2026-05-18 16:50:24.80753+00', 'text', NULL, NULL),
	('606a9f36-b09c-42b2-bc0c-8eb396973cf1', '0155a33b-88d3-4562-b6c1-f981f737f224', 3, '', '', 'In [1518] Thomas Wolsey even [organised] the [treaty] [of] [London] which aimed to [bring] [peace] to over [20] [countries] and in [1520] he [organised] [the] Field [of] [the] [Cloth] [of] [Gold] for [henry] to make [friends] with [France] and he even met [Anne] [Boleyn] there. In fact, he did so much for [Henry] he was even called [alter] [rex] ([other] [king]) ', '2026-05-18 16:49:22.960736+00', 'text', NULL, NULL),
	('d46842fd-24ce-4c46-8d94-de211bda8db1', '0155a33b-88d3-4562-b6c1-f981f737f224', 2, '', '', '[Henry''s] [primary] [advisers] when he [first] came to the [throne] were [Richard] [Foxe] and [William] [Warham] who were [very] [careful] and [conservative]. However, [Thomas] [Wolsey] was [less] [cautious] and [instead] [helped] [Henry] with what [he] [wanted] to do. While he [suggested] his [own] [ideas], he would [adapt] if the [King] [opposed] them. Because of this, he rose to [power] and eventually [became] [Lord] [High] [Chancellor] in [1515]. ', '2026-05-18 16:40:43.130159+00', 'text', NULL, NULL),
	('b5e1dec7-2d11-4583-aed4-e45b19fcd39e', '0155a33b-88d3-4562-b6c1-f981f737f224', 0, '', '', 'I believe that Thomas Wolsey was a [successful] [person] due to his [many] [jobs] and his [influence] over the [country]. He was [born] to [Robert] [Wolsey], who is believed to have been a [butcher], and [Joan] [Daundy]. Wolsey attended [Ipswich] [School] and [Magdalen] [College] [School] before [studying] [theology] at [Magdalen] [College], [Oxford]. On [March] [10th], he was [ordained] a [priest] at [Marlborough]. ', '2026-05-18 16:33:37.682793+00', 'text', NULL, NULL),
	('79f688f0-efd3-4d7c-aff1-bfda073bc7cf', '0155a33b-88d3-4562-b6c1-f981f737f224', 5, '', '', 'What really put the [nail] [in] [the] [coffin] was The [King’s] [Great] [Matter]. Henry tried to get an [annulment] from the [Pope], but Thomas Wolsey was [unable] to [secure] it because [Catherine’s] [nephew] [controlled] the [Pope]. This, [combined] with the [constant] [bickering] of [Anne] [Boleyn], led [Henry] to [charge] [Thomas] with [treason]. He was [stripped] of his [titles] and was sent to [death], but he died on the way to the [execution] due to [natural] [causes]. ', '2026-05-18 16:51:25.020187+00', 'text', NULL, NULL);


--
-- Data for Name: mistakes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."mistakes" ("id", "user_id", "topic_id", "paragraph_id", "word_index", "word_text", "miss_count", "first_seen_at", "last_seen_at", "mastered_at") VALUES
	('aaee77d9-d740-4880-88c1-280791373600', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 29, 'mixte', 1, '2026-05-14 18:34:55.313563+00', '2026-05-14 18:34:55.313563+00', NULL),
	('0884e850-e36e-4057-8392-ee80b9116291', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '85436351-afeb-418e-a4c7-331594d8675d', 2, 'l''informatique', 1, '2026-05-14 18:36:48.599928+00', '2026-05-14 18:36:48.599928+00', NULL),
	('9932d500-2b5a-49dd-87a6-918162826499', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '85436351-afeb-418e-a4c7-331594d8675d', 8, 'intéressant', 1, '2026-05-14 18:37:09.119971+00', '2026-05-14 18:37:09.119971+00', NULL),
	('ae7d71f8-a2ba-4f32-9907-d1de885c7025', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '85436351-afeb-418e-a4c7-331594d8675d', 14, 'facile', 1, '2026-05-14 18:37:17.964076+00', '2026-05-14 18:37:17.964076+00', NULL),
	('63b91797-6dca-407d-972c-5ce887a2dc45', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '3dfdc3a3-3e9b-4c9f-9b8c-f25b44560532', 37, 'animée', 1, '2026-05-14 18:39:28.583464+00', '2026-05-14 18:39:28.583464+00', NULL),
	('9e508380-f93b-4144-90e3-41d77073b271', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '034f9a7f-1f4a-44cc-b16d-4e583c2860e6', 24, 'plein', 1, '2026-05-14 18:41:24.270417+00', '2026-05-14 18:41:24.270417+00', NULL),
	('cdf8ef2b-394e-4d05-96ac-fb34623dc2f2', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '034f9a7f-1f4a-44cc-b16d-4e583c2860e6', 46, 'pollué', 1, '2026-05-14 18:41:53.227614+00', '2026-05-14 18:41:53.227614+00', NULL),
	('6c2f8d8d-e6a1-43e9-b99f-06af073fdbca', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '034f9a7f-1f4a-44cc-b16d-4e583c2860e6', 67, 'assez', 1, '2026-05-14 18:43:09.605401+00', '2026-05-14 18:43:09.605401+00', NULL),
	('e7b3daff-0be9-4c0c-ae1e-293870a75eb9', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '034f9a7f-1f4a-44cc-b16d-4e583c2860e6', 69, 'propre', 1, '2026-05-14 18:43:18.649694+00', '2026-05-14 18:43:18.649694+00', NULL),
	('1f963dca-5d9d-4e76-b8e5-e6d563435a6f', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '034f9a7f-1f4a-44cc-b16d-4e583c2860e6', 75, 'temps', 1, '2026-05-14 18:43:59.699841+00', '2026-05-14 18:43:59.699841+00', NULL),
	('6b39f897-e6ff-42f7-9754-cc687c8d4272', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '034f9a7f-1f4a-44cc-b16d-4e583c2860e6', 81, 'c''est', 1, '2026-05-14 18:44:15.568876+00', '2026-05-14 18:44:15.568876+00', NULL),
	('726663aa-f305-453b-855d-f8c439077934', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 4, 's''appelle', 1, '2026-05-14 18:49:54.567421+00', '2026-05-14 18:49:54.567421+00', NULL),
	('cf4fd9d3-acfc-4258-91b1-6611ada23ad3', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 49, 'professeurs', 1, '2026-05-14 19:20:25.17415+00', '2026-05-14 19:20:25.17415+00', NULL),
	('b0aa8234-0ff0-4699-abae-a81e8aa823f2', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 52, 'Le', 1, '2026-05-14 19:20:28.110537+00', '2026-05-14 19:20:28.110537+00', NULL),
	('13b7db6c-fd9c-4930-8ff2-b3a59b143756', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 54, 'bâtiment', 1, '2026-05-14 19:20:30.874617+00', '2026-05-14 19:20:30.874617+00', NULL),
	('7fd768f2-ac3c-491f-b52f-b2af0b496437', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 62, 'assez', 1, '2026-05-14 19:20:34.905295+00', '2026-05-14 19:20:34.905295+00', NULL),
	('01251501-9f49-4921-915c-91e58e51494e', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 64, 'moderne', 1, '2026-05-14 19:20:38.782642+00', '2026-05-14 19:20:38.782642+00', NULL),
	('776b2ca9-919e-4be8-8ac8-acdd1dd8ed66', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '3dfdc3a3-3e9b-4c9f-9b8c-f25b44560532', 22, 'individuelle', 1, '2026-05-14 19:21:49.345625+00', '2026-05-14 19:21:49.345625+00', NULL),
	('f80e9ff0-4557-4064-8544-3803d15cc5b9', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '3dfdc3a3-3e9b-4c9f-9b8c-f25b44560532', 46, 'joli', 1, '2026-05-14 19:22:46.665357+00', '2026-05-14 19:22:46.665357+00', NULL),
	('e61788e8-b7bf-4ed9-82a3-b0e5dbe1b54d', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '3dfdc3a3-3e9b-4c9f-9b8c-f25b44560532', 50, 'tranquille', 2, '2026-05-14 18:40:41.574976+00', '2026-05-14 19:23:00.491343+00', NULL),
	('44cf1849-b2b9-451d-a0c9-a5d3cd18c696', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'c6d70144-8754-4eab-ae72-cadae338f3b2', 19, 'aller', 1, '2026-05-14 19:30:09.008666+00', '2026-05-14 19:30:09.008666+00', NULL),
	('c26b6e4c-f151-4dba-8c56-f8066f0de0f6', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'c6d70144-8754-4eab-ae72-cadae338f3b2', 35, 'cependant', 1, '2026-05-14 19:30:42.970481+00', '2026-05-14 19:30:42.970481+00', NULL),
	('d8b5b130-2378-44ff-a506-a95cf9b38501', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'c6d70144-8754-4eab-ae72-cadae338f3b2', 52, 'patinoire', 1, '2026-05-14 19:30:57.782442+00', '2026-05-14 19:30:57.782442+00', NULL),
	('0b44b2e4-8ff2-4ccc-8797-b65ff5b9a3a9', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 42, 'maison', 1, '2026-05-14 19:32:12.245981+00', '2026-05-14 19:32:12.245981+00', NULL),
	('51418a11-7d4f-4d52-8396-07b5dfe6576c', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 48, 'deux', 1, '2026-05-14 19:32:42.640022+00', '2026-05-14 19:32:42.640022+00', NULL),
	('aada8959-c217-4abb-bb25-832f6f9af6f8', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 63, 'trois', 1, '2026-05-14 19:33:35.780229+00', '2026-05-14 19:33:35.780229+00', NULL),
	('cf43ed25-e6b8-4aa6-aa01-dcc63cccc8b4', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 78, 'bureau', 1, '2026-05-14 19:34:15.678308+00', '2026-05-14 19:34:15.678308+00', NULL),
	('31ed186c-7c09-4a5e-b90d-08d71c86a1e9', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 115, 'équipée', 1, '2026-05-14 19:34:55.506133+00', '2026-05-14 19:34:55.506133+00', NULL),
	('534744b8-da69-48d1-9a99-a5ae617c4bb6', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 136, 'moyenne', 1, '2026-05-14 19:35:12.162406+00', '2026-05-14 19:35:12.162406+00', NULL),
	('b0bad3f7-c011-4b89-848e-121e92c74bf4', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 142, 'grand', 1, '2026-05-14 19:35:17.306439+00', '2026-05-14 19:35:17.306439+00', NULL),
	('23a481d8-336f-48d7-bae6-81bde69c1231', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 144, 'salon', 1, '2026-05-14 19:35:19.570608+00', '2026-05-14 19:35:19.570608+00', NULL),
	('1cd1ca28-4ee9-4951-a436-84327a418dea', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 20, 'tranquille', 2, '2026-05-14 19:31:39.468135+00', '2026-05-14 19:35:58.785378+00', NULL),
	('9f5652be-379d-4c4e-b9b9-c9c1ca4920fc', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 111, 'cuisine', 2, '2026-05-14 19:34:49.474738+00', '2026-05-14 19:37:52.625838+00', NULL),
	('e81fe88b-d3b3-429d-a887-29f07fac4e04', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 130, 'salle', 1, '2026-05-14 19:38:10.697352+00', '2026-05-14 19:38:10.697352+00', NULL),
	('21f2168f-ae0d-4077-97ed-ee77796a3b6d', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 168, 'salles', 1, '2026-05-14 19:39:29.118429+00', '2026-05-14 19:39:29.118429+00', NULL),
	('0654650c-327a-4618-ad12-d77ae92dd768', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 23, 'C''est', 1, '2026-05-14 19:41:00.330783+00', '2026-05-14 19:41:00.330783+00', NULL),
	('5d6fa4ae-a212-4868-a9c6-9d0c11fdcf35', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 29, 'mais', 1, '2026-05-14 19:41:15.380769+00', '2026-05-14 19:41:15.380769+00', NULL),
	('b8c0f79d-6a96-4134-9fed-35c3308bb2f6', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 8, 'qui', 1, '2026-05-14 19:43:42.771503+00', '2026-05-14 19:43:42.771503+00', NULL),
	('6b082310-cd84-4d4f-9aed-bb7930610c47', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 67, 'bureau', 3, '2026-05-14 19:33:54.211589+00', '2026-05-14 19:44:52.533657+00', NULL),
	('6e50b0a1-711e-45ad-bc61-abdd2637ef8e', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 97, 'côté', 2, '2026-05-14 19:34:32.417909+00', '2026-05-14 19:45:57.721037+00', NULL),
	('13ea076f-cb7d-499e-b994-eee75d7f7e6d', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 185, 'vieux', 2, '2026-05-14 19:39:52.408207+00', '2026-05-14 19:48:05.899692+00', NULL),
	('58202a3d-19b3-45ff-ad98-6c3b17ea03aa', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 191, 'derrière', 2, '2026-05-14 19:40:11.533631+00', '2026-05-14 19:48:23.081271+00', NULL),
	('63727ee8-8e22-48bf-84f3-c62a83b6b0b0', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 101, 'l’escalier', 2, '2026-05-14 19:34:40.57301+00', '2026-05-14 19:52:39.421512+00', NULL),
	('51c79213-a29b-4e56-8a6c-1f78ff291107', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 160, 'chambres', 2, '2026-05-14 19:38:59.581398+00', '2026-05-14 19:54:28.548004+00', NULL),
	('3b92176a-851f-4c65-a9da-68464d2551c8', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 166, 'petites', 2, '2026-05-14 19:39:21.608498+00', '2026-05-14 19:54:45.508686+00', NULL),
	('f92a897b-9e66-4e34-af81-988809e9d4d1', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '3dfdc3a3-3e9b-4c9f-9b8c-f25b44560532', 6, 'sud-est', 2, '2026-05-14 18:38:03.374245+00', '2026-05-14 21:02:35.236229+00', NULL),
	('d2b8e080-eb71-4dcb-b7ce-af6d4fd30a29', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'c6d70144-8754-4eab-ae72-cadae338f3b2', 12, 'beaucoup', 2, '2026-05-14 19:29:51.716052+00', '2026-05-14 21:41:52.410351+00', NULL),
	('c5671dfa-1fda-4c5b-8fa6-0446c843df32', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'c6d70144-8754-4eab-ae72-cadae338f3b2', 33, 'restaurants', 2, '2026-05-14 19:30:21.345787+00', '2026-05-14 21:42:27.814588+00', NULL),
	('205f3901-99e2-40af-83c2-9bef47e8c0ed', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '3dfdc3a3-3e9b-4c9f-9b8c-f25b44560532', 10, 'l’Angleterre', 2, '2026-05-14 19:21:15.078448+00', '2026-05-14 21:43:14.482132+00', NULL),
	('1970484f-8295-484f-8b29-ff2cf546eaf0', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '3dfdc3a3-3e9b-4c9f-9b8c-f25b44560532', 26, 'banlieue', 3, '2026-05-14 18:38:50.563596+00', '2026-05-14 21:43:42.458603+00', NULL),
	('8b04d3a9-9c85-4574-80df-a2bde2b703ea', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '034f9a7f-1f4a-44cc-b16d-4e583c2860e6', 63, 'tranquille', 2, '2026-05-14 18:42:55.945866+00', '2026-05-14 21:45:18.675466+00', NULL),
	('93d4f15e-8e3b-48a9-9776-17a7ce636cb5', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 16, 'situé', 2, '2026-05-14 18:13:36.958459+00', '2026-05-15 06:35:54.839447+00', NULL),
	('c0648ab0-6353-47ff-91e2-379828cb0fc4', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 27, 'collège', 2, '2026-05-14 18:34:44.254005+00', '2026-05-15 06:36:13.446157+00', NULL),
	('1599d865-b0ca-422b-a123-ee7b87a94a9a', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 39, 'environ', 3, '2026-05-14 18:35:04.716266+00', '2026-05-15 06:36:34.679138+00', NULL),
	('e1c802b9-c94f-4497-a824-08cb9acb42b9', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 46, 'à', 1, '2026-05-14 19:44:14.995526+00', '2026-05-14 19:44:14.995526+00', NULL),
	('a828bdf0-f086-4d12-ada7-3295f45d0a77', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 124, 'a', 1, '2026-05-14 19:46:39.293375+00', '2026-05-14 19:46:39.293375+00', NULL),
	('c57627ab-e6fe-4b08-9e9d-423da7c3833a', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 152, 'il', 1, '2026-05-14 19:47:18.492473+00', '2026-05-14 19:47:18.492473+00', NULL),
	('e13eb192-bb05-421a-93e7-ba32340ad5b7', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 162, 'et', 1, '2026-05-14 19:47:38.94209+00', '2026-05-14 19:47:38.94209+00', NULL),
	('82cc9910-3219-4d48-8e90-6724e715222d', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 14, 'dans', 1, '2026-05-14 19:49:10.086151+00', '2026-05-14 19:49:10.086151+00', NULL),
	('6000804d-63bc-4c26-bc2c-199197c252bb', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '44667f8a-a9d4-4969-9a8b-213d6dd8e5da', 189, 'et', 1, '2026-05-14 19:56:05.341234+00', '2026-05-14 19:56:05.341234+00', NULL),
	('f264ee8c-2025-46b7-90a4-90fff4e9e591', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 7, 'serait', 1, '2026-05-14 19:56:51.40218+00', '2026-05-14 19:56:51.40218+00', NULL),
	('557ba1d8-2256-423e-9693-a4536e387baa', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 20, 'compagne', 2, '2026-05-14 19:57:14.431785+00', '2026-05-14 20:23:45.687354+00', NULL),
	('bf847ca1-7dd1-4c92-b4da-1048dab6dc0a', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 39, 'deux', 1, '2026-05-14 20:30:31.32133+00', '2026-05-14 20:30:31.32133+00', NULL),
	('28e67520-0159-4109-a167-ed8d436e5c31', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 47, 'pièces', 1, '2026-05-14 20:30:45.358164+00', '2026-05-14 20:30:45.358164+00', NULL),
	('e5c907ff-c28e-4277-9f70-7a135bcb9520', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 59, 'aurait', 1, '2026-05-14 20:31:08.531567+00', '2026-05-14 20:31:08.531567+00', NULL),
	('d3c8887b-3c55-40ab-b90f-e533018a6f57', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 63, 'grande', 1, '2026-05-14 20:31:14.699044+00', '2026-05-14 20:31:14.699044+00', NULL),
	('807edb61-56d2-423c-9875-11f3a432500e', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 69, 'jeux', 1, '2026-05-14 20:31:32.308096+00', '2026-05-14 20:31:32.308096+00', NULL),
	('1ee4ccb7-bddf-4980-8b7c-719ee0a39a87', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', 'a987556e-51b0-4d7b-91a4-1847aa8b7168', 2, 'collège', 1, '2026-05-14 21:02:56.231111+00', '2026-05-14 21:02:56.231111+00', NULL),
	('3922f45c-c7ab-4a35-adbf-8c322f910f6d', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 10, 'range', 1, '2026-05-14 21:40:25.001322+00', '2026-05-14 21:40:25.001322+00', NULL),
	('621e5256-b819-49c5-b4c7-894c4c7f0043', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 24, 'jardinage', 1, '2026-05-14 21:40:36.383081+00', '2026-05-14 21:40:36.383081+00', NULL),
	('b16b7978-f693-4d9a-9c0d-ac7b82de60fb', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 26, 'cependant', 1, '2026-05-14 21:40:37.833179+00', '2026-05-14 21:40:37.833179+00', NULL),
	('daebb2d2-70f4-4327-a1d8-5ce1b93d87fa', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 29, 'c’est', 1, '2026-05-14 21:40:39.344313+00', '2026-05-14 21:40:39.344313+00', NULL),
	('0398184a-c64b-4244-b807-fc2d27af7d2f', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 36, 'Avant', 1, '2026-05-14 21:40:42.663755+00', '2026-05-14 21:40:42.663755+00', NULL),
	('84928e4a-865d-4c32-8396-0374220321d5', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 40, 'repas', 1, '2026-05-14 21:40:44.733942+00', '2026-05-14 21:40:44.733942+00', NULL),
	('0d23128f-6246-4e20-ba10-2f2ff2a75873', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 49, 'table', 1, '2026-05-14 21:40:47.547358+00', '2026-05-14 21:40:47.547358+00', NULL),
	('0ead7a39-56e6-42e3-a81b-446122f2d06c', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 53, 'c’est', 1, '2026-05-14 21:41:08.241694+00', '2026-05-14 21:41:08.241694+00', NULL),
	('db689789-d550-4aaf-b479-580fda7a19f4', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 55, 'ennuyeux', 1, '2026-05-14 21:41:09.804107+00', '2026-05-14 21:41:09.804107+00', NULL),
	('c3604652-97b6-4f8c-82ec-c3e9ec134b5f', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 58, 'Je', 1, '2026-05-14 21:41:11.644551+00', '2026-05-14 21:41:11.644551+00', NULL),
	('800741e6-a327-45b2-94aa-de792d1ae646', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 60, 'déteste', 1, '2026-05-14 21:41:14.275992+00', '2026-05-14 21:41:14.275992+00', NULL),
	('47ca1df5-8f9f-4a16-8ea3-ef61634fbb25', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 62, 'sortir', 1, '2026-05-14 21:41:16.623741+00', '2026-05-14 21:41:16.623741+00', NULL),
	('0507520c-8517-46ed-a251-7a152a1c27e4', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '6f5caa4f-b539-4760-927a-d9ac4eb028af', 66, 'poubelle', 1, '2026-05-14 21:41:19.570806+00', '2026-05-14 21:41:19.570806+00', NULL),
	('33abf98d-9751-491d-a357-d03c712f5d8f', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'c6d70144-8754-4eab-ae72-cadae338f3b2', 16, 'faire', 1, '2026-05-14 21:42:03.319976+00', '2026-05-14 21:42:03.319976+00', NULL),
	('3cdb4fa1-9231-4e0b-a9ea-93319f855084', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '034f9a7f-1f4a-44cc-b16d-4e583c2860e6', 71, 'cependant', 1, '2026-05-14 21:45:55.078293+00', '2026-05-14 21:45:55.078293+00', NULL),
	('4fa049e7-d101-4c3f-89a6-53c09908d1b1', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 10, 'c’est', 1, '2026-05-14 21:46:59.128657+00', '2026-05-14 21:46:59.128657+00', NULL),
	('2cbc5d3c-5369-45e6-87c8-573edff4cf89', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 14, 'grand', 1, '2026-05-14 21:47:13.791384+00', '2026-05-14 21:47:13.791384+00', NULL),
	('7f3d2dd7-ab6b-4134-97ec-72fe3e8192be', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 22, 'confortable', 1, '2026-05-14 21:47:25.640249+00', '2026-05-14 21:47:25.640249+00', NULL),
	('628d7f35-44a7-4950-b6ba-b86c4c048b5f', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 35, 'moyen', 1, '2026-05-14 21:47:35.658521+00', '2026-05-14 21:47:35.658521+00', NULL),
	('994f1f51-fbc0-4e0d-937d-f94b3bedd8c1', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 41, 'armoire', 1, '2026-05-14 21:47:47.397479+00', '2026-05-14 21:47:47.397479+00', NULL),
	('078878eb-cbbd-4515-a911-a6674a8569ae', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 43, 'bleue', 1, '2026-05-14 21:48:05.273593+00', '2026-05-14 21:48:05.273593+00', NULL),
	('39266381-dd2e-4792-9988-779af4c9bf3b', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 54, 'Il', 1, '2026-05-14 21:48:09.349157+00', '2026-05-14 21:48:09.349157+00', NULL),
	('3bd5ccb4-2f34-4ce0-986f-69b21aa6c8f7', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 62, 'petite', 1, '2026-05-14 21:48:15.927165+00', '2026-05-14 21:48:15.927165+00', NULL),
	('b70d3da5-6726-410e-ae04-1a0007b689a3', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 64, 'commode', 1, '2026-05-14 21:48:20.855207+00', '2026-05-14 21:48:20.855207+00', NULL),
	('f3753a9c-de46-440c-a40e-6de17e70cf28', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 67, 'Sur', 1, '2026-05-14 21:48:23.190532+00', '2026-05-14 21:48:23.190532+00', NULL),
	('9920f863-5a55-4035-a947-9abebf29ff93', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 81, 'posters', 1, '2026-05-14 21:49:03.391718+00', '2026-05-14 21:49:03.391718+00', NULL),
	('c8a21019-c504-4899-a1e1-0df4ad9bf79b', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 84, 'Malheureusement', 1, '2026-05-14 21:49:09.885141+00', '2026-05-14 21:49:09.885141+00', NULL),
	('33c9d650-ffd0-4e5c-8963-5dca06e73b2e', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 93, 'souvent', 1, '2026-05-14 21:49:16.063095+00', '2026-05-14 21:49:16.063095+00', NULL),
	('2e827546-0fb9-40e2-a096-90facc5fc038', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 97, 'désordre', 1, '2026-05-14 21:49:18.71043+00', '2026-05-14 21:49:18.71043+00', NULL),
	('1ed63541-18ed-4ad3-9c81-efe6032b2500', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 9, 'située', 4, '2026-05-14 19:57:00.14651+00', '2026-05-14 21:49:51.101588+00', NULL),
	('cca6b7f5-f3e0-4c52-93b7-926165c4b7ac', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 33, 'serait', 1, '2026-05-14 21:50:20.60508+00', '2026-05-14 21:50:20.60508+00', NULL),
	('a4a707bb-6436-4d7e-aabf-741d871eba39', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '7b2ad257-8e09-4e55-a126-9b88f8d285e9', 4, 'propre', 2, '2026-05-14 21:46:42.470454+00', '2026-05-15 06:38:53.466359+00', NULL),
	('56af4369-9b08-40ab-9e45-6845483f78fc', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 45, 'neuf', 3, '2026-05-14 20:30:41.76048+00', '2026-05-15 06:41:51.780048+00', NULL),
	('da196c08-429f-475c-8853-0434cd9770b7', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 49, 'Au', 3, '2026-05-14 20:30:49.304023+00', '2026-05-15 06:43:01.17773+00', NULL),
	('d7627776-1744-4753-bbdb-549eae6a68d4', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 51, 'rez-de', 3, '2026-05-14 20:30:52.582108+00', '2026-05-15 06:43:14.072434+00', NULL),
	('6d1cae57-ccf7-49d0-8243-f024ebaeb8aa', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 53, 'chaussée', 2, '2026-05-14 20:30:59.968158+00', '2026-05-15 06:43:23.853969+00', NULL),
	('635f4172-497e-424e-85a6-6fd2346bfe8a', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 75, 'bureau', 1, '2026-05-15 06:44:20.267972+00', '2026-05-15 06:44:20.267972+00', NULL),
	('bc15fa6c-953c-4b4d-9570-639676a53946', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 90, 'cuisine', 1, '2026-05-15 06:45:15.667788+00', '2026-05-15 06:45:15.667788+00', NULL),
	('6fe91204-aacd-47d3-9c4b-37d8c30b7d94', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 106, 'confortable', 1, '2026-05-15 06:45:38.727408+00', '2026-05-15 06:45:38.727408+00', NULL),
	('33c61365-aa9a-4c64-b8b9-dbce2ee60b39', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 109, 'Au', 1, '2026-05-15 06:46:06.080146+00', '2026-05-15 06:46:06.080146+00', NULL),
	('d33b5916-1dda-4848-ab0d-e156f193e2de', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 111, 'premier', 1, '2026-05-15 06:46:09.595718+00', '2026-05-15 06:46:09.595718+00', NULL),
	('fc44fa61-ef60-4be3-bc70-96e6d5412960', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 132, 'chambres', 1, '2026-05-15 06:46:44.303028+00', '2026-05-15 06:46:44.303028+00', NULL),
	('740de0fe-e3a7-4559-9efb-d0b3f5cf9fc9', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 136, 'taille', 1, '2026-05-15 06:46:51.005894+00', '2026-05-15 06:46:51.005894+00', NULL),
	('052c1207-233b-49d2-b4b5-e87522c2afbd', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 147, 'aussi', 1, '2026-05-15 06:47:11.138382+00', '2026-05-15 06:47:11.138382+00', NULL),
	('1efcfc9e-b5a2-4ed5-9a20-5b29ec411142', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 151, 'salles', 1, '2026-05-15 06:47:21.339264+00', '2026-05-15 06:47:21.339264+00', NULL),
	('c35495c6-cbfc-4f9a-bb56-7dbedb530fa2', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 160, 'Derrière', 1, '2026-05-15 06:47:36.538055+00', '2026-05-15 06:47:36.538055+00', NULL),
	('530f63b8-01d4-4cbc-987e-c6a7f498cf66', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 181, 'beaucoup', 1, '2026-05-15 06:48:07.637519+00', '2026-05-15 06:48:07.637519+00', NULL),
	('63dda7e7-5eb1-4524-b477-875fa3146264', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 193, 'arbres', 1, '2026-05-15 06:48:20.848035+00', '2026-05-15 06:48:20.848035+00', NULL),
	('6b881a5f-4745-47fe-8f42-7ceb5d6b51a3', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 157, 'modernes', 1, '2026-05-15 06:47:31.948232+00', '2026-05-15 06:47:31.948232+00', NULL),
	('08f49baf-1524-4156-849e-b164fc1c5e21', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 187, 'fleurs', 1, '2026-05-15 06:48:16.748526+00', '2026-05-15 06:48:16.748526+00', NULL),
	('8aad8ab4-bb51-41da-8a40-9b2bacd6e116', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', 'f8f29b36-6b5f-4c58-8187-9278d20f959a', 185, 'jolies', 1, '2026-05-15 06:48:12.030414+00', '2026-05-15 06:48:12.030414+00', NULL);


--
-- Data for Name: practice_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."practice_sessions" ("id", "user_id", "topic_id", "started_at") VALUES
	('59c2b35b-6c69-42aa-ae99-4e140bc3f33d', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-09 21:24:00.635742+00'),
	('61d376b0-b4b0-4db5-86eb-f416de14c8d8', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-09 21:29:46.58868+00'),
	('6f7eec81-3415-4408-a3c8-ae9e7548d73f', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-09 21:31:11.561093+00'),
	('fa09a7ad-0f18-4f66-a9ab-76d7ecc3b50b', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-09 21:32:00.136652+00'),
	('3b60c024-db0f-4f65-9914-6058b920efb8', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-09 21:35:50.706512+00'),
	('a149396f-f42a-4314-bd5a-0166eefef3ea', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-09 21:46:38.080913+00'),
	('e87ed7ff-1176-4fee-a89a-69b7ef5adbe6', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-10 07:24:56.461089+00'),
	('0f2b53b2-4bcb-4634-865b-ac69db3ba6d3', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-10 08:28:11.860186+00'),
	('63d7ab13-026f-4276-bbbe-6463451154f3', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-10 12:54:25.558683+00'),
	('248ad049-d686-4607-89e5-25b78a7eb694', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '2026-05-10 13:06:32.547261+00'),
	('70a530b9-aa7b-4194-8f53-28fd3066db5e', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-10 13:09:30.393938+00'),
	('e733a309-0f88-44fc-8fec-16b86d086f29', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-10 18:12:18.916885+00'),
	('ebe0e2e3-1167-4007-98d3-e44c89128463', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-10 18:54:02.637758+00'),
	('4cd42e9e-be89-4f4a-a83b-3da0f1ab3e6f', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-10 19:02:39.860038+00'),
	('7fcb793e-a9b8-4e0d-9b68-a240a37ca9b2', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-12 19:26:25.431715+00'),
	('4a70895a-35ad-4452-8411-1a2b31cab29b', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-13 19:22:21.269262+00'),
	('bc5619fb-3ef6-4cb1-9258-b806cbfa1aaa', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '2026-05-14 18:48:49.877304+00'),
	('891d6f19-1cb0-4b88-b2b6-55453a3d1f0a', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-14 19:30:44.273529+00'),
	('99f17fe6-4d3e-4852-8789-4107ffaa1d01', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-14 20:36:07.184123+00'),
	('d3ee12fb-f445-4944-9f3b-c18fb624a8c9', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '2026-05-14 21:02:51.361528+00'),
	('450a2532-6075-4dcc-a909-019adff757d8', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '2026-05-15 06:36:57.137948+00'),
	('6f263622-8346-4a0c-979d-49999017aa53', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '2026-05-15 06:38:10.595901+00'),
	('e23e2f65-2454-4ea2-b4d4-2db01585b165', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-15 06:47:39.376114+00'),
	('3edaf3fd-ebe7-4cf4-8309-0179b0ca8274', 'e942fba8-e099-4bc9-a78f-e974cfc81557', 'f530fb13-39b5-4546-9e8c-56d65c659e98', '2026-05-17 17:18:02.86449+00'),
	('b87ddfda-c12f-4c96-897a-18433775710a', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-17 17:19:59.700248+00'),
	('e93741fa-6ec7-4fe1-9d8c-86a6c2d46cff', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '0155a33b-88d3-4562-b6c1-f981f737f224', '2026-05-18 18:40:39.335308+00'),
	('b031200b-8ee7-465e-aef7-3bd276091fde', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '06cba967-f32d-47e2-97a1-791cd4e66376', '2026-05-18 19:18:15.834112+00');


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."profiles" ("id", "username", "full_name", "created_at", "is_admin", "tier", "premium_until", "billing_interval", "accent_color", "font_family", "font_size", "para_spacing") VALUES
	('5f0264b9-8f37-42bb-bcc1-3494b5230954', 'tester_2', 'Jessie Kim', '2026-05-09 22:00:02.300339+00', false, 'free', NULL, 'monthly', 'green', 'default', 'md', 'normal'),
	('707c0818-a555-41d0-b026-2176e3cbdc91', NULL, NULL, '2026-05-12 18:38:39.812708+00', false, 'free', NULL, 'monthly', 'green', 'default', 'md', 'normal'),
	('e942fba8-e099-4bc9-a78f-e974cfc81557', 'hades', 'Isaac chen', '2026-05-09 21:23:24.312436+00', true, 'free', NULL, 'monthly', 'green', 'default', 'md', 'normal'),
	('edddd94a-f428-4229-a4cb-02948c678e40', NULL, 'Elan Jin', '2026-05-16 12:08:46.16953+00', false, 'free', NULL, 'monthly', 'green', 'default', 'md', 'normal');


--
-- Data for Name: review_state; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."buckets" ("id", "name", "owner", "created_at", "updated_at", "public", "avif_autodetection", "file_size_limit", "allowed_mime_types", "owner_id", "type") VALUES
	('diagrams', 'diagrams', NULL, '2026-05-12 17:14:06.126659+00', '2026-05-12 17:14:06.126659+00', true, false, 5242880, '{image/*}', NULL, 'STANDARD');


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

INSERT INTO "storage"."objects" ("id", "bucket_id", "name", "owner", "created_at", "updated_at", "last_accessed_at", "metadata", "version", "owner_id", "user_metadata") VALUES
	('ea7599c2-33c1-483b-afc2-ddc99f4cf606', 'diagrams', 'e942fba8-e099-4bc9-a78f-e974cfc81557/67370578-6465-4c38-8571-43d5027295c7.webp', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-13 15:22:53.441142+00', '2026-05-13 15:22:53.441142+00', '2026-05-13 15:22:53.441142+00', '{"eTag": "\"02b0ad65c3a8c51c0f57f512759420fa\"", "size": 190426, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-05-13T15:22:54.000Z", "contentLength": 190426, "httpStatusCode": 200}', 'a929e383-4ef5-4179-973d-ef3fbf9fc2cb', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '{}'),
	('5f885c62-a9ea-435b-8ac2-36282ff4cd66', 'diagrams', 'e942fba8-e099-4bc9-a78f-e974cfc81557/5a215879-5642-40ed-83eb-c58129ffef16.webp', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-18 18:29:32.032225+00', '2026-05-18 18:29:32.032225+00', '2026-05-18 18:29:32.032225+00', '{"eTag": "\"ddceb4976b006d54be8f2cde5dbaa142\"", "size": 235401, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-05-18T18:29:32.000Z", "contentLength": 235401, "httpStatusCode": 200}', 'b1b47854-3cab-4e93-afd3-0da205107179', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '{}'),
	('de92fa66-eb15-493c-bef6-6c9b5bc07e87', 'diagrams', 'e942fba8-e099-4bc9-a78f-e974cfc81557/7205a562-c2b3-4e96-a444-7599ffaa4d41.webp', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '2026-05-18 18:38:02.802323+00', '2026-05-18 18:38:02.802323+00', '2026-05-18 18:38:02.802323+00', '{"eTag": "\"080b23f9b1c6021e66daee4e3338f483\"", "size": 365329, "mimetype": "image/png", "cacheControl": "max-age=3600", "lastModified": "2026-05-18T18:38:03.000Z", "contentLength": 365329, "httpStatusCode": 200}', '622ea18e-858e-439a-b1ed-cea088f45476', 'e942fba8-e099-4bc9-a78f-e974cfc81557', '{}');


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 71, true);


--
-- PostgreSQL database dump complete
--

-- \unrestrict bjGNiEfrNWS2VXbHGtGmDrr6RRCDvrxU8cqFyeaRkaOZSYimfV1j4GgHawV1Qbb

RESET ALL;
