--
-- PostgreSQL database cluster dump
--

-- Started on 2024-04-24 00:25:01

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE "LeZ";
ALTER ROLE "LeZ" WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:wuKY6GWHvojNtb2ZZpMW7g==$2UsB5BXxCaXp86ItEcr4rDOoXzmXWbubywrFZirnfZ8=:cAP+pNLVpPpG5GMN7+l+9KjSxhtkFLjgWAoFB/YFQbU=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:tsyA+bfCrybSMZebOxP6vg==$EznbH0AreoxETlTYe/Fd/uhot91kXrf8g6bJctA4BL4=:eEbk5g93G1FF69rhzEiwgjaUjyxSleXzPDIIy2bBcF0=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-24 00:25:01

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

-- Completed on 2024-04-24 00:25:01

--
-- PostgreSQL database dump complete
--

--
-- Database "ProjetTi" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-24 00:25:01

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
-- TOC entry 4922 (class 1262 OID 16806)
-- Name: ProjetTi; Type: DATABASE; Schema: -; Owner: LeZ
--

CREATE DATABASE "ProjetTi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';


ALTER DATABASE "ProjetTi" OWNER TO "LeZ";

\connect "ProjetTi"

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
-- TOC entry 228 (class 1259 OID 16875)
-- Name: admin; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom text,
    mdp text
);


ALTER TABLE public.admin OWNER TO "LeZ";

--
-- TOC entry 227 (class 1259 OID 16874)
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_id_admin_seq OWNER TO "LeZ";

--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 227
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 218 (class 1259 OID 16817)
-- Name: carte_graphique; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.carte_graphique (
    id_cartegraphique integer NOT NULL,
    nom text
);


ALTER TABLE public.carte_graphique OWNER TO "LeZ";

--
-- TOC entry 217 (class 1259 OID 16816)
-- Name: carte_graphique_id_cartegraphique_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.carte_graphique_id_cartegraphique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNER TO "LeZ";

--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 217
-- Name: carte_graphique_id_cartegraphique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;


--
-- TOC entry 216 (class 1259 OID 16808)
-- Name: classification; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.classification (
    id_class integer NOT NULL,
    pegi text
);


ALTER TABLE public.classification OWNER TO "LeZ";

--
-- TOC entry 215 (class 1259 OID 16807)
-- Name: classification_id_class_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.classification_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classification_id_class_seq OWNER TO "LeZ";

--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 215
-- Name: classification_id_class_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;


--
-- TOC entry 226 (class 1259 OID 16866)
-- Name: client; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text,
    mdp text
);


ALTER TABLE public.client OWNER TO "LeZ";

--
-- TOC entry 225 (class 1259 OID 16865)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_client_seq OWNER TO "LeZ";

--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 225
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 224 (class 1259 OID 16844)
-- Name: config; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.config (
    id_config integer NOT NULL,
    ram integer,
    stockage integer,
    id_processeur integer NOT NULL,
    id_cartegraphique integer NOT NULL,
    id_os integer NOT NULL
);


ALTER TABLE public.config OWNER TO "LeZ";

--
-- TOC entry 223 (class 1259 OID 16843)
-- Name: config_id_config_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.config_id_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.config_id_config_seq OWNER TO "LeZ";

--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 223
-- Name: config_id_config_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;


--
-- TOC entry 230 (class 1259 OID 16884)
-- Name: jeux; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.jeux (
    id_jeux integer NOT NULL,
    nom text,
    prix numeric(15,2),
    description text,
    id_class integer NOT NULL,
    id_config integer NOT NULL,
    id_config_1 integer NOT NULL,
    image text
);


ALTER TABLE public.jeux OWNER TO "LeZ";

--
-- TOC entry 229 (class 1259 OID 16883)
-- Name: jeux_id_jeux_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.jeux_id_jeux_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jeux_id_jeux_seq OWNER TO "LeZ";

--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 229
-- Name: jeux_id_jeux_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;


--
-- TOC entry 222 (class 1259 OID 16835)
-- Name: os; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.os (
    id_os integer NOT NULL,
    nom text
);


ALTER TABLE public.os OWNER TO "LeZ";

--
-- TOC entry 221 (class 1259 OID 16834)
-- Name: os_id_os_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.os_id_os_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.os_id_os_seq OWNER TO "LeZ";

--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 221
-- Name: os_id_os_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;


--
-- TOC entry 220 (class 1259 OID 16826)
-- Name: processeur; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.processeur (
    id_processeur integer NOT NULL,
    nom text
);


ALTER TABLE public.processeur OWNER TO "LeZ";

--
-- TOC entry 219 (class 1259 OID 16825)
-- Name: processeur_id_processeur_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.processeur_id_processeur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.processeur_id_processeur_seq OWNER TO "LeZ";

--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 219
-- Name: processeur_id_processeur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;


--
-- TOC entry 231 (class 1259 OID 16918)
-- Name: vue_jeux_config; Type: VIEW; Schema: public; Owner: LeZ
--

CREATE VIEW public.vue_jeux_config AS
 SELECT j.id_jeux,
    j.nom AS nom_jeu,
    j.prix,
    j.description,
    j.image,
    c1.ram AS ram_config1,
    c1.stockage AS stockage_config1,
    c2.ram AS ram_config2,
    c2.stockage AS stockage_config2,
    p1.nom AS nom_processeur_config1,
    p2.nom AS nom_processeur_config2,
    cg1.nom AS nom_carte_graphique_config1,
    cg2.nom AS nom_carte_graphique_config2,
    o1.nom AS nom_os_config1,
    o2.nom AS nom_os_config2,
    cl.pegi
   FROM (((((((((public.jeux j
     JOIN public.config c1 ON ((j.id_config = c1.id_config)))
     JOIN public.config c2 ON ((j.id_config_1 = c2.id_config)))
     JOIN public.os o1 ON ((c1.id_os = o1.id_os)))
     JOIN public.os o2 ON ((c2.id_os = o2.id_os)))
     JOIN public.processeur p1 ON ((c1.id_processeur = p1.id_processeur)))
     JOIN public.processeur p2 ON ((c2.id_processeur = p2.id_processeur)))
     JOIN public.carte_graphique cg1 ON ((c1.id_cartegraphique = cg1.id_cartegraphique)))
     JOIN public.carte_graphique cg2 ON ((c2.id_cartegraphique = cg2.id_cartegraphique)))
     JOIN public.classification cl ON ((j.id_class = cl.id_class)));


ALTER VIEW public.vue_jeux_config OWNER TO "LeZ";

--
-- TOC entry 4733 (class 2604 OID 16878)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 16820)
-- Name: carte_graphique id_cartegraphique; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16811)
-- Name: classification id_class; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);


--
-- TOC entry 4732 (class 2604 OID 16869)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 16847)
-- Name: config id_config; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 16887)
-- Name: jeux id_jeux; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 16838)
-- Name: os id_os; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 16829)
-- Name: processeur id_processeur; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);


--
-- TOC entry 4914 (class 0 OID 16875)
-- Dependencies: 228
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.admin (id_admin, nom, mdp) FROM stdin;
\.


