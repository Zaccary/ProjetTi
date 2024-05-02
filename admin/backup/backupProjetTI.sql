PGDMP                      |           ProjetTi    16.1    16.1 H    <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    25691    ProjetTi    DATABASE     ~   CREATE DATABASE "ProjetTi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';
    DROP DATABASE "ProjetTi";
                LeZ    false            �            1255    25692 0   ajout_config(integer, numeric, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_config(p_ram integer, p_sto numeric, p_proco text, p_cg text, p_os text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
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
$$;
 e   DROP FUNCTION public.ajout_config(p_ram integer, p_sto numeric, p_proco text, p_cg text, p_os text);
       public          LeZ    false            �            1255    25693 y   ajout_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
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
$$;
 *  DROP FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text);
       public          LeZ    false            �            1255    25801    lonelyconfig() 	   PROCEDURE     �  CREATE PROCEDURE public.lonelyconfig()
    LANGUAGE plpgsql
    AS $$
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
$$;
 &   DROP PROCEDURE public.lonelyconfig();
       public          LeZ    false            �            1255    25800 �   update_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text, integer)    FUNCTION     �  CREATE FUNCTION public.update_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text, id_jeu integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
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
$$;
 ;  DROP FUNCTION public.update_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text, id_jeu integer);
       public          LeZ    false            �            1255    25803    verifier_connexion(text, text)    FUNCTION     �  CREATE FUNCTION public.verifier_connexion(p_nom text, p_mdp text) RETURNS text
    LANGUAGE plpgsql
    AS $_$
  declare
    id integer;
    retour text;
BEGIN
      retour = 0;
if p_nom like '$%' and p_mdp like '$%' then
p_nom = substring(p_nom from 2);
p_mdp = substring(p_mdp from 2);
  select into id id_admin from admin where nom = p_nom and mdp = p_mdp;
  IF NOT FOUND
  THEN
    retour = '0';
  ELSE
    retour = concat('1',id);
  END IF;
else
    select into id id_client from client where nom = p_nom and mdp = p_mdp;
    IF NOT FOUND
    THEN
      retour = '0';
    ELSE
      retour = concat('2',id);
    END IF;
end if;
return retour;
end;

