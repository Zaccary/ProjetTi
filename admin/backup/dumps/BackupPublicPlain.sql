--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

-- Started on 2024-06-12 15:48:34

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
-- TOC entry 4928 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 232 (class 1255 OID 25692)
-- Name: ajout_config(integer, numeric, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_config(p_ram integer, p_sto numeric, p_proco text, p_cg text, p_os text) RETURNS integer
    LANGUAGE plpgsql
    AS '
declare
    id_config1 integer;

begin
    select into id_config1 id_config
    from config
    where ram = p_ram
      and stockage = p_sto
      and id_processeur = (select id_processeur from processeur where nom = p_proco)
      and id_cartegraphique = (select id_cartegraphique from carte_graphique where nom = p_CG)
      and id_os = (select id_os from os where nom = p_OS);
    if not found then
        insert into config (ram, stockage, id_processeur, id_cartegraphique, id_os)
        values (p_ram, p_sto, (select id_processeur from processeur where nom = p_proco),
                (select id_cartegraphique from carte_graphique where nom = p_CG),
                (select id_os from os where nom = p_OS))
        returning id_config into id_config1;
    end if;
    return id_config1;
end;
';


--
-- TOC entry 248 (class 1255 OID 25693)
-- Name: ajout_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text) RETURNS integer
    LANGUAGE plpgsql
    AS '
declare
    id_config1 integer;
    id_config2 integer;
    id_pegi integer;
    retour integer;

begin
id_config1= ajout_config(p_ram_co1, p_sto_co1, p_proco_co1, p_cg_co1, p_os_co1);
id_config2= ajout_config(p_ram_co2, p_sto_co2, p_proco_co2, p_cg_co2, p_os_co2);
select into id_pegi id_class from classification where pegi=p_pegi;
            insert into jeux (nom, prix, description, image, video, id_config, id_config_1, id_class)
            values (p_nom_jeu, p_prix, p_description, p_image, p_video, id_config1, id_config2, id_pegi);
select into retour id_jeux from jeux where nom=p_nom_jeu and prix=p_prix and description=p_description and image=p_image and video=p_video and id_config=id_config1 and id_config_1=id_config2 and id_class=id_pegi;
            if not found then
                retour = -1; --échec de la requête
            end if;
call lonelyconfig();
return retour;
end;
';


--
-- TOC entry 246 (class 1255 OID 25801)
-- Name: lonelyconfig(); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.lonelyconfig()
    LANGUAGE plpgsql
    AS '
DECLARE
    id_configg INTEGER[];
    id INTEGER;
BEGIN
    SELECT ARRAY(SELECT id_config FROM config WHERE id_config NOT IN (SELECT id_config FROM jeux UNION SELECT id_config_1 FROM jeux)) INTO id_configg;

    FOREACH id IN ARRAY id_configg
    LOOP
        DELETE FROM config WHERE id_config = id;
    END LOOP;
END;
';


--
-- TOC entry 234 (class 1255 OID 25804)
-- Name: supp_jeux(integer); Type: PROCEDURE; Schema: public; Owner: -
--

CREATE PROCEDURE public.supp_jeux(IN p_id_jeux integer)
    LANGUAGE plpgsql
    AS '
BEGIN
    DELETE FROM jeux WHERE id_jeux = p_id_jeux;

    call lonelyconfig();
END;
';


--
-- TOC entry 247 (class 1255 OID 25800)
-- Name: update_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.update_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text, id_jeu integer) RETURNS integer
    LANGUAGE plpgsql
    AS '
declare
    id_config1 integer;
    id_config2 integer;
    id_pegi integer;
    retour integer;

begin
id_config1= ajout_config(p_ram_co1, p_sto_co1, p_proco_co1, p_cg_co1, p_os_co1);
id_config2= ajout_config(p_ram_co2, p_sto_co2, p_proco_co2, p_cg_co2, p_os_co2);
select into id_pegi id_class from classification where pegi=p_pegi;
            update jeux set nom=p_nom_jeu, prix=p_prix, description=p_description, image=p_image, video=p_video, id_config=id_config1, id_config_1=id_config2, id_class=id_pegi where id_jeux=id_jeu;
select into retour id_jeux from jeux where nom=p_nom_jeu and prix=p_prix and description=p_description and image=p_image and video=p_video and id_config=id_config1 and id_config_1=id_config2 and id_class=id_pegi;
            if not found then
                retour = -1; --échec de la requête
            end if;
