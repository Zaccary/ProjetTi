PGDMP                      |           ProjetTi    16.2    16.2 F    :           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ;           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            <           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            =           1262    16853    ProjetTi    DATABASE     ~   CREATE DATABASE "ProjetTi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';
    DROP DATABASE "ProjetTi";
                LeZ    false            �            1255    16854 0   ajout_config(integer, numeric, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_config(p_ram integer, p_sto numeric, p_proco text, p_cg text, p_os text) RETURNS integer
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
       public          LeZ    false            �            1255    16855 y   ajout_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text) RETURNS integer
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
       public          LeZ    false            �            1255    16856    verifier_connexion(text, text)    FUNCTION     {  CREATE FUNCTION public.verifier_connexion(p_nom text, p_mdp text) RETURNS integer
    LANGUAGE plpgsql
    AS '
  declare
    id integer;
    retour integer;
BEGIN
      retour = 0;
if p_nom like ''$%'' and p_mdp like ''$%'' then
p_nom = substring(p_nom from 2);
p_mdp = substring(p_mdp from 2);
  select into id id_admin from admin where nom = p_nom and mdp = p_mdp;
  IF NOT FOUND
  THEN
    retour = 0;
  ELSE
    retour = 1;
  END IF;
else
    select into id id_client from client where nom = p_nom and mdp = p_mdp;
    IF NOT FOUND
    THEN
      retour = 0;
    ELSE
      retour = 2;
    END IF;
end if;
return retour;
end;

';
 A   DROP FUNCTION public.verifier_connexion(p_nom text, p_mdp text);
       public          LeZ    false            �            1259    16857    admin    TABLE     Y   CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.admin;
       public         heap    LeZ    false            �            1259    16862    admin_id_admin_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_id_admin_seq;
       public          LeZ    false    215            >           0    0    admin_id_admin_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;
          public          LeZ    false    216            �            1259    16863    carte_graphique    TABLE     ^   CREATE TABLE public.carte_graphique (
    id_cartegraphique integer NOT NULL,
    nom text
);
 #   DROP TABLE public.carte_graphique;
       public         heap    LeZ    false            �            1259    16868 %   carte_graphique_id_cartegraphique_seq    SEQUENCE     �   CREATE SEQUENCE public.carte_graphique_id_cartegraphique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.carte_graphique_id_cartegraphique_seq;
       public          LeZ    false    217            ?           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;
          public          LeZ    false    218            �            1259    16869    classification    TABLE     d   CREATE TABLE public.classification (
    id_class integer NOT NULL,
    pegi text,
    icon text
);
 "   DROP TABLE public.classification;
       public         heap    LeZ    false            �            1259    16874    classification_id_class_seq    SEQUENCE     �   CREATE SEQUENCE public.classification_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.classification_id_class_seq;
       public          LeZ    false    219            @           0    0    classification_id_class_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;
          public          LeZ    false    220            �            1259    16875    client    TABLE     [   CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.client;
       public         heap    LeZ    false            �            1259    16880    client_id_client_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_id_client_seq;
       public          LeZ    false    221            A           0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
          public          LeZ    false    222            �            1259    16881    config    TABLE     �   CREATE TABLE public.config (
    id_config integer NOT NULL,
    ram integer,
    stockage integer,
    id_processeur integer NOT NULL,
    id_cartegraphique integer NOT NULL,
    id_os integer NOT NULL
);
    DROP TABLE public.config;
       public         heap    LeZ    false            �            1259    16884    config_id_config_seq    SEQUENCE     �   CREATE SEQUENCE public.config_id_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.config_id_config_seq;
       public          LeZ    false    223            B           0    0    config_id_config_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;
          public          LeZ    false    224            �            1259    16885    jeux    TABLE     �   CREATE TABLE public.jeux (
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
       public         heap    LeZ    false            �            1259    16890    jeux_id_jeux_seq    SEQUENCE     �   CREATE SEQUENCE public.jeux_id_jeux_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.jeux_id_jeux_seq;
       public          LeZ    false    225            C           0    0    jeux_id_jeux_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;
          public          LeZ    false    226            �            1259    16891    os    TABLE     E   CREATE TABLE public.os (
    id_os integer NOT NULL,
    nom text
);
    DROP TABLE public.os;
       public         heap    LeZ    false            �            1259    16896    os_id_os_seq    SEQUENCE     �   CREATE SEQUENCE public.os_id_os_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.os_id_os_seq;
       public          LeZ    false    227            D           0    0    os_id_os_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;
          public          LeZ    false    228            �            1259    16897 
   processeur    TABLE     U   CREATE TABLE public.processeur (
    id_processeur integer NOT NULL,
    nom text
);
    DROP TABLE public.processeur;
       public         heap    LeZ    false            �            1259    16902    processeur_id_processeur_seq    SEQUENCE     �   CREATE SEQUENCE public.processeur_id_processeur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.processeur_id_processeur_seq;
       public          LeZ    false    229            E           0    0    processeur_id_processeur_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;
          public          LeZ    false    230            �            1259    16903    vue_jeux_config    VIEW     �  CREATE VIEW public.vue_jeux_config AS
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
       public          LeZ    false    223    225    225    225    225    225    223    223    223    223    223    219    219    219    217    217    229    229    227    227    225    225    225    225            z           2604    16908    admin id_admin    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN id_admin DROP DEFAULT;
       public          LeZ    false    216    215            {           2604    16909 !   carte_graphique id_cartegraphique    DEFAULT     �   ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);
 P   ALTER TABLE public.carte_graphique ALTER COLUMN id_cartegraphique DROP DEFAULT;
       public          LeZ    false    218    217            |           2604    16910    classification id_class    DEFAULT     �   ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);
 F   ALTER TABLE public.classification ALTER COLUMN id_class DROP DEFAULT;
       public          LeZ    false    220    219            }           2604    16911    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          LeZ    false    222    221            ~           2604    16912    config id_config    DEFAULT     t   ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);
 ?   ALTER TABLE public.config ALTER COLUMN id_config DROP DEFAULT;
       public          LeZ    false    224    223                       2604    16913    jeux id_jeux    DEFAULT     l   ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);
 ;   ALTER TABLE public.jeux ALTER COLUMN id_jeux DROP DEFAULT;
       public          LeZ    false    226    225            �           2604    16914    os id_os    DEFAULT     d   ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);
 7   ALTER TABLE public.os ALTER COLUMN id_os DROP DEFAULT;
       public          LeZ    false    228    227            �           2604    16915    processeur id_processeur    DEFAULT     �   ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);
 G   ALTER TABLE public.processeur ALTER COLUMN id_processeur DROP DEFAULT;
       public          LeZ    false    230    229            (          0    16857    admin 
   TABLE DATA                 public          LeZ    false    215   �Z       *          0    16863    carte_graphique 
   TABLE DATA                 public          LeZ    false    217   V[       ,          0    16869    classification 
   TABLE DATA                 public          LeZ    false    219   �\       .          0    16875    client 
   TABLE DATA                 public          LeZ    false    221   �]       0          0    16881    config 
   TABLE DATA                 public          LeZ    false    223   �]       2          0    16885    jeux 
   TABLE DATA                 public          LeZ    false    225   �^       4          0    16891    os 
   TABLE DATA                 public          LeZ    false    227   `m       6          0    16897 
   processeur 
   TABLE DATA                 public          LeZ    false    229   �m       F           0    0    admin_id_admin_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, true);
          public          LeZ    false    216            G           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 40, true);
          public          LeZ    false    218            H           0    0    classification_id_class_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);
          public          LeZ    false    220            I           0    0    client_id_client_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.client_id_client_seq', 1, true);
          public          LeZ    false    222            J           0    0    config_id_config_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.config_id_config_seq', 32, true);
          public          LeZ    false    224            K           0    0    jeux_id_jeux_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 10, true);
          public          LeZ    false    226            L           0    0    os_id_os_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.os_id_os_seq', 4, true);
          public          LeZ    false    228            M           0    0    processeur_id_processeur_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 100, true);
          public          LeZ    false    230            �           2606    16917    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            LeZ    false    215            �           2606    16919 $   carte_graphique carte_graphique_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.carte_graphique
    ADD CONSTRAINT carte_graphique_pkey PRIMARY KEY (id_cartegraphique);
 N   ALTER TABLE ONLY public.carte_graphique DROP CONSTRAINT carte_graphique_pkey;
       public            LeZ    false    217            �           2606    16921 "   classification classification_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (id_class);
 L   ALTER TABLE ONLY public.classification DROP CONSTRAINT classification_pkey;
       public            LeZ    false    219            �           2606    16923    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            LeZ    false    221            �           2606    16925    config config_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id_config);
 <   ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
       public            LeZ    false    223            �           2606    16927    jeux jeux_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_pkey PRIMARY KEY (id_jeux);
 8   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_pkey;
       public            LeZ    false    225            �           2606    16929 
   os os_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id_os);
 4   ALTER TABLE ONLY public.os DROP CONSTRAINT os_pkey;
       public            LeZ    false    227            �           2606    16931    processeur processeur_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.processeur
    ADD CONSTRAINT processeur_pkey PRIMARY KEY (id_processeur);
 D   ALTER TABLE ONLY public.processeur DROP CONSTRAINT processeur_pkey;
       public            LeZ    false    229            �           2606    16932 $   config config_id_cartegraphique_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_cartegraphique_fkey FOREIGN KEY (id_cartegraphique) REFERENCES public.carte_graphique(id_cartegraphique);
 N   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_cartegraphique_fkey;
       public          LeZ    false    4741    223    217            �           2606    16937    config config_id_os_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);
 B   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_os_fkey;
       public          LeZ    false    223    4751    227            �           2606    16942     config config_id_processeur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);
 J   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_processeur_fkey;
       public          LeZ    false    4753    229    223            �           2606    16947    jeux jeux_id_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);
 A   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_class_fkey;
       public          LeZ    false    219    225    4743            �           2606    16952    jeux jeux_id_config_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);
 D   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_1_fkey;
       public          LeZ    false    225    223    4747            �           2606    16957    jeux jeux_id_config_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);
 B   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_fkey;
       public          LeZ    false    223    4747    225            (   H   x���v
Q���W((M��L�KL���S��L��t��surS
4�}B]�4u����p��5 ��       *   |  x���=o�0��_q ��q��EjhR����Z�F��o@�CsfzY=���{7�,�d�?Qӽ}V��}������h>�ﮤIu؝���ft�����?�,74�3���"�Ӫ|��}IY�H�X����@(��#,�|D((�P��y���8���2Ga,��C ��P�G�+�����_Q6]S�(H
�dђ'��T�XI+�BKL�`���U[2��]�+�QB�d�� B��DC�`��o�f��3��@���wf�_jf���._���F�'4�`�ㆽb��K��T�?�`!l{�vA����۳Y&+q�d����l��8���vH�N�ڐf��S@�֩�8 ��綦Ww��31�1:�      ,   �   x���v
Q���W((M��L�K�I,.�L�LN,���S��L��(��g�(d&��i*�9���+h��(���{*Z��� �xC��t���tuMk.OJ-2�[d�n�U-2�Yd�f�1U�1����?fT��f�9�=���pq �f�x      .   J   x���v
Q���W((M��L�K��L�+Q��L��0u��surS
4�}B]�4uԣ�ա��5 �`      0   �   x�œM�0F��b��4���W.\�M�����������Ƥ%����o��f�N!Y�+��õT#U�Oeny�G:�1h�J]�"g�j]��i�N��*�m^�>��n�Q5�f��|���qs��1n� �������� �S��7ܔA����!���x\��â���GgҸ�tޓ%��+c=��Y��=����tй�9�)ե�Q70�х�.��9�~���      2   x  x��Y�rG���NhWc� %r���(��(Se��#Q5fz�&g���=�����f��,Ǜl�?��9�g@Rv�h�H ���>�9������o.��ˋW��f�ͳKӽS���-?�T��j�����6Z׌�!}rMi��>����������q_�7������`󙩪�����H��g��}���2A��΍���*�h��u5Re;oC��
&F�̹d���Bպ��M�lP��L�f+F}�����˽�W�)W��5^i�:���lyɻ
F`ٝi#e޵�)��2�T6����)8��J�|��C�\4yL���ݢ�56�T�]�n����4��W:g�C���h�g�
�]=67�4n�NX���ç���Z��=F�k*�l|�0�	��>jK�^;o�>���DDN���-���L��!�FU����9��y���� q+53qiL����(]�ЕD���!lr|/��l���(�^����&�77x��2P����5ie��2���.���3��s��� �ET��j��$��Wi=F �&���X��H�[@�Z�����Z�F�'T�_��
ܫ�g�:tu��13���*��g��Y���G���͠8�)Re�vF�Z��8�հk�󶼬g��|��bl�_��r�\f+��L��|i�)��*��>�/�������ؽh��������#����6N���0��_�X�?��iR�'�y(�:F:�yD.v�����CVkmA����@�&�~ ������Z�����8���[h	���!�7��*4�wgK�� �q���Z�Q ��O�tL��l(���3��5�u�*��5v��`UEw䥝�n��jsSϼ)�P��{@�j��-��~��z� ~	��a9��>�5FԷ���q�t9L��k2��|c��Z�QO�
ר����L=w�
����{�
��LO*�З���F�i�HV�BC��P����HQz6�EG��-|����g��������܃�AD�R����qp��>J������x�C���e�q��F�Ws�%m��*Z|�h��@�q�����S��G�@k��$�o? RE�򝾺�7��D�B��C:tM�{�o�NQS'u�G�1u�Y
<��A�,.�k�x`�{��J�~nkƯ�\�Y�ւ�6!2��2:)Wdu�ۖ�p>�Y�+R��\���� &x(�=c�"��X����~IE�3���!ݍѐ�0�"��ł��ZF��[����3�V���N�ȕm\�b�N=�dy�2�ASϑ��{�̻9��'��|��\�����PcGOSh�U��?x*P�B�rq�d/����(X�B�=�Y�( ܖ�rRt8�E�#����F����?�͋;�nr��>%�&0�����+P�*(l8���s*֔���^�����jx�:&�-�6�`N����!��k�^-	��6&AѲ~Щ����A�\=����9���b��h0h��:�}������k�VϫS�^@�5�����{�&
�wt��;6нS����O�,�
#����hh-�g��#��%���iLF���c\�{G�2_�����BJ��tzH�8�Jt&^R"�C�bK�Κ����9p�m|ۨ����ٯ7C!ɑI��ۈV%$ًN�au�����P��U2Ly��p,�M�>��E��úPRE��W�����o�)"�F`�f��;PV�(tuMH[qϞ�9��=]aC",垽�0Q����	Tm*,O})e]�@�E�R����]T%Q�#����WE�HՕ\0w�;�0@D6��N�^UF��^����U��"݌�mҌ@@�5V�O$s�������w����;q��kj\�١���m�����V�=�����ۛNw&[{ۏ��4��<-�c�]���dV�g��������VYN�l�Ӛ�ݓ��h��b�����o=��'���7{?|���in�`�SQ�U�����Y��Pw���	sC�%��E�}��&��A����d���i���FU���bjň
�+�d{h���UvK��Z�/׭Ήb]U-����zt6�E�b�V:�M��=���hSݕv��m5Z��
��qU�N���:2X����vP�u<%��n�&�a!�FMlGI~�h�f��CKj�-����9�C�ݺh��a��ԅ�Z!�u��oi�t&z(�5r����P����H)� 8Kfm
�v ��`���
�J�Qcj��)i�-�:�n5ո��q01��A�3�9�F����Ľ>{|(7G}֞<�_�_~����s���#$��{d�+��X�������1=G��*��#��=�]���])�x]g5h̒��ͭǝ\G�p]�Is.��{?���B��
���ˠVl}�r��T
^�@��=9���)�;�)��!],2 �Wji�ű��3�u�nT�3�t����z�_QG�&�&>�6�
���2��Fn�2����:��\�V�4��9+ �5���o��5�;��,�YO��#�Ɔ�H���1)Dp6C�R��L��r����!d��ɒJ*���ba�@̊��=�<�󺟴4`3�Fa��/��r6�ـ�%�v���Q��L\\e#�������B�]<���ae�H������-�jX�d�eށƢ��I��'����k������73N=9"1�P��1D�������D0��=^�� �u�ym�g@~?�b�y] �-�iŒs�>����]אhh�\�aȆ���h�����;{w|���Ӕ�����GoO��#*����>_��}{���џ�L��Ģ:����W��to�}��_L%�/[jEt�!�B�̍�aȿ�9�=QT�7��KZʈ��
��4�'���h���Qԡ��%.Ux)D��$��jΙg���RO2w�ٟq�h_�=���Y�ā�p��;/��J*_��� .z�xs��nd�}����@�%Ǵ#*���.���2--�~y�g n�g���4k^�媌S8�VWV��ȱn��&����{R���ȼ�:+F�
�5�L$fŢ��N��~>(Ln��r��H�z�x�ҾW`�W)[U0��Qzc9HF�~�韉>8�M�b��T%cj�V�W�c�`���e� :��D� �����S�fNA�=���$5�
����Hb�`��0���/�/()�I$@^�q�N�AU�������R��>Q��U!�is�������|���-F~�9薆�=Bg�6�֝�\D�)[D�`�S�{��� �U��5�P7��R	����N�ޛ^}�h=>����o��Y�h��~q�ڽ�>�GS�\7�hm��<����t��x������&H�"� %�W��4釔��J����ȟ4�uD$N�!_
�Ҵ,1.��L�~!��m�50'_CRE��!���(��z�KY%�x�F|��ֿ�U,�:qj������qrG��U��8��
��z��0�B���ת�p4�2C�w:i��e'���#��ǯކR�)$��岫��e�w�
�h�8� ܉6�'���;zZ>�;zww�����4�{�zkw�i��<}�w~��~-�o��/��<?{�J}LDol���/      4   ]   x���v
Q���W((M��L��/V��L��/�Q����Ts�	uV�0�QP��K�//V04P״��$^�!�fC5#i6'Q�	�^�^.. ��G	      6   �  x���?oT1����H1��-��� �J�D�"R�ER�����Y_�ly�h�������bs~y��W���ӷ�ۛ�����q��wǷ߿��y��w?Nܗ���7�8�������{��o�m�1����\��_6Ͳg_��_�����2k^��F��uz6ju���̣
?�<��"��U h
�B��5 � ���\���X3� ����l�@Dku��@��@DoU�- ��`D4W�݂���Y�]�"h���=AQ�����V3� %� ���W��u
��&H�rUb�swe������{�UEsE�ϪO� �� VS.1  '$ $BtV��' ����z��lM��#a�Bxˊ�5���H�`VtV��G`Bcŉ�DcU��;@?_�X1񣢯���`�	G5�+{1  }��:���O�uي�DW�
?j	V�P�W�'���h�X�N�sfEG�b5uL�,��A(:����{���+*�Q<�2��A X
�A �V0Dk�ZP^�2�-N���7���hQv�bPȠ\8x�����������x���-U��3|��J�1����`@X��upŪ���=-��e���؅�� B1�^�~m- ��aC(����p@�b�!�h�%܅&�|�j�7ׂ+��>Џ�hP�u�2,�>̈�Q�:#�a���Vwi���EDZt��E�*!6������( .����_=     