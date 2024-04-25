PGDMP  (                    |           ProjetTi    16.1    16.1 E    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    17400    ProjetTi    DATABASE     ~   CREATE DATABASE "ProjetTi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';
    DROP DATABASE "ProjetTi";
                LeZ    false            �            1255    17401 0   ajout_config(integer, numeric, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_config(p_ram integer, p_sto numeric, p_proco text, p_cg text, p_os text) RETURNS integer
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
       public          LeZ    false            �            1255    17402 y   ajout_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text) RETURNS integer
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
return retour;
end;
';
 *  DROP FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text);
       public          LeZ    false            �            1259    17403    admin    TABLE     Y   CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.admin;
       public         heap    LeZ    false            �            1259    17408    admin_id_admin_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_id_admin_seq;
       public          LeZ    false    215            =           0    0    admin_id_admin_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;
          public          LeZ    false    216            �            1259    17409    carte_graphique    TABLE     ^   CREATE TABLE public.carte_graphique (
    id_cartegraphique integer NOT NULL,
    nom text
);
 #   DROP TABLE public.carte_graphique;
       public         heap    LeZ    false            �            1259    17414 %   carte_graphique_id_cartegraphique_seq    SEQUENCE     �   CREATE SEQUENCE public.carte_graphique_id_cartegraphique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.carte_graphique_id_cartegraphique_seq;
       public          LeZ    false    217            >           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;
          public          LeZ    false    218            �            1259    17415    classification    TABLE     d   CREATE TABLE public.classification (
    id_class integer NOT NULL,
    pegi text,
    icon text
);
 "   DROP TABLE public.classification;
       public         heap    LeZ    false            �            1259    17420    classification_id_class_seq    SEQUENCE     �   CREATE SEQUENCE public.classification_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.classification_id_class_seq;
       public          LeZ    false    219            ?           0    0    classification_id_class_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;
          public          LeZ    false    220            �            1259    17421    client    TABLE     [   CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.client;
       public         heap    LeZ    false            �            1259    17426    client_id_client_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_id_client_seq;
       public          LeZ    false    221            @           0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
          public          LeZ    false    222            �            1259    17427    config    TABLE     �   CREATE TABLE public.config (
    id_config integer NOT NULL,
    ram integer,
    stockage integer,
    id_processeur integer NOT NULL,
    id_cartegraphique integer NOT NULL,
    id_os integer NOT NULL
);
    DROP TABLE public.config;
       public         heap    LeZ    false            �            1259    17430    config_id_config_seq    SEQUENCE     �   CREATE SEQUENCE public.config_id_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.config_id_config_seq;
       public          LeZ    false    223            A           0    0    config_id_config_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;
          public          LeZ    false    224            �            1259    17431    jeux    TABLE     �   CREATE TABLE public.jeux (
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
       public         heap    LeZ    false            �            1259    17436    jeux_id_jeux_seq    SEQUENCE     �   CREATE SEQUENCE public.jeux_id_jeux_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.jeux_id_jeux_seq;
       public          LeZ    false    225            B           0    0    jeux_id_jeux_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;
          public          LeZ    false    226            �            1259    17437    os    TABLE     E   CREATE TABLE public.os (
    id_os integer NOT NULL,
    nom text
);
    DROP TABLE public.os;
       public         heap    LeZ    false            �            1259    17442    os_id_os_seq    SEQUENCE     �   CREATE SEQUENCE public.os_id_os_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.os_id_os_seq;
       public          LeZ    false    227            C           0    0    os_id_os_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;
          public          LeZ    false    228            �            1259    17443 
   processeur    TABLE     U   CREATE TABLE public.processeur (
    id_processeur integer NOT NULL,
    nom text
);
    DROP TABLE public.processeur;
       public         heap    LeZ    false            �            1259    17448    processeur_id_processeur_seq    SEQUENCE     �   CREATE SEQUENCE public.processeur_id_processeur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.processeur_id_processeur_seq;
       public          LeZ    false    229            D           0    0    processeur_id_processeur_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;
          public          LeZ    false    230            �            1259    17449    vue_jeux_config    VIEW     �  CREATE VIEW public.vue_jeux_config AS
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
       public          LeZ    false    225    217    217    219    219    219    223    223    223    223    223    223    225    225    225    225    225    225    225    225    227    227    229    229            y           2604    17454    admin id_admin    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN id_admin DROP DEFAULT;
       public          LeZ    false    216    215            z           2604    17455 !   carte_graphique id_cartegraphique    DEFAULT     �   ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);
 P   ALTER TABLE public.carte_graphique ALTER COLUMN id_cartegraphique DROP DEFAULT;
       public          LeZ    false    218    217            {           2604    17456    classification id_class    DEFAULT     �   ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);
 F   ALTER TABLE public.classification ALTER COLUMN id_class DROP DEFAULT;
       public          LeZ    false    220    219            |           2604    17457    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          LeZ    false    222    221            }           2604    17458    config id_config    DEFAULT     t   ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);
 ?   ALTER TABLE public.config ALTER COLUMN id_config DROP DEFAULT;
       public          LeZ    false    224    223            ~           2604    17459    jeux id_jeux    DEFAULT     l   ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);
 ;   ALTER TABLE public.jeux ALTER COLUMN id_jeux DROP DEFAULT;
       public          LeZ    false    226    225                       2604    17460    os id_os    DEFAULT     d   ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);
 7   ALTER TABLE public.os ALTER COLUMN id_os DROP DEFAULT;
       public          LeZ    false    228    227            �           2604    17461    processeur id_processeur    DEFAULT     �   ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);
 G   ALTER TABLE public.processeur ALTER COLUMN id_processeur DROP DEFAULT;
       public          LeZ    false    230    229            '          0    17403    admin 
   TABLE DATA                 public          LeZ    false    215   �W       )          0    17409    carte_graphique 
   TABLE DATA                 public          LeZ    false    217   �W       +          0    17415    classification 
   TABLE DATA                 public          LeZ    false    219   SY       -          0    17421    client 
   TABLE DATA                 public          LeZ    false    221   �Y       /          0    17427    config 
   TABLE DATA                 public          LeZ    false    223   Z       1          0    17431    jeux 
   TABLE DATA                 public          LeZ    false    225   �Z       3          0    17437    os 
   TABLE DATA                 public          LeZ    false    227   Ng       5          0    17443 
   processeur 
   TABLE DATA                 public          LeZ    false    229   �g       E           0    0    admin_id_admin_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, false);
          public          LeZ    false    216            F           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 40, true);
          public          LeZ    false    218            G           0    0    classification_id_class_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);
          public          LeZ    false    220            H           0    0    client_id_client_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);
          public          LeZ    false    222            I           0    0    config_id_config_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.config_id_config_seq', 30, true);
          public          LeZ    false    224            J           0    0    jeux_id_jeux_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 8, true);
          public          LeZ    false    226            K           0    0    os_id_os_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.os_id_os_seq', 4, true);
          public          LeZ    false    228            L           0    0    processeur_id_processeur_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 100, true);
          public          LeZ    false    230            �           2606    17464    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            LeZ    false    215            �           2606    17466 $   carte_graphique carte_graphique_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.carte_graphique
    ADD CONSTRAINT carte_graphique_pkey PRIMARY KEY (id_cartegraphique);
 N   ALTER TABLE ONLY public.carte_graphique DROP CONSTRAINT carte_graphique_pkey;
       public            LeZ    false    217            �           2606    17468 "   classification classification_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (id_class);
 L   ALTER TABLE ONLY public.classification DROP CONSTRAINT classification_pkey;
       public            LeZ    false    219            �           2606    17470    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            LeZ    false    221            �           2606    17472    config config_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id_config);
 <   ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
       public            LeZ    false    223            �           2606    17474    jeux jeux_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_pkey PRIMARY KEY (id_jeux);
 8   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_pkey;
       public            LeZ    false    225            �           2606    17476 
   os os_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id_os);
 4   ALTER TABLE ONLY public.os DROP CONSTRAINT os_pkey;
       public            LeZ    false    227            �           2606    17478    processeur processeur_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.processeur
    ADD CONSTRAINT processeur_pkey PRIMARY KEY (id_processeur);
 D   ALTER TABLE ONLY public.processeur DROP CONSTRAINT processeur_pkey;
       public            LeZ    false    229            �           2606    17479 $   config config_id_cartegraphique_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_cartegraphique_fkey FOREIGN KEY (id_cartegraphique) REFERENCES public.carte_graphique(id_cartegraphique);
 N   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_cartegraphique_fkey;
       public          LeZ    false    217    223    4740            �           2606    17484    config config_id_os_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);
 B   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_os_fkey;
       public          LeZ    false    223    227    4750            �           2606    17489     config config_id_processeur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);
 J   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_processeur_fkey;
       public          LeZ    false    4752    229    223            �           2606    17494    jeux jeux_id_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);
 A   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_class_fkey;
       public          LeZ    false    4742    225    219            �           2606    17499    jeux jeux_id_config_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);
 D   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_1_fkey;
       public          LeZ    false    225    223    4746            �           2606    17504    jeux jeux_id_config_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);
 B   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_fkey;
       public          LeZ    false    223    225    4746            '   
   x���          )   |  x���=o�0��_q ��q��EjhR����Z�F��o@�CsfzY=���{7�,�d�?Qӽ}V��}������h>�ﮤIu؝���ft�����?�,74�3���"�Ӫ|��}IY�H�X����@(��#,�|D((�P��y���8���2Ga,��C ��P�G�+�����_Q6]S�(H