--
-- TOC entry 4904 (class 0 OID 16817)
-- Dependencies: 218
-- Data for Name: carte_graphique; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.carte_graphique (id_cartegraphique, nom) FROM stdin;
1	NVIDIA GeForce RTX 3090
2	NVIDIA GeForce RTX 3080
3	NVIDIA GeForce RTX 3070
4	NVIDIA GeForce RTX 3060 Ti
5	AMD Radeon RX 6900 XT
6	AMD Radeon RX 6800 XT
7	AMD Radeon RX 6800
8	NVIDIA GeForce RTX 2080 Ti
9	NVIDIA GeForce RTX 2080 Super
10	NVIDIA GeForce RTX 2070 Super
11	NVIDIA GeForce RTX 2060 Super
12	AMD Radeon RX 6700 XT
13	AMD Radeon RX 5700 XT
14	NVIDIA GeForce GTX 1660 Ti
15	NVIDIA GeForce GTX 1660 Super
16	NVIDIA GeForce GTX 1650 Super
17	AMD Radeon RX 6600 XT
18	AMD Radeon RX 6500 XT
19	NVIDIA GeForce GTX 1080 Ti
20	NVIDIA GeForce GTX 1080
\.


--
-- TOC entry 4902 (class 0 OID 16808)
-- Dependencies: 216
-- Data for Name: classification; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.classification (id_class, pegi) FROM stdin;
1	PEGI 3
2	PEGI 7
3	PEGI 12
4	PEGI 16
5	PEGI 18
\.


--
-- TOC entry 4912 (class 0 OID 16866)
-- Dependencies: 226
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.client (id_client, nom, mdp) FROM stdin;
\.


--
-- TOC entry 4910 (class 0 OID 16844)
-- Dependencies: 224
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) FROM stdin;
1	16	100	15	11	2
2	8	100	17	20	2
3	8	100	17	16	3
4	16	100	16	20	2
\.


--
-- TOC entry 4916 (class 0 OID 16884)
-- Dependencies: 230
-- Data for Name: jeux; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image) FROM stdin;
1	Helldivers 2	59.99	Helldivers 2 takes place in a satirical, futuristic setting in which mankind is ruled by the "managed democracy" of Super Earth. Players take the roles of Helldivers, expendable elite soldiers who fight and die to protect the rest of humanity from various enemy factions. Helldivers 2 is a tactical shooter presented from a third-person perspective, unlike its predecessor which was designed as an isometric top-down shooter. Missions focus on cooperative gameplay between up to four players, who are encouraged to coordinate their actions and tactics together to eliminate enemies and complete objectives. Helldivers 2 carries over several hallmarks of the first game, including permanent friendly-fire and a feature called stratagems, which summon specific tools and abilities to the team's side. 	5	2	1	https://media.discordapp.net/attachments/929447829611622410/1232256780742950943/helldivers-2-wallpaper-2_fjm7.jpg?ex=6628cc0e&is=66277a8e&hm=239dffc8f07339853654f791d3b162f461433138c2cddf19d0ec3129314f7732&=&format=webp&width=1177&height=662
3	Fallout 76	44.99	Bethesda Game Studios, créateurs maintes fois récompensés de Skyrim et Fallout 4, vous souhaitent la bienvenue dans Fallout 76. Vingt-cinq ans se sont écoulés depuis le bombardement, lorsque vous et les autres résidents de l'abri, triés sur le volet parmi l'élite de la nation, vous aventurez dans une Amérique post-nucléaire, lors de Reclamation Day, en 2102. Jouez seul ou avec d'autres personnes afin d'explorer, d'accomplir des quêtes, de construire et de venir à bout des plus grandes menaces des Terres désolées. Explorez des Terres désolées dévastées par une guerre nucléaire dans cet ajout multijoueur à l'histoire de Fallout. Découvrez le monde le plus étendu et le plus vivant jamais créé dans l'univers de Fallout.\nQuêtes Immersives Et Personnages Attachants\nDécouvrez les secrets de la Virginie-Occidentale en prenant part à une quête principale immersive qui commence dès votre sortie de l'abri 76. Faites-vous des amis ou trahissez vos nouveaux voisins venus pour reconstruire, et voyez les Appalaches du point de vue de ses résidents.\nTableau De S.c.o.r.e. Saisonnier\nProgressez dans une saison avec une série de récompenses gratuites comme des consommables, objets de C.A.M.P. et plus encore en terminant des défis à durée limitée.\nJeu De Rôle Multijoueur\nCréez votre personnage grâce au système S.P.E.C.I.A.L. et forgez votre propre destinée dans une nouvelle région sauvage et dévastée, avec des centaines de lieux à découvrir. Que vous voyagiez seul ou avec des amis, une nouvelle aventure Fallout unique vous attend.\nLà-haut, Sur La Montagne !\nL'histoire prend vie dans le monde de Fallout 76, avec six régions différentes de Virginie-Occidentale. Parcourez les forêts des Appalaches ou les terres pourpres et toxiques de la Tourbière, chaque région vous offrira ses propres récompenses et comportera ses propres dangers.\nUn Nouveau Rêve Américain !\nUtilisez le tout nouveau Centre d'Assemblage et de Montage Portatif (C.A.M.P.) pour construire et fabriquer où bon vous semble. Votre C.A.M.P. vous offrira un abri, du matériel et une sécurité indispensables. Vous pourrez même établir une boutique pour échanger des produits avec d'autres survivants.\nFallout worlds\nJouez à des aventures uniques dans les Appalaches avec Fallout Worlds, une sélection de réglages évolutifs qui offrent aux joueurs la possibilité de découvrir Fallout 76 de manière unique avec des réglages personnalisables. 	5	3	4	https://media.discordapp.net/attachments/929447829611622410/1232258137546031104/apps.37480.14021888442308164.4c8974f4-a1df-43bd-bf56-247900ff3ab1.jpg?ex=6628cd52&is=66277bd2&hm=3d0391da15cf7ab0b27dec15bf844ed9dbf373ed3f29dc397625ec7da6dc4eb7&=&format=webp&width=1177&height=662
\.


--
-- TOC entry 4908 (class 0 OID 16835)
-- Dependencies: 222
-- Data for Name: os; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.os (id_os, nom) FROM stdin;
1	Windows 11
2	Windows 10
3	Windows 7
\.


--
-- TOC entry 4906 (class 0 OID 16826)
-- Dependencies: 220
-- Data for Name: processeur; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.processeur (id_processeur, nom) FROM stdin;
1	Intel Core i9-11900K
2	AMD Ryzen 9 5900X
3	Intel Core i7-11700K
4	AMD Ryzen 7 5800X
5	Intel Core i5-11600K
6	AMD Ryzen 5 5600X
7	Intel Core i9-10900K
8	AMD Ryzen 9 5950X
9	Intel Core i7-10700K
10	AMD Ryzen 7 3700X
11	Intel Core i5-10600K
12	AMD Ryzen 5 3600X
13	Intel Core i9-9900K
14	AMD Ryzen 9 3900X
15	Intel Core i7-9700K
16	AMD Ryzen 7 3800X
17	Intel Core i5-9600K
18	AMD Ryzen 5 3500X
19	Intel Core i9-10980XE
20	AMD Ryzen 9 3950X
\.


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 227
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, false);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 217
-- Name: carte_graphique_id_cartegraphique_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 20, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 215
-- Name: classification_id_class_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 225
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 223
-- Name: config_id_config_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.config_id_config_seq', 4, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 229
-- Name: jeux_id_jeux_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 3, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 221
-- Name: os_id_os_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.os_id_os_seq', 3, true);


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 219
-- Name: processeur_id_processeur_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 20, true);


