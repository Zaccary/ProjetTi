PGDMP  %    1                |           ProjetTi    16.1    16.1 I    =           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            >           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            @           1262    25691    ProjetTi    DATABASE     ~   CREATE DATABASE "ProjetTi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';
    DROP DATABASE "ProjetTi";
                LeZ    false            �            1255    25692 0   ajout_config(integer, numeric, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_config(p_ram integer, p_sto numeric, p_proco text, p_cg text, p_os text) RETURNS integer
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
 e   DROP FUNCTION public.ajout_config(p_ram integer, p_sto numeric, p_proco text, p_cg text, p_os text);
       public          LeZ    false            �            1255    25693 y   ajout_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text) RETURNS integer
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
 *  DROP FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text);
       public          LeZ    false            �            1255    25801    lonelyconfig() 	   PROCEDURE     �  CREATE PROCEDURE public.lonelyconfig()
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
 &   DROP PROCEDURE public.lonelyconfig();
       public          LeZ    false            �            1255    25804    supp_jeux(integer) 	   PROCEDURE     �   CREATE PROCEDURE public.supp_jeux(IN p_id_jeux integer)
    LANGUAGE plpgsql
    AS '
BEGIN
    DELETE FROM jeux WHERE id_jeux = p_id_jeux;

    call lonelyconfig();
END;
';
 7   DROP PROCEDURE public.supp_jeux(IN p_id_jeux integer);
       public          LeZ    false            �            1255    25800 �   update_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text, integer)    FUNCTION     �  CREATE FUNCTION public.update_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text, id_jeu integer) RETURNS integer
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
 ;  DROP FUNCTION public.update_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text, id_jeu integer);
       public          LeZ    false            �            1255    25803    verifier_connexion(text, text)    FUNCTION     �  CREATE FUNCTION public.verifier_connexion(p_nom text, p_mdp text) RETURNS text
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
       public          LeZ    false    215            A           0    0    admin_id_admin_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;
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
       public          LeZ    false    217            B           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;
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
       public          LeZ    false    219            C           0    0    classification_id_class_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;
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
       public          LeZ    false    221            D           0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
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
       public          LeZ    false    223            E           0    0    config_id_config_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;
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
       public          LeZ    false    225            F           0    0    jeux_id_jeux_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;
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
       public          LeZ    false    227            G           0    0    os_id_os_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;
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
       public          LeZ    false    229            H           0    0    processeur_id_processeur_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;
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
       public          LeZ    false    225    229    229    227    227    225    225    225    225    225    225    225    225    223    223    223    223    223    223    219    219    219    217    217            }           2604    25746    admin id_admin    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN id_admin DROP DEFAULT;
       public          LeZ    false    216    215            ~           2604    25747 !   carte_graphique id_cartegraphique    DEFAULT     �   ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);
 P   ALTER TABLE public.carte_graphique ALTER COLUMN id_cartegraphique DROP DEFAULT;
       public          LeZ    false    218    217                       2604    25748    classification id_class    DEFAULT     �   ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);
 F   ALTER TABLE public.classification ALTER COLUMN id_class DROP DEFAULT;
       public          LeZ    false    220    219            �           2604    25749    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          LeZ    false    222    221            �           2604    25750    config id_config    DEFAULT     t   ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);
 ?   ALTER TABLE public.config ALTER COLUMN id_config DROP DEFAULT;
       public          LeZ    false    224    223            �           2604    25751    jeux id_jeux    DEFAULT     l   ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);
 ;   ALTER TABLE public.jeux ALTER COLUMN id_jeux DROP DEFAULT;
       public          LeZ    false    226    225            �           2604    25752    os id_os    DEFAULT     d   ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);
 7   ALTER TABLE public.os ALTER COLUMN id_os DROP DEFAULT;
       public          LeZ    false    228    227            �           2604    25753    processeur id_processeur    DEFAULT     �   ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);
 G   ALTER TABLE public.processeur ALTER COLUMN id_processeur DROP DEFAULT;
       public          LeZ    false    230    229            +          0    25695    admin 
   TABLE DATA                 public          LeZ    false    215   f       -          0    25701    carte_graphique 
   TABLE DATA                 public          LeZ    false    217   ef       /          0    25707    classification 
   TABLE DATA                 public          LeZ    false    219   �g       1          0    25713    client 
   TABLE DATA                 public          LeZ    false    221   �h       3          0    25719    config 
   TABLE DATA                 public          LeZ    false    223   i       5          0    25723    jeux 
   TABLE DATA                 public          LeZ    false    225   �i       7          0    25729    os 
   TABLE DATA                 public          LeZ    false    227   z       9          0    25735 
   processeur 
   TABLE DATA                 public          LeZ    false    229   pz       I           0    0    admin_id_admin_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);
          public          LeZ    false    216            J           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 40, true);
          public          LeZ    false    218            K           0    0    classification_id_class_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);
          public          LeZ    false    220            L           0    0    client_id_client_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_id_client_seq', 1, true);
          public          LeZ    false    222            M           0    0    config_id_config_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.config_id_config_seq', 46, true);
          public          LeZ    false    224            N           0    0    jeux_id_jeux_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 18, true);
          public          LeZ    false    226            O           0    0    os_id_os_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.os_id_os_seq', 4, true);
          public          LeZ    false    228            P           0    0    processeur_id_processeur_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 100, true);
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
       public          LeZ    false    217    4744    223            �           2606    25775    config config_id_os_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);
 B   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_os_fkey;
       public          LeZ    false    223    227    4754            �           2606    25780     config config_id_processeur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);
 J   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_processeur_fkey;
       public          LeZ    false    229    4756    223            �           2606    25785    jeux jeux_id_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);
 A   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_class_fkey;
       public          LeZ    false    219    225    4746            �           2606    25790    jeux jeux_id_config_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);
 D   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_1_fkey;
       public          LeZ    false    4750    223    225            �           2606    25795    jeux jeux_id_config_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);
 B   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_fkey;
       public          LeZ    false    223    4750    225            +   H   x���v
