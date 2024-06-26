PGDMP  (                    |           ProjetTi    16.1    16.1 E    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    16806    ProjetTi    DATABASE     ~   CREATE DATABASE "ProjetTi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';
    DROP DATABASE "ProjetTi";
                LeZ    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            ;           0    0 
   SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    16875    admin    TABLE     Y   CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.admin;
       public         heap    LeZ    false    4            �            1259    16874    admin_id_admin_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_id_admin_seq;
       public          LeZ    false    228    4            <           0    0    admin_id_admin_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;
          public          LeZ    false    227            �            1259    16817    carte_graphique    TABLE     ^   CREATE TABLE public.carte_graphique (
    id_cartegraphique integer NOT NULL,
    nom text
);
 #   DROP TABLE public.carte_graphique;
       public         heap    LeZ    false    4            �            1259    16816 %   carte_graphique_id_cartegraphique_seq    SEQUENCE     �   CREATE SEQUENCE public.carte_graphique_id_cartegraphique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.carte_graphique_id_cartegraphique_seq;
       public          LeZ    false    4    218            =           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;
          public          LeZ    false    217            �            1259    16808    classification    TABLE     U   CREATE TABLE public.classification (
    id_class integer NOT NULL,
    pegi text
);
 "   DROP TABLE public.classification;
       public         heap    LeZ    false    4            �            1259    16807    classification_id_class_seq    SEQUENCE     �   CREATE SEQUENCE public.classification_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.classification_id_class_seq;
       public          LeZ    false    216    4            >           0    0    classification_id_class_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;
          public          LeZ    false    215            �            1259    16866    client    TABLE     [   CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.client;
       public         heap    LeZ    false    4            �            1259    16865    client_id_client_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_id_client_seq;
       public          LeZ    false    226    4            ?           0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
          public          LeZ    false    225            �            1259    16844    config    TABLE     �   CREATE TABLE public.config (
    id_config integer NOT NULL,
    ram integer,
    stockage integer,
    id_processeur integer NOT NULL,
    id_cartegraphique integer NOT NULL,
    id_os integer NOT NULL
);
    DROP TABLE public.config;
       public         heap    LeZ    false    4            �            1259    16843    config_id_config_seq    SEQUENCE     �   CREATE SEQUENCE public.config_id_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.config_id_config_seq;
       public          LeZ    false    4    224            @           0    0    config_id_config_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;
          public          LeZ    false    223            �            1259    16884    jeux    TABLE     �   CREATE TABLE public.jeux (
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
       public         heap    LeZ    false    4            �            1259    16883    jeux_id_jeux_seq    SEQUENCE     �   CREATE SEQUENCE public.jeux_id_jeux_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.jeux_id_jeux_seq;
       public          LeZ    false    4    230            A           0    0    jeux_id_jeux_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;
          public          LeZ    false    229            �            1259    16835    os    TABLE     E   CREATE TABLE public.os (
    id_os integer NOT NULL,
    nom text
);
    DROP TABLE public.os;
       public         heap    LeZ    false    4            �            1259    16834    os_id_os_seq    SEQUENCE     �   CREATE SEQUENCE public.os_id_os_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.os_id_os_seq;
       public          LeZ    false    222    4            B           0    0    os_id_os_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;
          public          LeZ    false    221            �            1259    16826 
   processeur    TABLE     U   CREATE TABLE public.processeur (
    id_processeur integer NOT NULL,
    nom text
);
    DROP TABLE public.processeur;
       public         heap    LeZ    false    4            �            1259    16825    processeur_id_processeur_seq    SEQUENCE     �   CREATE SEQUENCE public.processeur_id_processeur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.processeur_id_processeur_seq;
       public          LeZ    false    4    220            C           0    0    processeur_id_processeur_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;
          public          LeZ    false    219            �            1259    17272    vue_jeux_config    VIEW     �  CREATE VIEW public.vue_jeux_config AS
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
 "   DROP VIEW public.vue_jeux_config;
       public          LeZ    false    220    222    222    224    224    218    216    224    224    224    224    230    230    230    230    230    230    230    230    230    216    218    220    4            }           2604    17039    admin id_admin    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN id_admin DROP DEFAULT;
       public          LeZ    false    227    228    228            x           2604    17040 !   carte_graphique id_cartegraphique    DEFAULT     �   ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);
 P   ALTER TABLE public.carte_graphique ALTER COLUMN id_cartegraphique DROP DEFAULT;
       public          LeZ    false    218    217    218            w           2604    17041    classification id_class    DEFAULT     �   ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);
 F   ALTER TABLE public.classification ALTER COLUMN id_class DROP DEFAULT;
       public          LeZ    false    216    215    216            |           2604    17042    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          LeZ    false    225    226    226            {           2604    17043    config id_config    DEFAULT     t   ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);
 ?   ALTER TABLE public.config ALTER COLUMN id_config DROP DEFAULT;
       public          LeZ    false    223    224    224            ~           2604    17044    jeux id_jeux    DEFAULT     l   ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);
 ;   ALTER TABLE public.jeux ALTER COLUMN id_jeux DROP DEFAULT;
       public          LeZ    false    230    229    230            z           2604    17045    os id_os    DEFAULT     d   ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);
 7   ALTER TABLE public.os ALTER COLUMN id_os DROP DEFAULT;
       public          LeZ    false    221    222    222            y           2604    17046    processeur id_processeur    DEFAULT     �   ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);
 G   ALTER TABLE public.processeur ALTER COLUMN id_processeur DROP DEFAULT;
       public          LeZ    false    220    219    220            2          0    16875    admin 
   TABLE DATA                 public          LeZ    false    228   �M       (          0    16817    carte_graphique 
   TABLE DATA                 public          LeZ    false    218   �M       &          0    16808    classification 
   TABLE DATA                 public          LeZ    false    216   O       0          0    16866    client 
   TABLE DATA                 public          LeZ    false    226   �O       .          0    16844    config 
   TABLE DATA                 public          LeZ    false    224   �O       4          0    16884    jeux 
   TABLE DATA                 public          LeZ    false    230   EP       ,          0    16835    os 
   TABLE DATA                 public          LeZ    false    222   �X       *          0    16826 
   processeur 
   TABLE DATA                 public          LeZ    false    220   ZY       D           0    0    admin_id_admin_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, false);
          public          LeZ    false    227            E           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 20, true);
          public          LeZ    false    217            F           0    0    classification_id_class_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);
          public          LeZ    false    215            G           0    0    client_id_client_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);
          public          LeZ    false    225            H           0    0    config_id_config_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.config_id_config_seq', 4, true);
          public          LeZ    false    223            I           0    0    jeux_id_jeux_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 3, true);
          public          LeZ    false    229            J           0    0    os_id_os_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.os_id_os_seq', 3, true);
          public          LeZ    false    221            K           0    0    processeur_id_processeur_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 20, true);
          public          LeZ    false    219            �           2606    16882    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            LeZ    false    228            �           2606    16824 $   carte_graphique carte_graphique_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.carte_graphique
    ADD CONSTRAINT carte_graphique_pkey PRIMARY KEY (id_cartegraphique);
 N   ALTER TABLE ONLY public.carte_graphique DROP CONSTRAINT carte_graphique_pkey;
       public            LeZ    false    218            �           2606    16815 "   classification classification_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (id_class);
 L   ALTER TABLE ONLY public.classification DROP CONSTRAINT classification_pkey;
       public            LeZ    false    216            �           2606    16873    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            LeZ    false    226            �           2606    16849    config config_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id_config);
 <   ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
       public            LeZ    false    224            �           2606    16891    jeux jeux_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_pkey PRIMARY KEY (id_jeux);
 8   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_pkey;
       public            LeZ    false    230            �           2606    16842 
   os os_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id_os);
 4   ALTER TABLE ONLY public.os DROP CONSTRAINT os_pkey;
       public            LeZ    false    222            �           2606    16833    processeur processeur_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.processeur
    ADD CONSTRAINT processeur_pkey PRIMARY KEY (id_processeur);
 D   ALTER TABLE ONLY public.processeur DROP CONSTRAINT processeur_pkey;
       public            LeZ    false    220            �           2606    16855 $   config config_id_cartegraphique_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_cartegraphique_fkey FOREIGN KEY (id_cartegraphique) REFERENCES public.carte_graphique(id_cartegraphique);
 N   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_cartegraphique_fkey;
       public          LeZ    false    218    224    4738            �           2606    16860    config config_id_os_fkey 
   FK CONSTRAINT     u   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);
 B   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_os_fkey;
       public          LeZ    false    224    222    4742            �           2606    16850     config config_id_processeur_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);
 J   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_processeur_fkey;
       public          LeZ    false    4740    220    224            �           2606    16892    jeux jeux_id_class_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);
 A   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_class_fkey;
       public          LeZ    false    230    4736    216            �           2606    16902    jeux jeux_id_config_1_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);
 D   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_1_fkey;
       public          LeZ    false    4744    230    224            �           2606    16897    jeux jeux_id_config_fkey 
   FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);
 B   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_fkey;
       public          LeZ    false    230    224    4744            2   
   x���          (      x����k�0�{��wSAF�.i���N��6�ޤ��6[�����vi�����}Og�&7�3�A�����/u�_���W�ws,͛�������s���}���)hΗ4��z�S�ڷ��-妤�%l�X@È�GD0��G(F�A)rT�ݚ��h�3�%��1*