call lonelyconfig();
return retour;
end;
';


--
-- TOC entry 233 (class 1255 OID 25803)
-- Name: verifier_connexion(text, text); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.verifier_connexion(p_nom text, p_mdp text) RETURNS text
    LANGUAGE plpgsql
    AS '
  declare
    id integer;
    retour text;
BEGIN
      retour = 0;
if p_nom like ''$%'' and p_mdp like ''$%'' then
p_nom = substring(p_nom from 2);
p_mdp = substring(p_mdp from 2);
  select into id id_admin from admin where nom = p_nom and mdp = p_mdp;
  IF NOT FOUND
  THEN
    retour = ''0'';
  ELSE
    retour = concat(''1'',id);
  END IF;
else
    select into id id_client from client where nom = p_nom and mdp = p_mdp;
    IF NOT FOUND
    THEN
      retour = ''0'';
    ELSE
      retour = concat(''2'',id);
    END IF;
end if;
return retour;
end;

';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 25695)
-- Name: admin; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom text,
    mdp text
);


--
-- TOC entry 216 (class 1259 OID 25700)
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
-- TOC entry 4929 (class 0 OID 0)
-- Dependencies: 216
-- Name: admin_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;


--
-- TOC entry 217 (class 1259 OID 25701)
-- Name: carte_graphique; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carte_graphique (
    id_cartegraphique integer NOT NULL,
    nom text
);


--
-- TOC entry 218 (class 1259 OID 25706)
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
-- TOC entry 4930 (class 0 OID 0)
-- Dependencies: 218
-- Name: carte_graphique_id_cartegraphique_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;


--
-- TOC entry 219 (class 1259 OID 25707)
-- Name: classification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.classification (
    id_class integer NOT NULL,
    pegi text,
    icon text
);


--
-- TOC entry 220 (class 1259 OID 25712)
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
-- TOC entry 4931 (class 0 OID 0)
-- Dependencies: 220
-- Name: classification_id_class_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;


--
-- TOC entry 221 (class 1259 OID 25713)
-- Name: client; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text,
    mdp text,
    pp text
);


--
-- TOC entry 222 (class 1259 OID 25718)
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
-- TOC entry 4932 (class 0 OID 0)
-- Dependencies: 222
-- Name: client_id_client_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;


--
-- TOC entry 223 (class 1259 OID 25719)
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
-- TOC entry 224 (class 1259 OID 25722)
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
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 224
-- Name: config_id_config_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;


--
-- TOC entry 225 (class 1259 OID 25723)
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
    image text,
    video text
);


--
-- TOC entry 226 (class 1259 OID 25728)
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
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 226
-- Name: jeux_id_jeux_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;


--
-- TOC entry 227 (class 1259 OID 25729)
-- Name: os; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.os (
    id_os integer NOT NULL,
    nom text
);


--
-- TOC entry 228 (class 1259 OID 25734)
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
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 228
-- Name: os_id_os_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;


--
-- TOC entry 229 (class 1259 OID 25735)
-- Name: processeur; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.processeur (
    id_processeur integer NOT NULL,
    nom text
);


--
-- TOC entry 230 (class 1259 OID 25740)
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
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 230
-- Name: processeur_id_processeur_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;


--
-- TOC entry 231 (class 1259 OID 25741)
-- Name: vue_jeux_config; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.vue_jeux_config AS
 SELECT j.id_jeux,
    j.nom AS nom_jeu,
    j.prix,
    j.description,
    j.image,
    j.video,
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
    cl.pegi,
    cl.icon
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
-- TOC entry 4733 (class 2604 OID 25746)
-- Name: admin id_admin; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 25747)
-- Name: carte_graphique id_cartegraphique; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 25748)
-- Name: classification id_class; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);


--
-- TOC entry 4736 (class 2604 OID 25749)
-- Name: client id_client; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);


--
-- TOC entry 4737 (class 2604 OID 25750)
-- Name: config id_config; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);


--
-- TOC entry 4738 (class 2604 OID 25751)
-- Name: jeux id_jeux; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);


--
-- TOC entry 4739 (class 2604 OID 25752)
-- Name: os id_os; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);


--
-- TOC entry 4740 (class 2604 OID 25753)
-- Name: processeur id_processeur; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);


