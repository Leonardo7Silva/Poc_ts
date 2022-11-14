--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: jogos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.jogos (
    id integer NOT NULL,
    "mandanteId" integer NOT NULL,
    "visitanteId" integer NOT NULL,
    "placarMandante" integer,
    "placarVisitante" integer
);


--
-- Name: jogos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jogos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: jogos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jogos_id_seq OWNED BY public.jogos.id;


--
-- Name: paises; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.paises (
    id integer NOT NULL,
    name text NOT NULL
);


--
-- Name: paises_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.paises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: paises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.paises_id_seq OWNED BY public.paises.id;


--
-- Name: palpites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.palpites (
    id integer NOT NULL,
    name text NOT NULL,
    "jogoId" integer NOT NULL,
    "placarMandante" integer NOT NULL,
    "placarVisitante" integer NOT NULL,
    marcadores text NOT NULL
);


--
-- Name: palpites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.palpites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: palpites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.palpites_id_seq OWNED BY public.palpites.id;


--
-- Name: jogos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jogos ALTER COLUMN id SET DEFAULT nextval('public.jogos_id_seq'::regclass);


--
-- Name: paises id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paises ALTER COLUMN id SET DEFAULT nextval('public.paises_id_seq'::regclass);


--
-- Name: palpites id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palpites ALTER COLUMN id SET DEFAULT nextval('public.palpites_id_seq'::regclass);


--
-- Data for Name: jogos; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jogos VALUES (1, 1, 2, NULL, NULL);
INSERT INTO public.jogos VALUES (2, 1, 3, NULL, NULL);
INSERT INTO public.jogos VALUES (3, 1, 4, NULL, NULL);
INSERT INTO public.jogos VALUES (4, 2, 3, NULL, NULL);
INSERT INTO public.jogos VALUES (5, 2, 4, NULL, NULL);
INSERT INTO public.jogos VALUES (6, 3, 4, NULL, NULL);


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.paises VALUES (1, 'Brasil');
INSERT INTO public.paises VALUES (2, 'Sérvia');
INSERT INTO public.paises VALUES (3, 'Suíça');
INSERT INTO public.paises VALUES (4, 'Camarões');


--
-- Data for Name: palpites; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.palpites VALUES (1, 'Leo', 1, 3, 0, 'Neymar 2 e Vini');
INSERT INTO public.palpites VALUES (2, 'Wilton', 1, 1, 0, 'Vini');
INSERT INTO public.palpites VALUES (5, 'Adriana', 1, 0, 1, 'Vlarovic');
INSERT INTO public.palpites VALUES (7, 'Leo', 2, 4, 0, 'Vini 2, ney 2');
INSERT INTO public.palpites VALUES (9, 'Adriana', 2, 1, 0, 'Paquetá');


--
-- Name: jogos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jogos_id_seq', 6, true);


--
-- Name: paises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.paises_id_seq', 4, true);


--
-- Name: palpites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.palpites_id_seq', 9, true);


--
-- Name: jogos jogos_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jogos
    ADD CONSTRAINT jogos_pk PRIMARY KEY (id);


--
-- Name: paises paises_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pk PRIMARY KEY (id);


--
-- Name: palpites palpites_pk; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palpites
    ADD CONSTRAINT palpites_pk PRIMARY KEY (id);


--
-- Name: jogos jogos_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jogos
    ADD CONSTRAINT jogos_fk0 FOREIGN KEY ("mandanteId") REFERENCES public.paises(id);


--
-- Name: jogos jogos_fk1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jogos
    ADD CONSTRAINT jogos_fk1 FOREIGN KEY ("visitanteId") REFERENCES public.paises(id);


--
-- Name: palpites palpites_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.palpites
    ADD CONSTRAINT palpites_fk0 FOREIGN KEY ("jogoId") REFERENCES public.jogos(id);


--
-- PostgreSQL database dump complete
--

