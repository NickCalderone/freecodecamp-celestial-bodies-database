--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(255) NOT NULL,
    diameter_in_ly integer,
    distance_from_earth_in_ly numeric(5,4),
    galaxy_id integer NOT NULL,
    notes character varying(255)
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
    name character varying(255) NOT NULL,
    discovery_year integer,
    spherical boolean,
    planet_id integer,
    moon_id integer NOT NULL
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(255) NOT NULL,
    distance_from_sun_in_au numeric(3,1),
    has_life boolean,
    planet_id integer NOT NULL,
    star_id integer
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    name character varying(255) NOT NULL,
    description text,
    planet_type_id integer NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(255) NOT NULL,
    distance_from_sun_in_ly numeric(3,1),
    stellar_class character varying(255),
    star_id integer NOT NULL,
    galaxy_id integer
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 87400, 0.0265, 2, 'Home galaxy of Earth. Barred spiral galaxy');
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf', NULL, 0.0250, 3, 'Satellite of Milky Way (accretion by Milky Way');
INSERT INTO public.galaxy VALUES ('Segue 1', NULL, 0.0750, 4, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES ('Sagittarius Dwarf Sphr', 10000, 0.0780, 5, 'Satellite of Milky Way (partial accretion by Milky Way');
INSERT INTO public.galaxy VALUES ('Ursa Major II Dwarf', 1800, 0.0980, 6, 'Satellite of Milky Way (accretion by Milky Way');
INSERT INTO public.galaxy VALUES ('Triangulum II', NULL, 0.0980, 7, 'Satellite of Milky Way (accretion by Milky Way');
INSERT INTO public.galaxy VALUES ('Reticulum II', NULL, 0.1020, 8, 'Satellite of Milky Way');
INSERT INTO public.galaxy VALUES ('Segue 2', 220, 0.1140, 9, 'Satellite of Milky Way, one of the smallest known galaxies');
INSERT INTO public.galaxy VALUES ('Willman 1', NULL, 0.1240, 10, 'Satellite of Milky Way');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', NULL, true, 3, 1);
INSERT INTO public.moon VALUES ('Phobos', 1877, false, 4, 2);
INSERT INTO public.moon VALUES ('Deimos', 1877, false, 4, 3);
INSERT INTO public.moon VALUES ('Lo', 1610, true, 5, 4);
INSERT INTO public.moon VALUES ('Europa', 1610, true, 5, 5);
INSERT INTO public.moon VALUES ('Ganymede', 1610, true, 5, 6);
INSERT INTO public.moon VALUES ('Callisto', 1610, true, 5, 7);
INSERT INTO public.moon VALUES ('Amalthea', 1892, false, 5, 8);
INSERT INTO public.moon VALUES ('Himalia', 1904, true, 5, 9);
INSERT INTO public.moon VALUES ('Elara', 1905, true, 5, 10);
INSERT INTO public.moon VALUES ('Pasiphae', 1908, true, 5, 11);
INSERT INTO public.moon VALUES ('Sinope', 1914, true, 5, 12);
INSERT INTO public.moon VALUES ('Lysithea', 1938, true, 5, 13);
INSERT INTO public.moon VALUES ('Carme', 1938, true, 5, 14);
INSERT INTO public.moon VALUES ('Ananke', 1951, true, 5, 15);
INSERT INTO public.moon VALUES ('Leda', 1974, true, 5, 16);
INSERT INTO public.moon VALUES ('Thebe', 1979, false, 5, 17);
INSERT INTO public.moon VALUES ('Adrastea', 1979, true, 5, 18);
INSERT INTO public.moon VALUES ('Metis', 1979, true, 5, 19);
INSERT INTO public.moon VALUES ('Callirrhoe', 2000, true, 5, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 0.4, false, 1, 1);
INSERT INTO public.planet VALUES ('Venus', 0.7, false, 2, 1);
INSERT INTO public.planet VALUES ('Earth', 1.0, true, 3, 1);
INSERT INTO public.planet VALUES ('Mars', 1.5, false, 4, 1);
INSERT INTO public.planet VALUES ('Jupiter', 5.2, false, 5, 1);
INSERT INTO public.planet VALUES ('Saturn', 9.5, false, 6, 1);
INSERT INTO public.planet VALUES ('Uranus', 19.8, false, 7, 1);
INSERT INTO public.planet VALUES ('Neptune', 30.1, false, 8, 1);
INSERT INTO public.planet VALUES ('16 Cygni Bb', 68.9, false, 9, 1);
INSERT INTO public.planet VALUES ('23 Librae b', 85.5, false, 10, 1);
INSERT INTO public.planet VALUES ('47 Ursae Majoris b', 45.0, false, 11, 1);
INSERT INTO public.planet VALUES ('51 Pegasi b', 50.5, false, 12, 1);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES ('Terrestrial Planet', 'Planet with landforms', 1);
INSERT INTO public.planet_type VALUES ('Gas Giant', 'Planet made of gas', 2);
INSERT INTO public.planet_type VALUES ('Ice Giant', 'Planet made of ice', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 0.0, 'G2V', 1, 2);
INSERT INTO public.star VALUES ('A Centauri', 4.4, 'G2V', 2, 2);
INSERT INTO public.star VALUES ('Sirius', 8.6, 'A1V', 3, 2);
INSERT INTO public.star VALUES ('Eridani', 10.5, 'K2V', 4, 2);
INSERT INTO public.star VALUES ('Cygni', 11.4, 'K5.0V', 5, 2);
INSERT INTO public.star VALUES ('Procyon', 11.5, 'F5IV-V', 6, 2);
INSERT INTO public.star VALUES ('Indi', 11.8, 'K5Ve', 7, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet_type type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT type_name_key UNIQUE (name);


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