--
-- TOC entry 4748 (class 2606 OID 16882)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4738 (class 2606 OID 16824)
-- Name: carte_graphique carte_graphique_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.carte_graphique
    ADD CONSTRAINT carte_graphique_pkey PRIMARY KEY (id_cartegraphique);


--
-- TOC entry 4736 (class 2606 OID 16815)
-- Name: classification classification_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (id_class);


--
-- TOC entry 4746 (class 2606 OID 16873)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4744 (class 2606 OID 16849)
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id_config);


--
-- TOC entry 4750 (class 2606 OID 16891)
-- Name: jeux jeux_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_pkey PRIMARY KEY (id_jeux);


--
-- TOC entry 4742 (class 2606 OID 16842)
-- Name: os os_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id_os);


--
-- TOC entry 4740 (class 2606 OID 16833)
-- Name: processeur processeur_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.processeur
    ADD CONSTRAINT processeur_pkey PRIMARY KEY (id_processeur);


--
-- TOC entry 4751 (class 2606 OID 16855)
-- Name: config config_id_cartegraphique_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_cartegraphique_fkey FOREIGN KEY (id_cartegraphique) REFERENCES public.carte_graphique(id_cartegraphique);


--
-- TOC entry 4752 (class 2606 OID 16860)
-- Name: config config_id_os_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);


--
-- TOC entry 4753 (class 2606 OID 16850)
-- Name: config config_id_processeur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);


--
-- TOC entry 4754 (class 2606 OID 16892)
-- Name: jeux jeux_id_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);


--
-- TOC entry 4755 (class 2606 OID 16902)
-- Name: jeux jeux_id_config_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);


--
-- TOC entry 4756 (class 2606 OID 16897)
-- Name: jeux jeux_id_config_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);


-- Completed on 2024-04-24 00:25:02

--
-- PostgreSQL database dump complete
--

--
-- Database "demo" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-24 00:25:02

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
-- TOC entry 5002 (class 1262 OID 16399)
-- Name: demo; Type: DATABASE; Schema: -; Owner: LeZ
--

CREATE DATABASE demo WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';


ALTER DATABASE demo OWNER TO "LeZ";

\connect demo

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
-- TOC entry 246 (class 1255 OID 16802)
-- Name: ajout_admin(text, text); Type: FUNCTION; Schema: public; Owner: LeZ
--

CREATE FUNCTION public.ajout_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  declare p_nom alias for $1;
  declare p_password alias for $2;
  declare id integer;
  declare retour integer;
  
  begin
  	select into id id_admin from admin where nom_admin = p_nom and password = p_password;
	if not found
	then
	  insert into admin (nom_admin,password) values (p_nom,p_password);
	  if not found
	  then
	  
	    retour = -1; -- échec insertion
	  else
	    retour = 1; -- insertion réussie
	  end if;
	else
	  retour = 0; --déjà en BD
	end if;
	
	return retour;
end;
$_$;


ALTER FUNCTION public.ajout_admin(text, text) OWNER TO "LeZ";

