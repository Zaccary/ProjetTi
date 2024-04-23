--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-04-23 22:35:50

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 16875)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom text,
    mdp text
);


--
-- TOC entry 227 (class 1259 OID 16874)
-- Name: admin_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 227
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 218 (class 1259 OID 16817)
-- Name: carte_graphique; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carte_graphique (
    id_cartegraphique integer NOT NULL,
    nom text
);


--
-- TOC entry 217 (class 1259 OID 16816)
-- Name: carte_graphique_id_cartegraphique_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.carte_graphique_id_cartegraphique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 217
-- Name: carte_graphique_id_cartegraphique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;


--
-- TOC entry 216 (class 1259 OID 16808)
-- Name: classification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.classification (
    id_class integer NOT NULL,
    pegi text
);


--
-- TOC entry 215 (class 1259 OID 16807)
-- Name: classification_id_class_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.classification_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4925 (class 0 OID 0)
-- Dependencies: 215
-- Name: classification_id_class_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;


--
-- TOC entry 226 (class 1259 OID 16866)
-- Name: client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text,
    mdp text
);


--
-- TOC entry 225 (class 1259 OID 16865)
-- Name: client_id_client_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4926 (class 0 OID 0)
-- Dependencies: 225
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 224 (class 1259 OID 16844)
-- Name: config; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.config (
    id_config integer NOT NULL,
    ram integer,
    stockage integer,
    id_processeur integer NOT NULL,
    id_cartegraphique integer NOT NULL,
    id_os integer NOT NULL
);


--
-- TOC entry 223 (class 1259 OID 16843)
-- Name: config_id_config_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.config_id_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4927 (class 0 OID 0)
-- Dependencies: 223
-- Name: config_id_config_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;


--
-- TOC entry 230 (class 1259 OID 16884)
-- Name: jeux; Type: TABLE; Schema: public; Owner: -
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


--
-- TOC entry 229 (class 1259 OID 16883)
-- Name: jeux_id_jeux_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.jeux_id_jeux_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 229
-- Name: jeux_id_jeux_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;


--
-- TOC entry 222 (class 1259 OID 16835)
-- Name: os; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.os (
    id_os integer NOT NULL,
    nom text
);


--
-- TOC entry 221 (class 1259 OID 16834)
-- Name: os_id_os_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.os_id_os_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 221
-- Name: os_id_os_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;


--
-- TOC entry 220 (class 1259 OID 16826)
-- Name: processeur; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.processeur (
    id_processeur integer NOT NULL,
    nom text
);


--
-- TOC entry 219 (class 1259 OID 16825)
-- Name: processeur_id_processeur_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.processeur_id_processeur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 219
-- Name: processeur_id_processeur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;


--
-- TOC entry 231 (class 1259 OID 16918)
-- Name: vue_jeux_config; Type: VIEW; Schema: public; Owner: -
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


--
-- TOC entry 4733 (class 2604 OID 16878)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 16820)
-- Name: carte_graphique id_cartegraphique; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);


--
-- TOC entry 4727 (class 2604 OID 16811)
-- Name: classification id_class; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);


--
-- TOC entry 4732 (class 2604 OID 16869)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 16847)
-- Name: config id_config; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 16887)
-- Name: jeux id_jeux; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 16838)
-- Name: os id_os; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 16829)
-- Name: processeur id_processeur; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);


--
-- TOC entry 4914 (class 0 OID 16875)
-- Dependencies: 228
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4904 (class 0 OID 16817)
-- Dependencies: 218
-- Data for Name: carte_graphique; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (1, 'NVIDIA GeForce RTX 3090');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (2, 'NVIDIA GeForce RTX 3080');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (3, 'NVIDIA GeForce RTX 3070');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (4, 'NVIDIA GeForce RTX 3060 Ti');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (5, 'AMD Radeon RX 6900 XT');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (6, 'AMD Radeon RX 6800 XT');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (7, 'AMD Radeon RX 6800');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (8, 'NVIDIA GeForce RTX 2080 Ti');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (9, 'NVIDIA GeForce RTX 2080 Super');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (10, 'NVIDIA GeForce RTX 2070 Super');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (11, 'NVIDIA GeForce RTX 2060 Super');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (12, 'AMD Radeon RX 6700 XT');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (13, 'AMD Radeon RX 5700 XT');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (14, 'NVIDIA GeForce GTX 1660 Ti');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (15, 'NVIDIA GeForce GTX 1660 Super');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (16, 'NVIDIA GeForce GTX 1650 Super');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (17, 'AMD Radeon RX 6600 XT');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (18, 'AMD Radeon RX 6500 XT');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (19, 'NVIDIA GeForce GTX 1080 Ti');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (20, 'NVIDIA GeForce GTX 1080');