$_$;
 A   DROP FUNCTION public.verifier_connexion(p_nom text, p_mdp text);
       public          LeZ    false            �            1259    25695    admin    TABLE     Y   CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.admin;
       public         heap    LeZ    false            �            1259    25700    admin_id_admin_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_id_admin_seq;
       public          LeZ    false    215            @           0    0    admin_id_admin_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;
          public          LeZ    false    216            �            1259    25701    carte_graphique    TABLE     ^   CREATE TABLE public.carte_graphique (
    id_cartegraphique integer NOT NULL,
    nom text
);
 #   DROP TABLE public.carte_graphique;
       public         heap    LeZ    false            �            1259    25706 %   carte_graphique_id_cartegraphique_seq    SEQUENCE     �   CREATE SEQUENCE public.carte_graphique_id_cartegraphique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.carte_graphique_id_cartegraphique_seq;
       public          LeZ    false    217            A           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;
          public          LeZ    false    218            �            1259    25707    classification    TABLE     d   CREATE TABLE public.classification (
    id_class integer NOT NULL,
    pegi text,
    icon text
);
 "   DROP TABLE public.classification;
       public         heap    LeZ    false            �            1259    25712    classification_id_class_seq    SEQUENCE     �   CREATE SEQUENCE public.classification_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.classification_id_class_seq;
       public          LeZ    false    219            B           0    0    classification_id_class_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;
          public          LeZ    false    220            �            1259    25713    client    TABLE     h   CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text,
    mdp text,
    pp text
);
    DROP TABLE public.client;
       public         heap    LeZ    false            �            1259    25718    client_id_client_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_id_client_seq;
       public          LeZ    false    221            C           0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
          public          LeZ    false    222            �            1259    25719    config    TABLE     �   CREATE TABLE public.config (
    id_config integer NOT NULL,
    ram integer,
    stockage integer,
    id_processeur integer NOT NULL,
    id_cartegraphique integer NOT NULL,
    id_os integer NOT NULL
);
    DROP TABLE public.config;
       public         heap    LeZ    false            �            1259    25722    config_id_config_seq    SEQUENCE     �   CREATE SEQUENCE public.config_id_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.config_id_config_seq;
       public          LeZ    false    223            D           0    0    config_id_config_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;
          public          LeZ    false    224            �            1259    25723    jeux    TABLE     �   CREATE TABLE public.jeux (
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
    DROP TABLE public.jeux;
       public         heap    LeZ    false            �            1259    25728    jeux_id_jeux_seq    SEQUENCE     �   CREATE SEQUENCE public.jeux_id_jeux_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.jeux_id_jeux_seq;
       public          LeZ    false    225            E           0    0    jeux_id_jeux_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;
          public          LeZ    false    226            �            1259    25729    os    TABLE     E   CREATE TABLE public.os (
    id_os integer NOT NULL,
    nom text
);
    DROP TABLE public.os;
       public         heap    LeZ    false            �            1259    25734    os_id_os_seq    SEQUENCE     �   CREATE SEQUENCE public.os_id_os_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.os_id_os_seq;
       public          LeZ    false    227            F           0    0    os_id_os_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;
          public          LeZ    false    228            �            1259    25735 
   processeur    TABLE     U   CREATE TABLE public.processeur (
    id_processeur integer NOT NULL,
    nom text
);
    DROP TABLE public.processeur;
       public         heap    LeZ    false            �            1259    25740    processeur_id_processeur_seq    SEQUENCE     �   CREATE SEQUENCE public.processeur_id_processeur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.processeur_id_processeur_seq;
       public          LeZ    false    229            G           0    0    processeur_id_processeur_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;
          public          LeZ    false    230            �            1259    25741    vue_jeux_config    VIEW     �  CREATE VIEW public.vue_jeux_config AS
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
 "   DROP VIEW public.vue_jeux_config;
       public          LeZ    false    223    223    223    219    219    217    219    217    229    229    227    227    225    225    225    225    225    225    225    225    225    223    223    223            |           2604    25746    admin id_admin    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN id_admin DROP DEFAULT;
       public          LeZ    false    216    215            }           2604    25747 !   carte_graphique id_cartegraphique    DEFAULT     �   ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);
 P   ALTER TABLE public.carte_graphique ALTER COLUMN id_cartegraphique DROP DEFAULT;
       public          LeZ    false    218    217            ~           2604    25748    classification id_class    DEFAULT     �   ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);
 F   ALTER TABLE public.classification ALTER COLUMN id_class DROP DEFAULT;
       public          LeZ    false    220    219                       2604    25749    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          LeZ    false    222    221            �           2604    25750    config id_config    DEFAULT     t   ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);
 ?   ALTER TABLE public.config ALTER COLUMN id_config DROP DEFAULT;
       public          LeZ    false    224    223            �           2604    25751    jeux id_jeux    DEFAULT     l   ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);
 ;   ALTER TABLE public.jeux ALTER COLUMN id_jeux DROP DEFAULT;
       public          LeZ    false    226    225            �           2604    25752    os id_os    DEFAULT     d   ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);
 7   ALTER TABLE public.os ALTER COLUMN id_os DROP DEFAULT;
       public          LeZ    false    228    227            �           2604    25753    processeur id_processeur    DEFAULT     �   ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);
 G   ALTER TABLE public.processeur ALTER COLUMN id_processeur DROP DEFAULT;
       public          LeZ    false    230    229            *          0    25695    admin 
   TABLE DATA           3   COPY public.admin (id_admin, nom, mdp) FROM stdin;
    public          LeZ    false    215   �f       ,          0    25701    carte_graphique 
   TABLE DATA           A   COPY public.carte_graphique (id_cartegraphique, nom) FROM stdin;
    public          LeZ    false    217   �f       .          0    25707    classification 
   TABLE DATA           >   COPY public.classification (id_class, pegi, icon) FROM stdin;
    public          LeZ    false    219   h       0          0    25713    client 
   TABLE DATA           9   COPY public.client (id_client, nom, mdp, pp) FROM stdin;
    public          LeZ    false    221   jh       2          0    25719    config 
   TABLE DATA           c   COPY public.config (id_config, ram, stockage, id_processeur, id_cartegraphique, id_os) FROM stdin;
    public          LeZ    false    223   �h       4          0    25723    jeux 
   TABLE DATA           o   COPY public.jeux (id_jeux, nom, prix, description, id_class, id_config, id_config_1, image, video) FROM stdin;
    public          LeZ    false    225   i       6          0    25729    os 
   TABLE DATA           (   COPY public.os (id_os, nom) FROM stdin;
    public          LeZ    false    227   �x       8          0    25735 
   processeur 
   TABLE DATA           8   COPY public.processeur (id_processeur, nom) FROM stdin;
    public          LeZ    false    229   �x       H           0    0    admin_id_admin_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);
          public          LeZ    false    216            I           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 40, true);
          public          LeZ    false    218            J           0    0    classification_id_class_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);
          public          LeZ    false    220            K           0    0    client_id_client_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_id_client_seq', 1, true);
          public          LeZ    false    222            L           0    0    config_id_config_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.config_id_config_seq', 38, true);
          public          LeZ    false    224            M           0    0    jeux_id_jeux_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 12, true);
          public          LeZ    false    226            N           0    0    os_id_os_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.os_id_os_seq', 4, true);
          public          LeZ    false    228            O           0    0    processeur_id_processeur_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 100, true);
          public          LeZ    false    230            �           2606    25755    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            LeZ    false    215            �           2606    25757 $   carte_graphique carte_graphique_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.carte_graphique
    ADD CONSTRAINT carte_graphique_pkey PRIMARY KEY (id_cartegraphique);
 N   ALTER TABLE ONLY public.carte_graphique DROP CONSTRAINT carte_graphique_pkey;
       public            LeZ    false    217            �           2606    25759 "   classification classification_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (id_class);
 L   ALTER TABLE ONLY public.classification DROP CONSTRAINT classification_pkey;
       public            LeZ    false    219            �           2606    25761    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            LeZ    false    221            �           2606    25763    config config_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id_config);
 <   ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
       public            LeZ    false    223            �           2606    25765    jeux jeux_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_pkey PRIMARY KEY (id_jeux);
 8   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_pkey;
       public            LeZ    false    225            �           2606    25767 
   os os_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id_os);
 4   ALTER TABLE ONLY public.os DROP CONSTRAINT os_pkey;
       public            LeZ    false    227            �           2606    25769    processeur processeur_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.processeur
    ADD CONSTRAINT processeur_pkey PRIMARY KEY (id_processeur);
 D   ALTER TABLE ONLY public.processeur DROP CONSTRAINT processeur_pkey;
       public            LeZ    false    229            �           2606    25770 $   config config_id_cartegraphique_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_cartegraphique_fkey FOREIGN KEY (id_cartegraphique) REFERENCES public.carte_graphique(id_cartegraphique);
 N   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_cartegraphique_fkey;
       public          LeZ    false    223    4743    217            �           2606    25775    config config_id_os_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);
 B   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_os_fkey;
       public          LeZ    false    4753    227    223            �           2606    25780     config config_id_processeur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);
 J   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_processeur_fkey;
       public          LeZ    false    223    229    4755            �           2606    25785    jeux jeux_id_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);
 A   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_class_fkey;
       public          LeZ    false    219    4745    225            �           2606    25790    jeux jeux_id_config_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);
 D   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_1_fkey;
       public          LeZ    false    4749    225    223            �           2606    25795    jeux jeux_id_config_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);
 B   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_fkey;
       public          LeZ    false    225    223    4749            *      x�3�LL��̃�\1z\\\ 8Z      ,     x�u�;n�0@��<AA��d��\��j�R4�ԁ�޿T�*�+��3m�o������<N_v}D����&`��J'���w8�'�>o���]D�a����z�%����T�C�_����%=�o	6*��΀[A��"%����K��^Op[B��/����%��p�R��&7?�9'��Y� ��Yk�z51BXHaDl�#��m��	L�S`�..�JQecF��/���U1Tv吓6Q��O�F��Ňo#K�����4�{L�|<��4      .   N   x�3�pu�T0��00(����-����
�ҹ���F(�FpyC��1��1\���E�\�"o�,m������ [)*q      0   '   x�3�JLc##S�xc#CS���t�=... ���      2   f   x�M��� �r17H�zI�u����Վ	`)`	��g>��������
���6E��l�����v�Wb���K5����n�f>�WɆj��OD|�       4   �  x��Y�rG�]�_��vG 0	�"鈉��$ʔLI�d;�HTeIVU��Y�����M�:z%y=�Y�O�%s��*��=1�B��q���n�)���Ԩ�w8<<|�HE}e�Z�:3��J����6�e_Ml��f*�m=���fsU���ֹ�A��4���T����3|�M�2���_�+��fa�:�>·��+�λe�w%���;����.L��ii�)m4*8���ܩ���QiH�g*:��.�,��L�<n�@W��R7�[�ejS�΢uu���>��L����T��M0u�ZrV̭��)�Z��w㌾j��B-w�&3!8�Zm���Q��k\�*aq(��nYw��KeT�� 8�ʜ�m�W����RS��ԪY��k<�+�V�Äu�����1>���b�Uk1h��q3�����*����I+3W-J��nz����93�=W;|��?�:�eYi%.��
��0��²�ɉ5(
���0��� �ܬUa4�ipCI���@�Jt��CSU�=c1�+��zj(��x4��*��Uo�7����5���,4�>����r1��c\�o��f�\W�25CX�SMM��N�q�E�|U^�=���񧋽�:���d�}ub�ƽ�8�����d��|Ls�\�g��zau2���70h�-PH<0��_� S���J��Zy[)Uw���n����F���VSX��ԍQ������w0|d��V|u�ě�2]�hp7�rꪩ�s��W���'�u���������lE�r[O��+@�����6�H-��,V��H�s�V@��*�!7��)���FU�/���qP7� J���1Y�+9G=�+pK�F�;��z��LS*���L�ۭ�)�k*R���m0N4��5����xV���W����2�Q��
�� "c��_�Xe���*3,���^P����qЂ�t�.������F�(�a>�Ȭ�2ug�d���K�P5e��LQ�r{�w��tp�'���!����_��&y:=��7P����v�%]\n7u"�{��_'��Ӫ�;��:��<Y��Q�qj�P?���̼i�[?��5��L���5j2pM�`�HMi��+����N ��$5��0_�VX@x��|%V�2��@pI��
zE`"�3@�T��nn��k0��+��7w`�Ӗ7n��w��hP�.n�q/XjD�� �`��Iݨ'`�a6tC?���'`K$���w3`'�� ���;#I.��#H�uM�e)8��Z�����q<<�������G�X�3��) ���S�����0�1�yaD�7���w^ށ�C}̥�Z�,6P����e�@X!>�?!���xx
��D�����f�x�75��XE<��B#�HA77���	�~��gk��h�M�Z�Z$��3��zf�@9-z����n������������AY}Y^�i���Qa���˻�f,��V�MH��$P�j�m�=��E`�<X�g���N{V-|ajDY��{P��|�1XYѰ��R�.�/�jjן` j�yC�wj�%�'�C��H~Aܚ�-��3 ���V�Rtj��t�$�/i�"ʄ��/�<m(�c�L�l!��i�aô�7��"��]<�-E���P�K��Wn�?H�rr(L�N�����7[ɣ`d6	ܒg�q��r�S�S���D*�lɇ��ֿ"P��xiS�`�j�)���/̕Җwy���a�D
O�O�vPZ:_��`�.{�ɡ������9��~�Vi�Pm)jVJ�@L�bA�&b�C�M�)T�J�Ǽd���=��{"��M����1���U�7���"�������dg�{pp0���;��&�Ivp�?)&����x���ޣ�h���Sc=����r�4�>9��w�����\�/�������O?>���=w�~���:Q�U�As���/�K�Q�Vl@�ߩ�̽�_����S��DKm�l{jd@�s��
0�I-�ĹGIS\�r�q���V<F/�Z1A���/]j3���V	y2�i�B5��
�:?fJ��#4wK��F�R�r�����_��۹�F�W�/>�&:-l��-�.��i�ږ�d�a����5A��Щ�1B�YT\��f�D�@�;+����/��y���m�s����)��L� sן��J��&[-�,�4i��цs#���W8�e}&~��U��_9�[l u�_�4dL1ha!LŴ��h��]�g+*t��(�e�YN�iJ'�KK[zQ�o��X����9i9�-�����4n�����o+޴N�
���s��tX�;9�[Dy2Ӱ�k�+��.K����� �3 ��F�~���q!�X��m}Z�o���q&f��t���_�F��� ��~ot�1{�� ���׏>��G'$����������ǣW�O�{Ou&n���+���l�B��_�I3�7�Q+:u��	2��"�� J ������ [�S��������n���-c@����:�e�DŃ�0j1�-glg9��M���s���+�vZ`el�2(����^��ғ�2�*�]�4�H)�q�:�Y����V�!bk��E��	�y�����Vf�'o�]p�FjT/�N��>E�P�я��2�1��QOP&��e���#=�]:�[�+2C���$$\D��F8��fj��lb7�{j!p�&ā�I�[ظ=ز���4�!��t���$��R�ѱdBa�.���,pv96&	�,�����T����YT ��6iDe��;3�2塣g��R
1}�����p8�W>Oc����b �,���������,�2�ja�}��Ɩ��NXŹ�)H
�d6�E�s�O�>�А�蔴�7!_3�p2�s��t�X!n��Lhޕ�6Ԏd7�JHBbJ�{4N��&W_���������9䋏?Ο�v�&���������N��m����]��v�*���T(�YF����λ�%M�Ҥ� ������l��G-}
�H
��-M�ڃ4����
����3�JH���p4lɹe�LI�nk���-�$7�ݒ�@'<o��)F���ĝ_�<�z�YN(s�:^C��5�@���U7>�G�q�P��i��D]6R�6AvM��V�dR�) ��岩�LU�a�����ƣ��x<6z�'ţi>�{{�=T���Ᵹ�W�i��6��������4���ϟ�z{��{�ݳ����W�=�t�3�v���v2�4 ��Mz�JZ{���:f�n?�RwS���(����Df!ۑ�.M�O1��! lS�ߍ�d6-�u#8��g����u�^��G��R��w�g�v*u�ș&�q��m,D�{���I��Q�(�U��4�㪔���nF�8�࠳k�7��KSu?(��S��4EH���o����?��=LS�xv��^�L�6#��8�@�9�9z����2Q��2�o�Ѫ-{x��`+$7w�!�w�=+���x��f6��hP���2��AhH�a��1� /���,��5��'��
L^����������������������Q�hanՙ��A��\WZ��yz#��4�iJB��l�\mL3��ο�3����ڦi��'6�	�����iV�Q�OJg���֚���ݘ���گ?�i���c**0������[���u���$ d���H��{1�c��5�y��vȸ�7�4f��0�6`nqUh��P�[��k$��z�
�� s�����9L�x�S<)�b�'����f�!#��l#k�����/���ܲ�{����\��vvv���ϙL/��qb��n2�@H�� �q\ˆ�)e2$���DԳƌ�L��2D�Go-錦����	-t{�Ӄ����$�? ��}:�������{�J�(�4$��f��"������+��
#e���m�fqb�GO���˭í����9Kx      6   (   x�3���K�//V04�2Dp���s.8ۂ+F��� ��      8   3  x�m��n�1�����2�`{��'��.m�]��J��K����wEG�8�ݗ�?��Ǉ_�/��Gܭ=ݽ����������k�z�N�N��+�<x����U*&�+),&��9�J �ҝ�`}ڳ��9R`�΀=Alg� �O9Q�B"��g��'Ê��]���'��(l�I���(P��������|�77�����Gﮍ��������|6�N��� =/N��S$@wdO�zl}�=�m�m�FK�h�z^�׮�@�ڝ�!���a"�=���I{�������	@@�`�@>�Qۂ� �I��`L d Le*�NT/׮��m1�х���B�7�	�'���@Zy$��ǁ�P�)�Hnm��(~�Rr�\��m�ߌ�d�3d%)���a����s��
���an�1e��g����q<�̇��^u�.	����U�b�[���-�{s��¡E���,)���o�1`�B�}�s
ح@<���Q[���c�7-�v��oZT�բZ,%��^��o�Q�j�G�� ��0�     