PGDMP                         x            product_database    13beta3    13beta3 $    K           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            L           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            M           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            N           1262    31148    product_database    DATABASE     s   CREATE DATABASE product_database WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Indonesian_Indonesia.1252';
     DROP DATABASE product_database;
                postgres    false            �            1259    32303 	   addresses    TABLE     t  CREATE TABLE public.addresses (
    id integer NOT NULL,
    street character varying(255),
    user_id integer NOT NULL,
    city character varying(255),
    province character varying(255),
    country character varying(255),
    postal_code character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.addresses;
       public         heap    postgres    false            �            1259    32301    addresses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.addresses_id_seq;
       public          postgres    false    207            O           0    0    addresses_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;
          public          postgres    false    206            �            1259    32274 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    product_id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    32272    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    203            P           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    202            �            1259    32282    products    TABLE     N  CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255),
    price bigint,
    description character varying(255),
    vendor_id integer,
    picture character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    product_id integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    32280    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    205            Q           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    204            �            1259    32261    vendors    TABLE     #  CREATE TABLE public.vendors (
    id integer NOT NULL,
    fullname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.vendors;
       public         heap    postgres    false            �            1259    32259    vendors_id_seq    SEQUENCE     �   CREATE SEQUENCE public.vendors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.vendors_id_seq;
       public          postgres    false    201            R           0    0    vendors_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.vendors_id_seq OWNED BY public.vendors.id;
          public          postgres    false    200            �
           2604    32306    addresses id    DEFAULT     l   ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);
 ;   ALTER TABLE public.addresses ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    207    207            �
           2604    32277    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    32285    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            �
           2604    32264 
   vendors id    DEFAULT     h   ALTER TABLE ONLY public.vendors ALTER COLUMN id SET DEFAULT nextval('public.vendors_id_seq'::regclass);
 9   ALTER TABLE public.vendors ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            H          0    32303 	   addresses 
   TABLE DATA           x   COPY public.addresses (id, street, user_id, city, province, country, postal_code, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    207   Y*       D          0    32274 
   categories 
   TABLE DATA           T   COPY public.categories (id, name, product_id, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    203   v*       F          0    32282    products 
   TABLE DATA           z   COPY public.products (id, name, price, description, vendor_id, picture, "createdAt", "updatedAt", product_id) FROM stdin;
    public          postgres    false    205   �*       B          0    32261    vendors 
   TABLE DATA           W   COPY public.vendors (id, fullname, email, phone, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    201   �*       S           0    0    addresses_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.addresses_id_seq', 1, false);
          public          postgres    false    206            T           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          postgres    false    202            U           0    0    products_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.products_id_seq', 1, true);
          public          postgres    false    204            V           0    0    vendors_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.vendors_id_seq', 1, true);
          public          postgres    false    200            �
           2606    32311    addresses addresses_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
       public            postgres    false    207            �
           2606    32279    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    203            �
           2606    32290    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    205            �
           2606    32271    vendors vendors_email_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_email_key UNIQUE (email);
 C   ALTER TABLE ONLY public.vendors DROP CONSTRAINT vendors_email_key;
       public            postgres    false    201            �
           2606    32269    vendors vendors_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.vendors DROP CONSTRAINT vendors_pkey;
       public            postgres    false    201            �
           2606    32312     addresses addresses_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.vendors(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_user_id_fkey;
       public          postgres    false    207    2741    201            �
           2606    32296 !   products products_product_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.products DROP CONSTRAINT products_product_id_fkey;
       public          postgres    false    2743    203    205            �
           2606    32291     products products_vendor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_vendor_id_fkey FOREIGN KEY (vendor_id) REFERENCES public.vendors(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.products DROP CONSTRAINT products_vendor_id_fkey;
       public          postgres    false    201    205    2741            H      x������ � �      D      x������ � �      F   P   x�3�LN�K��,�44 �̼L��BnbFb�!gri�^VA:�������������������������9�?�=... ۀ      B   J   x�3�,M��鹉�9z�����F�@laihai�id`d�k`�k`�`hne`jel�gih�m`�G�+F��� ��.     