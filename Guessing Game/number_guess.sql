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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (105, 62, 1);
INSERT INTO public.games VALUES (106, 62, 1);
INSERT INTO public.games VALUES (107, 63, 1);
INSERT INTO public.games VALUES (108, 63, 1);
INSERT INTO public.games VALUES (109, 62, 3);
INSERT INTO public.games VALUES (110, 62, 2);
INSERT INTO public.games VALUES (111, 62, 1);
INSERT INTO public.games VALUES (112, 65, 1);
INSERT INTO public.games VALUES (113, 65, 1);
INSERT INTO public.games VALUES (114, 66, 1);
INSERT INTO public.games VALUES (115, 66, 1);
INSERT INTO public.games VALUES (116, 65, 3);
INSERT INTO public.games VALUES (117, 65, 2);
INSERT INTO public.games VALUES (118, 65, 1);
INSERT INTO public.games VALUES (119, 67, 1);
INSERT INTO public.games VALUES (120, 67, 1);
INSERT INTO public.games VALUES (121, 68, 1);
INSERT INTO public.games VALUES (122, 68, 1);
INSERT INTO public.games VALUES (123, 67, 3);
INSERT INTO public.games VALUES (124, 67, 2);
INSERT INTO public.games VALUES (125, 67, 1);
INSERT INTO public.games VALUES (126, 69, 1);
INSERT INTO public.games VALUES (127, 69, 1);
INSERT INTO public.games VALUES (128, 70, 1);
INSERT INTO public.games VALUES (129, 70, 1);
INSERT INTO public.games VALUES (130, 69, 3);
INSERT INTO public.games VALUES (131, 69, 2);
INSERT INTO public.games VALUES (132, 69, 1);
INSERT INTO public.games VALUES (133, 71, 1);
INSERT INTO public.games VALUES (134, 64, 2);
INSERT INTO public.games VALUES (135, 92, 1);
INSERT INTO public.games VALUES (136, 92, 1);
INSERT INTO public.games VALUES (137, 93, 1);
INSERT INTO public.games VALUES (138, 93, 1);
INSERT INTO public.games VALUES (139, 92, 3);
INSERT INTO public.games VALUES (140, 92, 2);
INSERT INTO public.games VALUES (141, 92, 1);
INSERT INTO public.games VALUES (142, 94, 3);
INSERT INTO public.games VALUES (143, 95, 961);
INSERT INTO public.games VALUES (144, 95, 318);
INSERT INTO public.games VALUES (145, 96, 906);
INSERT INTO public.games VALUES (146, 96, 125);
INSERT INTO public.games VALUES (147, 95, 421);
INSERT INTO public.games VALUES (148, 95, 570);
INSERT INTO public.games VALUES (149, 95, 678);
INSERT INTO public.games VALUES (150, 97, 878);
INSERT INTO public.games VALUES (151, 97, 823);
INSERT INTO public.games VALUES (152, 98, 905);
INSERT INTO public.games VALUES (153, 98, 355);
INSERT INTO public.games VALUES (154, 97, 231);
INSERT INTO public.games VALUES (155, 97, 418);
INSERT INTO public.games VALUES (156, 97, 363);
INSERT INTO public.games VALUES (157, 64, 1);
INSERT INTO public.games VALUES (158, 64, 1);
INSERT INTO public.games VALUES (159, 64, 1);
INSERT INTO public.games VALUES (160, 99, 852);
INSERT INTO public.games VALUES (161, 99, 878);
INSERT INTO public.games VALUES (162, 100, 751);
INSERT INTO public.games VALUES (163, 100, 810);
INSERT INTO public.games VALUES (164, 99, 956);
INSERT INTO public.games VALUES (165, 99, 801);
INSERT INTO public.games VALUES (166, 99, 255);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (62, 'user_1693335219928');
INSERT INTO public.users VALUES (63, 'user_1693335219927');
INSERT INTO public.users VALUES (64, 'Ben');
INSERT INTO public.users VALUES (65, 'user_1693336792692');
INSERT INTO public.users VALUES (66, 'user_1693336792691');
INSERT INTO public.users VALUES (67, 'user_1693337887544');
INSERT INTO public.users VALUES (68, 'user_1693337887543');
INSERT INTO public.users VALUES (69, 'user_1693338614695');
INSERT INTO public.users VALUES (70, 'user_1693338614694');
INSERT INTO public.users VALUES (71, '');
INSERT INTO public.users VALUES (83, 'user_1693924402389');
INSERT INTO public.users VALUES (84, 'user_1693924402388');
INSERT INTO public.users VALUES (92, 'user_1693926712318');
INSERT INTO public.users VALUES (93, 'user_1693926712317');
INSERT INTO public.users VALUES (94, 'Benny');
INSERT INTO public.users VALUES (95, 'user_1693927838352');
INSERT INTO public.users VALUES (96, 'user_1693927838351');
INSERT INTO public.users VALUES (97, 'user_1693927917207');
INSERT INTO public.users VALUES (98, 'user_1693927917206');
INSERT INTO public.users VALUES (99, 'user_1693929538959');
INSERT INTO public.users VALUES (100, 'user_1693929538958');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 166, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 100, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games fk_users_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_users_games FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

