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
-- Name: earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.earth (
    earth_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth numeric(10,2),
    age integer,
    is_spherical boolean DEFAULT true NOT NULL,
    is_earth boolean DEFAULT true,
    describe text
);


ALTER TABLE public.earth OWNER TO freecodecamp;

--
-- Name: earth_earth_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.earth_earth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.earth_earth_id_seq OWNER TO freecodecamp;

--
-- Name: earth_earth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.earth_earth_id_seq OWNED BY public.earth.earth_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth numeric(10,2),
    age integer,
    is_spherical boolean DEFAULT true NOT NULL,
    is_earth boolean DEFAULT false,
    describe text
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
    name character varying(50) NOT NULL,
    distance_from_earth numeric(10,2),
    age integer,
    is_spherical boolean DEFAULT true NOT NULL,
    is_earth boolean DEFAULT false,
    describe text,
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
    name character varying(50) NOT NULL,
    distance_from_earth numeric(10,2),
    age integer,
    is_spherical boolean DEFAULT true NOT NULL,
    is_earth boolean DEFAULT false,
    describe text,
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
    name character varying(50) NOT NULL,
    distance_from_earth numeric(10,2),
    age integer,
    is_spherical boolean DEFAULT true NOT NULL,
    is_earth boolean DEFAULT false,
    describe text,
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
-- Name: earth earth_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth ALTER COLUMN earth_id SET DEFAULT nextval('public.earth_earth_id_seq'::regclass);


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
-- Data for Name: earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.earth VALUES (1, 'VIET NAM', 0.00, 4000, true, true, 'VIETNAM VO DICH');
INSERT INTO public.earth VALUES (2, 'Chinese', 0.00, 5000, true, true, 'Trung Quoc tuoi lon');
INSERT INTO public.earth VALUES (3, 'America', 0.00, 200, true, true, 'Tuoi lon sanh vai');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Ngân Hà', 0.00, 13600000, true, false, 'Thiên hà chứa Trái Đất');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2540000.00, 10000000, true, false, 'Thiên hà xoắn ốc gần nhất');
INSERT INTO public.galaxy VALUES (3, 'Tiên Nữ', 220000.00, 5000000, true, false, 'Thiên hà elip khổng lồ');
INSERT INTO public.galaxy VALUES (4, 'Xoáy Nước', 310000.00, 4000000, true, false, 'Thiên hà xoắn ốc đẹp nhất');
INSERT INTO public.galaxy VALUES (5, 'Sao Mộc Tinh', 500000.00, 8000000, true, false, 'Thiên hà hình elip');
INSERT INTO public.galaxy VALUES (6, 'Mắt Thần', 450000.00, 7000000, true, false, 'Thiên hà vòng cực hiếm');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mặt Trăng', 0.00, 4500, true, false, 'Vệ tinh tự nhiên của Trái Đất', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.00, 4500, true, false, 'Vệ tinh nhỏ của Sao Hỏa', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.00, 4500, true, false, 'Vệ tinh hình khoai tây', 2);
INSERT INTO public.moon VALUES (4, 'Proxima Luna', 4.24, 4800, true, false, 'Vệ tinh đá', 3);
INSERT INTO public.moon VALUES (5, 'Terra Nova I', 4.37, 5000, true, false, 'Vệ tinh băng', 4);
INSERT INTO public.moon VALUES (6, 'Terra Nova II', 4.38, 5000, true, false, 'Vệ tinh núi lửa', 4);
INSERT INTO public.moon VALUES (7, 'Sirius Moon A', 8.60, 2000, true, false, 'Vệ tinh khí', 5);
INSERT INTO public.moon VALUES (8, 'Sirius Moon B', 8.61, 2000, true, false, 'Vệ tinh đại dương ngầm', 6);
INSERT INTO public.moon VALUES (9, 'Betelgeuse Moon X', 643.00, 500, true, false, 'Vệ tinh nham thạch', 7);
INSERT INTO public.moon VALUES (10, 'Betelgeuse Moon Y', 643.50, 600, true, false, 'Vệ tinh băng nóng', 8);
INSERT INTO public.moon VALUES (11, 'Vega Satellite 1', 25.04, 1000, true, false, 'Vệ tinh kim cương', 9);
INSERT INTO public.moon VALUES (12, 'Vega Satellite 2', 25.05, 1200, true, false, 'Vệ tinh khí quyển dày', 10);
INSERT INTO public.moon VALUES (13, 'Polaris Moon Alpha', 433.00, 1500, true, false, 'Vệ tinh xanh', 11);
INSERT INTO public.moon VALUES (14, 'Polaris Moon Beta', 433.50, 1600, true, false, 'Vệ tinh đất hiếm', 12);
INSERT INTO public.moon VALUES (15, 'Trái Đất II', 0.00, 4500, true, false, 'Vệ tinh nhân tạo', 1);
INSERT INTO public.moon VALUES (16, 'Sao Hỏa III', 0.00, 4500, true, false, 'Vệ tinh thăm dò', 2);
INSERT INTO public.moon VALUES (17, 'Proxima Centauri Moon', 4.25, 4800, true, false, 'Vệ tinh giá lạnh', 3);
INSERT INTO public.moon VALUES (18, 'Terra Nova III', 4.39, 5000, true, false, 'Vệ tinh sao chổi', 4);
INSERT INTO public.moon VALUES (19, 'Sirius Moon C', 8.62, 2000, true, false, 'Vệ tinh plasma', 5);
INSERT INTO public.moon VALUES (20, 'Betelgeuse Moon Z', 643.60, 600, true, false, 'Vệ tinh phát sáng', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Trái Đất', 0.00, 4540, true, false, 'Hành tinh xanh', 1);
INSERT INTO public.planet VALUES (2, 'Sao Hỏa', 78.00, 4500, true, false, 'Hành tinh đỏ', 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 4.24, 4800, true, false, 'Hành tinh ngoài hệ Mặt Trời', 2);
INSERT INTO public.planet VALUES (4, 'Terra Nova', 4.37, 5000, true, false, 'Hành tinh đất đá', 2);
INSERT INTO public.planet VALUES (5, 'Sirius Prime', 8.60, 2000, true, false, 'Hành tinh khí khổng lồ', 3);
INSERT INTO public.planet VALUES (6, 'Sirius Secundus', 8.61, 2100, true, false, 'Hành tinh đại dương', 3);
INSERT INTO public.planet VALUES (7, 'Betelgeuse I', 643.00, 500, true, false, 'Hành tinh nham thạch', 4);
INSERT INTO public.planet VALUES (8, 'Betelgeuse II', 643.50, 600, true, false, 'Hành tinh băng giá', 4);
INSERT INTO public.planet VALUES (9, 'Vega Prime', 25.04, 1000, true, false, 'Hành tinh kim cương', 5);
INSERT INTO public.planet VALUES (10, 'Vega Secundus', 25.05, 1200, true, false, 'Hành tinh khí', 5);
INSERT INTO public.planet VALUES (11, 'Polaris Alpha', 433.00, 1500, true, false, 'Hành tinh xanh lá', 6);
INSERT INTO public.planet VALUES (12, 'Polaris Beta', 433.50, 1600, true, false, 'Hành tinh đất đá', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mặt Trời', 0.00, 4600, true, false, 'Ngôi sao trung tâm hệ Mặt Trời', 1);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 4.37, 6000, true, false, 'Hệ sao gần nhất', 2);
INSERT INTO public.star VALUES (3, 'Sirius', 8.60, 250, true, false, 'Ngôi sao sáng nhất bầu trời đêm', 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 643.00, 8, true, false, 'Sao siêu khổng lồ đỏ', 4);
INSERT INTO public.star VALUES (5, 'Vega', 25.04, 455, true, false, 'Sao sáng trong chòm Thiên Cầm', 5);
INSERT INTO public.star VALUES (6, 'Polaris', 433.00, 70, true, false, 'Sao Bắc Cực', 6);


--
-- Name: earth_earth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.earth_earth_id_seq', 3, true);


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
-- Name: earth earth_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_name_key UNIQUE (name);


--
-- Name: earth earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.earth
    ADD CONSTRAINT earth_pkey PRIMARY KEY (earth_id);


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