--
-- TOC entry 247 (class 1255 OID 16803)
-- Name: ajout_client(text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: LeZ
--

CREATE FUNCTION public.ajout_client(text, text, text, text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  declare p_nom alias for $1;
  declare p_prenom alias for $2;
  declare p_email alias for $3;
  declare p_adresse alias for $4;
  declare p_numero alias for $5;
  declare id integer;
  declare retour integer;
  
begin
	select into id id_client from client where email = p_email;
	if not found
	then
	  insert into client (nom_client,prenom_client,email,adresse,numero) values
	    (p_nom,p_prenom,p_email,p_adresse,p_numero);
	  select into id id_client from client where email = p_email;
	  if not found
	  then	
	    retour = -1;  --échec de la requête
	  else
	    retour = 1;   -- insertion ok
	  end if;
	else
	  retour = 0;      -- déjà en BD
	end if;
 return retour;
 end;
$_$;


ALTER FUNCTION public.ajout_client(text, text, text, text, text) OWNER TO "LeZ";

--
-- TOC entry 249 (class 1255 OID 16805)
-- Name: delete_client(integer); Type: FUNCTION; Schema: public; Owner: LeZ
--

CREATE FUNCTION public.delete_client(integer) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
    declare p_id alias for $1;
    declare retour integer;
    --declare id integer;
BEGIN
    delete from client where id_client = p_id;
    -- verifier le delete
    RETURN 1;
END;
$_$;


ALTER FUNCTION public.delete_client(integer) OWNER TO "LeZ";

--
-- TOC entry 248 (class 1255 OID 16804)
-- Name: verifier_admin(text, text); Type: FUNCTION; Schema: public; Owner: LeZ
--

CREATE FUNCTION public.verifier_admin(text, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$
  DECLARE p_login ALIAS FOR $1;
  DECLARE p_pass ALIAS for $2;
  DECLARE id integer;
  DECLARE retour integer;
BEGIN
  select into id id_admin from admin where nom_admin = p_login and password = p_pass;
  IF NOT FOUND
  THEN
    retour = 0;
  ELSE
    retour = 1;
  END IF;
   return retour;
 end;
  
$_$;


ALTER FUNCTION public.verifier_admin(text, text) OWNER TO "LeZ";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 237 (class 1259 OID 16739)
-- Name: admin; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom_admin text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public.admin OWNER TO "LeZ";

--
-- TOC entry 238 (class 1259 OID 16746)
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.admin_id_admin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 20000000
    CACHE 1;


ALTER SEQUENCE public.admin_id_admin_seq OWNER TO "LeZ";

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 238
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 224 (class 1259 OID 16613)
-- Name: boite; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.boite (
    id_boite integer NOT NULL,
    adresse text NOT NULL,
    numero integer
);


ALTER TABLE public.boite OWNER TO "LeZ";

--
-- TOC entry 223 (class 1259 OID 16612)
-- Name: boite_id_boite_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.boite_id_boite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.boite_id_boite_seq OWNER TO "LeZ";

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 223
-- Name: boite_id_boite_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.boite_id_boite_seq OWNED BY public.boite.id_boite;


--
-- TOC entry 216 (class 1259 OID 16567)
-- Name: categorie; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.categorie (
    id_categorie integer NOT NULL,
    nom_categorie text NOT NULL
);


ALTER TABLE public.categorie OWNER TO "LeZ";

--
-- TOC entry 215 (class 1259 OID 16566)
-- Name: categorie_id_categorie_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.categorie_id_categorie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorie_id_categorie_seq OWNER TO "LeZ";

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 215
-- Name: categorie_id_categorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.categorie_id_categorie_seq OWNED BY public.categorie.id_categorie;


--
-- TOC entry 228 (class 1259 OID 16636)
-- Name: client; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom_client text NOT NULL,
    email text NOT NULL,
    adresse text NOT NULL,
    numero text NOT NULL,
    id_ville integer,
    prenom_client text
);


ALTER TABLE public.client OWNER TO "LeZ";

--
-- TOC entry 227 (class 1259 OID 16635)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_client_seq OWNER TO "LeZ";

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 227
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 234 (class 1259 OID 16686)
-- Name: facture; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.facture (
    id_facture integer NOT NULL,
    date_facture date NOT NULL,
    paye boolean NOT NULL,
    id_produit integer NOT NULL,
    id_client integer NOT NULL,
    prix real NOT NULL
);


ALTER TABLE public.facture OWNER TO "LeZ";

--
-- TOC entry 233 (class 1259 OID 16685)
-- Name: facture_id_facture_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.facture_id_facture_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facture_id_facture_seq OWNER TO "LeZ";

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 233
-- Name: facture_id_facture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.facture_id_facture_seq OWNED BY public.facture.id_facture;


--
-- TOC entry 236 (class 1259 OID 16703)
-- Name: livraison; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.livraison (
    id_livraison integer NOT NULL,
    id_magasin integer,
    id_facture integer
);


ALTER TABLE public.livraison OWNER TO "LeZ";

--
-- TOC entry 235 (class 1259 OID 16702)
-- Name: livraison_id_livraison_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.livraison_id_livraison_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.livraison_id_livraison_seq OWNER TO "LeZ";

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 235
-- Name: livraison_id_livraison_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.livraison_id_livraison_seq OWNED BY public.livraison.id_livraison;


--
-- TOC entry 226 (class 1259 OID 16622)
-- Name: magasin; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.magasin (
    id_magasin integer NOT NULL,
    nom_magasin text NOT NULL,
    adresse text NOT NULL,
    numero text NOT NULL,
    localite text,
    code_postal text,
    id_ville integer NOT NULL
);


ALTER TABLE public.magasin OWNER TO "LeZ";

--
-- TOC entry 225 (class 1259 OID 16621)
-- Name: magasin_id_magasin_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.magasin_id_magasin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.magasin_id_magasin_seq OWNER TO "LeZ";

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 225
-- Name: magasin_id_magasin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.magasin_id_magasin_seq OWNED BY public.magasin.id_magasin;


--
-- TOC entry 232 (class 1259 OID 16669)
-- Name: panier; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.panier (
    id_panier integer NOT NULL,
    quantite integer NOT NULL,
    id_client integer NOT NULL,
    id_produit integer NOT NULL
);


ALTER TABLE public.panier OWNER TO "LeZ";

--
-- TOC entry 231 (class 1259 OID 16668)
-- Name: panier_id_panier_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.panier_id_panier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.panier_id_panier_seq OWNER TO "LeZ";

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 231
-- Name: panier_id_panier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.panier_id_panier_seq OWNED BY public.panier.id_panier;


--
-- TOC entry 220 (class 1259 OID 16590)
-- Name: pays; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.pays (
    id_pays integer NOT NULL,
    nom_pays text NOT NULL
);


ALTER TABLE public.pays OWNER TO "LeZ";

--
-- TOC entry 219 (class 1259 OID 16589)
-- Name: pays_id_pays_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.pays_id_pays_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pays_id_pays_seq OWNER TO "LeZ";

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 219
-- Name: pays_id_pays_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.pays_id_pays_seq OWNED BY public.pays.id_pays;


--
-- TOC entry 230 (class 1259 OID 16650)
-- Name: produit; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.produit (
    id_produit integer NOT NULL,
    nom_produit text NOT NULL,
    prix double precision,
    stock integer,
    relais boolean,
    id_magasin integer NOT NULL,
    id_sous_categorie integer NOT NULL
);


ALTER TABLE public.produit OWNER TO "LeZ";

--
-- TOC entry 229 (class 1259 OID 16649)
-- Name: produit_id_produit_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.produit_id_produit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produit_id_produit_seq OWNER TO "LeZ";

--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 229
-- Name: produit_id_produit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.produit_id_produit_seq OWNED BY public.produit.id_produit;


--
-- TOC entry 218 (class 1259 OID 16576)
-- Name: sous_categorie; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.sous_categorie (
    id_sous_categorie integer NOT NULL,
    nom_sous_categorie text NOT NULL,
    id_categorie integer NOT NULL
);


ALTER TABLE public.sous_categorie OWNER TO "LeZ";

--
-- TOC entry 217 (class 1259 OID 16575)
-- Name: sous_categorie_id_sous_categorie_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.sous_categorie_id_sous_categorie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sous_categorie_id_sous_categorie_seq OWNER TO "LeZ";

--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 217
-- Name: sous_categorie_id_sous_categorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.sous_categorie_id_sous_categorie_seq OWNED BY public.sous_categorie.id_sous_categorie;


--
-- TOC entry 222 (class 1259 OID 16599)
-- Name: ville; Type: TABLE; Schema: public; Owner: LeZ
--

CREATE TABLE public.ville (
    id_ville integer NOT NULL,
    nom_ville text NOT NULL,
    code_postal text NOT NULL,
    id_pays integer NOT NULL
);


ALTER TABLE public.ville OWNER TO "LeZ";

--
-- TOC entry 221 (class 1259 OID 16598)
-- Name: ville_id_ville_seq; Type: SEQUENCE; Schema: public; Owner: LeZ
--

CREATE SEQUENCE public.ville_id_ville_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ville_id_ville_seq OWNER TO "LeZ";

--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 221
-- Name: ville_id_ville_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: LeZ
--

ALTER SEQUENCE public.ville_id_ville_seq OWNED BY public.ville.id_ville;


--
-- TOC entry 241 (class 1259 OID 16768)
-- Name: vue_cat_sous_cat; Type: VIEW; Schema: public; Owner: LeZ
--

CREATE VIEW public.vue_cat_sous_cat AS
 SELECT categorie.id_categorie,
    categorie.nom_categorie,
    sous_categorie.id_sous_categorie,
    sous_categorie.nom_sous_categorie
   FROM public.categorie,
    public.sous_categorie
  WHERE (categorie.id_categorie = sous_categorie.id_categorie);


ALTER VIEW public.vue_cat_sous_cat OWNER TO "LeZ";

--
-- TOC entry 242 (class 1259 OID 16772)
-- Name: vue_categorie_sous_categorie; Type: VIEW; Schema: public; Owner: LeZ
--

CREATE VIEW public.vue_categorie_sous_categorie AS
 SELECT categorie.id_categorie,
    categorie.nom_categorie,
    sous_categorie.id_sous_categorie,
    sous_categorie.nom_sous_categorie
   FROM public.categorie,
    public.sous_categorie
  WHERE (sous_categorie.id_categorie = categorie.id_categorie);


ALTER VIEW public.vue_categorie_sous_categorie OWNER TO "LeZ";

--
-- TOC entry 239 (class 1259 OID 16748)
-- Name: vue_pays_ville; Type: VIEW; Schema: public; Owner: LeZ
--

CREATE VIEW public.vue_pays_ville AS
 SELECT pays.id_pays,
    pays.nom_pays,
    ville.id_ville,
    ville.nom_ville,
    ville.code_postal
   FROM public.ville,
    public.pays
  WHERE (ville.id_pays = pays.id_pays);


ALTER VIEW public.vue_pays_ville OWNER TO "LeZ";

--
-- TOC entry 240 (class 1259 OID 16756)
-- Name: vue_produit_magasin; Type: VIEW; Schema: public; Owner: LeZ
--

CREATE VIEW public.vue_produit_magasin AS
 SELECT produit.nom_produit,
    produit.id_produit,
    magasin.nom_magasin,
    magasin.adresse,
    produit.prix
   FROM public.produit,
    public.magasin
  WHERE (produit.id_magasin = magasin.id_magasin);


ALTER VIEW public.vue_produit_magasin OWNER TO "LeZ";

--
-- TOC entry 244 (class 1259 OID 16787)
-- Name: vue_produits_magasins; Type: VIEW; Schema: public; Owner: LeZ
--

CREATE VIEW public.vue_produits_magasins AS
 SELECT produit.id_produit,
    produit.nom_produit,
    produit.prix,
    produit.stock,
    produit.relais,
    magasin.id_magasin,
    magasin.nom_magasin,
    magasin.adresse,
    magasin.numero
   FROM public.magasin,
    public.produit
  WHERE (magasin.id_magasin = produit.id_magasin);


ALTER VIEW public.vue_produits_magasins OWNER TO "LeZ";

--
-- TOC entry 245 (class 1259 OID 16791)
-- Name: vue_produits_cat_magasin; Type: VIEW; Schema: public; Owner: LeZ
--

CREATE VIEW public.vue_produits_cat_magasin AS
 SELECT vue_cat_sous_cat.id_categorie,
    vue_cat_sous_cat.nom_categorie,
    vue_cat_sous_cat.id_sous_categorie,
    vue_cat_sous_cat.nom_sous_categorie,
    vue_produits_magasins.id_produit,
    vue_produits_magasins.nom_produit,
    vue_produits_magasins.prix,
    vue_produits_magasins.stock,
    vue_produits_magasins.relais,
    vue_produits_magasins.id_magasin,
    vue_produits_magasins.nom_magasin,
    vue_produits_magasins.adresse,
    vue_produits_magasins.numero
   FROM public.vue_produits_magasins,
    public.produit,
    public.vue_cat_sous_cat
  WHERE ((vue_produits_magasins.id_produit = produit.id_produit) AND (vue_cat_sous_cat.id_sous_categorie = produit.id_sous_categorie))
  ORDER BY vue_produits_magasins.nom_produit;


ALTER VIEW public.vue_produits_cat_magasin OWNER TO "LeZ";

--
-- TOC entry 243 (class 1259 OID 16776)
-- Name: vue_produits_cat_sous_cat_mag; Type: VIEW; Schema: public; Owner: LeZ
--

CREATE VIEW public.vue_produits_cat_sous_cat_mag AS
 SELECT vue_categorie_sous_categorie.id_categorie,
    vue_categorie_sous_categorie.nom_categorie,
    vue_categorie_sous_categorie.nom_sous_categorie,
    produit.id_produit,
    produit.nom_produit,
    produit.prix,
    produit.stock,
    produit.relais,
    magasin.id_magasin,
    magasin.nom_magasin
   FROM public.vue_categorie_sous_categorie,
    public.produit,
    public.magasin
  WHERE ((produit.id_sous_categorie = vue_categorie_sous_categorie.id_sous_categorie) AND (produit.id_magasin = magasin.id_magasin));


ALTER VIEW public.vue_produits_cat_sous_cat_mag OWNER TO "LeZ";

--
-- TOC entry 4786 (class 2604 OID 16747)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 16616)
-- Name: boite id_boite; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.boite ALTER COLUMN id_boite SET DEFAULT nextval('public.boite_id_boite_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 16570)
-- Name: categorie id_categorie; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.categorie ALTER COLUMN id_categorie SET DEFAULT nextval('public.categorie_id_categorie_seq'::regclass);


--
-- TOC entry 4781 (class 2604 OID 16639)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4784 (class 2604 OID 16689)
-- Name: facture id_facture; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.facture ALTER COLUMN id_facture SET DEFAULT nextval('public.facture_id_facture_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 16706)
-- Name: livraison id_livraison; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.livraison ALTER COLUMN id_livraison SET DEFAULT nextval('public.livraison_id_livraison_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 16625)
-- Name: magasin id_magasin; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.magasin ALTER COLUMN id_magasin SET DEFAULT nextval('public.magasin_id_magasin_seq'::regclass);


--
-- TOC entry 4783 (class 2604 OID 16672)
-- Name: panier id_panier; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.panier ALTER COLUMN id_panier SET DEFAULT nextval('public.panier_id_panier_seq'::regclass);


--
-- TOC entry 4777 (class 2604 OID 16593)
-- Name: pays id_pays; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.pays ALTER COLUMN id_pays SET DEFAULT nextval('public.pays_id_pays_seq'::regclass);


--
-- TOC entry 4782 (class 2604 OID 16653)
-- Name: produit id_produit; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.produit ALTER COLUMN id_produit SET DEFAULT nextval('public.produit_id_produit_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 16579)
-- Name: sous_categorie id_sous_categorie; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.sous_categorie ALTER COLUMN id_sous_categorie SET DEFAULT nextval('public.sous_categorie_id_sous_categorie_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 16602)
-- Name: ville id_ville; Type: DEFAULT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.ville ALTER COLUMN id_ville SET DEFAULT nextval('public.ville_id_ville_seq'::regclass);


--
-- TOC entry 4995 (class 0 OID 16739)
-- Dependencies: 237
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.admin (id_admin, nom_admin, password) FROM stdin;
1	Ben	Ben
4	Louis	Louis
2	Pierre	Pierre
3	Emma	Emma
5	Bob	Bob
9	Fred	Fred
10	Marie	Marie
\.


--
-- TOC entry 4982 (class 0 OID 16613)
-- Dependencies: 224
-- Data for Name: boite; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.boite (id_boite, adresse, numero) FROM stdin;
\.


--
-- TOC entry 4974 (class 0 OID 16567)
-- Dependencies: 216
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.categorie (id_categorie, nom_categorie) FROM stdin;
1	Boucherie
2	Boulangerie
3	Epicerie
4	Ménage
5	Papeterie
6	Animaux
7	Fruits et légumes
8	Produits laitiers
\.


--
-- TOC entry 4986 (class 0 OID 16636)
-- Dependencies: 228
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.client (id_client, nom_client, email, adresse, numero, id_ville, prenom_client) FROM stdin;
\.


--
-- TOC entry 4992 (class 0 OID 16686)
-- Dependencies: 234
-- Data for Name: facture; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.facture (id_facture, date_facture, paye, id_produit, id_client, prix) FROM stdin;
\.


--
-- TOC entry 4994 (class 0 OID 16703)
-- Dependencies: 236
-- Data for Name: livraison; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.livraison (id_livraison, id_magasin, id_facture) FROM stdin;
\.


--
-- TOC entry 4984 (class 0 OID 16622)
-- Dependencies: 226
-- Data for Name: magasin; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.magasin (id_magasin, nom_magasin, adresse, numero, localite, code_postal, id_ville) FROM stdin;
2	Chez Jacques	Rue des écoles	154	\N	\N	3
3	Chez Ignace	Rue de la ferme	19	\N	\N	4
4	Chez Arthur	Rue des bois	29	\N	\N	3
5	Chez Margot	Rue de la poste	84	\N	\N	4
\.


--
-- TOC entry 4990 (class 0 OID 16669)
-- Dependencies: 232
-- Data for Name: panier; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.panier (id_panier, quantite, id_client, id_produit) FROM stdin;
\.


--
-- TOC entry 4978 (class 0 OID 16590)
-- Dependencies: 220
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.pays (id_pays, nom_pays) FROM stdin;
1	Belgique
2	France
\.


--
-- TOC entry 4988 (class 0 OID 16650)
-- Dependencies: 230
-- Data for Name: produit; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) FROM stdin;
1	Glacé	3.5	8	\N	2	7
2	Riz	5.7	8	\N	3	5
3	Ebly	4.5	16	\N	3	5
4	Semoule moyen	4.19	11	\N	3	5
5	Félix Duo	5.75	18	\N	3	3
6	Whiskas Poisson	6.51	21	\N	3	3
7	Croquettes Gourmet	7.24	10	\N	3	3
8	Pommes Grany Smith	3.15	20	\N	3	9
9	Poires Williams	2.51	12	\N	3	9
10	Oranges de table	4.24	12	\N	3	9
11	Clémentines	4.11	19	\N	3	9
12	Bananes	1.2	19	\N	3	9
13	Laitues	0.85	20	\N	3	11
14	Carottes	3	12	\N	3	11
15	Poireaux	2.24	15	\N	3	11
16	Navets	2.4	19	\N	3	11
17	Céleri	1.26	4	\N	3	11
19	Poulet	8.75	11	\N	2	6
20	Dinde	6.51	21	\N	2	6
21	Caille	17.24	5	\N	2	6
\.


--
-- TOC entry 4976 (class 0 OID 16576)
-- Dependencies: 218
-- Data for Name: sous_categorie; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) FROM stdin;
6	Volaille	1
7	Pains	2
5	Féculents	3
4	Pâtisserie	2
10	Vaisselle	4
2	Entretien	4
9	Fruits	7
11	Légumes	7
1	Traiteur	1
3	Animaux	4
\.


--
-- TOC entry 4980 (class 0 OID 16599)
-- Dependencies: 222
-- Data for Name: ville; Type: TABLE DATA; Schema: public; Owner: LeZ
--

COPY public.ville (id_ville, nom_ville, code_postal, id_pays) FROM stdin;
1	Peruwelz	7060	1
2	Quiévrechain	59920	2
3	Quiévrain	7380	1
4	Crespin	59154	2
5	Quarouble	59243	2
6	Hensies	7350	1
\.


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 238
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 10, true);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 223
-- Name: boite_id_boite_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.boite_id_boite_seq', 1, false);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 215
-- Name: categorie_id_categorie_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.categorie_id_categorie_seq', 8, true);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 227
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 233
-- Name: facture_id_facture_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.facture_id_facture_seq', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 235
-- Name: livraison_id_livraison_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.livraison_id_livraison_seq', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 225
-- Name: magasin_id_magasin_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.magasin_id_magasin_seq', 5, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 231
-- Name: panier_id_panier_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.panier_id_panier_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 219
-- Name: pays_id_pays_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.pays_id_pays_seq', 2, true);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 229
-- Name: produit_id_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.produit_id_produit_seq', 1, false);


--
-- TOC entry 5025 (class 0 OID 0)
-- Dependencies: 217
-- Name: sous_categorie_id_sous_categorie_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.sous_categorie_id_sous_categorie_seq', 11, true);


--
-- TOC entry 5026 (class 0 OID 0)
-- Dependencies: 221
-- Name: ville_id_ville_seq; Type: SEQUENCE SET; Schema: public; Owner: LeZ
--

SELECT pg_catalog.setval('public.ville_id_ville_seq', 6, true);


--
-- TOC entry 4810 (class 2606 OID 16745)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4796 (class 2606 OID 16620)
-- Name: boite boite_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.boite
    ADD CONSTRAINT boite_pkey PRIMARY KEY (id_boite);


--
-- TOC entry 4788 (class 2606 OID 16574)
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id_categorie);


--
-- TOC entry 4800 (class 2606 OID 16643)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4806 (class 2606 OID 16691)
-- Name: facture facture_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_pkey PRIMARY KEY (id_facture);


--
-- TOC entry 4808 (class 2606 OID 16708)
-- Name: livraison livraison_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_pkey PRIMARY KEY (id_livraison);


--
-- TOC entry 4798 (class 2606 OID 16629)
-- Name: magasin magasin_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.magasin
    ADD CONSTRAINT magasin_pkey PRIMARY KEY (id_magasin);


--
-- TOC entry 4804 (class 2606 OID 16674)
-- Name: panier panier_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_pkey PRIMARY KEY (id_panier);


--
-- TOC entry 4792 (class 2606 OID 16597)
-- Name: pays pays_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (id_pays);


--
-- TOC entry 4802 (class 2606 OID 16657)
-- Name: produit produit_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pkey PRIMARY KEY (id_produit);


--
-- TOC entry 4790 (class 2606 OID 16583)
-- Name: sous_categorie sous_categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.sous_categorie
    ADD CONSTRAINT sous_categorie_pkey PRIMARY KEY (id_sous_categorie);


--
-- TOC entry 4794 (class 2606 OID 16606)
-- Name: ville ville_pkey; Type: CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.ville
    ADD CONSTRAINT ville_pkey PRIMARY KEY (id_ville);


--
-- TOC entry 4814 (class 2606 OID 16644)
-- Name: client client_id_ville_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_id_ville_fkey FOREIGN KEY (id_ville) REFERENCES public.ville(id_ville);


--
-- TOC entry 4819 (class 2606 OID 16697)
-- Name: facture facture_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4820 (class 2606 OID 16692)
-- Name: facture facture_id_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES public.produit(id_produit);


--
-- TOC entry 4821 (class 2606 OID 16714)
-- Name: livraison livraison_id_facture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_id_facture_fkey FOREIGN KEY (id_facture) REFERENCES public.facture(id_facture);


--
-- TOC entry 4822 (class 2606 OID 16709)
-- Name: livraison livraison_id_magasin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_id_magasin_fkey FOREIGN KEY (id_magasin) REFERENCES public.magasin(id_magasin);


--
-- TOC entry 4813 (class 2606 OID 16630)
-- Name: magasin magasin_id_ville_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.magasin
    ADD CONSTRAINT magasin_id_ville_fkey FOREIGN KEY (id_ville) REFERENCES public.ville(id_ville);


--
-- TOC entry 4817 (class 2606 OID 16675)
-- Name: panier panier_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4818 (class 2606 OID 16680)
-- Name: panier panier_id_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES public.produit(id_produit);


--
-- TOC entry 4815 (class 2606 OID 16658)
-- Name: produit produit_id_magasin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_id_magasin_fkey FOREIGN KEY (id_magasin) REFERENCES public.magasin(id_magasin);


--
-- TOC entry 4816 (class 2606 OID 16663)
-- Name: produit produit_id_sous_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_id_sous_categorie_fkey FOREIGN KEY (id_sous_categorie) REFERENCES public.sous_categorie(id_sous_categorie);


--
-- TOC entry 4811 (class 2606 OID 16584)
-- Name: sous_categorie sous_categorie_id_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.sous_categorie
    ADD CONSTRAINT sous_categorie_id_categorie_fkey FOREIGN KEY (id_categorie) REFERENCES public.categorie(id_categorie);


--
-- TOC entry 4812 (class 2606 OID 16607)
-- Name: ville ville_id_pays_fkey; Type: FK CONSTRAINT; Schema: public; Owner: LeZ
--

ALTER TABLE ONLY public.ville
    ADD CONSTRAINT ville_id_pays_fkey FOREIGN KEY (id_pays) REFERENCES public.pays(id_pays);


-- Completed on 2024-04-24 00:25:02

--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-24 00:25:02

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 225 (class 1259 OID 16447)
-- Name: boite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.boite (
    id_boite integer NOT NULL,
    adresse text NOT NULL,
    numero integer
);


ALTER TABLE public.boite OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16446)
-- Name: boite_id_boite_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.boite_id_boite_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.boite_id_boite_seq OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 224
-- Name: boite_id_boite_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.boite_id_boite_seq OWNED BY public.boite.id_boite;


--
-- TOC entry 217 (class 1259 OID 16401)
-- Name: categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorie (
    id_categorie integer NOT NULL,
    nom_categorie text NOT NULL
);


ALTER TABLE public.categorie OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16400)
-- Name: categorie_id_categorie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categorie_id_categorie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorie_id_categorie_seq OWNER TO postgres;

