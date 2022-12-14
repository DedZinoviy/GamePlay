PGDMP         4            	    z            game_play_db    15.0    15.0 H    Z           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            [           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            \           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ]           1262    16398    game_play_db    DATABASE     ?   CREATE DATABASE game_play_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE game_play_db;
                postgres    false            ?            1259    16413    age_restrictions    TABLE     ?   CREATE TABLE public.age_restrictions (
    idage_restriction bigint NOT NULL,
    russian character varying[],
    motion_picture character varying[]
);
 $   DROP TABLE public.age_restrictions;
       public         heap    postgres    false            ?            1259    16452    critic_review    TABLE     ?   CREATE TABLE public.critic_review (
    idcritic_review bigint NOT NULL,
    text character varying[] NOT NULL,
    idauthor bigint NOT NULL,
    idgame bigint NOT NULL
);
 !   DROP TABLE public.critic_review;
       public         heap    postgres    false            ?            1259    16420    games    TABLE     ?   CREATE TABLE public.games (
    idgame bigint NOT NULL,
    title character varying[] NOT NULL,
    annotation character varying[],
    release_date date NOT NULL,
    idage_restriction bigint
);
    DROP TABLE public.games;
       public         heap    postgres    false            ?            1259    16406    genres    TABLE     Z   CREATE TABLE public.genres (
    idgenre bigint NOT NULL,
    name character varying[]
);
    DROP TABLE public.genres;
       public         heap    postgres    false            ?            1259    16427    genres_to_games    TABLE     d   CREATE TABLE public.genres_to_games (
    game_idgame bigint NOT NULL,
    genres_idgenre bigint
);
 #   DROP TABLE public.genres_to_games;
       public         heap    postgres    false            ?            1259    16440    news    TABLE     ?   CREATE TABLE public.news (
    idnew bigint NOT NULL,
    title character varying[] NOT NULL,
    contain_text character varying[],
    iduser bigint NOT NULL
);
    DROP TABLE public.news;
       public         heap    postgres    false            ?            1259    16447    ratings    TABLE     ?   CREATE TABLE public.ratings (
    iduser bigint NOT NULL,
    idgame bigint NOT NULL,
    plot integer NOT NULL,
    action integer NOT NULL,
    effects integer NOT NULL,
    gameplay integer NOT NULL
);
    DROP TABLE public.ratings;
       public         heap    postgres    false            ?            1259    16399    studios    TABLE     ?   CREATE TABLE public.studios (
    idstudio bigint NOT NULL,
    name character varying[],
    information character varying[]
);
    DROP TABLE public.studios;
       public         heap    postgres    false            ?            1259    16430    studios_to_games    TABLE     q   CREATE TABLE public.studios_to_games (
    studios_idstudio bigint NOT NULL,
    games_idgame bigint NOT NULL
);
 $   DROP TABLE public.studios_to_games;
       public         heap    postgres    false            ?            1259    16433    users    TABLE     ?   CREATE TABLE public.users (
    iduser bigint NOT NULL,
    login character varying[] NOT NULL,
    password character varying[] NOT NULL,
    email character varying[] NOT NULL,
    birth_date date,
    is_verificied smallint NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            P          0    16413    age_restrictions 
   TABLE DATA           V   COPY public.age_restrictions (idage_restriction, russian, motion_picture) FROM stdin;
    public          postgres    false    216   ?e       W          0    16452    critic_review 
   TABLE DATA           P   COPY public.critic_review (idcritic_review, text, idauthor, idgame) FROM stdin;
    public          postgres    false    223   ?e       Q          0    16420    games 
   TABLE DATA           [   COPY public.games (idgame, title, annotation, release_date, idage_restriction) FROM stdin;
    public          postgres    false    217   ?e       O          0    16406    genres 
   TABLE DATA           /   COPY public.genres (idgenre, name) FROM stdin;
    public          postgres    false    215   ?e       R          0    16427    genres_to_games 
   TABLE DATA           F   COPY public.genres_to_games (game_idgame, genres_idgenre) FROM stdin;
    public          postgres    false    218   f       U          0    16440    news 
   TABLE DATA           B   COPY public.news (idnew, title, contain_text, iduser) FROM stdin;
    public          postgres    false    221   $f       V          0    16447    ratings 
   TABLE DATA           R   COPY public.ratings (iduser, idgame, plot, action, effects, gameplay) FROM stdin;
    public          postgres    false    222   Af       N          0    16399    studios 
   TABLE DATA           >   COPY public.studios (idstudio, name, information) FROM stdin;
    public          postgres    false    214   ^f       S          0    16430    studios_to_games 
   TABLE DATA           J   COPY public.studios_to_games (studios_idstudio, games_idgame) FROM stdin;
    public          postgres    false    219   {f       T          0    16433    users 
   TABLE DATA           Z   COPY public.users (iduser, login, password, email, birth_date, is_verificied) FROM stdin;
    public          postgres    false    220   ?f       ?           2606    16419 &   age_restrictions age_restrictions_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.age_restrictions
    ADD CONSTRAINT age_restrictions_pkey PRIMARY KEY (idage_restriction);
 P   ALTER TABLE ONLY public.age_restrictions DROP CONSTRAINT age_restrictions_pkey;
       public            postgres    false    216            ?           2606    16458     critic_review critic_review_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_pkey PRIMARY KEY (idcritic_review);
 J   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_pkey;
       public            postgres    false    223            ?           2606    16426    games games_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (idgame);
 :   ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
       public            postgres    false    217            ?           2606    16412    genres genres_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (idgenre);
 <   ALTER TABLE ONLY public.genres DROP CONSTRAINT genres_pkey;
       public            postgres    false    215            ?           2606    16446    news news_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (idnew);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    221            ?           2606    16451    ratings ratings_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (iduser, idgame);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            postgres    false    222    222            ?           2606    16405    studios studios_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.studios
    ADD CONSTRAINT studios_pkey PRIMARY KEY (idstudio);
 >   ALTER TABLE ONLY public.studios DROP CONSTRAINT studios_pkey;
       public            postgres    false    214            ?           2606    16439    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (iduser);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            ?           2606    16499 )   critic_review critic_review_idauthor_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_idauthor_fkey FOREIGN KEY (idauthor) REFERENCES public.users(iduser) NOT VALID;
 S   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_idauthor_fkey;
       public          postgres    false    220    3217    223            ?           2606    16549 *   critic_review critic_review_idauthor_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_idauthor_fkey1 FOREIGN KEY (idauthor) REFERENCES public.users(iduser) NOT VALID;
 T   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_idauthor_fkey1;
       public          postgres    false    220    223    3217            ?           2606    16599 *   critic_review critic_review_idauthor_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_idauthor_fkey2 FOREIGN KEY (idauthor) REFERENCES public.users(iduser) NOT VALID;
 T   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_idauthor_fkey2;
       public          postgres    false    220    223    3217            ?           2606    16649 *   critic_review critic_review_idauthor_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_idauthor_fkey3 FOREIGN KEY (idauthor) REFERENCES public.users(iduser) NOT VALID;
 T   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_idauthor_fkey3;
       public          postgres    false    223    220    3217            ?           2606    16504 '   critic_review critic_review_idgame_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_idgame_fkey FOREIGN KEY (idgame) REFERENCES public.games(idgame) NOT VALID;
 Q   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_idgame_fkey;
       public          postgres    false    3215    223    217            ?           2606    16554 (   critic_review critic_review_idgame_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_idgame_fkey1 FOREIGN KEY (idgame) REFERENCES public.games(idgame) NOT VALID;
 R   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_idgame_fkey1;
       public          postgres    false    217    3215    223            ?           2606    16604 (   critic_review critic_review_idgame_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_idgame_fkey2 FOREIGN KEY (idgame) REFERENCES public.games(idgame) NOT VALID;
 R   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_idgame_fkey2;
       public          postgres    false    223    217    3215            ?           2606    16654 (   critic_review critic_review_idgame_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.critic_review
    ADD CONSTRAINT critic_review_idgame_fkey3 FOREIGN KEY (idgame) REFERENCES public.games(idgame) NOT VALID;
 R   ALTER TABLE ONLY public.critic_review DROP CONSTRAINT critic_review_idgame_fkey3;
       public          postgres    false    223    217    3215            ?           2606    16459 "   games games_idage_restriction_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_idage_restriction_fkey FOREIGN KEY (idage_restriction) REFERENCES public.age_restrictions(idage_restriction) NOT VALID;
 L   ALTER TABLE ONLY public.games DROP CONSTRAINT games_idage_restriction_fkey;
       public          postgres    false    216    217    3213            ?           2606    16509 #   games games_idage_restriction_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_idage_restriction_fkey1 FOREIGN KEY (idage_restriction) REFERENCES public.age_restrictions(idage_restriction) NOT VALID;
 M   ALTER TABLE ONLY public.games DROP CONSTRAINT games_idage_restriction_fkey1;
       public          postgres    false    3213    217    216            ?           2606    16559 #   games games_idage_restriction_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_idage_restriction_fkey2 FOREIGN KEY (idage_restriction) REFERENCES public.age_restrictions(idage_restriction) NOT VALID;
 M   ALTER TABLE ONLY public.games DROP CONSTRAINT games_idage_restriction_fkey2;
       public          postgres    false    217    216    3213            ?           2606    16609 #   games games_idage_restriction_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_idage_restriction_fkey3 FOREIGN KEY (idage_restriction) REFERENCES public.age_restrictions(idage_restriction) NOT VALID;
 M   ALTER TABLE ONLY public.games DROP CONSTRAINT games_idage_restriction_fkey3;
       public          postgres    false    216    217    3213            ?           2606    16464 0   genres_to_games genres_to_games_game_idgame_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genres_to_games
    ADD CONSTRAINT genres_to_games_game_idgame_fkey FOREIGN KEY (game_idgame) REFERENCES public.games(idgame) NOT VALID;
 Z   ALTER TABLE ONLY public.genres_to_games DROP CONSTRAINT genres_to_games_game_idgame_fkey;
       public          postgres    false    217    3215    218            ?           2606    16514 1   genres_to_games genres_to_games_game_idgame_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genres_to_games
    ADD CONSTRAINT genres_to_games_game_idgame_fkey1 FOREIGN KEY (game_idgame) REFERENCES public.games(idgame) NOT VALID;
 [   ALTER TABLE ONLY public.genres_to_games DROP CONSTRAINT genres_to_games_game_idgame_fkey1;
       public          postgres    false    218    3215    217            ?           2606    16564 1   genres_to_games genres_to_games_game_idgame_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genres_to_games
    ADD CONSTRAINT genres_to_games_game_idgame_fkey2 FOREIGN KEY (game_idgame) REFERENCES public.games(idgame) NOT VALID;
 [   ALTER TABLE ONLY public.genres_to_games DROP CONSTRAINT genres_to_games_game_idgame_fkey2;
       public          postgres    false    217    3215    218            ?           2606    16614 1   genres_to_games genres_to_games_game_idgame_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genres_to_games
    ADD CONSTRAINT genres_to_games_game_idgame_fkey3 FOREIGN KEY (game_idgame) REFERENCES public.games(idgame) NOT VALID;
 [   ALTER TABLE ONLY public.genres_to_games DROP CONSTRAINT genres_to_games_game_idgame_fkey3;
       public          postgres    false    3215    218    217            ?           2606    16469 3   genres_to_games genres_to_games_genres_idgenre_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genres_to_games
    ADD CONSTRAINT genres_to_games_genres_idgenre_fkey FOREIGN KEY (genres_idgenre) REFERENCES public.genres(idgenre) NOT VALID;
 ]   ALTER TABLE ONLY public.genres_to_games DROP CONSTRAINT genres_to_games_genres_idgenre_fkey;
       public          postgres    false    215    3211    218            ?           2606    16519 4   genres_to_games genres_to_games_genres_idgenre_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genres_to_games
    ADD CONSTRAINT genres_to_games_genres_idgenre_fkey1 FOREIGN KEY (genres_idgenre) REFERENCES public.genres(idgenre) NOT VALID;
 ^   ALTER TABLE ONLY public.genres_to_games DROP CONSTRAINT genres_to_games_genres_idgenre_fkey1;
       public          postgres    false    215    218    3211            ?           2606    16569 4   genres_to_games genres_to_games_genres_idgenre_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genres_to_games
    ADD CONSTRAINT genres_to_games_genres_idgenre_fkey2 FOREIGN KEY (genres_idgenre) REFERENCES public.genres(idgenre) NOT VALID;
 ^   ALTER TABLE ONLY public.genres_to_games DROP CONSTRAINT genres_to_games_genres_idgenre_fkey2;
       public          postgres    false    215    3211    218            ?           2606    16619 4   genres_to_games genres_to_games_genres_idgenre_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.genres_to_games
    ADD CONSTRAINT genres_to_games_genres_idgenre_fkey3 FOREIGN KEY (genres_idgenre) REFERENCES public.genres(idgenre) NOT VALID;
 ^   ALTER TABLE ONLY public.genres_to_games DROP CONSTRAINT genres_to_games_genres_idgenre_fkey3;
       public          postgres    false    3211    215    218            ?           2606    16484    news news_idnew_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_idnew_fkey FOREIGN KEY (idnew) REFERENCES public.users(iduser) NOT VALID;
 >   ALTER TABLE ONLY public.news DROP CONSTRAINT news_idnew_fkey;
       public          postgres    false    220    3217    221            ?           2606    16534    news news_idnew_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_idnew_fkey1 FOREIGN KEY (idnew) REFERENCES public.users(iduser) NOT VALID;
 ?   ALTER TABLE ONLY public.news DROP CONSTRAINT news_idnew_fkey1;
       public          postgres    false    221    3217    220            ?           2606    16584    news news_idnew_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_idnew_fkey2 FOREIGN KEY (idnew) REFERENCES public.users(iduser) NOT VALID;
 ?   ALTER TABLE ONLY public.news DROP CONSTRAINT news_idnew_fkey2;
       public          postgres    false    220    3217    221            ?           2606    16634    news news_idnew_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_idnew_fkey3 FOREIGN KEY (idnew) REFERENCES public.users(iduser) NOT VALID;
 ?   ALTER TABLE ONLY public.news DROP CONSTRAINT news_idnew_fkey3;
       public          postgres    false    3217    221    220            ?           2606    16494    ratings ratings_idgame_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_idgame_fkey FOREIGN KEY (idgame) REFERENCES public.games(idgame) NOT VALID;
 E   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_idgame_fkey;
       public          postgres    false    217    222    3215            ?           2606    16544    ratings ratings_idgame_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_idgame_fkey1 FOREIGN KEY (idgame) REFERENCES public.games(idgame) NOT VALID;
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_idgame_fkey1;
       public          postgres    false    222    3215    217            ?           2606    16594    ratings ratings_idgame_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_idgame_fkey2 FOREIGN KEY (idgame) REFERENCES public.games(idgame) NOT VALID;
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_idgame_fkey2;
       public          postgres    false    222    217    3215            ?           2606    16644    ratings ratings_idgame_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_idgame_fkey3 FOREIGN KEY (idgame) REFERENCES public.games(idgame) NOT VALID;
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_idgame_fkey3;
       public          postgres    false    217    3215    222            ?           2606    16489    ratings ratings_iduser_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_iduser_fkey FOREIGN KEY (iduser) REFERENCES public.users(iduser) NOT VALID;
 E   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_iduser_fkey;
       public          postgres    false    220    3217    222            ?           2606    16539    ratings ratings_iduser_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_iduser_fkey1 FOREIGN KEY (iduser) REFERENCES public.users(iduser) NOT VALID;
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_iduser_fkey1;
       public          postgres    false    220    222    3217            ?           2606    16589    ratings ratings_iduser_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_iduser_fkey2 FOREIGN KEY (iduser) REFERENCES public.users(iduser) NOT VALID;
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_iduser_fkey2;
       public          postgres    false    220    222    3217            ?           2606    16639    ratings ratings_iduser_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_iduser_fkey3 FOREIGN KEY (iduser) REFERENCES public.users(iduser) NOT VALID;
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_iduser_fkey3;
       public          postgres    false    222    3217    220            ?           2606    16479 3   studios_to_games studios_to_games_games_idgame_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.studios_to_games
    ADD CONSTRAINT studios_to_games_games_idgame_fkey FOREIGN KEY (games_idgame) REFERENCES public.games(idgame) NOT VALID;
 ]   ALTER TABLE ONLY public.studios_to_games DROP CONSTRAINT studios_to_games_games_idgame_fkey;
       public          postgres    false    3215    217    219            ?           2606    16529 4   studios_to_games studios_to_games_games_idgame_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.studios_to_games
    ADD CONSTRAINT studios_to_games_games_idgame_fkey1 FOREIGN KEY (games_idgame) REFERENCES public.games(idgame) NOT VALID;
 ^   ALTER TABLE ONLY public.studios_to_games DROP CONSTRAINT studios_to_games_games_idgame_fkey1;
       public          postgres    false    219    3215    217            ?           2606    16579 4   studios_to_games studios_to_games_games_idgame_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.studios_to_games
    ADD CONSTRAINT studios_to_games_games_idgame_fkey2 FOREIGN KEY (games_idgame) REFERENCES public.games(idgame) NOT VALID;
 ^   ALTER TABLE ONLY public.studios_to_games DROP CONSTRAINT studios_to_games_games_idgame_fkey2;
       public          postgres    false    3215    219    217            ?           2606    16629 4   studios_to_games studios_to_games_games_idgame_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.studios_to_games
    ADD CONSTRAINT studios_to_games_games_idgame_fkey3 FOREIGN KEY (games_idgame) REFERENCES public.games(idgame) NOT VALID;
 ^   ALTER TABLE ONLY public.studios_to_games DROP CONSTRAINT studios_to_games_games_idgame_fkey3;
       public          postgres    false    3215    217    219            ?           2606    16474 7   studios_to_games studios_to_games_studios_idstudio_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.studios_to_games
    ADD CONSTRAINT studios_to_games_studios_idstudio_fkey FOREIGN KEY (studios_idstudio) REFERENCES public.studios(idstudio) NOT VALID;
 a   ALTER TABLE ONLY public.studios_to_games DROP CONSTRAINT studios_to_games_studios_idstudio_fkey;
       public          postgres    false    219    214    3209            ?           2606    16524 8   studios_to_games studios_to_games_studios_idstudio_fkey1    FK CONSTRAINT     ?   ALTER TABLE ONLY public.studios_to_games
    ADD CONSTRAINT studios_to_games_studios_idstudio_fkey1 FOREIGN KEY (studios_idstudio) REFERENCES public.studios(idstudio) NOT VALID;
 b   ALTER TABLE ONLY public.studios_to_games DROP CONSTRAINT studios_to_games_studios_idstudio_fkey1;
       public          postgres    false    3209    219    214            ?           2606    16574 8   studios_to_games studios_to_games_studios_idstudio_fkey2    FK CONSTRAINT     ?   ALTER TABLE ONLY public.studios_to_games
    ADD CONSTRAINT studios_to_games_studios_idstudio_fkey2 FOREIGN KEY (studios_idstudio) REFERENCES public.studios(idstudio) NOT VALID;
 b   ALTER TABLE ONLY public.studios_to_games DROP CONSTRAINT studios_to_games_studios_idstudio_fkey2;
       public          postgres    false    3209    219    214            ?           2606    16624 8   studios_to_games studios_to_games_studios_idstudio_fkey3    FK CONSTRAINT     ?   ALTER TABLE ONLY public.studios_to_games
    ADD CONSTRAINT studios_to_games_studios_idstudio_fkey3 FOREIGN KEY (studios_idstudio) REFERENCES public.studios(idstudio) NOT VALID;
 b   ALTER TABLE ONLY public.studios_to_games DROP CONSTRAINT studios_to_games_studios_idstudio_fkey3;
       public          postgres    false    219    214    3209            P      x?????? ? ?      W      x?????? ? ?      Q      x?????? ? ?      O      x?????? ? ?      R      x?????? ? ?      U      x?????? ? ?      V      x?????? ? ?      N      x?????? ? ?      S      x?????? ? ?      T      x?????? ? ?     