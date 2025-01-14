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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size numeric(15,2),
    description text NOT NULL,
    orbit_type character varying(50)
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(50),
    distance_from_earth numeric(15,2),
    has_life boolean NOT NULL
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
    description text,
    diameter numeric(15,2),
    planet_id integer NOT NULL,
    distance_from_planet numeric(15,2)
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
    description text,
    planet_type character varying(50),
    distance_from_earth integer,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
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
    description text,
    star_type character varying(50),
    distance_from_earth integer,
    galaxy_id integer NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 939.40, 'The largest object in the asteroid belt between Mars and Jupiter.', 'Main-belt');
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525.40, 'One of the largest asteroids in the asteroid belt.', 'Main-belt');
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512.00, 'A large asteroid in the asteroid belt.', 'Main-belt');
INSERT INTO public.asteroid VALUES (4, 'Eros', 16.80, 'A near-Earth asteroid that was visited by the NEAR Shoemaker spacecraft.', 'Near-Earth');
INSERT INTO public.asteroid VALUES (5, 'Gaspra', 18.20, 'An asteroid in the inner asteroid belt, visited by the Galileo spacecraft.', 'Main-belt');
INSERT INTO public.asteroid VALUES (6, 'Ida', 31.40, 'An asteroid in the asteroid belt, known for its moon Dactyl.', 'Main-belt');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, containing our solar system.', 'Spiral', 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest spiral galaxy to the Milky Way.', 'Spiral', 2537000.00, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A member of the Local Group of galaxies.', 'Spiral', 3000000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Known for its distinctive spiral arms.', 'Spiral', 23000000.00, false);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Notable for its bright nucleus and large central bulge.', 'Elliptical', 29000000.00, false);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'A giant elliptical galaxy in the Virgo Cluster.', 'Elliptical', 53000000.00, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'The only natural satellite of Earth.', 3474.80, 1, 384400.00);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger and closer of the two natural satellites of Mars.', 22.40, 2, 9376.00);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and more distant of the two natural satellites of Mars.', 12.40, 2, 23460.00);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active body in the solar system.', 3643.20, 3, 421700.00);
INSERT INTO public.moon VALUES (5, 'Europa', 'An icy moon with a subsurface ocean.', 3121.60, 3, 670900.00);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the solar system.', 5268.20, 3, 1070400.00);
INSERT INTO public.moon VALUES (7, 'Callisto', 'The second-largest moon of Jupiter.', 4820.60, 3, 1882700.00);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn, with a thick atmosphere.', 5151.80, 4, 1221870.00);
INSERT INTO public.moon VALUES (9, 'Rhea', 'The second-largest moon of Saturn.', 1527.60, 4, 527040.00);
INSERT INTO public.moon VALUES (10, 'Iapetus', 'Known for its two-tone coloration.', 1469.00, 4, 3561300.00);
INSERT INTO public.moon VALUES (29, 'Mimas', 'A moon of Saturn, known for its large crater Herschel.', 396.40, 4, 185520.00);
INSERT INTO public.moon VALUES (30, 'Enceladus', 'A moon of Saturn, known for its geysers and subsurface ocean.', 504.20, 4, 238020.00);
INSERT INTO public.moon VALUES (31, 'Tethys', 'A moon of Saturn, known for its large rift Ithaca Chasma.', 1062.20, 4, 294670.00);
INSERT INTO public.moon VALUES (32, 'Dione', 'A moon of Saturn, with a heavily cratered surface.', 1122.80, 4, 377400.00);
INSERT INTO public.moon VALUES (33, 'Hyperion', 'A moon of Saturn, known for its irregular shape.', 270.00, 4, 1481000.00);
INSERT INTO public.moon VALUES (34, 'Miranda', 'A moon of Uranus, known for its extreme geological features.', 471.60, 5, 129390.00);
INSERT INTO public.moon VALUES (35, 'Ariel', 'A moon of Uranus, with a surface of canyons and ridges.', 1158.80, 5, 191020.00);
INSERT INTO public.moon VALUES (36, 'Umbriel', 'A moon of Uranus, known for its dark surface.', 1169.40, 5, 266300.00);
INSERT INTO public.moon VALUES (37, 'Titania', 'The largest moon of Uranus.', 1577.80, 5, 436300.00);
INSERT INTO public.moon VALUES (38, 'Oberon', 'The second-largest moon of Uranus.', 1522.80, 5, 583500.00);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The third planet from the Sun and the only known planet to support life.', 'Terrestrial', 0, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The fourth planet from the Sun, known as the Red Planet.', 'Terrestrial', 225, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'The largest planet in the solar system, a gas giant.', 'Gas giant', 778, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Known for its prominent ring system.', 'Gas giant', 1427, false, 1);
INSERT INTO public.planet VALUES (5, 'Proxima b', 'An exoplanet orbiting the star Proxima Centauri.', 'Terrestrial', 4, false, 2);
INSERT INTO public.planet VALUES (6, 'Kepler-22b', 'An exoplanet orbiting within the habitable zone of its star.', 'Super-Earth', 600, false, 3);
INSERT INTO public.planet VALUES (7, 'Venus', 'The second planet from the Sun, known for its thick atmosphere.', 'Terrestrial', 41, false, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'The closest planet to the Sun, with extreme temperature variations.', 'Terrestrial', 77, false, 1);
INSERT INTO public.planet VALUES (9, 'Neptune', 'The farthest planet from the Sun, known for its deep blue color.', 'Ice giant', 4495, false, 1);
INSERT INTO public.planet VALUES (10, 'Uranus', 'An ice giant with a unique tilt, causing extreme seasons.', 'Ice giant', 2871, false, 1);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 'An exoplanet orbiting a star similar to the Sun.', 'Super-Earth', 1400, true, 3);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 'An exoplanet in the habitable zone of its star.', 'Super-Earth', 20, false, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our solar system.', 'G-type main-sequence', 0, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun.', 'Red dwarf', 4, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'A red supergiant star in the constellation Orion.', 'Red supergiant', 642, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 'The brightest star in the night sky.', 'Binary star system', 9, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'The fifth-brightest star in the night sky.', 'A-type main-sequence', 25, 1);
INSERT INTO public.star VALUES (6, 'Rigel', 'A blue supergiant star in the constellation Orion.', 'Blue supergiant', 860, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 38, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