--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 216
-- Name: categorie_id_categorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categorie_id_categorie_seq OWNED BY public.categorie.id_categorie;


--
-- TOC entry 229 (class 1259 OID 16470)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom_client text NOT NULL,
    email text NOT NULL,
    adresse text NOT NULL,
    numero text NOT NULL,
    id_ville integer NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16469)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_client_seq OWNER TO postgres;

--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 228
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 235 (class 1259 OID 16520)
-- Name: facture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facture (
    id_facture integer NOT NULL,
    date_facture date NOT NULL,
    paye boolean NOT NULL,
    id_produit integer NOT NULL,
    id_client integer NOT NULL
);


ALTER TABLE public.facture OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16519)
-- Name: facture_id_facture_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.facture_id_facture_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.facture_id_facture_seq OWNER TO postgres;

--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 234
-- Name: facture_id_facture_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.facture_id_facture_seq OWNED BY public.facture.id_facture;


--
-- TOC entry 237 (class 1259 OID 16537)
-- Name: livraison; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.livraison (
    id_livraison integer NOT NULL,
    id_magasin integer,
    id_facture integer
);


ALTER TABLE public.livraison OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 16536)
-- Name: livraison_id_livraison_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.livraison_id_livraison_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.livraison_id_livraison_seq OWNER TO postgres;