--
-- TOC entry 4902 (class 0 OID 16808)
-- Dependencies: 216
-- Data for Name: classification; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.classification (id_class, pegi) VALUES (1, 'PEGI 3');
INSERT INTO public.classification (id_class, pegi) VALUES (2, 'PEGI 7');
INSERT INTO public.classification (id_class, pegi) VALUES (3, 'PEGI 12');
INSERT INTO public.classification (id_class, pegi) VALUES (4, 'PEGI 16');
INSERT INTO public.classification (id_class, pegi) VALUES (5, 'PEGI 18');


--
-- TOC entry 4912 (class 0 OID 16866)
-- Dependencies: 226
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 4910 (class 0 OID 16844)
-- Dependencies: 224
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (1, 16, 100, 15, 11, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (2, 8, 100, 17, 20, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (3, 8, 100, 17, 16, 3);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (4, 16, 100, 16, 20, 2);


--
-- TOC entry 4916 (class 0 OID 16884)
-- Dependencies: 230
-- Data for Name: jeux; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image) VALUES (1, 'Helldivers 2', 59.99, 'Helldivers 2 takes place in a satirical, futuristic setting in which mankind is ruled by the "managed democracy" of Super Earth. Players take the roles of Helldivers, expendable elite soldiers who fight and die to protect the rest of humanity from various enemy factions. Helldivers 2 is a tactical shooter presented from a third-person perspective, unlike its predecessor which was designed as an isometric top-down shooter. Missions focus on cooperative gameplay between up to four players, who are encouraged to coordinate their actions and tactics together to eliminate enemies and complete objectives. Helldivers 2 carries over several hallmarks of the first game, including permanent friendly-fire and a feature called stratagems, which summon specific tools and abilities to the team''s side. ', 5, 2, 1, 'https://media.discordapp.net/attachments/929447829611622410/1232256780742950943/helldivers-2-wallpaper-2_fjm7.jpg?ex=6628cc0e&is=66277a8e&hm=239dffc8f07339853654f791d3b162f461433138c2cddf19d0ec3129314f7732&=&format=webp&width=1177&height=662');
INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image) VALUES (3, 'Fallout 76', 44.99, 'Bethesda Game Studios, créateurs maintes fois récompensés de Skyrim et Fallout 4, vous souhaitent la bienvenue dans Fallout 76. Vingt-cinq ans se sont écoulés depuis le bombardement, lorsque vous et les autres résidents de l''abri, triés sur le volet parmi l''élite de la nation, vous aventurez dans une Amérique post-nucléaire, lors de Reclamation Day, en 2102. Jouez seul ou avec d''autres personnes afin d''explorer, d''accomplir des quêtes, de construire et de venir à bout des plus grandes menaces des Terres désolées. Explorez des Terres désolées dévastées par une guerre nucléaire dans cet ajout multijoueur à l''histoire de Fallout. Découvrez le monde le plus étendu et le plus vivant jamais créé dans l''univers de Fallout.
Quêtes Immersives Et Personnages Attachants
Découvrez les secrets de la Virginie-Occidentale en prenant part à une quête principale immersive qui commence dès votre sortie de l''abri 76. Faites-vous des amis ou trahissez vos nouveaux voisins venus pour reconstruire, et voyez les Appalaches du point de vue de ses résidents.
Tableau De S.c.o.r.e. Saisonnier
Progressez dans une saison avec une série de récompenses gratuites comme des consommables, objets de C.A.M.P. et plus encore en terminant des défis à durée limitée.
Jeu De Rôle Multijoueur
Créez votre personnage grâce au système S.P.E.C.I.A.L. et forgez votre propre destinée dans une nouvelle région sauvage et dévastée, avec des centaines de lieux à découvrir. Que vous voyagiez seul ou avec des amis, une nouvelle aventure Fallout unique vous attend.
Là-haut, Sur La Montagne !
L''histoire prend vie dans le monde de Fallout 76, avec six régions différentes de Virginie-Occidentale. Parcourez les forêts des Appalaches ou les terres pourpres et toxiques de la Tourbière, chaque région vous offrira ses propres récompenses et comportera ses propres dangers.
Un Nouveau Rêve Américain !
Utilisez le tout nouveau Centre d''Assemblage et de Montage Portatif (C.A.M.P.) pour construire et fabriquer où bon vous semble. Votre C.A.M.P. vous offrira un abri, du matériel et une sécurité indispensables. Vous pourrez même établir une boutique pour échanger des produits avec d''autres survivants.
Fallout worlds
Jouez à des aventures uniques dans les Appalaches avec Fallout Worlds, une sélection de réglages évolutifs qui offrent aux joueurs la possibilité de découvrir Fallout 76 de manière unique avec des réglages personnalisables. ', 5, 3, 4, 'https://media.discordapp.net/attachments/929447829611622410/1232258137546031104/apps.37480.14021888442308164.4c8974f4-a1df-43bd-bf56-247900ff3ab1.jpg?ex=6628cd52&is=66277bd2&hm=3d0391da15cf7ab0b27dec15bf844ed9dbf373ed3f29dc397625ec7da6dc4eb7&=&format=webp&width=1177&height=662');


--
-- TOC entry 4908 (class 0 OID 16835)
-- Dependencies: 222
-- Data for Name: os; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.os (id_os, nom) VALUES (1, 'Windows 11');
INSERT INTO public.os (id_os, nom) VALUES (2, 'Windows 10');
INSERT INTO public.os (id_os, nom) VALUES (3, 'Windows 7');


--
-- TOC entry 4906 (class 0 OID 16826)
-- Dependencies: 220
-- Data for Name: processeur; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.processeur (id_processeur, nom) VALUES (1, 'Intel Core i9-11900K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (2, 'AMD Ryzen 9 5900X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (3, 'Intel Core i7-11700K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (4, 'AMD Ryzen 7 5800X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (5, 'Intel Core i5-11600K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (6, 'AMD Ryzen 5 5600X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (7, 'Intel Core i9-10900K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (8, 'AMD Ryzen 9 5950X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (9, 'Intel Core i7-10700K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (10, 'AMD Ryzen 7 3700X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (11, 'Intel Core i5-10600K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (12, 'AMD Ryzen 5 3600X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (13, 'Intel Core i9-9900K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (14, 'AMD Ryzen 9 3900X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (15, 'Intel Core i7-9700K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (16, 'AMD Ryzen 7 3800X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (17, 'Intel Core i5-9600K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (18, 'AMD Ryzen 5 3500X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (19, 'Intel Core i9-10980XE');
INSERT INTO public.processeur (id_processeur, nom) VALUES (20, 'AMD Ryzen 9 3950X');


--
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 227
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, false);


--
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 217
-- Name: carte_graphique_id_cartegraphique_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 20, true);


--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 215
-- Name: classification_id_class_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);


--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 225
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 223
-- Name: config_id_config_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.config_id_config_seq', 4, true);


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 229
-- Name: jeux_id_jeux_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 3, true);


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 221
-- Name: os_id_os_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.os_id_os_seq', 3, true);


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 219
-- Name: processeur_id_processeur_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 20, true);


--
-- TOC entry 4748 (class 2606 OID 16882)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4738 (class 2606 OID 16824)
-- Name: carte_graphique carte_graphique_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carte_graphique
    ADD CONSTRAINT carte_graphique_pkey PRIMARY KEY (id_cartegraphique);


--
-- TOC entry 4736 (class 2606 OID 16815)
-- Name: classification classification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (id_class);


--
-- TOC entry 4746 (class 2606 OID 16873)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4744 (class 2606 OID 16849)
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id_config);


--
-- TOC entry 4750 (class 2606 OID 16891)
-- Name: jeux jeux_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_pkey PRIMARY KEY (id_jeux);


--
-- TOC entry 4742 (class 2606 OID 16842)
-- Name: os os_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id_os);


--
-- TOC entry 4740 (class 2606 OID 16833)
-- Name: processeur processeur_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processeur
    ADD CONSTRAINT processeur_pkey PRIMARY KEY (id_processeur);


--
-- TOC entry 4751 (class 2606 OID 16855)
-- Name: config config_id_cartegraphique_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_cartegraphique_fkey FOREIGN KEY (id_cartegraphique) REFERENCES public.carte_graphique(id_cartegraphique);


--
-- TOC entry 4752 (class 2606 OID 16860)
-- Name: config config_id_os_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);


--
-- TOC entry 4753 (class 2606 OID 16850)
-- Name: config config_id_processeur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);


--
-- TOC entry 4754 (class 2606 OID 16892)
-- Name: jeux jeux_id_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);


--
-- TOC entry 4755 (class 2606 OID 16902)
-- Name: jeux jeux_id_config_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);


--
-- TOC entry 4756 (class 2606 OID 16897)
-- Name: jeux jeux_id_config_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);


-- Completed on 2024-04-23 22:35:51

--
-- PostgreSQL database dump complete
--