--
-- TOC entry 4907 (class 0 OID 25695)
-- Dependencies: 215
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.admin (id_admin, nom, mdp) VALUES (1, 'admin', 'admin');


--
-- TOC entry 4909 (class 0 OID 25701)
-- Dependencies: 217
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
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (21, 'NVIDIA GeForce RTX 3050 Ti');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (22, 'NVIDIA GeForce RTX 3050');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (23, 'NVIDIA GeForce GTX 1650');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (24, 'NVIDIA GeForce GTX 1050 Ti');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (25, 'NVIDIA GeForce GTX 1050');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (26, 'NVIDIA GeForce GT 1030');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (27, 'AMD Radeon RX 6900');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (28, 'AMD Radeon RX 6800');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (29, 'AMD Radeon RX 6700');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (30, 'AMD Radeon RX 6600');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (31, 'AMD Radeon RX 6500');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (32, 'AMD Radeon RX 6400');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (33, 'NVIDIA GeForce GT 710');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (34, 'NVIDIA GeForce GT 730');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (35, 'NVIDIA GeForce GT 740');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (36, 'NVIDIA GeForce GT 1030');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (37, 'NVIDIA GeForce MX150');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (38, 'NVIDIA GeForce MX250');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (39, 'NVIDIA GeForce MX350');
INSERT INTO public.carte_graphique (id_cartegraphique, nom) VALUES (40, 'AMD Radeon Pro WX 7100');


--
-- TOC entry 4911 (class 0 OID 25707)
-- Dependencies: 219
-- Data for Name: classification; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.classification (id_class, pegi, icon) VALUES (5, 'PEGI 18', '800px-PEGI_18.svg.png');
INSERT INTO public.classification (id_class, pegi, icon) VALUES (3, 'PEGI 12', '800px-PEGI_12.svg.png');
INSERT INTO public.classification (id_class, pegi, icon) VALUES (1, 'PEGI 3', '800px-PEGI_3.svg.png');
INSERT INTO public.classification (id_class, pegi, icon) VALUES (4, 'PEGI 16', '800px-PEGI_16.svg.png');
INSERT INTO public.classification (id_class, pegi, icon) VALUES (2, 'PEGI 7', '800px-PEGI_7.svg.png');


--
-- TOC entry 4913 (class 0 OID 25713)
-- Dependencies: 221
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.client (id_client, nom, mdp, pp) VALUES (1, 'Zac', 'Zac', '20240501_032815.jpg');


