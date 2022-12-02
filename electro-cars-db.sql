--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 15.0

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO postgres;

--
-- Name: charging_sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.charging_sessions (
    id bigint NOT NULL,
    amount integer,
    connector_id bigint NOT NULL,
    client_id bigint NOT NULL,
    state integer
);


ALTER TABLE public.charging_sessions OWNER TO postgres;

--
-- Name: charging_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.charging_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.charging_sessions_id_seq OWNER TO postgres;

--
-- Name: charging_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.charging_sessions_id_seq OWNED BY public.charging_sessions.id;


--
-- Name: charging_stations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.charging_stations (
    id bigint NOT NULL,
    serial_number character varying,
    location_id bigint NOT NULL
);


ALTER TABLE public.charging_stations OWNER TO postgres;

--
-- Name: charging_stations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.charging_stations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.charging_stations_id_seq OWNER TO postgres;

--
-- Name: charging_stations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.charging_stations_id_seq OWNED BY public.charging_stations.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    phone_number character varying,
    first_name character varying,
    surname character varying,
    middle_name character varying
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO postgres;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: connectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.connectors (
    id bigint NOT NULL,
    state integer,
    connector_type integer,
    charging_station_id bigint NOT NULL,
    power integer
);


ALTER TABLE public.connectors OWNER TO postgres;

--
-- Name: connectors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.connectors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.connectors_id_seq OWNER TO postgres;

--
-- Name: connectors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.connectors_id_seq OWNED BY public.connectors.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    title character varying,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: charging_sessions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_sessions ALTER COLUMN id SET DEFAULT nextval('public.charging_sessions_id_seq'::regclass);


--
-- Name: charging_stations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_stations ALTER COLUMN id SET DEFAULT nextval('public.charging_stations_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: connectors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors ALTER COLUMN id SET DEFAULT nextval('public.connectors_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-12-01 11:59:29.530117	2022-12-01 11:59:29.530117
\.


--
-- Data for Name: charging_sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.charging_sessions (id, amount, connector_id, client_id, state) FROM stdin;
2	0	1	1	1
3	0	2	1	1
4	0	3	2	1
\.


--
-- Data for Name: charging_stations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.charging_stations (id, serial_number, location_id) FROM stdin;
1	48353832647	1
2	94047527591	1
3	458456205711	2
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, phone_number, first_name, surname, middle_name) FROM stdin;
1	89998889999	alexey	rakitin	evgenevich
2	89998889934	maksim	nikitin	alekseevich
\.


--
-- Data for Name: connectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.connectors (id, state, connector_type, charging_station_id, power) FROM stdin;
4	0	2	3	600
1	0	0	1	500
2	0	1	1	300
3	0	0	2	400
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, title, latitude, longitude) FROM stdin;
1	Bolshoi Theatre	55.76	37.61
2	VDNH	55.83	37.63
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schema_migrations (version) FROM stdin;
20221201112844
20221201113131
20221201113534
20221201113620
20221201113700
20221201125318
20221201195547
20221202121833
\.


--
-- Name: charging_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.charging_sessions_id_seq', 4, true);


--
-- Name: charging_stations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.charging_stations_id_seq', 3, true);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 2, true);


--
-- Name: connectors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.connectors_id_seq', 4, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: charging_sessions charging_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_sessions
    ADD CONSTRAINT charging_sessions_pkey PRIMARY KEY (id);


--
-- Name: charging_stations charging_stations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_stations
    ADD CONSTRAINT charging_stations_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: connectors connectors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT connectors_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_charging_sessions_on_client_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_charging_sessions_on_client_id ON public.charging_sessions USING btree (client_id);


--
-- Name: index_charging_sessions_on_connector_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_charging_sessions_on_connector_id ON public.charging_sessions USING btree (connector_id);


--
-- Name: index_charging_stations_on_location_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_charging_stations_on_location_id ON public.charging_stations USING btree (location_id);


--
-- Name: index_connectors_on_charging_station_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX index_connectors_on_charging_station_id ON public.connectors USING btree (charging_station_id);


--
-- Name: charging_stations fk_rails_0c86325662; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_stations
    ADD CONSTRAINT fk_rails_0c86325662 FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: charging_sessions fk_rails_7af8ceb67b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_sessions
    ADD CONSTRAINT fk_rails_7af8ceb67b FOREIGN KEY (connector_id) REFERENCES public.connectors(id);


--
-- Name: charging_sessions fk_rails_b614f6db4d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.charging_sessions
    ADD CONSTRAINT fk_rails_b614f6db4d FOREIGN KEY (client_id) REFERENCES public.clients(id);


--
-- Name: connectors fk_rails_c6663557d9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.connectors
    ADD CONSTRAINT fk_rails_c6663557d9 FOREIGN KEY (charging_station_id) REFERENCES public.charging_stations(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

