--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    origin_id integer NOT NULL,
    has_magic boolean NOT NULL,
    has_space_flight boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    has_life boolean NOT NULL,
    orbiting_planet_position integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: origin; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.origin (
    origin_id integer NOT NULL,
    name character varying(30) NOT NULL,
    media text,
    year integer
);


ALTER TABLE public.origin OWNER TO freecodecamp;

--
-- Name: origin_origin_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.origin_origin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.origin_origin_id_seq OWNER TO freecodecamp;

--
-- Name: origin_origin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.origin_origin_id_seq OWNED BY public.origin.origin_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    orbital_position numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    planetary_system text,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: origin origin_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.origin ALTER COLUMN origin_id SET DEFAULT nextval('public.origin_origin_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Cosmere', 1, true, true);
INSERT INTO public.galaxy VALUES (2, 'Dune', 2, true, true);
INSERT INTO public.galaxy VALUES (3, 'Discworld', 3, true, false);
INSERT INTO public.galaxy VALUES (4, 'Middle-earth', 4, true, false);
INSERT INTO public.galaxy VALUES (5, 'Pern', 5, true, false);
INSERT INTO public.galaxy VALUES (6, 'Velgarth', 6, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Oem', 2, false, 2);
INSERT INTO public.moon VALUES (2, 'Ky 1', 3, false, 3);
INSERT INTO public.moon VALUES (3, 'Ky 2', 3, false, 3);
INSERT INTO public.moon VALUES (4, 'Ky 3', 3, false, 3);
INSERT INTO public.moon VALUES (5, 'Ky 4', 3, false, 3);
INSERT INTO public.moon VALUES (6, 'Ralen 1', 4, false, 4);
INSERT INTO public.moon VALUES (7, 'Ralen 2', 4, false, 4);
INSERT INTO public.moon VALUES (8, 'Ralen 3', 4, false, 4);
INSERT INTO public.moon VALUES (9, 'Ralen 4', 4, false, 4);
INSERT INTO public.moon VALUES (10, 'Ralen 5', 4, false, 4);
INSERT INTO public.moon VALUES (11, 'Aagal Nod 1', 7, false, 2);
INSERT INTO public.moon VALUES (12, 'Aagal Nod 2', 7, false, 2);
INSERT INTO public.moon VALUES (13, 'Aagal Nod 3', 7, false, 2);
INSERT INTO public.moon VALUES (14, 'Aagal Nod 4', 7, false, 2);
INSERT INTO public.moon VALUES (15, 'Aagal Nod 5', 7, false, 2);
INSERT INTO public.moon VALUES (16, 'Aagal Nod 6', 7, false, 2);
INSERT INTO public.moon VALUES (17, 'Aagal Uch 1', 8, false, 3);
INSERT INTO public.moon VALUES (18, 'Aagal Uch 2', 8, false, 3);
INSERT INTO public.moon VALUES (19, 'Aagal Uch 3', 8, false, 3);
INSERT INTO public.moon VALUES (20, 'Aagal Uch 4', 8, false, 3);
INSERT INTO public.moon VALUES (21, 'Aagal Uch 5', 8, false, 3);
INSERT INTO public.moon VALUES (22, 'Nizh Da', 11, false, 1);
INSERT INTO public.moon VALUES (23, 'Coronach', 13, false, 2);
INSERT INTO public.moon VALUES (24, 'First of the First', 16, false, 1);
INSERT INTO public.moon VALUES (25, 'First of the Fifth', 20, false, 5);
INSERT INTO public.moon VALUES (26, 'Second of the Fifth', 20, false, 5);
INSERT INTO public.moon VALUES (27, 'Third of the Fifth', 20, false, 5);
INSERT INTO public.moon VALUES (28, 'First of the Sixth', 21, false, 6);
INSERT INTO public.moon VALUES (29, 'Second of the Sixth', 21, false, 6);
INSERT INTO public.moon VALUES (30, 'Third of the Sixth', 21, false, 6);
INSERT INTO public.moon VALUES (31, 'Fourth of the Sixth', 21, false, 6);
INSERT INTO public.moon VALUES (32, 'First of the Seventh', 22, false, 7);
INSERT INTO public.moon VALUES (33, 'Second of the Seventh', 22, false, 7);
INSERT INTO public.moon VALUES (34, 'Third of the Seventh', 22, false, 7);
INSERT INTO public.moon VALUES (35, 'Fourth of the Seventh', 22, false, 7);
INSERT INTO public.moon VALUES (36, 'Salas', 24, false, 2);
INSERT INTO public.moon VALUES (37, 'Nomon', 24, false, 2);
INSERT INTO public.moon VALUES (38, 'Mishim', 24, false, 2);
INSERT INTO public.moon VALUES (39, 'Rrendos', 36, false, 1);
INSERT INTO public.moon VALUES (40, 'Farkeeper 1', 37, false, 2);
INSERT INTO public.moon VALUES (41, 'Farkeeper 2', 37, false, 2);
INSERT INTO public.moon VALUES (42, 'Farkeeper 3', 37, false, 2);
INSERT INTO public.moon VALUES (43, 'Farkeeper 4', 37, false, 2);
INSERT INTO public.moon VALUES (44, 'Farkeeper 5', 37, false, 2);
INSERT INTO public.moon VALUES (45, 'Farkeeper 6', 37, false, 2);


--
-- Data for Name: origin; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.origin VALUES (1, 'Brandon Sanderson', 'literature', NULL);
INSERT INTO public.origin VALUES (2, 'Frank Herbert', 'literature', NULL);
INSERT INTO public.origin VALUES (3, 'Terry Pratchet', 'literature', NULL);
INSERT INTO public.origin VALUES (4, 'J. R. R. Tolkien', 'literature', NULL);
INSERT INTO public.origin VALUES (5, 'Anne McCaffrey', 'literature', NULL);
INSERT INTO public.origin VALUES (6, 'Mercedes Lackey', 'literature', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Donne', 1, false, 1);
INSERT INTO public.planet VALUES (2, 'Sel', 1, true, 2);
INSERT INTO public.planet VALUES (3, 'Ky', 1, false, 3);
INSERT INTO public.planet VALUES (4, 'Ralen', 1, false, 4);
INSERT INTO public.planet VALUES (5, 'Unnamed Dwarf Planet', 1, false, 5);
INSERT INTO public.planet VALUES (6, 'Scadrial', 2, true, 1);
INSERT INTO public.planet VALUES (7, 'Aagal  Nod', 2, false, 2);
INSERT INTO public.planet VALUES (8, 'Aagal Uch', 2, false, 3);
INSERT INTO public.planet VALUES (9, 'Dwarf Planet', 2, false, 4);
INSERT INTO public.planet VALUES (10, 'Dwarf Planet', 2, false, 5);
INSERT INTO public.planet VALUES (11, 'Taldain', 4, true, 1);
INSERT INTO public.planet VALUES (12, 'Monody', 5, false, 1);
INSERT INTO public.planet VALUES (13, 'Elegy', 5, false, 2);
INSERT INTO public.planet VALUES (14, 'Threnody', 5, true, 3);
INSERT INTO public.planet VALUES (15, 'Purity', 5, false, 4);
INSERT INTO public.planet VALUES (16, 'First of the Sun', 6, true, 1);
INSERT INTO public.planet VALUES (17, 'Second of the Sun', 6, true, 2);
INSERT INTO public.planet VALUES (18, 'Third of the Sun', 6, true, 3);
INSERT INTO public.planet VALUES (19, 'Fourth of the Sun', 6, true, 4);
INSERT INTO public.planet VALUES (20, 'Fifth of the Sun', 6, false, 5);
INSERT INTO public.planet VALUES (21, 'Sixth of the Sun', 6, false, 6);
INSERT INTO public.planet VALUES (22, 'Seventh of the Sun', 6, false, 7);
INSERT INTO public.planet VALUES (23, 'Ashyn', 7, true, 1);
INSERT INTO public.planet VALUES (24, 'Roshar', 7, true, 2);
INSERT INTO public.planet VALUES (25, 'Braize', 7, false, 3);
INSERT INTO public.planet VALUES (26, 'Jes', 7, false, 4);
INSERT INTO public.planet VALUES (27, 'Nan', 7, false, 5);
INSERT INTO public.planet VALUES (28, 'Chach', 7, false, 6);
INSERT INTO public.planet VALUES (29, 'Vev', 7, false, 7);
INSERT INTO public.planet VALUES (30, 'Palah', 7, false, 8);
INSERT INTO public.planet VALUES (31, 'Shash', 7, false, 9);
INSERT INTO public.planet VALUES (32, 'Betab', 7, false, 10);
INSERT INTO public.planet VALUES (33, 'Kak', 7, false, 11);
INSERT INTO public.planet VALUES (34, 'Tanat', 7, false, 12);
INSERT INTO public.planet VALUES (35, 'Ishi', 7, false, 13);
INSERT INTO public.planet VALUES (36, 'Nalthis', 8, true, 1);
INSERT INTO public.planet VALUES (37, 'Farkeeper the Bright', 8, false, 2);
INSERT INTO public.planet VALUES (38, 'Nightstar the Hidden', 8, false, 3);
INSERT INTO public.planet VALUES (39, 'Komashi', 9, true, 1);
INSERT INTO public.planet VALUES (40, 'UTol', 9, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mashe', 1, 'Selish', 'a yellow star');
INSERT INTO public.star VALUES (2, 'sun', 1, 'Scadrian', 'a yellow sun');
INSERT INTO public.star VALUES (3, 'white dwarf', 1, 'Taldain', 'weak');
INSERT INTO public.star VALUES (4, 'supergiant', 1, 'Taldain', 'blue-white');
INSERT INTO public.star VALUES (5, 'sun', 1, 'Threnodite', NULL);
INSERT INTO public.star VALUES (6, 'sun', 1, 'Drominad', NULL);
INSERT INTO public.star VALUES (7, 'Greater Roshar', 1, 'Rosharan', NULL);
INSERT INTO public.star VALUES (8, 'star', 1, 'Nalthian', 'yellow');
INSERT INTO public.star VALUES (9, 'star', 1, 'UTol', 'red-orange');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 45, true);


--
-- Name: origin_origin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.origin_origin_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 40, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: origin origin_origin_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.origin
    ADD CONSTRAINT origin_origin_id_key UNIQUE (origin_id);


--
-- Name: origin origin_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.origin
    ADD CONSTRAINT origin_pkey PRIMARY KEY (origin_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: galaxy galaxy_origin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_origin_id_fkey FOREIGN KEY (origin_id) REFERENCES public.origin(origin_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