Q���W((M��L�KL���S��L��t��surS
4�}B]�4u����p��5 ��       -   |  x���=o�0��_q ��q��EjhR����Z�F��o@�CsfzY=���{7�,�d�?Qӽ}V��}������h>�ﮤIu؝���ft�����?�,74�3���"�Ӫ|��}IY�H�X����@(��#,�|D((�P��y���8���2Ga,��C ��P�G�+�����_Q6]S�(H
�dђ'��T�XI+�BKL�`���U[2��]�+�QB�d�� B��DC�`��o�f��3��@���wf�_jf���._���F�'4�`�ㆽb��K��T�?�`!l{�vA����۳Y&+q�d����l��8���vH�N�ڐf��S@�֩�8 ��綦Ww��31�1:�      /   �   x���v
Q���W((M��L�K�I,.�L�LN,���S��L��(��g�(d&��i*�9���+h��(���{*Z��� �xC��t���tuMk.OJ-2�[d�n�U-2�Yd�f�1U�1����?fT��f�9�=���pq �f�x      1   b   x���v
Q���W((M��L�K��L�+Q��L��0u��surS
t

4�}B]�4uԣ����������a�������^VA���5 cek      3   �   x�Ŕ�
�0E���Y*ɣU�+.
RA�[�1��5����!V?`�L���!Q�Y���deu��z���)�`��풁MoܳЗ43𦴅6Ι�6[�ڧ�lZ��Gվ(�v��v���` �X��`�μ��.L��	�9%\}�k���>��.;�"�O�軒^5C��ß�CҦ��QwH)]����$&���eO�$o:������{��K����^i�ؿ      5   �  x��Y=sG���+jׁ1�0 ����$(�	�r5�53tw5��1Xr�?缍���=�D�����)]�#i�]��2�e�ɫ��7���ŏ�iǥͳK�ުom�?�v�@5��gaB�m��
�R��~�zb�k??n�JO�@��¸����ӟ��շ{���y{�j����-
S�w&č��9������:,�B��̨��7&(�*}��6W�6�B�S�]Tm�j�]��*�tT3WAU�����8�Fǐ�����UMi�Qǅ�RJ����p��N��D��q%�B�Z���ϕPxrv� ��GD�M\���35v5䀁"��>u^����r�����}>s����B��Fׁ��N�ͯ�j�'Q�4�����dǷM����!�:�R��g̢�),��HU\��fh��X�;+��lm��L����R�6̸F���^H&�b���� 퇓O��ƅ8ԍ���5w�,���F�.��*��X��L������WA$ѵjk��4z\��( Xri�u����7U�/����-�>��61�WQ�W�v�X����N��N�x�=|�f�����͵�T�<��B';��C`���0�M�`rX+����ӃQ.��#�"�ȓ��}rӛW,���/s�HhT-P�M�M���`�&��yص<.����N�h�!���4��*�T��a7N���:Pۈ����x~F^6S�ݘ�؄�}��|>� �؎M���{S�M�������������߃����ُ��������W��7���oN��35y��R/���NJEg���c�	��؀��U�֨n���[�A��p)�,e$c! �y��81Ha�{Dۍ����	���[&�(����l���D�@oSY^�H���d���~\����ykC@H�T�����}P��ry_��� P�ܕ��i#�\�_��1\HX�T��ҥ��*������ ��A�,*D~��]mQt���S�*�/�ĉ�s���kIӹ�ay�t��"�e $d��.�%Ϫ�����6w
I��!Ў�Q��L{�x�Z���],Ū�z���6����]��Nf�C��}�C�	}� B�M��H����"&+3�X�Pa��5�(�a066�F�|�j(���B�h��8q����^3��Ysr��`v7�a7>�������)�"��6�+��U�WLͥ�Q״
�g�E"cq�R�����K����z}eS5�m�r0N���xy
hQ��#������S���Y���w�&��H��h7-eȔ̴ ��}��,(�1e��DU:Oh�ZYQ��,w�6�b��3��=,)O�;� ��9�e�~ BM�N���0��hÀ��ں�P�\�
�
��6��`�5��, ��e>�Ͱp�5S/�x������Ayc���qԸ87��T'�6��b+�����3X�c�7jMW��+R��qS#e�̬�UZO�Y�V�=�s�ˤ����Y��[��`�_Xu��Xi�J7��>���}L���0�y
9��"I�R!�*P��i��V,F�؉�ו�[ �bu��O:C�b��C��6H$s��h�5��8����,?lw_��W�P����uq}}g��:6_)?0E>�4��$���xm��4�Ǘd6B��	2J7p=����9!���g��<Q 2ձ!>O���B�4-�9�Y���,nA�U6%!h_i)ҥ�Z�3�b� ���3TIb�?v� .I�����5A�t#D?��"�R�5g����xN��ZJL^�>Hz�j����P8�i0�e+m.BY�]S�u2$�R���ϰ��e[5!%�?��t9K`# z�`4��w&��Ŷ���n��'�`�@oѣ'�����ׯ�h~�g�_��=�Q���+!��6�V�R����h���(��M��ݱ̷,7��N(�w�,1�hI4@1V���Na��?��u��e*c���u+� �H�427NC���P׉v���.1�����{AQ���o������ӎj D�$M}�Kj����]�<T�l��8o�;�4R�<��#���*t��� ���k�@�A>gH�v��w�/9L�x�S<)�⢈��R��3<�m|���~��_ԟ[V{��^͵[jss1�����x��|g7�
�(�>�
�d�muO�s�x��X
�����MjtNS{�Q�5�:����'���L�2�\����������#�I#D�F�oa��L4�nes3n��h�x���y�_W!g����o�c;y�t|��:��|"��T�ܶ:�Hw���ָ�I��7fJ��TP��MG�# �F�'�2M�錔X�0����+B�J7/�,��Z�?��-鲘���	ކ(���̖ST�UX��sl��\!c�n�����cHE�?ZHme�Z`��ya֥I�G#��r%���u|��w�Vm�����RI�D��H*S��0��M�I��؍�9�J�x!]���IHHՕ���'`��P^�H��,e�Gn�"\��=�m�&"����wZ�U=�!�i�FZ�d�@�$�����b���B"pX�`��L����/��&'��m�b���J]��:��+�SN��g� *X'�QOQ` ���$�l�)� v�%��b��a%Ш�+��ɰ,��[#cR_�n'93qR1gF$6o����#�-)�w!��O��ڲ��T˹	���Z��J�|���`?�;��9��S�X���ш,���a�J[M�tM'�h��m ���Б�ՐJBK&�۩����w���b�윾<���Y`���~��{��<�����:Ik��rd�R���ɹ#��(�B+����8��s���L��O'�ʬ��������ՂI��?i�Ff�����/+��FP���As�i�0���~���	8N���)�1q
V2/��#r���tY�Y�Se*764R܀��V���w)A�� K�u!A ���r���n�ǢxX���a�x��,�2��X<十��4�zB��J������s�`�r5f* b����Z�<_���ʥw�
8��o��G!��[aQm�NE�:рopr%�FԹLӂ�0�'2\I*����ݟ��O�x��Q�-��c${�G_R�
���)'�����=�	Ӄ���>1I��= U�����I�%������q۟�:M�Tް�W�Q��1��I� ����p>���(���sA��ȧ��D�%��'m�<Ř�s�p���g��fː�,���lY��`�����0d
-��5?Cy=#y���e��FRA��j}!�f�y�� M`���d���p��X�R+b�OB+���K��	�@�g.��˹t�şy7l�z�t�]@߱K�t|�-&�ƫ!F�������$Oe����,�&��dr�R���`v[�#E��`VtǄp��Z�Y����G\�Op�Z	���W�}5�?���QviNE�����]#0�l�w�,"�"[�]S&��[�j�F�]��<A;�H�N�p�]8�*uH� >������C��P3���>ͭ�s7�O902���?�3d��:�N�z�\��8�/�k��(��iw�Q(w*{۫��dD)9X�g!��3���A	;#�R0��W(Y $�b}�}ƈ�v�!a|�Wc�@2�,�*����d�jArc���e�j��e�s�~�ի���o7}���E�/?�%ڐ�?Q�����/1��q� ��e�
әݨ3\��O}�G�w)�?�f(�[�7?.w5��o��8�Dk�7)���f�%��7o=c,������]�����o�n���X�(=|-�+�U�S�-џ���{0/g=��cgH�Q`�u� >���C��Oy'�>�wSV��R��8{m&l�Gf��,�|lϵ2�M��r���	��|��l�7�}B��Ť���M�����f�����������=���z�����{;����*&ÝѸ�'����;{����H����������W�dfv�S�G��tt�v���'$��|�?��k�      7   ]   x���v
Q���W((M��L��/V��L��/�Q����Ts�	uV�0�QP��K�//V04P״��$^�!�fC5#i6'Q�	�^�^.. ��G	      9   �  x���?oT1����H1��-��� �J�D�"R�ER�����Y_�ly�h�������bs~y��W���ӷ�ۛ�����q��wǷ߿��y��w?Nܗ���7�8�������{��o�m�1����\��_6Ͳg_��_�����2k^��F��uz6ju���̣
?�<��"��U h
�B��5 � ���\���X3� ����l�@Dku��@��@DoU�- ��`D4W�݂���Y�]�"h���=AQ�����V3� %� ���W��u
��&H�rUb�swe������{�UEsE�ϪO� �� VS.1  '$ $BtV��' ����z��lM��#a�Bxˊ�5���H�`VtV��G`Bcŉ�DcU��;@?_�X1񣢯���`�	G5�+{1  }��:���O�uي�DW�
?j	V�P�W�'���h�X�N�sfEG�b5uL�,��A(:����{���+*�Q<�2��A X
�A �V0Dk�ZP^�2�-N���7���hQv�bPȠ\8x�����������x���-U��3|��J�1����`@X��upŪ���=-��e���؅�� B1�^�~m- ��aC(����p@�b�!�h�%܅&�|�j�7ׂ+��>Џ�hP�u�2,�>̈�Q�:#�a���Vwi���EDZt��E�*!6������( .����_=     