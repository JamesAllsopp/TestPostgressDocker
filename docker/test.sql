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
1	250e271d-81e9-4727-bc31-3eaa9ed8ace7	increasing	Oysters Rockefeller	44.86.60
2	1c50eb5f-7b3b-4c6a-b94a-b25fb075bbc7	styles	Chowder	78.97.76
3	9bcd023b-79ba-449a-aefa-4b33979ab5db	nh	Shawarma	54.67.43
4	415dfa7f-1d1f-40a7-9ac9-9a84938e6dcb	samuel	Sichuan Hot Pot	77.23.27
5	959c3df5-7874-44f7-9352-38e1d6837d17	welcome	Potato Wedges	69.54.29
6	4cedc197-cec3-4791-8f25-b5d49e33a71d	reviewed	Protein bar	74.29.1
7	54fd37f4-b453-4954-b129-82ee647cf668	math	Risotto	39.33.88
8	6eecaa31-93d4-4ac7-914b-7611b3a82479	planning	Toaster Strudel	43.77.24
9	751821b9-4ba5-4524-8381-0d20b9fb131b	housewares	Fortune cookie	57.31.92
10	a9e2ce82-e4c6-4bd2-bc9f-a4c505bb1352	romania	Muffuletta	20.59.84
11	a85102df-80d4-498a-b30b-77e9baccdd79	deleted	Sour cream	43.70.18
12	0a8887d7-13ae-4dfd-a8be-1c051a361a77	driving	Vichyssoise	95.52.28
13	a6046009-8d66-4e9e-956e-7b9fa5301f38	preparation	Drunken chicken	92.78.63
14	eae8879a-6d9c-4a32-be25-605183c4460f	mask	Popover	89.10.2
15	7af7561b-0cf1-4db9-b679-033c8576eaae	effects	Fried chicken	15.81.2
16	00879554-d775-4aab-8737-25a17e823c22	registered	Senate bean soup	10.64.10
17	cc86459b-c1bb-4b71-bd4b-b774ac90d1cb	else	Vichyssoise	97.69.26
18	d3e6d8f0-9214-4322-81e2-8e619f8de5e5	adopted	Pastrami on Rye	76.65.17
19	d846e7c2-5c18-4fb7-ba1f-956424b2d5e3	goods	Rice and gravy	69.88.5
20	ee07b4a8-9d76-4ffb-885b-5da614e89c62	farmer	Chili dog	53.12.49
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