--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 236
-- Name: livraison_id_livraison_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.livraison_id_livraison_seq OWNED BY public.livraison.id_livraison;


--
-- TOC entry 227 (class 1259 OID 16456)
-- Name: magasin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.magasin (
    id_magasin integer NOT NULL,
    nom_magasin text NOT NULL,
    adresse text NOT NULL,
    numero text NOT NULL,
    localite text NOT NULL,
    code_postal text NOT NULL,
    id_ville integer NOT NULL
);


ALTER TABLE public.magasin OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16455)
-- Name: magasin_id_magasin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.magasin_id_magasin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.magasin_id_magasin_seq OWNER TO postgres;

--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 226
-- Name: magasin_id_magasin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.magasin_id_magasin_seq OWNED BY public.magasin.id_magasin;


--
-- TOC entry 233 (class 1259 OID 16503)
-- Name: panier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.panier (
    id_panier integer NOT NULL,
    quantite integer NOT NULL,
    id_client integer NOT NULL,
    id_produit integer NOT NULL
);


ALTER TABLE public.panier OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16502)
-- Name: panier_id_panier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.panier_id_panier_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.panier_id_panier_seq OWNER TO postgres;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 232
-- Name: panier_id_panier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.panier_id_panier_seq OWNED BY public.panier.id_panier;


