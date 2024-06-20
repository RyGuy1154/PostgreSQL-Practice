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
    name character varying(60),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    hours_in_a_day integer,
    galaxy_id integer NOT NULL,
    distance_from_earth_in_km numeric(10,1)
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
    name character varying(60),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    hours_in_a_day integer,
    moon_id integer NOT NULL,
    distance_from_earth_in_km numeric(10,1),
    planet_id integer
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    galaxy_id integer NOT NULL,
    name character varying(30),
    has_aliens boolean NOT NULL,
    more_info_id integer NOT NULL,
    random_number integer
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(60),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    hours_in_a_day integer,
    planet_id integer NOT NULL,
    distance_from_earth_in_km numeric(10,1),
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(60),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    description text,
    age_in_millions_of_years integer,
    hours_in_a_day integer,
    star_id integer NOT NULL,
    distance_from_earth_in_km numeric(10,1),
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES ('milkway', true, true, 'the milkyway', 4, 24, 1, 123.1);
INSERT INTO public.galaxy VALUES ('blorg', true, false, 'the blorg', 14, 28, 2, 1423.1);
INSERT INTO public.galaxy VALUES ('shmorg', true, true, 'the shmorg', 7, 20, 3, 5123.1);
INSERT INTO public.galaxy VALUES ('zorg', true, true, 'the zorg', 42, 35, 4, 1923.1);
INSERT INTO public.galaxy VALUES ('grorg', true, true, 'the grorg', 19, 3, 5, 8123.1);
INSERT INTO public.galaxy VALUES ('florg', true, true, 'the florg', 24, 13, 6, 3123.1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon1', true, true, 'the Moon1', 13, 24, 1, 1213.6, 1);
INSERT INTO public.moon VALUES ('Moon2', true, true, 'the Moon2', 14, 25, 2, 1214.6, 1);
INSERT INTO public.moon VALUES ('Moon3', true, true, 'the Moon3', 15, 26, 3, 1215.6, 2);
INSERT INTO public.moon VALUES ('Moon4', true, true, 'the Moon4', 16, 27, 4, 1216.6, 2);
INSERT INTO public.moon VALUES ('Moon5', true, true, 'the Moon5', 17, 28, 5, 1217.6, 3);
INSERT INTO public.moon VALUES ('Moon6', true, true, 'the Moon6', 18, 29, 6, 1218.6, 3);
INSERT INTO public.moon VALUES ('Moon7', true, true, 'the Moon7', 19, 30, 7, 1219.6, 4);
INSERT INTO public.moon VALUES ('Moon8', true, true, 'the Moon8', 20, 31, 8, 1220.6, 4);
INSERT INTO public.moon VALUES ('Moon9', true, true, 'the Moon9', 21, 32, 9, 1221.6, 5);
INSERT INTO public.moon VALUES ('Moon10', true, true, 'the Moon10', 22, 33, 10, 1222.6, 5);
INSERT INTO public.moon VALUES ('Moon11', true, true, 'the Moon11', 23, 34, 11, 1223.6, 6);
INSERT INTO public.moon VALUES ('Moon12', true, true, 'the Moon12', 24, 35, 12, 1224.6, 6);
INSERT INTO public.moon VALUES ('Moon13', true, true, 'the Moon13', 25, 36, 13, 1225.6, 7);
INSERT INTO public.moon VALUES ('Moon14', true, true, 'the Moon14', 26, 37, 14, 1226.6, 7);
INSERT INTO public.moon VALUES ('Moon15', true, true, 'the Moon15', 27, 38, 15, 1227.6, 8);
INSERT INTO public.moon VALUES ('Moon16', true, true, 'the Moon16', 28, 39, 16, 1228.6, 8);
INSERT INTO public.moon VALUES ('Moon17', true, true, 'the Moon17', 29, 40, 17, 1229.6, 9);
INSERT INTO public.moon VALUES ('Moon18', true, true, 'the Moon18', 30, 41, 18, 1230.6, 10);
INSERT INTO public.moon VALUES ('Moon19', true, true, 'the Moon19', 31, 42, 19, 1231.6, 11);
INSERT INTO public.moon VALUES ('Moon20', true, true, 'the Moon20', 32, 43, 20, 1232.6, 12);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'milkway', true, 1, NULL);
INSERT INTO public.more_info VALUES (2, 'blorg', true, 2, NULL);
INSERT INTO public.more_info VALUES (3, 'shmorg', true, 3, NULL);
INSERT INTO public.more_info VALUES (4, 'zorg', true, 4, NULL);
INSERT INTO public.more_info VALUES (5, 'grorg', true, 5, NULL);
INSERT INTO public.more_info VALUES (6, 'florg', true, 6, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Planet1', true, true, 'the Planet1', 13, 24, 1, 1213.6, 1);
INSERT INTO public.planet VALUES ('Planet2', true, true, 'the Planet2', 14, 25, 2, 1214.6, 1);
INSERT INTO public.planet VALUES ('Planet3', true, true, 'the Planet3', 15, 26, 3, 1215.6, 2);
INSERT INTO public.planet VALUES ('Planet4', true, true, 'the Planet4', 16, 27, 4, 1216.6, 2);
INSERT INTO public.planet VALUES ('Planet5', true, true, 'the Planet5', 17, 28, 5, 1217.6, 3);
INSERT INTO public.planet VALUES ('Planet6', true, true, 'the Planet6', 18, 29, 6, 1218.6, 3);
INSERT INTO public.planet VALUES ('Planet7', true, true, 'the Planet7', 19, 30, 7, 1219.6, 4);
INSERT INTO public.planet VALUES ('Planet8', true, true, 'the Planet8', 20, 31, 8, 1220.6, 4);
INSERT INTO public.planet VALUES ('Planet9', true, true, 'the Planet9', 21, 32, 9, 1221.6, 5);
INSERT INTO public.planet VALUES ('Planet10', true, true, 'the Planet10', 22, 33, 10, 1222.6, 5);
INSERT INTO public.planet VALUES ('Planet11', true, true, 'the Planet11', 23, 34, 11, 1223.6, 6);
INSERT INTO public.planet VALUES ('Planet12', true, true, 'the Planet12', 24, 35, 12, 1224.6, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('star1', true, true, 'the star1', 4, 24, 1, 123.1, 1);
INSERT INTO public.star VALUES ('star2', true, true, 'the star2', 4, 24, 2, 123.1, 2);
INSERT INTO public.star VALUES ('star3', true, true, 'the star3', 4, 24, 3, 123.1, 3);
INSERT INTO public.star VALUES ('star4', true, true, 'the star4', 4, 24, 4, 123.4, 4);
INSERT INTO public.star VALUES ('star5', true, true, 'the star5', 4, 24, 5, 123.1, 5);
INSERT INTO public.star VALUES ('star6', true, true, 'the star6', 4, 24, 6, 123.1, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 2, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: more_info more_info_random_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_random_number_key UNIQUE (random_number);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: more_info more_info_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

