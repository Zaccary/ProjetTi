PGDMP                      |           ProjetTi    16.2    16.2 E    9           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            :           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ;           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            <           1262    16635    ProjetTi    DATABASE     ~   CREATE DATABASE "ProjetTi" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_Belgium.1252';
    DROP DATABASE "ProjetTi";
                LeZ    false            �            1255    16743 0   ajout_config(integer, numeric, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_config(p_ram integer, p_sto numeric, p_proco text, p_cg text, p_os text) RETURNS integer
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
       public          LeZ    false            �            1255    16744 y   ajout_jeux(text, numeric, text, text, text, integer, numeric, integer, numeric, text, text, text, text, text, text, text)    FUNCTION     �  CREATE FUNCTION public.ajout_jeux(p_nom_jeu text, p_prix numeric, p_description text, p_image text, p_video text, p_ram_co1 integer, p_sto_co1 numeric, p_ram_co2 integer, p_sto_co2 numeric, p_proco_co1 text, p_proco_co2 text, p_cg_co1 text, p_cg_co2 text, p_os_co1 text, p_os_co2 text, p_pegi text) RETURNS integer
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
       public          LeZ    false            �            1259    16637    admin    TABLE     Y   CREATE TABLE public.admin (
    id_admin integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.admin;
       public         heap    LeZ    false            �            1259    16642    admin_id_admin_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_id_admin_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_id_admin_seq;
       public          LeZ    false    215            =           0    0    admin_id_admin_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_id_admin_seq OWNED BY public.admin.id_admin;
          public          LeZ    false    216            �            1259    16643    carte_graphique    TABLE     ^   CREATE TABLE public.carte_graphique (
    id_cartegraphique integer NOT NULL,
    nom text
);
 #   DROP TABLE public.carte_graphique;
       public         heap    LeZ    false            �            1259    16648 %   carte_graphique_id_cartegraphique_seq    SEQUENCE     �   CREATE SEQUENCE public.carte_graphique_id_cartegraphique_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.carte_graphique_id_cartegraphique_seq;
       public          LeZ    false    217            >           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.carte_graphique_id_cartegraphique_seq OWNED BY public.carte_graphique.id_cartegraphique;
          public          LeZ    false    218            �            1259    16649    classification    TABLE     U   CREATE TABLE public.classification (
    id_class integer NOT NULL,
    pegi text
);
 "   DROP TABLE public.classification;
       public         heap    LeZ    false            �            1259    16654    classification_id_class_seq    SEQUENCE     �   CREATE SEQUENCE public.classification_id_class_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.classification_id_class_seq;
       public          LeZ    false    219            ?           0    0    classification_id_class_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.classification_id_class_seq OWNED BY public.classification.id_class;
          public          LeZ    false    220            �            1259    16655    client    TABLE     [   CREATE TABLE public.client (
    id_client integer NOT NULL,
    nom text,
    mdp text
);
    DROP TABLE public.client;
       public         heap    LeZ    false            �            1259    16660    client_id_client_seq    SEQUENCE     �   CREATE SEQUENCE public.client_id_client_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.client_id_client_seq;
       public          LeZ    false    221            @           0    0    client_id_client_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.client_id_client_seq OWNED BY public.client.id_client;
          public          LeZ    false    222            �            1259    16661    config    TABLE     �   CREATE TABLE public.config (
    id_config integer NOT NULL,
    ram integer,
    stockage integer,
    id_processeur integer NOT NULL,
    id_cartegraphique integer NOT NULL,
    id_os integer NOT NULL
);
    DROP TABLE public.config;
       public         heap    LeZ    false            �            1259    16664    config_id_config_seq    SEQUENCE     �   CREATE SEQUENCE public.config_id_config_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.config_id_config_seq;
       public          LeZ    false    223            A           0    0    config_id_config_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.config_id_config_seq OWNED BY public.config.id_config;
          public          LeZ    false    224            �            1259    16665    jeux    TABLE     �   CREATE TABLE public.jeux (
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
       public         heap    LeZ    false            �            1259    16670    jeux_id_jeux_seq    SEQUENCE     �   CREATE SEQUENCE public.jeux_id_jeux_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.jeux_id_jeux_seq;
       public          LeZ    false    225            B           0    0    jeux_id_jeux_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.jeux_id_jeux_seq OWNED BY public.jeux.id_jeux;
          public          LeZ    false    226            �            1259    16671    os    TABLE     E   CREATE TABLE public.os (
    id_os integer NOT NULL,
    nom text
);
    DROP TABLE public.os;
       public         heap    LeZ    false            �            1259    16676    os_id_os_seq    SEQUENCE     �   CREATE SEQUENCE public.os_id_os_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.os_id_os_seq;
       public          LeZ    false    227            C           0    0    os_id_os_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.os_id_os_seq OWNED BY public.os.id_os;
          public          LeZ    false    228            �            1259    16677 
   processeur    TABLE     U   CREATE TABLE public.processeur (
    id_processeur integer NOT NULL,
    nom text
);
    DROP TABLE public.processeur;
       public         heap    LeZ    false            �            1259    16682    processeur_id_processeur_seq    SEQUENCE     �   CREATE SEQUENCE public.processeur_id_processeur_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.processeur_id_processeur_seq;
       public          LeZ    false    229            D           0    0    processeur_id_processeur_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.processeur_id_processeur_seq OWNED BY public.processeur.id_processeur;
          public          LeZ    false    230            �            1259    16683    vue_jeux_config    VIEW     �  CREATE VIEW public.vue_jeux_config AS
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
       public          LeZ    false    219    223    229    229    227    227    225    225    225    225    225    225    225    225    225    223    223    223    223    223    217    217    219            y           2604    16688    admin id_admin    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN id_admin SET DEFAULT nextval('public.admin_id_admin_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN id_admin DROP DEFAULT;
       public          LeZ    false    216    215            z           2604    16689 !   carte_graphique id_cartegraphique    DEFAULT     �   ALTER TABLE ONLY public.carte_graphique ALTER COLUMN id_cartegraphique SET DEFAULT nextval('public.carte_graphique_id_cartegraphique_seq'::regclass);
 P   ALTER TABLE public.carte_graphique ALTER COLUMN id_cartegraphique DROP DEFAULT;
       public          LeZ    false    218    217            {           2604    16690    classification id_class    DEFAULT     �   ALTER TABLE ONLY public.classification ALTER COLUMN id_class SET DEFAULT nextval('public.classification_id_class_seq'::regclass);
 F   ALTER TABLE public.classification ALTER COLUMN id_class DROP DEFAULT;
       public          LeZ    false    220    219            |           2604    16691    client id_client    DEFAULT     t   ALTER TABLE ONLY public.client ALTER COLUMN id_client SET DEFAULT nextval('public.client_id_client_seq'::regclass);
 ?   ALTER TABLE public.client ALTER COLUMN id_client DROP DEFAULT;
       public          LeZ    false    222    221            }           2604    16692    config id_config    DEFAULT     t   ALTER TABLE ONLY public.config ALTER COLUMN id_config SET DEFAULT nextval('public.config_id_config_seq'::regclass);
 ?   ALTER TABLE public.config ALTER COLUMN id_config DROP DEFAULT;
       public          LeZ    false    224    223            ~           2604    16693    jeux id_jeux    DEFAULT     l   ALTER TABLE ONLY public.jeux ALTER COLUMN id_jeux SET DEFAULT nextval('public.jeux_id_jeux_seq'::regclass);
 ;   ALTER TABLE public.jeux ALTER COLUMN id_jeux DROP DEFAULT;
       public          LeZ    false    226    225                       2604    16694    os id_os    DEFAULT     d   ALTER TABLE ONLY public.os ALTER COLUMN id_os SET DEFAULT nextval('public.os_id_os_seq'::regclass);
 7   ALTER TABLE public.os ALTER COLUMN id_os DROP DEFAULT;
       public          LeZ    false    228    227            �           2604    16695    processeur id_processeur    DEFAULT     �   ALTER TABLE ONLY public.processeur ALTER COLUMN id_processeur SET DEFAULT nextval('public.processeur_id_processeur_seq'::regclass);
 G   ALTER TABLE public.processeur ALTER COLUMN id_processeur DROP DEFAULT;
       public          LeZ    false    230    229            '          0    16637    admin 
   TABLE DATA                 public          LeZ    false    215   �W       )          0    16643    carte_graphique 
   TABLE DATA                 public          LeZ    false    217   �W       +          0    16649    classification 
   TABLE DATA                 public          LeZ    false    219   �X       -          0    16655    client 
   TABLE DATA                 public          LeZ    false    221   0Y       /          0    16661    config 
   TABLE DATA                 public          LeZ    false    223   JY       1          0    16665    jeux 
   TABLE DATA                 public          LeZ    false    225    Z       3          0    16671    os 
   TABLE DATA                 public          LeZ    false    227   �e       5          0    16677 
   processeur 
   TABLE DATA                 public          LeZ    false    229   �e       E           0    0    admin_id_admin_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.admin_id_admin_seq', 1, false);
          public          LeZ    false    216            F           0    0 %   carte_graphique_id_cartegraphique_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.carte_graphique_id_cartegraphique_seq', 20, true);
          public          LeZ    false    218            G           0    0    classification_id_class_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.classification_id_class_seq', 5, true);
          public          LeZ    false    220            H           0    0    client_id_client_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.client_id_client_seq', 1, false);
          public          LeZ    false    222            I           0    0    config_id_config_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.config_id_config_seq', 28, true);
          public          LeZ    false    224            J           0    0    jeux_id_jeux_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.jeux_id_jeux_seq', 7, true);
          public          LeZ    false    226            K           0    0    os_id_os_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.os_id_os_seq', 3, true);
          public          LeZ    false    228            L           0    0    processeur_id_processeur_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.processeur_id_processeur_seq', 20, true);
          public          LeZ    false    230            �           2606    16698    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            LeZ    false    215            �           2606    16700 $   carte_graphique carte_graphique_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.carte_graphique
    ADD CONSTRAINT carte_graphique_pkey PRIMARY KEY (id_cartegraphique);
 N   ALTER TABLE ONLY public.carte_graphique DROP CONSTRAINT carte_graphique_pkey;
       public            LeZ    false    217            �           2606    16702 "   classification classification_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.classification
    ADD CONSTRAINT classification_pkey PRIMARY KEY (id_class);
 L   ALTER TABLE ONLY public.classification DROP CONSTRAINT classification_pkey;
       public            LeZ    false    219            �           2606    16704    client client_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id_client);
 <   ALTER TABLE ONLY public.client DROP CONSTRAINT client_pkey;
       public            LeZ    false    221            �           2606    16706    config config_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_pkey PRIMARY KEY (id_config);
 <   ALTER TABLE ONLY public.config DROP CONSTRAINT config_pkey;
       public            LeZ    false    223            �           2606    16708    jeux jeux_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_pkey PRIMARY KEY (id_jeux);
 8   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_pkey;
       public            LeZ    false    225            �           2606    16710 
   os os_pkey 
   CONSTRAINT     K   ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id_os);
 4   ALTER TABLE ONLY public.os DROP CONSTRAINT os_pkey;
       public            LeZ    false    227            �           2606    16712    processeur processeur_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.processeur
    ADD CONSTRAINT processeur_pkey PRIMARY KEY (id_processeur);
 D   ALTER TABLE ONLY public.processeur DROP CONSTRAINT processeur_pkey;
       public            LeZ    false    229            �           2606    16713 $   config config_id_cartegraphique_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_cartegraphique_fkey FOREIGN KEY (id_cartegraphique) REFERENCES public.carte_graphique(id_cartegraphique);
 N   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_cartegraphique_fkey;
       public          LeZ    false    217    4740    223            �           2606    16718    config config_id_os_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_os_fkey FOREIGN KEY (id_os) REFERENCES public.os(id_os);
 B   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_os_fkey;
       public          LeZ    false    227    4750    223            �           2606    16723     config config_id_processeur_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.config
    ADD CONSTRAINT config_id_processeur_fkey FOREIGN KEY (id_processeur) REFERENCES public.processeur(id_processeur);
 J   ALTER TABLE ONLY public.config DROP CONSTRAINT config_id_processeur_fkey;
       public          LeZ    false    223    229    4752            �           2606    16728    jeux jeux_id_class_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_class_fkey FOREIGN KEY (id_class) REFERENCES public.classification(id_class);
 A   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_class_fkey;
       public          LeZ    false    225    219    4742            �           2606    16733    jeux jeux_id_config_1_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_1_fkey FOREIGN KEY (id_config_1) REFERENCES public.config(id_config);
 D   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_1_fkey;
       public          LeZ    false    4746    225    223            �           2606    16738    jeux jeux_id_config_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.jeux
    ADD CONSTRAINT jeux_id_config_fkey FOREIGN KEY (id_config) REFERENCES public.config(id_config);
 B   ALTER TABLE ONLY public.jeux DROP CONSTRAINT jeux_id_config_fkey;
       public          LeZ    false    225    4746    223            '   
   x���          )      x����k�0�{��wSAF�.i���N��6�ޤ��6[�����vi�����}Og�&7�3�A�����/u�_���W�ws,͛�������s���}���)hΗ4��z�S�ڷ��-妤�%l�X@È�GD0��G(F�A)rT�ݚ��h�3�%��1*