--
-- TOC entry 4915 (class 0 OID 25719)
-- Dependencies: 223
-- Data for Name: config; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (1, 16, 100, 15, 11, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (2, 8, 100, 17, 20, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (3, 8, 100, 17, 16, 3);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (4, 16, 100, 16, 20, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (27, 16, 150, 15, 11, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (28, 32, 150, 3, 3, 1);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (29, 8, 100, 17, 19, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (30, 16, 100, 3, 9, 1);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (31, 8, 100, 27, 25, 4);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (32, 16, 100, 25, 11, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (35, 16, 100, 25, 20, 2);
INSERT INTO public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) VALUES (38, 8, 100, 33, 24, 4);


--
-- TOC entry 4917 (class 0 OID 25723)
-- Dependencies: 225
-- Data for Name: jeux; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image, video) VALUES (7, 'Horizon Forbidden West', 49.99, 'Join Aloy as she braves a majestic but dangerous new frontier that holds mysterious new threats. This Complete Edition allows you to enjoy the critically acclaimed Horizon Forbidden West on PC in its entirety with bonus content, including the Burning Shores story expansion that picks up after the main game.Explore distant lands, fight bigger and more awe-inspiring machines, and encounter astonishing new tribes as you return to the far-future, post-apocalyptic world of Horizon.The land is dying. Vicious storms and an unstoppable blight ravage the scattered remnants of humanity while fearsome new machines prowl their borders, and life on Earth is hurtling toward another extinction.It''s up to Aloy to uncover the secrets behind these threats and restore order and balance to the world. Along the way, she must reunite with old friends, forge alliances with warring new factions and unravel the legacy of the ancient past.', 4, 27, 28, 'HorizonGame.jpg', 'https://www.youtube.com/embed/Xk-xq6_Lr6E?si=C8hOaG-Tohi_ANBE');
INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image, video) VALUES (8, 'Destiny', 54.99, 'Plongez dans l''univers de Destiny 2 pour explorer les mystères de notre système solaire, et découvrez les combats réactifs de ce jeu de tir à la première personne. Débloquez de puissantes capacités élémentaires et collectionnez de l''équipement unique pour personnaliser le look de votre Gardien et votre style de jeu. Découvrez les cinématiques de Destiny 2, des missions en coopération corsées, et toute une variété de modes en JcJ en solo ou avec vos amis. Téléchargez gratuitement dès aujourd''hui et écrivez votre légende dans les étoiles.', 4, 29, 30, 'destiny-2-la-forme-finale-pass-annuel-dlc-season-pc-jeu-steam-cover.jpg', 'https://www.youtube.com/embed/C-MdIoQP7CQ?si=aPpIAD9hzwK5tGZq');
INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image, video) VALUES (1, 'Helldivers 2', 59.99, 'Helldivers 2 takes place in a satirical, futuristic setting in which mankind is ruled by the "managed democracy" of Super Earth. Players take the roles of Helldivers, expendable elite soldiers who fight and die to protect the rest of humanity from various enemy factions. Helldivers 2 is a tactical shooter presented from a third-person perspective, unlike its predecessor which was designed as an isometric top-down shooter. Missions focus on cooperative gameplay between up to four players, who are encouraged to coordinate their actions and tactics together to eliminate enemies and complete objectives. Helldivers 2 carries over several hallmarks of the first game, including permanent friendly-fire and a feature called stratagems, which summon specific tools and abilities to the team''s side. ', 5, 2, 1, 'helldivers-2-wallpaper-2_fjm7.jpg', 'https://www.youtube.com/embed/0d_5JuwNn-Q?si=XYT5TndqqziBSNEe');
INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image, video) VALUES (10, 'Grand Theft Auto V', 19.99, 'Grand Theft Auto V for PC is an action adventure game, the fifth in the GTA series. As with the other games in the series, you score points by committing crimes. The game alternates between third-person narrative and play and first-person play, and you play as three criminals trying to avoid a determined government agency and committing heists. You do not pick just one character to play as, the game’s narrative jumps from one character to the next.', 5, 31, 32, '9333ea2a4f6bd2a5535247bfe989a053.jpg', 'https://www.youtube.com/embed/3DBrG2YjqQA?si=rItZWrhHNSPHOaKG');
INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image, video) VALUES (12, 'Apex Legends - Champion Edition', 24.99, 'Vous voulez décrocher le titre de Champion ? L’Édition Champion est le meilleur moyen de laisser instantanément votre marque dans l’arène des Jeux Apex.L’Édition Champion inclut :    9 Légendes débloquées (tous les personnages jusqu’à la saison 7)    3 skins légendaires exclusifs de personnage : Wraith, Revenant et Crypto    3 skins légendaires exclusifs d’arme : Fusil triple, Flatline et Sentinel    • Charme d’arme légendaire exclusif    1 000 pièces ApexCe jeu inclut des achats intégrés facultatifs de devise virtuelle pouvant servir à acquérir des éléments de jeu virtuels, dont une sélection aléatoire d’éléments de jeu virtuels.', 4, 38, 35, 'maxresdefault-1.webp', 'https://www.youtube.com/embed/TQXlZyrQmsc?si=-SVxdRpEif6Fb9Bl');
INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image, video) VALUES (9, 'Dying Light 2 Stay Human', 59.99, 'It’s been 20 years since the events of the original game. The virus won, and humanity is slowly dying. You play as Aiden Caldwell, a wandering Pilgrim who delivers goods, brings news, and connects the few remaining survivor settlements in barren lands devastated by the zombie virus. However, your true goal is to find your little sister Mia, who you left behind as a kid to escape Dr. Waltz''s torturous experiments. Haunted by the past, you eventually make the decision to confront it when you learn that Mia may still be alive in Villedor — the last city standing on Earth.You quickly find yourself in a settlement torn by conflict. You’ll need to engage in creative and gory combat, so hone your skills to defeat hordes of zombies and make allies. Roam the city, free run across Villedor’s buildings and rooftops in search of loot in remote areas, and be wary of the night. With every sunset, monsters take control of the streets.', 5, 27, 28, 'dyinglight2-cover_a84k.jpg', 'https://www.youtube.com/embed/7I4LM9nwuPs?si=_XhGQoN4HtE4inqn');
INSERT INTO public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image, video) VALUES (3, 'Fallout 76', 44.99, 'Bethesda Game Studios, créateurs maintes fois récompensés de Skyrim et Fallout 4, vous souhaitent la bienvenue dans Fallout 76. Vingt-cinq ans se sont écoulés depuis le bombardement, lorsque vous et les autres résidents de l''abri, triés sur le volet parmi l''élite de la nation, vous aventurez dans une Amérique post-nucléaire, lors de Reclamation Day, en 2102. Jouez seul ou avec d''autres personnes afin d''explorer, d''accomplir des quêtes, de construire et de venir à bout des plus grandes menaces des Terres désolées. Explorez des Terres désolées dévastées par une guerre nucléaire dans cet ajout multijoueur à l''histoire de Fallout. Découvrez le monde le plus étendu et le plus vivant jamais créé dans l''univers de Fallout.Quêtes Immersives Et Personnages AttachantsDécouvrez les secrets de la Virginie-Occidentale en prenant part à une quête principale immersive qui commence dès votre sortie de l''abri 76. Faites-vous des amis ou trahissez vos nouveaux voisins venus pour reconstruire, et voyez les Appalaches du point de vue de ses résidents.Tableau De S.c.o.r.e. SaisonnierProgressez dans une saison avec une série de récompenses gratuites comme des consommables, objets de C.A.M.P. et plus encore en terminant des défis à durée limitée.Jeu De Rôle MultijoueurCréez votre personnage grâce au système S.P.E.C.I.A.L. et forgez votre propre destinée dans une nouvelle région sauvage et dévastée, avec des centaines de lieux à découvrir. Que vous voyagiez seul ou avec des amis, une nouvelle aventure Fallout unique vous attend.Là-haut, Sur La Montagne !L''histoire prend vie dans le monde de Fallout 76, avec six régions différentes de Virginie-Occidentale. Parcourez les forêts des Appalaches ou les terres pourpres et toxiques de la Tourbière, chaque région vous offrira ses propres récompenses et comportera ses propres dangers.Un Nouveau Rêve Américain !Utilisez le tout nouveau Centre d''Assemblage et de Montage Portatif (C.A.M.P.) pour construire et fabriquer où bon vous semble. Votre C.A.M.P. vous offrira un abri, du matériel et une sécurité indispensables. Vous pourrez même établir une boutique pour échanger des produits avec d''autres survivants.Fallout worldsJouez à des aventures uniques dans les Appalaches avec Fallout Worlds, une sélection de réglages évolutifs qui offrent aux joueurs la possibilité de découvrir Fallout 76 de manière unique avec des réglages personnalisables. ', 5, 3, 4, 'apps.37480.14021888442308164.4c8974f4-a1df-43bd-bf56-247900ff3ab1.jpg', 'https://www.youtube.com/embed/5IcqE8kT3KA?si=9Uda3TtIL3TV8YXD');


