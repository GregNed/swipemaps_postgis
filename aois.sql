--
-- PostgreSQL database dump
--

-- Dumped from database version 11.13
-- Dumped by pg_dump version 12.3

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

--
-- Name: aoi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aoi (
    id integer NOT NULL,
    name text,
    geom public.geometry(Polygon,32637)
);


ALTER TABLE public.aoi OWNER TO postgres;

--
-- Name: aoi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aoi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.aoi_id_seq OWNER TO postgres;

--
-- Name: aoi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aoi_id_seq OWNED BY public.aoi.id;


--
-- Name: aoi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aoi ALTER COLUMN id SET DEFAULT nextval('public.aoi_id_seq'::regclass);


--
-- Data for Name: aoi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aoi (id, name, geom) FROM stdin;
4	Москва и Московская область	\N
1	Йошкар-Ола	\N
2	Иркутск	\N
\.


--
-- Name: aoi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aoi_id_seq', 4, true);


--
-- Name: aoi aoi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aoi
    ADD CONSTRAINT aoi_pkey PRIMARY KEY (id);


--
-- Name: idx_aoi_geom; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_aoi_geom ON public.aoi USING gist (geom);

ALTER TABLE public.aoi CLUSTER ON idx_aoi_geom;


--
-- PostgreSQL database dump complete
--