PS ��@��S�.SH�(���q�"��)���/V���+�É �����qZ\A�����I-9�O��1-����1w#n��z2      +   n   x���v
Q���W((M��L�K�I,.�L�LN,���S��L��(��gj*�9���+h�(���{*�kZsy�o�� s
2�dhD�I&p��(4�n��$.. a3pf      -   
   x���          /   �   x���v
Q���W((M��L�K��K�LW��L��0u�su�K��Su�2E�ɩ�ũ�E`nrbQIjzQbAFfa)DE~��B��O�k������� 	S 
iZsy��v#���@��i�1��`0���&��nFo��"P|C�b���@?�5�������6����4�| ���ߍ�~�� 0�a      1   V  x��XMs���W�9�ɌH�EI��d�^'�ֻ���Mr�AP�M4 J���LOqν��?��Il3�2�ŖD���<����<�ኝ�����]V)^��}���a�]OXk>��
�Z�t3aX *nm�I7�Z?��1Ɨ���mT.�W������K�%�UVU�6�X6=���*\�>��9~#-k+.$S��r������s�Q�)��tN5kZ�-�(Y͛��LYf�J�,�1WJ���Q�Z.v_0]�ˮ���q�ʐ������m������G�&L޵��yVI&+�$���m��/�� �1��;��p�~�:ڮ���r;V]�7Jw��F���ʰٳ| ��)`����`sie���	+Je� 1Y�0���6������R��[��Zm��m���u���70�k�q���6�Ր�Q֒����Ô��8�bk^Kn�2�R6�k)��t�H��)l~���lcr�p�����G����SC/�u����d�R躭$~��u����Z�� �_d��UUss�KN�*�A�(��U��(ʇ�#�
P�vJo��Br�S�BE�YAx���rm��Fƨ2����U�6� En!2��$���,��PȈ*6�0�P�\k�||\�\�0WV s�m�F�c����x5]%�b9]�q�N�I���t:O�h�LW�h�̎ˇ��`�[�8����^����ky�"M�<Η�PY��"��e�B�b>�D��3!�y��gi����|�S1�c�Z�I�y4Og��j#O�,�/��,9|qXh$ս�ʬ=ܪܕ/�x�8�'2v�$��v�4T �!j},�L��Q�q��۾m�￶��O?_ͯ�����zy��L}����������7H'�e�A$I�v/	�6��[��]:`Kcwa���s��\��D2��=�Z6vO\e�7;�j&�O`�t���& ��,D7��$�9���K�> �.��e�Ȓ��%��U����m(]��h'v��J{��9x@*�;1"?	�@9Y�̨	��ІP�{`'k��-��{�����>�~oωM�z�F��zoYo�uA�	�����-���R�~��� ����4d�u����*�;�]�.�����P,�	@걧4�JxY�(�����J 7hޑ ,� ��l���9����ڀ���$��y�eWҐ�����ꬷ��������F
}R�-c����%��&�r
� ,�I/�@�_)GP�앯����L�)�����Ry�׻�i�6��F������]Ӌ��������H�ٙc��ă>��x�®���3Oa� +욵j����S?n��5�2�(R�N_+bu#TK�h����F��Ai�L0P�'����xe�M��7��G>-<�h�6�CV6`�B6�(5@#�2�\n�n�o�j�a5����y7�3r�W4������"ԡ	�#.Q����;�׀�}J����߉K~�G}����H���P�m|!�@=5־��I�&|R,��}cG�2Ԝ���m�l�&ykH,Z7�8<x-}?���ڼy���)-�4��}�	���B�v*�J

�����\xo�R֏/�z�cll��CN|�Ы)k�˻!.?pm2�e�Ц�CQQ����*�Gߏڈ���7��3yn���T-�.��%k��հ��@�9�6����'�&� ����@AYu7��TQ ҷ��=�aT����4�S�	�/=u���i^��:}G��d�£L�%J���X�.0i�9��>,��/��l�_7������y	����@%������e�Qr�SDL�9::���!��K�f�l
��ȅ�z�?��B3L����0��7EF?x�>��Y�(��(t}͓��=��+fT���R�s�*T��4���������R_�'�E���et��i�.���>r:"i�M�ۃ���c����g���跙�QU���:�+�@H]���z�ѠCj�k�%@a4��O�Ԑ�r>A?=�s�n��?-��|i�qLv�2�/��b���,�����p�H�Q'�4^.�I2�E�8M�D,W��H��E�̲<ȊyL��*��bƳ�ٰ.��ð�ϧ4��1�ǘ��_&�j9�MżX�i���T�y��L��2O�sS.�4ZI�L����3��������j���W�s>�r���˟z���t����}�!I9����A��pM����TzGe�SZf82`���V"���S���-��8��ܱR�F��џ�����x]A���x�=˕g�vkَ��{�k�_l j'P�����~?:��;���5@	er;�U�$=�|�w~�<풍��i��e��8mvtB�k>�V	�q���qJ���pi�\���\���˒L�It�\�"����V�Y�@�l'~��.h� ڲn�-i�O�QU�O���9��&�F(�?5�V#e������_��I�J��;�|���$|�(�z8�7�|���U�I� 
�ȨԳ�adMS�}v��-^�)��E�a��w[7 ��ߘ��J���/�ȿ�3��e�[�ϰH��y�1��gx��
������i�U��L�tqF�R9���[+��w���A�i^��3��^�t�"j�Pg$�H�8�k�?Mh�lE��~Ŗ�f��O������6��b7���m%��o]x�uy
.O�OdH��Su&%�/�9����e�uI�:0#��-�]Q���3�=_�Um�� �8S��F�P� ��4��n��!I�(�I��F��E�X�+ee)�Y6�d��<��W$B�e�HeR_�����(��3�'�'�,��Y��	�nӏ&=#%>]���o�+]��'o_����W�I      3   W   x���v
Q���W((M��L��/V��L��/�Q����Ts�	uV�0�QP��K�//V04T״��$^��f5#i6��� �D5_      5   �   x���=�@�὿"�
V.��z8�v(~�_�	�m�꠿�C1ݼ�]�Ky��f�t��l����?�Υ*�z��
��q��lCQ�[�L���؆FV��	�ee!7!�Qj�h�����]7v0��� 7s�93b�ڥj���O�J�S���K��S�T��Su� �� �w��P P1������P��D���	���1��@�[:4b�@� _.
���� �V�]�C��m������)�/�     