--
-- TOC entry 4919 (class 0 OID 25729)
-- Dependencies: 227
-- Data for Name: os; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.os (id_os, nom) VALUES (2, 'Windows 10');
INSERT INTO public.os (id_os, nom) VALUES (1, 'Windows 11');
INSERT INTO public.os (id_os, nom) VALUES (3, 'Windows 7');
INSERT INTO public.os (id_os, nom) VALUES (4, 'Windows 8');


--
-- TOC entry 4921 (class 0 OID 25735)
-- Dependencies: 229
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
INSERT INTO public.processeur (id_processeur, nom) VALUES (21, 'Intel Core i9-8700K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (22, 'AMD Ryzen 7 2700X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (23, 'Intel Core i7-7700K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (24, 'AMD Ryzen 5 2600X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (25, 'Intel Core i5-7600K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (26, 'AMD Ryzen 3 3300X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (27, 'Intel Core i3-9100');
INSERT INTO public.processeur (id_processeur, nom) VALUES (28, 'AMD Ryzen 5 1600X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (29, 'Intel Core i7-6700K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (30, 'AMD Ryzen 5 2600');
INSERT INTO public.processeur (id_processeur, nom) VALUES (31, 'Intel Core i5-6600K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (32, 'AMD Ryzen 3 3100X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (33, 'Intel Core i3-8100');
INSERT INTO public.processeur (id_processeur, nom) VALUES (34, 'AMD Ryzen 5 1500X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (35, 'Intel Core i7-4790K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (36, 'AMD Ryzen 5 2400G');
INSERT INTO public.processeur (id_processeur, nom) VALUES (37, 'Intel Core i5-4690K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (38, 'AMD Ryzen 3 2200G');
INSERT INTO public.processeur (id_processeur, nom) VALUES (39, 'Intel Core i3-7100');
INSERT INTO public.processeur (id_processeur, nom) VALUES (40, 'AMD Ryzen 5 1400');
INSERT INTO public.processeur (id_processeur, nom) VALUES (41, 'Intel Core i7-3770K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (42, 'AMD Ryzen 3 1200');
INSERT INTO public.processeur (id_processeur, nom) VALUES (43, 'Intel Core i5-3570K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (44, 'AMD Ryzen 3 1300X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (45, 'Intel Core i3-6100');
INSERT INTO public.processeur (id_processeur, nom) VALUES (46, 'AMD Ryzen 5 1600');
INSERT INTO public.processeur (id_processeur, nom) VALUES (47, 'Intel Core i7-2600K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (48, 'AMD Ryzen 3 2200');
INSERT INTO public.processeur (id_processeur, nom) VALUES (49, 'Intel Core i5-2500K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (50, 'AMD Ryzen 3 1200G');
INSERT INTO public.processeur (id_processeur, nom) VALUES (51, 'Intel Core i3-2100');
INSERT INTO public.processeur (id_processeur, nom) VALUES (52, 'AMD Ryzen 5 1400G');
INSERT INTO public.processeur (id_processeur, nom) VALUES (53, 'Intel Core i7-950');
INSERT INTO public.processeur (id_processeur, nom) VALUES (54, 'AMD Ryzen 3 1300');
INSERT INTO public.processeur (id_processeur, nom) VALUES (55, 'Intel Core i5-2400');
INSERT INTO public.processeur (id_processeur, nom) VALUES (56, 'AMD Ryzen 3 1100X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (57, 'Intel Core i3-550');
INSERT INTO public.processeur (id_processeur, nom) VALUES (58, 'AMD Ryzen 5 1200');
INSERT INTO public.processeur (id_processeur, nom) VALUES (59, 'Intel Core i7-920');
INSERT INTO public.processeur (id_processeur, nom) VALUES (60, 'AMD Ryzen 3 1100');
INSERT INTO public.processeur (id_processeur, nom) VALUES (61, 'Intel Core i9-12900K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (62, 'AMD Ryzen 9 6900X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (63, 'Intel Core i7-12700K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (64, 'AMD Ryzen 7 6700X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (65, 'Intel Core i5-12600K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (66, 'AMD Ryzen 5 6600X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (67, 'Intel Core i9-11980XE');
INSERT INTO public.processeur (id_processeur, nom) VALUES (68, 'AMD Ryzen 9 6950X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (69, 'Intel Core i7-12700KF');
INSERT INTO public.processeur (id_processeur, nom) VALUES (70, 'AMD Ryzen 7 6700');
INSERT INTO public.processeur (id_processeur, nom) VALUES (71, 'Intel Core i5-12600KF');
INSERT INTO public.processeur (id_processeur, nom) VALUES (72, 'AMD Ryzen 5 6600');
INSERT INTO public.processeur (id_processeur, nom) VALUES (73, 'Intel Core i9-11970K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (74, 'AMD Ryzen 9 6850X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (75, 'Intel Core i7-12700F');
INSERT INTO public.processeur (id_processeur, nom) VALUES (76, 'AMD Ryzen 7 6700XT');
INSERT INTO public.processeur (id_processeur, nom) VALUES (77, 'Intel Core i5-12600F');
INSERT INTO public.processeur (id_processeur, nom) VALUES (78, 'AMD Ryzen 5 6600XT');
INSERT INTO public.processeur (id_processeur, nom) VALUES (79, 'Intel Core i9-11960K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (80, 'AMD Ryzen 9 6800X');
INSERT INTO public.processeur (id_processeur, nom) VALUES (81, 'Intel Core i7-12700T');
INSERT INTO public.processeur (id_processeur, nom) VALUES (82, 'AMD Ryzen 7 6700T');
INSERT INTO public.processeur (id_processeur, nom) VALUES (83, 'Intel Core i5-12600T');
INSERT INTO public.processeur (id_processeur, nom) VALUES (84, 'AMD Ryzen 5 6600T');
INSERT INTO public.processeur (id_processeur, nom) VALUES (85, 'Intel Core i9-12980XE');
INSERT INTO public.processeur (id_processeur, nom) VALUES (86, 'AMD Ryzen 9 6900');
INSERT INTO public.processeur (id_processeur, nom) VALUES (87, 'Intel Core i7-12700');
INSERT INTO public.processeur (id_processeur, nom) VALUES (88, 'AMD Ryzen 7 6700K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (89, 'Intel Core i5-12600');
INSERT INTO public.processeur (id_processeur, nom) VALUES (90, 'AMD Ryzen 5 6600K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (91, 'Intel Core i9-12970K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (92, 'AMD Ryzen 9 6950');
INSERT INTO public.processeur (id_processeur, nom) VALUES (93, 'Intel Core i7-12700S');
INSERT INTO public.processeur (id_processeur, nom) VALUES (94, 'AMD Ryzen 7 6700S');
INSERT INTO public.processeur (id_processeur, nom) VALUES (95, 'Intel Core i5-12600S');
INSERT INTO public.processeur (id_processeur, nom) VALUES (96, 'AMD Ryzen 5 6600S');
INSERT INTO public.processeur (id_processeur, nom) VALUES (97, 'Intel Core i9-12960K');
INSERT INTO public.processeur (id_processeur, nom) VALUES (98, 'AMD Ryzen 9 6850');
INSERT INTO public.processeur (id_processeur, nom) VALUES (99, 'Intel Core i7-12700H');
INSERT INTO public.processeur (id_processeur, nom) VALUES (100, 'AMD Ryzen 7 6700H');


--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 216
-- Name: admin_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);


--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 218
-- Name: carte_graphique_id_cartegraphique_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 40, true);


--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 220
-- Name: classification_id_class_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);


--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 222
-- Name: client_id_client_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.client_id_client_seq', 1, true);


--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 224
-- Name: config_id_config_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.config_id_config_seq', 46, true);


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 226
-- Name: jeux_id_jeux_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 18, true);


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 228
-- Name: os_id_os_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.os_id_os_seq', 4, true);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 230
-- Name: processeur_id_processeur_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 100, true);


--
-- TOC entry 4742 (class 2606 OID 25755)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 4744 (class 2606 OID 25757)
-- Name: carte_graphique carte_graphique_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carte_graphique
    ADD CONSTRAINT carte_graphique_pkey PRIMARY KEY (id_cartegraphique);


--
-- TOC entry 4746 (class 2606 OID 25759)
-- Name: classification classification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (id_class);


--
-- TOC entry 4748 (class 2606 OID 25761)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);


--
-- TOC entry 4750 (class 2606 OID 25763)
-- Name: config config_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id_config);


--
-- TOC entry 4752 (class 2606 OID 25765)
-- Name: jeux jeux_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_pkey PRIMARY KEY (id_jeux);


--
-- TOC entry 4754 (class 2606 OID 25767)
-- Name: os os_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id_os);


--
-- TOC entry 4756 (class 2606 OID 25769)
-- Name: processeur processeur_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.processeur
    ADD CONSTRAINT processeur_pkey PRIMARY KEY (id_processeur);


--
-- TOC entry 4757 (class 2606 OID 25770)
-- Name: config config_id_cartegraphique_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_cartegraphique_fkey FOREIGN KEY (id_cartegraphique) REFERENCES public.carte_graphique(id_cartegraphique);


--
-- TOC entry 4758 (class 2606 OID 25775)
-- Name: config config_id_os_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);


--
-- TOC entry 4759 (class 2606 OID 25780)
-- Name: config config_id_processeur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);


--
-- TOC entry 4760 (class 2606 OID 25785)
-- Name: jeux jeux_id_class_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);


--
-- TOC entry 4761 (class 2606 OID 25790)
-- Name: jeux jeux_id_config_1_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);


--
-- TOC entry 4762 (class 2606 OID 25795)
-- Name: jeux jeux_id_config_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);


-- Completed on 2024-06-12 15:48:34

--
-- PostgreSQL database dump complete
--

