--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.2

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

--
-- Name: test_database; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE test_database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE test_database OWNER TO postgres;

\connect test_database

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
-- Name: owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owner (
    id integer NOT NULL,
    email character varying(40) NOT NULL,
    creator character varying(40) NOT NULL
);


ALTER TABLE public.owner OWNER TO postgres;

--
-- Name: owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.owner_id_seq OWNER TO postgres;

--
-- Name: owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owner_id_seq OWNED BY public.owner.id;


--
-- Name: user_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_account (
    id integer NOT NULL,
    uid character varying(40) NOT NULL,
    name character varying(40) NOT NULL,
    favourite_food character varying(40) NOT NULL,
    version character varying(30) NOT NULL
);


ALTER TABLE public.user_account OWNER TO postgres;

--
-- Name: user_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_account_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_account_id_seq OWNER TO postgres;

--
-- Name: user_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_account_id_seq OWNED BY public.user_account.id;


--
-- Name: owner id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owner ALTER COLUMN id SET DEFAULT nextval('public.owner_id_seq'::regclass);


--
-- Name: user_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account ALTER COLUMN id SET DEFAULT nextval('public.user_account_id_seq'::regclass);


--
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owner (id, email, creator) FROM stdin;
\.


--
-- Data for Name: user_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_account (id, uid, name, favourite_food, version) FROM stdin;
1	98fabb98-b9f7-4fc8-9f02-37ebc190bdee	increasing	Oysters Rockefeller	44.86.60
2	308d183f-6c5a-455a-8ae9-19c60781307d	styles	Chowder	78.97.76
3	e5ece496-745c-41f9-806b-b33adeddbd52	nh	Shawarma	54.67.43
4	7b956c96-8ffb-45c4-b882-6d97b28f5ccc	samuel	Sichuan Hot Pot	77.23.27
5	7e8cd403-30bb-4643-8901-0cce0f188bb7	welcome	Potato Wedges	69.54.29
6	5fa2433f-fd60-4cca-b3e9-42c16365979d	reviewed	Protein bar	74.29.1
7	4c1b8529-208b-4644-8f8f-15e99ebf6440	math	Risotto	39.33.88
8	71e3545c-d105-482c-9b16-640f1d31a8e4	planning	Toaster Strudel	43.77.24
9	dad753f7-d478-4756-83b9-4293f5b73c54	housewares	Fortune cookie	57.31.92
10	f0051722-5852-4017-af9a-81b090fde0f7	romania	Muffuletta	20.59.84
11	b8f7f0cc-9856-421a-ae25-3b7a8c12ef8c	deleted	Sour cream	43.70.18
12	613b1abf-f4f6-4c8c-a7f8-88dffcc5f410	driving	Vichyssoise	95.52.28
13	59b7ffa0-61b2-47a4-8b0d-adbbba64543f	preparation	Drunken chicken	92.78.63
14	383e28dc-6ecb-4a06-be2a-d7345944ae2b	mask	Popover	89.10.2
15	a3bd85e3-6587-4048-ae42-a6712f504ae5	effects	Fried chicken	15.81.2
16	326e7f4a-bdbf-4cff-91a4-a3c1daf7ea94	registered	Senate bean soup	10.64.10
17	1556f669-8721-426e-97cc-fd494a589705	else	Vichyssoise	97.69.26
18	b3123701-da54-40cf-93cc-af36dee26285	adopted	Pastrami on Rye	76.65.17
19	b300fbba-7e76-4b41-b096-682d35bb6306	goods	Rice and gravy	69.88.5
20	04740779-e85c-4014-8f39-44401138c18d	farmer	Chili dog	53.12.49
\.


--
-- Name: owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owner_id_seq', 1, false);


--
-- Name: user_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_account_id_seq', 20, true);


--
-- Name: owner owner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT owner_pkey PRIMARY KEY (id);


--
-- Name: user_account user_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_account
    ADD CONSTRAINT user_account_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

