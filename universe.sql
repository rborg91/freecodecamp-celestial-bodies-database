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
    name character varying(20) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth integer
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
    planet_id integer,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean
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
-- Name: orbit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.orbit (
    orbit_id integer NOT NULL,
    name character varying(30) NOT NULL,
    orbital_period integer NOT NULL,
    eccentricity numeric(5,4),
    semi_major_axis numeric(10,2)
);


ALTER TABLE public.orbit OWNER TO freecodecamp;

--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.orbit_orbit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orbit_orbit_id_seq OWNER TO freecodecamp;

--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.orbit_orbit_id_seq OWNED BY public.orbit.orbit_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean
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
    galaxy_id integer,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric
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
-- Name: orbit orbit_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit ALTER COLUMN orbit_id SET DEFAULT nextval('public.orbit_orbit_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a spiral galaxy containing billions of stars, including our Sun.', 13000, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A large spiral galaxy, the closest to the Milky Way, on a collision course with us in about 4 billion years.', 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy, part of the Local Group along with Milky Way and Andromeda.', 3000, 2800000);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'A spiral galaxy with a large central bulge, resembling a sombrero hat.', 10000, 29000000);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A classic spiral galaxy located in the constellation Canes Venatici.', 11000, 23000000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'A spiral galaxy with a prominent dark dust lane, found in the constellation Coma Berenices.', 8000, 17000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Caloris Basin', 'The largest impact basin on Mercury.', true);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', 'The larger of Mars two moons, irregular in shape.', true);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', 'The smaller of Mars two moons, irregular in shape.', true);
INSERT INTO public.moon VALUES (4, 3, 'Moon', 'The only natural satellite of Earth, responsible for tides.', true);
INSERT INTO public.moon VALUES (5, 4, 'Olympus', 'A large moon of Mars, thought to have once supported liquid water.', true);
INSERT INTO public.moon VALUES (6, 5, 'Io', 'One of Jupiter largest moons, known for its volcanic activity.', true);
INSERT INTO public.moon VALUES (7, 5, 'Europa', 'One of Jupiter moons, covered by a thick icy shell, with possible subsurface oceans.', true);
INSERT INTO public.moon VALUES (8, 5, 'Ganymede', 'The largest moon of Jupiter, larger than the planet Mercury.', true);
INSERT INTO public.moon VALUES (9, 5, 'Callisto', 'The second largest moon of Jupiter, with many craters.', true);
INSERT INTO public.moon VALUES (10, 6, 'Titan', 'Saturn largest moon, with a thick atmosphere and lakes of methane.', true);
INSERT INTO public.moon VALUES (11, 6, 'Rhea', 'A moon of Saturn, the second-largest of its moons.', true);
INSERT INTO public.moon VALUES (12, 6, 'Enceladus', 'A moon of Saturn, known for its ice geysers and potential subsurface ocean.', true);
INSERT INTO public.moon VALUES (13, 7, 'Miranda', 'A moon of Uranus, known for its bizarre geological features.', true);
INSERT INTO public.moon VALUES (14, 7, 'Ariel', 'A moon of Uranus, with a heavily cratered surface.', true);
INSERT INTO public.moon VALUES (15, 8, 'Triton', 'The largest moon of Neptune, with retrograde orbit and geysers.', true);
INSERT INTO public.moon VALUES (16, 8, 'Nereid', 'A moon of Neptune, with an eccentric orbit.', true);
INSERT INTO public.moon VALUES (17, 9, 'Haumea', 'A large moon of Neptune, shaped like a potato due to its fast rotation.', true);
INSERT INTO public.moon VALUES (18, 9, 'Makemake', 'A dwarf planet with a possible moon, part of the Kuiper Belt.', true);
INSERT INTO public.moon VALUES (19, 10, 'Charon', 'Pluto largest moon, about half the size of the dwarf planet itself.', true);
INSERT INTO public.moon VALUES (21, 6, 'Mimas', 'Known as the "Death Star moon" due to the large crater, Herschel, on its surface.', true);


--
-- Data for Name: orbit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.orbit VALUES (1, 'Earth', 365, 0.0167, 1.00);
INSERT INTO public.orbit VALUES (2, 'Moon', 27, 0.0549, 0.00);
INSERT INTO public.orbit VALUES (3, 'Mars', 687, 0.0934, 1.52);
INSERT INTO public.orbit VALUES (4, 'Phobos', 0, 0.0150, 0.00);
INSERT INTO public.orbit VALUES (5, 'Jupiter', 4333, 0.0480, 5.20);
INSERT INTO public.orbit VALUES (6, 'Io', 2, 0.0041, 0.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'The smallest and closest planet to the Sun.', 4500, 91700000, false);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 'The second planet from the Sun, often called Earth twin due to its size.', 4600, 41700000, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 'Our home planet, the only known planet to support life.', 4600, 0, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 'The fourth planet from the Sun, known for its red color and potential for past life.', 4600, 78000000, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 'The largest planet in our solar system, a gas giant.', 4600, 628700000, false);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 'A gas giant with beautiful rings, the second largest planet.', 4600, 1275000000, false);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 'An ice giant, tilted on its side, seventh from the Sun.', 4600, 2724000000, false);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 'The eighth planet from the Sun, known for its strong winds and dark blue appearance.', 4600, 4305000000, false);
INSERT INTO public.planet VALUES (9, 1, 'Ceres', 'The largest object in the asteroid belt, classified as a dwarf planet.', 4600, 413000000, false);
INSERT INTO public.planet VALUES (10, 1, 'Pluto', 'A dwarf planet located in the Kuiper Belt, once considered the ninth planet.', 4600, 5913000000, false);
INSERT INTO public.planet VALUES (11, 2, 'Exoplanet Alpha', 'A discovered exoplanet orbiting a star in the Andromeda Galaxy.', 1000, 2537000, false);
INSERT INTO public.planet VALUES (12, 3, 'Exoplanet Beta', 'A discovered exoplanet in the Triangulum galaxy.', 500, 2800000, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 4600, 0);
INSERT INTO public.star VALUES (2, 1, 'Sirius', 200, 8500000);
INSERT INTO public.star VALUES (3, 1, 'Alpha Centauri A', 5000, 42000000);
INSERT INTO public.star VALUES (4, 2, 'Andromeda Galaxy Star 1', 10000, 2537000);
INSERT INTO public.star VALUES (5, 2, 'Andromeda Galaxy Star 2', 9000, 2537000);
INSERT INTO public.star VALUES (6, 3, 'Triangulum Star 1', 2000, 2800000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: orbit_orbit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.orbit_orbit_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique PRIMARY KEY (moon_id);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: orbit orbit_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_name_key UNIQUE (name);


--
-- Name: orbit orbit_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.orbit
    ADD CONSTRAINT orbit_pkey PRIMARY KEY (orbit_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique PRIMARY KEY (planet_id);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique PRIMARY KEY (star_id);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


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