--
-- TOC entry 221 (class 1259 OID 16424)
-- Name: pays; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pays (
    id_pays integer NOT NULL,
    nom_pays text NOT NULL
);


ALTER TABLE public.pays OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16423)
-- Name: pays_id_pays_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pays_id_pays_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pays_id_pays_seq OWNER TO postgres;

--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 220
-- Name: pays_id_pays_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pays_id_pays_seq OWNED BY public.pays.id_pays;


--
-- TOC entry 231 (class 1259 OID 16484)
-- Name: produit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produit (
    id_produit integer NOT NULL,
    nom_produit text NOT NULL,
    prix double precision,
    stock integer,
    relais boolean,
    id_magasin integer NOT NULL,
    id_sous_categorie integer NOT NULL
);


ALTER TABLE public.produit OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16483)
-- Name: produit_id_produit_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produit_id_produit_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produit_id_produit_seq OWNER TO postgres;

--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 230
-- Name: produit_id_produit_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produit_id_produit_seq OWNED BY public.produit.id_produit;


--
-- TOC entry 219 (class 1259 OID 16410)
-- Name: sous_categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sous_categorie (
    id_sous_categorie integer NOT NULL,
    nom_sous_categorie text NOT NULL,
    id_categorie integer NOT NULL
);


ALTER TABLE public.sous_categorie OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16409)
-- Name: sous_categorie_id_sous_categorie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sous_categorie_id_sous_categorie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sous_categorie_id_sous_categorie_seq OWNER TO postgres;

--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 218
-- Name: sous_categorie_id_sous_categorie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sous_categorie_id_sous_categorie_seq OWNED BY public.sous_categorie.id_sous_categorie;


--
-- TOC entry 223 (class 1259 OID 16433)
-- Name: ville; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ville (
    id_ville integer NOT NULL,
    nom_ville text NOT NULL,
    code_postal text NOT NULL,
    id_pays integer NOT NULL
);


ALTER TABLE public.ville OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16432)
-- Name: ville_id_ville_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ville_id_ville_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ville_id_ville_seq OWNER TO postgres;

--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 222
-- Name: ville_id_ville_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ville_id_ville_seq OWNED BY public.ville.id_ville;


