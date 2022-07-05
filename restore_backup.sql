--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: role; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public.role AS ENUM (
    'pro',
    'newby'
);


ALTER TYPE public.role OWNER TO admin;

--
-- Name: user_role; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public.user_role AS ENUM (
    'pro',
    'newbie'
);


ALTER TYPE public.user_role OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: addedcontacts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.addedcontacts (
    owner integer NOT NULL,
    contact integer NOT NULL
);


ALTER TABLE public.addedcontacts OWNER TO admin;

--
-- Name: blockedcontacts; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.blockedcontacts (
    owner integer NOT NULL,
    contact integer NOT NULL
);


ALTER TABLE public.blockedcontacts OWNER TO admin;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.tokens (
    user_ref_id integer,
    token character varying(20),
    token_exp timestamp without time zone DEFAULT (now() + '01:00:00'::interval) NOT NULL
);


ALTER TABLE public.tokens OWNER TO admin;

--
-- Name: users; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50),
    password character varying(100),
    role public.user_role
);


ALTER TABLE public.users OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO admin;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: addedcontacts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.addedcontacts (owner, contact) FROM stdin;
\.


--
-- Data for Name: blockedcontacts; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.blockedcontacts (owner, contact) FROM stdin;
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.tokens (user_ref_id, token, token_exp) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.users (id, username, password, role) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.users_id_seq', 25, true);


--
-- Name: blockedcontacts blocked_contact_id; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blockedcontacts
    ADD CONSTRAINT blocked_contact_id PRIMARY KEY (owner, contact);


--
-- Name: tokens constraint_name; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT constraint_name UNIQUE (user_ref_id);


--
-- Name: addedcontacts contact_id; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.addedcontacts
    ADD CONSTRAINT contact_id PRIMARY KEY (owner, contact);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: addedcontacts addedcontacts_contact_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.addedcontacts
    ADD CONSTRAINT addedcontacts_contact_fkey FOREIGN KEY (contact) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: addedcontacts addedcontacts_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.addedcontacts
    ADD CONSTRAINT addedcontacts_owner_fkey FOREIGN KEY (owner) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: blockedcontacts blockedcontacts_contact_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blockedcontacts
    ADD CONSTRAINT blockedcontacts_contact_fkey FOREIGN KEY (contact) REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- Name: blockedcontacts blockedcontacts_owner_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.blockedcontacts
    ADD CONSTRAINT blockedcontacts_owner_fkey FOREIGN KEY (owner) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tokens tokens_user_ref_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_user_ref_id_fkey FOREIGN KEY (user_ref_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

