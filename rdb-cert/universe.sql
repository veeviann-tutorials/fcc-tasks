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
-- Name: alien_race; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.alien_race (
    alien_race_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_hostile boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.alien_race OWNER TO freecodecamp;

--
-- Name: alien_race_alien_race_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.alien_race_alien_race_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alien_race_alien_race_id_seq OWNER TO freecodecamp;

--
-- Name: alien_race_alien_race_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.alien_race_alien_race_id_seq OWNED BY public.alien_race.alien_race_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    discovered_by character varying(30),
    discovered_in_year integer
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
    is_habitable boolean,
    discovered_by character varying(30),
    discovered_in_year integer,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_in_kg numeric,
    is_habitable boolean,
    discovered_by character varying(30),
    discovered_in_year integer,
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_shrinking boolean,
    discovered_by character varying(30),
    discovered_in_year integer,
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
-- Name: alien_race alien_race_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien_race ALTER COLUMN alien_race_id SET DEFAULT nextval('public.alien_race_alien_race_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: alien_race; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.alien_race VALUES (1, 'Klingons', true, 1);
INSERT INTO public.alien_race VALUES (2, 'Vulcans', false, 2);
INSERT INTO public.alien_race VALUES (3, 'Wookiees', false, 3);
INSERT INTO public.alien_race VALUES (4, 'Sontarans', true, 4);
INSERT INTO public.alien_race VALUES (5, 'Asari', false, 5);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral galaxy approximately 2.537 million light-years from Earth.', 'Edwin Hubble', 1923);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Barred spiral galaxy containing our Solar System.', 'Unknown', NULL);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool Galaxy', 'Interacting grand-design spiral galaxy in the constellation Canes Venatici.', 'Charles Messier', 1773);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'Unbarred spiral galaxy in the constellation Virgo.', 'Pierre Méchain', 1781);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Spiral galaxy approximately 3 million light-years from Earth.', 'Giovanni Battista Hodierna', 1654);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'Barred spiral galaxy in the constellation Ursa Major.', 'William Herschel', 1779);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', false, 'Humans', -100000, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 'Asaph Hall', 1877, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 'Asaph Hall', 1877, 2);
INSERT INTO public.moon VALUES (4, 'Europa', true, 'Galileo Galilei', 1610, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', false, 'Galileo Galilei', 1610, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', false, 'Galileo Galilei', 1610, 3);
INSERT INTO public.moon VALUES (7, 'Titan', false, 'Christiaan Huygens', 1655, 4);
INSERT INTO public.moon VALUES (8, 'Enceladus', true, 'William Herschel', 1789, 4);
INSERT INTO public.moon VALUES (9, 'Mimas', false, 'William Herschel', 1789, 4);
INSERT INTO public.moon VALUES (10, 'Triton', false, 'William Lassell', 1846, 5);
INSERT INTO public.moon VALUES (11, 'Charon', false, 'James Christy', 1978, 6);
INSERT INTO public.moon VALUES (12, 'Io', false, 'Galileo Galilei', 1610, 3);
INSERT INTO public.moon VALUES (13, 'Rhea', false, 'Giovanni Domenico Cassini', 1672, 4);
INSERT INTO public.moon VALUES (14, 'Dione', false, 'Giovanni Domenico Cassini', 1684, 4);
INSERT INTO public.moon VALUES (15, 'Hyperion', false, 'William Cranch Bond', 1848, 4);
INSERT INTO public.moon VALUES (16, 'Phoebe', false, 'William Henry Pickering', 1898, 4);
INSERT INTO public.moon VALUES (17, 'Ariel', false, 'William Lassell', 1851, 5);
INSERT INTO public.moon VALUES (18, 'Umbriel', false, 'William Lassell', 1851, 5);
INSERT INTO public.moon VALUES (19, 'Miranda', false, 'Gerard Kuiper', 1948, 5);
INSERT INTO public.moon VALUES (20, 'Tethys', false, 'Giovanni Domenico Cassini', 1684, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 5972000000000000000000000, true, 'Humans', -100000, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 639000000000000000000000, false, 'Humans', -1609, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1898000000000000000000000000, false, 'Galileo Galilei', 1610, 3);
INSERT INTO public.planet VALUES (4, 'Saturn', 568300000000000000000000000, false, 'Galileo Galilei', 1610, 4);
INSERT INTO public.planet VALUES (5, 'Uranus', 86810000000000000000000000, false, 'William Herschel', 1781, 5);
INSERT INTO public.planet VALUES (6, 'Neptune', 102400000000000000000000000, false, 'Urbain Le Verrier', 1846, 6);
INSERT INTO public.planet VALUES (7, 'Mercury', 328500000000000000000000, false, 'Ancient astronomers', -3000, 1);
INSERT INTO public.planet VALUES (8, 'Venus', 4867000000000000000000000, false, 'Ancient astronomers', -3000, 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 13090000000000000000000, false, 'Clyde Tombaugh', 1930, 3);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 3900000000000000000000000, true, 'NASA', 2014, 4);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 12700000000000000000000000, true, 'European Southern Observatory', 2016, 5);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 14860000000000000000000000, false, 'Geneva Observatory', 1999, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', false, 'Humans', 0, 1);
INSERT INTO public.star VALUES (2, 'Sirius', true, 'Ancient Egyptians', -2500, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', false, 'Thomas Henderson', 1839, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', true, 'Sir John Herschel', 1836, 4);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', false, 'Robert Innes', 1915, 5);
INSERT INTO public.star VALUES (6, 'Polaris', false, 'Greeks', -1600, 6);


--
-- Name: alien_race_alien_race_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.alien_race_alien_race_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: alien_race alien_race_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien_race
    ADD CONSTRAINT alien_race_name_key UNIQUE (name);


--
-- Name: alien_race alien_race_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien_race
    ADD CONSTRAINT alien_race_pkey PRIMARY KEY (alien_race_id);


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
-- Name: alien_race alien_race_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien_race
    ADD CONSTRAINT alien_race_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