--
-- TOC entry 4743 (class 2604 OID 16450)
-- Name: boite id_boite; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boite ALTER COLUMN id_boite SET DEFAULT nextval('public.boite_id_boite_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 16404)
-- Name: categorie id_categorie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie ALTER COLUMN id_categorie SET DEFAULT nextval('public.categorie_id_categorie_seq'::regclass);


--
-- TOC entry 4745 (class 2604 OID 16473)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4748 (class 2604 OID 16523)
-- Name: facture id_facture; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facture ALTER COLUMN id_facture SET DEFAULT nextval('public.facture_id_facture_seq'::regclass);


--
-- TOC entry 4749 (class 2604 OID 16540)
-- Name: livraison id_livraison; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison ALTER COLUMN id_livraison SET DEFAULT nextval('public.livraison_id_livraison_seq'::regclass);


--
-- TOC entry 4744 (class 2604 OID 16459)
-- Name: magasin id_magasin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magasin ALTER COLUMN id_magasin SET DEFAULT nextval('public.magasin_id_magasin_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 16506)
-- Name: panier id_panier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.panier ALTER COLUMN id_panier SET DEFAULT nextval('public.panier_id_panier_seq'::regclass);


--
-- TOC entry 4741 (class 2604 OID 16427)
-- Name: pays id_pays; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pays ALTER COLUMN id_pays SET DEFAULT nextval('public.pays_id_pays_seq'::regclass);


--
-- TOC entry 4746 (class 2604 OID 16487)
-- Name: produit id_produit; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit ALTER COLUMN id_produit SET DEFAULT nextval('public.produit_id_produit_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 16413)
-- Name: sous_categorie id_sous_categorie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sous_categorie ALTER COLUMN id_sous_categorie SET DEFAULT nextval('public.sous_categorie_id_sous_categorie_seq'::regclass);


--
-- TOC entry 4742 (class 2604 OID 16436)
-- Name: ville id_ville; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ville ALTER COLUMN id_ville SET DEFAULT nextval('public.ville_id_ville_seq'::regclass);


--
-- TOC entry 4936 (class 0 OID 16447)
-- Dependencies: 225
-- Data for Name: boite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.boite (id_boite, adresse, numero) FROM stdin;
\.


--
-- TOC entry 4928 (class 0 OID 16401)
-- Dependencies: 217
-- Data for Name: categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categorie (id_categorie, nom_categorie) FROM stdin;
\.


--
-- TOC entry 4940 (class 0 OID 16470)
-- Dependencies: 229
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id_client, nom_client, email, adresse, numero, id_ville) FROM stdin;
\.


--
-- TOC entry 4946 (class 0 OID 16520)
-- Dependencies: 235
-- Data for Name: facture; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.facture (id_facture, date_facture, paye, id_produit, id_client) FROM stdin;
\.


--
-- TOC entry 4948 (class 0 OID 16537)
-- Dependencies: 237
-- Data for Name: livraison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.livraison (id_livraison, id_magasin, id_facture) FROM stdin;
\.


--
-- TOC entry 4938 (class 0 OID 16456)
-- Dependencies: 227
-- Data for Name: magasin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.magasin (id_magasin, nom_magasin, adresse, numero, localite, code_postal, id_ville) FROM stdin;
\.


--
-- TOC entry 4944 (class 0 OID 16503)
-- Dependencies: 233
-- Data for Name: panier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.panier (id_panier, quantite, id_client, id_produit) FROM stdin;
\.


--
-- TOC entry 4932 (class 0 OID 16424)
-- Dependencies: 221
-- Data for Name: pays; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pays (id_pays, nom_pays) FROM stdin;
\.


--
-- TOC entry 4942 (class 0 OID 16484)
-- Dependencies: 231
-- Data for Name: produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produit (id_produit, nom_produit, prix, stock, relais, id_magasin, id_sous_categorie) FROM stdin;
\.


--
-- TOC entry 4930 (class 0 OID 16410)
-- Dependencies: 219
-- Data for Name: sous_categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sous_categorie (id_sous_categorie, nom_sous_categorie, id_categorie) FROM stdin;
\.


--
-- TOC entry 4934 (class 0 OID 16433)
-- Dependencies: 223
-- Data for Name: ville; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ville (id_ville, nom_ville, code_postal, id_pays) FROM stdin;
\.


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 224
-- Name: boite_id_boite_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.boite_id_boite_seq', 1, false);


--
-- TOC entry 4967 (class 0 OID 0)
-- Dependencies: 216
-- Name: categorie_id_categorie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categorie_id_categorie_seq', 1, false);


--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 228
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 234
-- Name: facture_id_facture_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.facture_id_facture_seq', 1, false);


--
-- TOC entry 4970 (class 0 OID 0)
-- Dependencies: 236
-- Name: livraison_id_livraison_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.livraison_id_livraison_seq', 1, false);


--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 226
-- Name: magasin_id_magasin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.magasin_id_magasin_seq', 1, false);


--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 232
-- Name: panier_id_panier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.panier_id_panier_seq', 1, false);


--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 220
-- Name: pays_id_pays_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pays_id_pays_seq', 1, false);


--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 230
-- Name: produit_id_produit_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produit_id_produit_seq', 1, false);


--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 218
-- Name: sous_categorie_id_sous_categorie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sous_categorie_id_sous_categorie_seq', 1, false);


--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 222
-- Name: ville_id_ville_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ville_id_ville_seq', 1, false);


--
-- TOC entry 4759 (class 2606 OID 16454)
-- Name: boite boite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.boite
    ADD CONSTRAINT boite_pkey PRIMARY KEY (id_boite);


--
-- TOC entry 4751 (class 2606 OID 16408)
-- Name: categorie categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorie
    ADD CONSTRAINT categorie_pkey PRIMARY KEY (id_categorie);


--
-- TOC entry 4763 (class 2606 OID 16477)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4769 (class 2606 OID 16525)
-- Name: facture facture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_pkey PRIMARY KEY (id_facture);


--
-- TOC entry 4771 (class 2606 OID 16542)
-- Name: livraison livraison_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_pkey PRIMARY KEY (id_livraison);


--
-- TOC entry 4761 (class 2606 OID 16463)
-- Name: magasin magasin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magasin
    ADD CONSTRAINT magasin_pkey PRIMARY KEY (id_magasin);


--
-- TOC entry 4767 (class 2606 OID 16508)
-- Name: panier panier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_pkey PRIMARY KEY (id_panier);


--
-- TOC entry 4755 (class 2606 OID 16431)
-- Name: pays pays_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pays
    ADD CONSTRAINT pays_pkey PRIMARY KEY (id_pays);


--
-- TOC entry 4765 (class 2606 OID 16491)
-- Name: produit produit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_pkey PRIMARY KEY (id_produit);


--
-- TOC entry 4753 (class 2606 OID 16417)
-- Name: sous_categorie sous_categorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sous_categorie
    ADD CONSTRAINT sous_categorie_pkey PRIMARY KEY (id_sous_categorie);


--
-- TOC entry 4757 (class 2606 OID 16440)
-- Name: ville ville_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ville
    ADD CONSTRAINT ville_pkey PRIMARY KEY (id_ville);


--
-- TOC entry 4775 (class 2606 OID 16478)
-- Name: client client_id_ville_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_id_ville_fkey FOREIGN KEY (id_ville) REFERENCES public.ville(id_ville);


--
-- TOC entry 4780 (class 2606 OID 16531)
-- Name: facture facture_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4781 (class 2606 OID 16526)
-- Name: facture facture_id_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facture
    ADD CONSTRAINT facture_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES public.produit(id_produit);


--
-- TOC entry 4782 (class 2606 OID 16548)
-- Name: livraison livraison_id_facture_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_id_facture_fkey FOREIGN KEY (id_facture) REFERENCES public.facture(id_facture);


--
-- TOC entry 4783 (class 2606 OID 16543)
-- Name: livraison livraison_id_magasin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.livraison
    ADD CONSTRAINT livraison_id_magasin_fkey FOREIGN KEY (id_magasin) REFERENCES public.magasin(id_magasin);


--
-- TOC entry 4774 (class 2606 OID 16464)
-- Name: magasin magasin_id_ville_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.magasin
    ADD CONSTRAINT magasin_id_ville_fkey FOREIGN KEY (id_ville) REFERENCES public.ville(id_ville);


--
-- TOC entry 4778 (class 2606 OID 16509)
-- Name: panier panier_id_client_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_id_client_fkey FOREIGN KEY (id_client) REFERENCES public.client(id_client);


--
-- TOC entry 4779 (class 2606 OID 16514)
-- Name: panier panier_id_produit_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.panier
    ADD CONSTRAINT panier_id_produit_fkey FOREIGN KEY (id_produit) REFERENCES public.produit(id_produit);


--
-- TOC entry 4776 (class 2606 OID 16492)
-- Name: produit produit_id_magasin_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_id_magasin_fkey FOREIGN KEY (id_magasin) REFERENCES public.magasin(id_magasin);


--
-- TOC entry 4777 (class 2606 OID 16497)
-- Name: produit produit_id_sous_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produit
    ADD CONSTRAINT produit_id_sous_categorie_fkey FOREIGN KEY (id_sous_categorie) REFERENCES public.sous_categorie(id_sous_categorie);


--
-- TOC entry 4772 (class 2606 OID 16418)
-- Name: sous_categorie sous_categorie_id_categorie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sous_categorie
    ADD CONSTRAINT sous_categorie_id_categorie_fkey FOREIGN KEY (id_categorie) REFERENCES public.categorie(id_categorie);


--
-- TOC entry 4773 (class 2606 OID 16441)
-- Name: ville ville_id_pays_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ville
    ADD CONSTRAINT ville_id_pays_fkey FOREIGN KEY (id_pays) REFERENCES public.pays(id_pays);


-- Completed on 2024-04-24 00:25:02

--
-- PostgreSQL database dump complete
--

-- Completed on 2024-04-24 00:25:02

--
-- PostgreSQL database cluster dump complete
--

