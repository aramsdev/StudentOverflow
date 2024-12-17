--
-- PostgreSQL database dump
--

-- Dumped from database version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-0ubuntu0.24.04.1)

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
-- Name: etiqueta; Type: TABLE; Schema: public; Owner: ars
--

CREATE TABLE public.etiqueta (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public.etiqueta OWNER TO ars;

--
-- Name: etiqueta_id_seq; Type: SEQUENCE; Schema: public; Owner: ars
--

CREATE SEQUENCE public.etiqueta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.etiqueta_id_seq OWNER TO ars;

--
-- Name: etiqueta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ars
--

ALTER SEQUENCE public.etiqueta_id_seq OWNED BY public.etiqueta.id;


--
-- Name: pregunta; Type: TABLE; Schema: public; Owner: ars
--

CREATE TABLE public.pregunta (
    id integer NOT NULL,
    titulo character varying(255) NOT NULL,
    cuerpo text NOT NULL,
    fecha_publicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_usuario integer NOT NULL
);


ALTER TABLE public.pregunta OWNER TO ars;

--
-- Name: pregunta_id_seq; Type: SEQUENCE; Schema: public; Owner: ars
--

CREATE SEQUENCE public.pregunta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pregunta_id_seq OWNER TO ars;

--
-- Name: pregunta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ars
--

ALTER SEQUENCE public.pregunta_id_seq OWNED BY public.pregunta.id;


--
-- Name: respuesta; Type: TABLE; Schema: public; Owner: ars
--

CREATE TABLE public.respuesta (
    id integer NOT NULL,
    contenido text NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    id_usuario integer NOT NULL,
    id_pregunta integer NOT NULL
);


ALTER TABLE public.respuesta OWNER TO ars;

--
-- Name: respuesta_id_seq; Type: SEQUENCE; Schema: public; Owner: ars
--

CREATE SEQUENCE public.respuesta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.respuesta_id_seq OWNER TO ars;

--
-- Name: respuesta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ars
--

ALTER SEQUENCE public.respuesta_id_seq OWNED BY public.respuesta.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: ars
--

CREATE TABLE public.usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correo_electronico character varying(255) NOT NULL,
    contrasena character varying(255) NOT NULL,
    fecha_creacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.usuario OWNER TO ars;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: ars
--

CREATE SEQUENCE public.usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO ars;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ars
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: etiqueta id; Type: DEFAULT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.etiqueta ALTER COLUMN id SET DEFAULT nextval('public.etiqueta_id_seq'::regclass);


--
-- Name: pregunta id; Type: DEFAULT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.pregunta ALTER COLUMN id SET DEFAULT nextval('public.pregunta_id_seq'::regclass);


--
-- Name: respuesta id; Type: DEFAULT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.respuesta ALTER COLUMN id SET DEFAULT nextval('public.respuesta_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Data for Name: etiqueta; Type: TABLE DATA; Schema: public; Owner: ars
--

COPY public.etiqueta (id, nombre) FROM stdin;
\.


--
-- Data for Name: pregunta; Type: TABLE DATA; Schema: public; Owner: ars
--

COPY public.pregunta (id, titulo, cuerpo, fecha_publicacion, id_usuario) FROM stdin;
2	titulo	cuerpo	2024-12-15 19:56:07.07226	1
3	titulo	cuerpo	2024-12-15 19:57:47.163309	1
4	ddd	dddd	2024-12-15 19:59:28.437584	1
5	Pregunta Ivana	Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.\r\n\r\n	2024-12-16 17:53:07.189823	2
6	Pregunta sobre Programacion	Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum 	2024-12-17 04:28:09.737565	1
7	Tengo una pregunta muy importante	CuerpoDeLaPRegunta	2024-12-17 04:33:55.898611	4
\.


--
-- Data for Name: respuesta; Type: TABLE DATA; Schema: public; Owner: ars
--

COPY public.respuesta (id, contenido, fecha_creacion, id_usuario, id_pregunta) FROM stdin;
1	Contenidoo	2024-12-15 20:12:31.833188	1	2
2	Pruebas	2024-12-16 17:52:40.482783	2	2
3	Holaa	2024-12-17 04:27:44.913116	1	2
4	Nueva Respuesta	2024-12-17 04:32:41.39167	1	6
5	Respondere a esta pregunta	2024-12-17 04:34:07.818068	4	6
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: ars
--

COPY public.usuario (id, nombre, correo_electronico, contrasena, fecha_creacion) FROM stdin;
1	alexis	alexis@alexis.com	alexis	2024-12-15 19:48:34.637766
2	ivana	ivana@ivana.com	ivana	2024-12-16 17:52:26.029594
3	javier	javier@javier.com	javier	2024-12-17 04:29:39.554467
4	prueba	prueba@prueba.com	prueba	2024-12-17 04:33:35.4321
\.


--
-- Name: etiqueta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ars
--

SELECT pg_catalog.setval('public.etiqueta_id_seq', 1, false);


--
-- Name: pregunta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ars
--

SELECT pg_catalog.setval('public.pregunta_id_seq', 7, true);


--
-- Name: respuesta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ars
--

SELECT pg_catalog.setval('public.respuesta_id_seq', 5, true);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ars
--

SELECT pg_catalog.setval('public.usuario_id_seq', 4, true);


--
-- Name: etiqueta etiqueta_nombre_key; Type: CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.etiqueta
    ADD CONSTRAINT etiqueta_nombre_key UNIQUE (nombre);


--
-- Name: etiqueta etiqueta_pkey; Type: CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.etiqueta
    ADD CONSTRAINT etiqueta_pkey PRIMARY KEY (id);


--
-- Name: pregunta pregunta_pkey; Type: CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.pregunta
    ADD CONSTRAINT pregunta_pkey PRIMARY KEY (id);


--
-- Name: respuesta respuesta_pkey; Type: CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.respuesta
    ADD CONSTRAINT respuesta_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_correo_electronico_key; Type: CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_correo_electronico_key UNIQUE (correo_electronico);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: pregunta pregunta_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.pregunta
    ADD CONSTRAINT pregunta_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- Name: respuesta respuesta_id_pregunta_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.respuesta
    ADD CONSTRAINT respuesta_id_pregunta_fkey FOREIGN KEY (id_pregunta) REFERENCES public.pregunta(id) ON DELETE CASCADE;


--
-- Name: respuesta respuesta_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ars
--

ALTER TABLE ONLY public.respuesta
    ADD CONSTRAINT respuesta_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuario(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