�dђ'��T�XI+�BKL�`���U[2��]�+�QB�d�� B��DC�`��o�f��3��@���wf�_jf���._���F�'4�`�ㆽb��K��T�?�`!l{�vA����۳Y&+q�d����l��8���vH�N�ڐf��S@�֩�8 ��綦Ww��31�1:�      +   �   x���v
Q���W((M��L�K�I,.�L�LN,���S��L��(��g�(d&��i*�9���+h��(���{*Z��� �xC��t���tuMk.OJ-2�[d�n�U-2�Yd�f�1U�1����?fT��f�9�=���pq �f�x      -   
   x���          /   �   x�œM�@����9*,�j�ҩ�!Һ�m�Ik���F����,���;i�'�Ҭ�@�o��	�8����`�tyg�vJ\�J2��F+!�V�z<�Rw��es�����Z���.��v�!&��x�9K+%�{�|�`N	���C|2�|Z��Z��x���&�:L��fR�-����*{l��aԢ�v�Z{�3k1���Pwl�[�J篻      1   E  x��XMw�6��W`���sDZ�eY�99=N�v�IҴv�v����$h �����Y�]�f��cs/@�#�Es�YĒ���������.�����D�-+��W��(���~���#�Z���r�խצ	,�*�\�d�B�|�0��Z��H�u��W���wg�K<�����\��ub�?G'���g?/��m%3%t#�p�k�3Y�D���j�u&��^7+.ٔ:+E-�k��B;a�J�b��T�<�=9��Mfe��B�B\t���LZ_��m%�<�g����`�ݛ6�c��\.+%T�����۔F���	���3^e>�vek�ߊZ��զsB5��O2c�]*��H�g�p����+���NXQj�'�əF�O����HtM����o�*S��Gm#ӫW��g��@S+��É6�ͦNM�k�m��`8�ʌ�i�G����K�7J5�k��t�	݆(2V�"�M��Cf���\7҇�k+�`��F��Rxj�2P����Vqef�R��,�����3��r��w��#����Z��r��	�?�s�U]N��Q�aG�5�Pm,T�d)
%�N�*��yD���g��uu��13��5U4[.5 E����J���N8p(��HLG�*�I��g�v%��U}�^��}.�u=8�l6�ր5K�"6�^��`�8z�m�4��_;����/�.����~v��L�������>��o���s81�EuxƜ�\�o�q���3��E�;d��T (I��-Q���%������Z(/��g8��s�+%���VR,�ҵj:%r	��ے��ȾO2��>r�>^�I]�i;�eX�z)-���De�����8X@U��yi'���`d��/�V���(S�=�Y��֚Kv�Aw�^
�?<�-a9��)�5J�ֻ[�yzk�O�.��x�fq�RU�}����5b:OS��t�˩�����ab4=�LC_
�/@�����*4�q��~Cr�г-:rn�X�e�_�·�moV��e (��T�g爎�#$�Y<���?�ǵt>|FCPV���`�xe0G^ц����' �v!�%
�	+� �T��_�p�	�fNT�~wH�]�w�i����B�BwwO�]����{�Ǩ���#�8��m<��ĩ�,����=2��̬�a%�]�ҍV�wY�&Y�ւ�6!2��2:1Wdu���p>�i�+R��~�Sh ,���c�!�\����~IE���ҵqАn�$de�jD��C�X0��Gˈ�\�m��i��<s�a5���3�#r�{��ز/ i��Ԧ��$�D��{k�
�q������\
���
@�=��	��l|�@=Q����4}��M�K +`(��{�b�D
 �����NC`Q��t�
~���r���{Ϲ�S���&0p�O��-��+6����s��*XS��ٚ6�mV���b�����(NvkB.�qmԫ#A��FE(j�:գU���~�F$W��IN��������h0�Ne�'�ҽW�_��5B�g�+)^C�%��WXM� h�����@�N9�qp>� *T(=X�{DCk)-����4)� ��O}�0����G�6����z�+)���!�yS�3�2p &�=,��pV}�ޯ��t�]#�D^g���B�!��;�V�E��N�a�7����R��d�>�J�ű(6��r��W���BA�kV�ݿQz�¦��� �;6=�eC�.���Vܳ�p��~EO�kǐ�r�^v��z�h�C��S_JYn)��V�X����Ϫ$Jx�}�t@���*w{����t��n �#��͇m~ی�*��^�VU� ��`u�t3Blt��Q3�����}� ��|�~>ཅ��v����>�����:�}ٶ.=<�-��d6�N��l6=/&�Y:�'ǳb��I^$��e�,��y2����Eq(��?���g7g�������=y���K�������^�9��f����7߾�}[�f5ԝǭ��򈹡�
�����(M,Ã����C��7{SR�U^Gu����c+FTX\�B��V/t<���t��lw�җ�Vf�1����o��zt6�����m�4�'��6�\��<�m5Z��
���
:�?��`�[�A=��R*��&��R�`�dǖq��*ЌwuHBdIm��|������-66,Z���V��:�
���@�L�P�U�>a����ݕ
�h�`4��(5�ǀQ,�[\+����
SR%-�����*ɫ,qJ"�I�%Z�x�L2ޅ?'W�r-S�$⑃�i���='p'ӓ��x1=�O&��t6L��ӓ�����>\�N���#ӾV�����l�ȟh��'�x�?)���L��Yvt8���G��Nf�,[L���\L�b�X�.���Le���b�f�����'4L���l�lt�˧����Rq�����8�p�X�	��Ơ���+ď)�O�^�����r~�J++y_���+�eK^�B�b�kԆS�m���^��$���).�UP���x>LV�rx��qb˦ހW&���uUU�'��H���Go�s���	TA5�Vl�/Y���K�p�����g�m���4��zc�TH����Z�];N�dჟ*�	�P'�o��᜗��߰���R�X�9���HnT��I�-Ϭ� ���� L����4ڕ\�g��Y�!�c�y��&a����˹lB�m���#��cZzY�` G���s ��<��!5�)|G��	%�I_ v^<�el�-�u�e�=�HnJ(�X�����*[�M��Ѓ0�㡕.�樴�쬯B��z�E&L��G�@���d+�l�kӣ���u�J�s9�Qá�2/����]��}xCSn��e���Qw@�U�:@r���O�^��l��\\��İOj�p,�5$Z��y%��0>��Z����V��S��ISKA�|H6p*�tBWJ��%l͍S	�O�X:��0���H�)�7���M�.��%�w	Օ%\�Ĵ��RVk���,WU�� vc֡�7!��)���&Wc*A�wI`�&�:-��VQH�;�>Ak�\n�M����?ֿ�t�|��xe�g�ߞ/���ɥ)���7��(�{{���_      3   ]   x���v
Q���W((M��L��/V��L��/�Q����Ts�	uV�0�QP��K�//V04P״��$^�!�fC5#i6'Q�	�^�^.. ��G	      5   �  x���?oT1����H1��-��� �J�D�"R�ER�����Y_�ly�h�������bs~y��W���ӷ�ۛ�����q��wǷ߿��y��w?Nܗ���7�8�������{��o�m�1����\��_6Ͳg_��_�����2k^��F��uz6ju���̣
?�<��"��U h
�B��5 � ���\���X3� ����l�@Dku��@��@DoU�- ��`D4W�݂���Y�]�"h���=AQ�����V3� %� ���W��u
��&H�rUb�swe������{�UEsE�ϪO� �� VS.1  '$ $BtV��' ����z��lM��#a�Bxˊ�5���H�`VtV��G`Bcŉ�DcU��;@?_�X1񣢯���`�	G5�+{1  }��:���O�uي�DW�
?j	V�P�W�'���h�X�N�sfEG�b5uL�,��A(:����{���+*�Q<�2��A X
�A �V0Dk�ZP^�2�-N���7���hQv�bPȠ\8x�����������x���-U��3|��J�1����`@X��upŪ���=-��e���؅�� B1�^�~m- ��aC(����p@�b�!�h�%܅&�|�j�7ׂ+��>Џ�hP�u�2,�>̈�Q�:#�a���Vwi���EDZt��E�*!6������( .����_=     