PS ��@��S�.SH�(���q�"��)���/V�
��+�É �����qZ\A�����I-9�O��1-����1w#n��z2      &   n   x���v
Q���W((M��L�K�I,.�L�LN,���S��L��(��gj*�9���+h�(���{*�kZsy�o�� s

2�dhD�I&p��(4�n��$.. a3pf      0   
   x���          .   �   x���v
Q���W((M��L�K��K�LW��L��0u�su�K��Su�2E�ɩ�ũ�E`nrbQIjzQbAFfa)DE~��B��O�k������� 	S 
iZsy��v#���@�
�i�1��`0���&��n��: �Ɲ<      4   �  x��WMs�F��W�� �U$D|� wK�Rl%+��ؖ�MN�f@�`��)�פr�|�e��c�z@P�7��^X g����n�_^���f��?���J�7��cϔ�H#V�j���(�͍j�����B^rk�']j���c�/_�[+!�s������{���G^��u,�
G,I��?� �JZ��O���ʵBiX���;��*�j'-+��?�jdmw����O[�*&��'p�[ˬnW\9Y;Vr�)Y�e�J&xm�C,���窾etd%^�K�-;7Mߥd��2n��`u�Jm�-,zw��D��uF�8-���yfԈ9�Ƞm
Y[�o5�T����K���sV�po�#r�����%;�v�F��F[7���redYy'Q���a/�v�d͢p�na�ʶd�%�9����הK�j:�w
lJ3�r*@��ݶ��(���֙1�Q���7��:�)���� D�K���!��h$"m��:�������:�=(˖��0:�r��o(��-���Eq���N���'E�^�گ�9�T�j"��w���h�zw?�՚�07 4!���;�p��j-����o;��yU�疝9�����9��`��C�̍�ӊ��f�j%�?��GP�sc n���(SB�����UCU�g
���:�/HJ�
P�qJ>�W̏�+;�ܤ��
y�I�p�i�Z[��v-9���U@��bi�o�[F��Zo�	�6�
�S�[܆�=�Z�}"�`pͳN�K�� t`�+P*io�^�:��x�?�ￓ�����"=Q]K�v��T)l|!�`��n��x���7��I$��p��o����� ���8��>�w�?P��T�����%i4A���Q/�o���ꠈ�,x�#�M����e�Ov�TM���j���`I-��vMNH����݂� ��ZvTT4?(�=[�	�۾7��|�����3z�ov�
�,w��`p��m�B��+�邳�h�|	;\<R5�@@��Dj~P#�Oʪ�>y䤊��~����	-`o�A��4�4�I���/�����z �N�Qj���q�����OI����� ��k�+�}JX��/Ь���_�7��}�.;]�g_�� �QI@�ީRٮ�9g�a�o��SH��ʞr��do�æ`�z-<��t.�E��az�L�}n�(��izPӓ�[H֏Q��5/ڒl�5�����T-�%H�J���P���W�]��4������=5^��M,�z��vJb�wm��L�hS
;�+iA>�n������"�xo���̨Ϫ���]wZ�~>@��Dԅ����E��m�3,
��UJJ���|�~:�x�y�k���}�?��b���6;l\Õs����q%���G��i�Z�c�-M�x-�$�G�Y΢(	'�aG�t��4�M�0�$�x�q��'A�L�p>�'IO��,	�|�H�"�P�$��8+��q���ɤ(b���M��^ޝ�f�<��HYzN�LDG��$�x
N�"��$�R!�p�p$�BdE��R�E�y�Hg�T��3�'2K�N��w��d#��h��[��a���Z�9>f��[ �f2�H��w)��������u����:Y�<�v��������>��������`�O�b�m.��tѭ�f��;�8h���@��K�+��AV��a�,��f����4�h�oK)X�e�����Ȣҹ���;0�cg�dV�%ߒw��_2���k�a�����I�Tck��۬4+�>���HQ�#�;�����H�V-��mYat���(��ײ�O�Kx���g��ٕ�UC#���%�X)#Ɲ���R�Z��K�����-�{�6{�6�O�!'�y
����O�#�f,����51?�
�S�ч5�qrŖ����mY&�FbIi���t�<V��04�|epf��>�<�h%{0<�]�(�^�;C/H�p�}BO���!�#�P>�o�̹1t[�;H�O��Bߪ���KN�*�A�(й�K��א(�G-�T(��y欐�o(�Ӊ��|΄�m��V TF^]vas�N),dF����p�� 
�=1��/鉳t>I�h1�,��xu@g�7����s},n��I��'����\R���(�|^L�8^̧�l�):`��g���$��x�G�E���a��C\K���w�q���\����~��zz]����ꇫ�3I�n0�/�{�P      ,   W   x���v
Q���W((M��L��/V��L��/�Q����Ts�	u
V�0�QP��K�//V04T״��$^��f5#i6��� �D5_      *   �   x���=�@�὿"�
V.��z8�v(~�_�	�
m�꠿�C1ݼ�]�Ky��f�t��l����?�Υ*�z��
��q��lCQ�[�L���؆FV��	�ee!7!�Qj�h�����]7v0��� 7s�93b�ڥj���O�J�S���K��S�T��Su� �� �w��P P1������P��D���	���1��@�[:4b�@� _.
���� �V�]�C��m������)�/�     