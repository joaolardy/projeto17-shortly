--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    expired boolean DEFAULT false NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2023-03-06 13:50:10.038454'::timestamp without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: shortedUrls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."shortedUrls" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "originalUrl" text NOT NULL,
    "shortedUrl" text NOT NULL,
    "accessNumber" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2023-03-06 11:17:49.064746'::timestamp without time zone NOT NULL
);


--
-- Name: shortedUrls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."shortedUrls_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortedUrls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."shortedUrls_id_seq" OWNED BY public."shortedUrls".id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email text NOT NULL,
    name character varying(255) NOT NULL,
    "createdAt" timestamp without time zone DEFAULT '2023-03-05 18:29:13.476224'::timestamp without time zone NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: shortedUrls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls" ALTER COLUMN id SET DEFAULT nextval('public."shortedUrls_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 10, '06a51e16-2ac4-45fb-b531-ad640adc6a48', false, '2023-03-06 13:50:10.038454');
INSERT INTO public.sessions VALUES (3, 10, 'c87da255-b4f9-4a83-a380-cee567dafa9d', false, '2023-03-06 13:50:10.038454');


--
-- Data for Name: shortedUrls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."shortedUrls" VALUES (1, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'Cggb4f3r', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (2, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'NsdGY7HG', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (3, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'hykbn-9Z', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (4, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'aznxkuMl', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (5, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'UbACRII-', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (6, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'atioVDm1', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (7, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'fn8KxO8t', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (8, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'r4D8mAVd', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (9, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'YHJrE58L', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (10, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', '1gJ7V4py', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (11, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', '8LCdxPsq', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (12, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'c-4Qhd01', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (13, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'VT7UzjCa', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (14, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'YeoGjk44', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (15, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', '73NY377w', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (16, 9, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-c306c707e7504d32a689e0ff6dffb8e3', 'GuZHJWss', 13, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (17, 9, 'https://www.joaodacouve.com', 'Rpk8oECS', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (19, 10, 'https://www.joaodacouve.com2222', 'pI_Kb26r', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (20, 10, 'https://www.alagoas.com2222', 'RiGnpDxI', 0, '2023-03-06 11:17:49.064746');
INSERT INTO public."shortedUrls" VALUES (21, 10, 'https://www.bananao.com2222', 'AwWav8VL', 0, '2023-03-06 11:17:49.064746');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'joao@driven.com.br', 'João', '2023-03-05 18:29:13.476224', '$2b$10$gVwECUo1EcIwKr0Un6zjJOPT/Prv/LPg2Oxq/eCvn7HmFUT2S0lLm');
INSERT INTO public.users VALUES (2, 'joao1@driven.com.br', 'João1', '2023-03-05 18:29:13.476224', '$2b$10$bFYeYxr.Q2FWG3ZZY7eJOuD6xfzkdRt0u.zU9jKxMHkNVKvOlzT5C');
INSERT INTO public.users VALUES (3, 'joao11@driven.com.br', 'João11', '2023-03-05 18:29:13.476224', '$2b$10$l8rkJlIGXUwZSXa6DY8KzOf8Z0XI8/zhoYnaBEelSWhy/sAkAcAq.');
INSERT INTO public.users VALUES (4, 'joao111@driven.com.br', 'João11', '2023-03-05 18:29:13.476224', '$2b$10$bt/qVdAjKBmAvCoR2q..xOGYHjQYkgUa9gfz3Ohjyt2OG2JjeuOhm');
INSERT INTO public.users VALUES (5, 'joao111a@driven.com.br', 'João11', '2023-03-05 18:29:13.476224', '$2b$10$Ze.SjH688jH79rENRkBZi.GwZA2qX3gy6B/WTzNsSNAiBSRIBFb7u');
INSERT INTO public.users VALUES (6, 'joao11s1a@driven.com.br', 'João11', '2023-03-05 18:29:13.476224', '$2b$10$GbFhFjySlLRBlcTN0QPEPOuxv5KwRJYQ3mP9K7LyY1phyzqRfovFW');
INSERT INTO public.users VALUES (7, 'joao11ss1a@driven.com.br', 'João11', '2023-03-05 18:29:13.476224', '$2b$10$alGBiY22x/cwiCaLndGpguT3sSG/HHojaDuE22IY6SL5Sz8RNAqTm');
INSERT INTO public.users VALUES (8, 'email@driven.com.br', 'João11', '2023-03-05 18:29:13.476224', '$2b$10$rahB3YGM3G9F7axMtWyuSusoA3MvDq5uPScKEFXB4yUgAh09alO9u');
INSERT INTO public.users VALUES (9, 'email123@driven.com.br', 'João11', '2023-03-05 18:29:13.476224', '$2b$10$hERCXLc2fOVShD0zIulMWOV/rj/8oLIQx6L0tIRksD2JvwmGv.KsS');
INSERT INTO public.users VALUES (10, 'joaolatinha@driven.com.br', 'Joao Latinha', '2023-03-05 18:29:13.476224', '$2b$10$ctaxTFbpKanobZuwCyavzec7P04X8YqM4ePA5kDgWcW1FHpbsTMba');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 3, true);


--
-- Name: shortedUrls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."shortedUrls_id_seq"', 21, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: shortedUrls shortedUrls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls"
    ADD CONSTRAINT "shortedUrls_pkey" PRIMARY KEY (id);


--
-- Name: shortedUrls shortedUrls_shortedUrl_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls"
    ADD CONSTRAINT "shortedUrls_shortedUrl_key" UNIQUE ("shortedUrl");


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: shortedUrls shortedUrls_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortedUrls"
    ADD CONSTRAINT "shortedUrls_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

