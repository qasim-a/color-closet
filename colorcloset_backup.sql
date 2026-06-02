--
-- PostgreSQL database dump
--

\restrict t4bJH87alwLYI69pCAEOTHoHB6JUB3mEjpLhy1ZyReY4GxAB7btRjH5CuoXPf68

-- Dumped from database version 18.3 (Postgres.app)
-- Dumped by pg_dump version 18.3 (Postgres.app)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    brand_name character varying NOT NULL,
    price_value double precision,
    price_text character varying,
    colour_raw character varying,
    colour_normalized character varying,
    colour_hex character varying,
    image_url character varying,
    is_marked_down boolean,
    palette_colors character varying
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
f706a70b2ee1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, brand_name, price_value, price_text, colour_raw, colour_normalized, colour_hex, image_url, is_marked_down, palette_colors) FROM stdin;
900985198	Jeggings H.W	H&M	\N	\N	Khaki green	khaki green	#4f4f45	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399223004.jpg	f	black
902055557	Basic Cool Pants	H&M	\N	\N	Green	forest green	#a5c49e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0404864022.jpg	f	green
902463761	Richie Regular Hood	H&M	\N	\N	Lilac Purple	lilac purple	#563555	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0387843037.jpg	f	purple
902544761	Basic 4pk studs	H&M	\N	\N	White	white	#c2bdba	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0235596002.jpg	f	white
902626296	Rollerneck Blenheim	H&M	\N	\N	Lilac Purple	lilac purple	#422e3f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0495685005.jpg	f	pink
902737161	DERRIDA windstopper tights	H&M	\N	\N	Black	black	#252221	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224521001.jpg	f	black
904978205	Theron (1)	H&M	\N	\N	White	white	#c2c0ba	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347069.jpg	f	white
905851220	Tail tee	H&M	\N	\N	Lilac Purple	lilac purple	#8d7494	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366686023.jpg	f	gray
905916739	NATE  basic S/S solid tee BB	H&M	\N	\N	Blue	cobalt	#cbddec	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0260736025.jpg	f	sky
906824654	Brooke raw cut ss	H&M	\N	\N	Green	forest green	#867c51	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0411413004.jpg	f	yellow
907221794	Bobby elastic waist belt	H&M	\N	\N	Black	black	#1f1d20	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0183815013.jpg	f	black
907600444	Woody(1)	H&M	\N	\N	Lilac Purple	lilac purple	#af9da9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0456163085.jpg	f	gray
907636042	R-Neck Merino Pisa	H&M	\N	\N	Turquoise	turquoise	#426868	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378135026.jpg	f	turquoise
907643709	Billy cargo pants	H&M	\N	\N	Khaki green	khaki green	#494734	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0219075023.jpg	f	yellow
907980593	TP BEN basic crewneck SB	H&M	\N	\N	Green	forest green	#066567	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0413911015.jpg	f	turquoise
908061421	Gary suede micro tote	H&M	\N	\N	Yellow	yellow	#d9a76f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0451704003.jpg	f	beige
908184337	Jerry jogger bottoms	H&M	\N	\N	Grey	gray	#b8b7b4	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/011/0118458004.jpg	f	gray
908394076	CLAY TEE	H&M	\N	\N	Turquoise	turquoise	#8cb8b8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449570055.jpg	f	turquoise
908405519	MAX jersey pants SB	H&M	\N	\N	Green	forest green	#707161	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885026.jpg	f	gray
908544951	Hat Fredrik Paper Straw	H&M	\N	\N	Beige	beige	#b98d55	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0339252009.jpg	f	beige
908942955	Richie Regular Hood	H&M	\N	\N	Orange	orange	#fc8351	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0387843041.jpg	f	orange
909140066	V-Neck Milan TVP	H&M	\N	\N	Mole	mole	#8f7e70	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447028.jpg	f	gray
909335343	Norling Knit	H&M	\N	\N	Grey	gray	#2e2d2f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0216081011.jpg	f	black
909405113	Flirty maja earrings	H&M	\N	\N	Yellow	yellow	#645748	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/047/0478641007.jpg	f	beige
909453554	Dean Drawstring Trousers.	H&M	\N	\N	Blue	cobalt	#231e24	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0212766046.jpg	f	black
909814848	Shaping Skinny H.W	H&M	\N	\N	Green	forest green	#1a1919	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399201002.jpg	f	black
910037005	BEN basic crewneck SB	H&M	\N	\N	Turquoise	turquoise	#abcabf	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0413911021.jpg	f	turquoise
910044923	Basic Hood	H&M	\N	\N	Blue	cobalt	#2b2e3b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244853036.jpg	f	blue
910740617	Nora Cardigan	H&M	\N	\N	Red	red	#432124	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396042.jpg	f	black
911009175	Theron (1)	H&M	\N	\N	Grey	gray	#939190	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347060.jpg	f	gray
911390286	MAX jersey pants SB	H&M	\N	\N	Red	red	#b90723	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885036.jpg	f	burgundy
911644190	Jodi skirt	H&M	\N	\N	Black	black	#1d1c1f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189626001.jpg	f	black
911682096	Howie SS Shirt	H&M	\N	\N	Khaki green	khaki green	#595038	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236018.jpg	f	beige
911907650	Slim Cheapo 79	H&M	\N	\N	Blue	cobalt	#325673	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/015/0156289011.jpg	f	sky
911985273	Omega bag	H&M	\N	\N	Brown	brown	#7c432f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/042/0428454002.jpg	f	brown
912329665	Jersey harem shorts	H&M	\N	\N	Mole	mole	#cac4bb	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0275362021.jpg	f	white
912684960	HARLEY 2-pack basic tee	H&M	\N	\N	Pink	pink	#1c1a1f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0225784044.jpg	f	black
912752860	Basic co/fl cardigan	H&M	\N	\N	Red	red	#ab0421	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0290519019.jpg	f	burgundy
912945936	CLAY TEE	H&M	\N	\N	Turquoise	turquoise	#35576c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449570017.jpg	f	sky
913085155	Malcolm Skinny 5 pocket	H&M	\N	\N	Turquoise	turquoise	#1d5768	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395619012.jpg	f	turquoise
913489696	MIA (1)	H&M	\N	\N	Red	red	#d21130	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395658049.jpg	f	burgundy
913677895	Gigi fake suede p cap	H&M	\N	\N	Pink	pink	#f3458e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0356693020.jpg	f	pink
914043781	VIOLA 2-pack	H&M	\N	\N	White	white	#dfc8c1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395730038.jpg	f	brown
914533105	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Blue	cobalt	#c0d4eb	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071027.jpg	f	sky
914773655	Sebastian braided belt	H&M	\N	\N	Beige	beige	#cfc6b8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0302334003.jpg	f	beige
914888640	Jacket Slim (1)	H&M	\N	\N	White	white	#b2b0ad	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399061023.jpg	f	gray
915104683	Manson SF slim fit blazer	H&M	\N	\N	Black	black	#201f1f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241602003.jpg	f	black
915169779	Skinny Cheapo 89 (1)	H&M	\N	\N	Grey	gray	#777780	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0309864011.jpg	f	gray
915305407	Leon tee	H&M	\N	\N	Orange	orange	#f75a3a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0445419008.jpg	f	red
916155013	Livia Top	H&M	\N	\N	Khaki green	khaki green	#a3a59c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0380609036.jpg	f	gray
916368923	Rita Ringer Tee	H&M	\N	\N	Green	forest green	#caddd6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0379780042.jpg	f	turquoise
916442099	Roman running hood	H&M	\N	\N	Red	red	#47292d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0382127035.jpg	f	black
916845833	Burnie sunglasses	H&M	\N	\N	Orange	orange	#d6cabd	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270382004.jpg	f	beige
917078657	Theron (1)	H&M	\N	\N	Mole	mole	#c09f97	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347063.jpg	f	black
917113776	TP BO basic OH BB	H&M	\N	\N	Yellow	yellow	#bddc6f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443696040.jpg	f	olive
917201625	MILL blocking tights	H&M	\N	\N	Black	black	#2d2e2f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241486015.jpg	f	black
917265406	Olja sunglasses	H&M	\N	\N	Orange	orange	#cd7596	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0220365002.jpg	f	pink
917753199	Hawlin Headband	H&M	\N	\N	Red	red	#39181f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0324502018.jpg	f	burgundy
918065079	GLASSIG ESPADRILLE	H&M	\N	\N	Red	red	#c2253b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0349301032.jpg	f	burgundy
918470914	V-Neck Merino Milan	H&M	\N	\N	Brown	brown	#8c5931	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447023.jpg	f	brown
918542946	GLASSIG ESPADRILLE	H&M	\N	\N	Red	red	#de222f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0349301022.jpg	f	red
918758661	Theron	H&M	\N	\N	Pink	pink	#faa9bf	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347022.jpg	f	burgundy
919147603	T-Shirt Allington R-neck!	H&M	\N	\N	Green	forest green	#1f4544	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386859030.jpg	f	turquoise
919197089	NATE  basic S/S solid tee BB	H&M	\N	\N	Green	forest green	#646f65	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0260736028.jpg	f	gray
919228105	Saya sunglasses	H&M	\N	\N	Yellow	yellow	#64464f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0370594023.jpg	f	pink
919247963	Linni tee (1)	H&M	\N	\N	Yellow	yellow	#fbb555	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/020/0203027048.jpg	f	orange
919349177	Skinny Ankel Denim	H&M	\N	\N	Blue	cobalt	#7fa1bf	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136015.jpg	f	sky
919635348	MAX jersey pants SB	H&M	\N	\N	Yellow	yellow	#e6ab0a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885053.jpg	f	yellow
920051653	Silver lake	H&M	\N	\N	Brown	brown	#c2ac9a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244267027.jpg	f	beige
920634630	Dean Drawstring Trousers.	H&M	\N	\N	Black	black	#221e24	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0212766043.jpg	f	black
921589304	Theron (1)	H&M	\N	\N	Blue	cobalt	#222734	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347035.jpg	f	blue
921739118	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Green	forest green	#03ceb2	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071025.jpg	f	turquoise
921948940	Milla mini pouch	H&M	\N	\N	Lilac Purple	lilac purple	#bb97c9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/052/0522661009.jpg	f	purple
921998213	Kim superskinny low waist	H&M	\N	\N	Khaki green	khaki green	#5e5f51	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0262277026.jpg	f	gray
922051368	Dean Drawstring Trousers.	H&M	\N	\N	Mole	mole	#9f8d7b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0212766042.jpg	f	beige
922400437	Brandon denim cropped	H&M	\N	\N	Blue	cobalt	#638296	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0250457010.jpg	f	sky
922817526	HARLEY 2-pack basic tee	H&M	\N	\N	Black	black	#1b191f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0225784001.jpg	f	black
923054549	Theron (1)	H&M	\N	\N	Lilac Purple	lilac purple	#716573	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347059.jpg	f	gray
923124754	Miracle velvet	H&M	\N	\N	Orange	orange	#ebccb5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/043/0438499003.jpg	f	brown
923312629	Saya sunglasses	H&M	\N	\N	Brown	brown	#664d53	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0370594017.jpg	f	gray
923535713	Billy cargo pants	H&M	\N	\N	Black	black	#232325	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0219075021.jpg	f	black
923622951	PELLE Basic S/S jersey polo SB	H&M	\N	\N	Orange	orange	#f2635e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265069021.jpg	f	red
923707968	Billy cargo pants	H&M	\N	\N	Beige	beige	#c2a385	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0219075028.jpg	f	beige
923752113	Rita Ringer Tee	H&M	\N	\N	Orange	orange	#ecddda	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0379780027.jpg	f	black
924149498	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Red	red	#c70629	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071030.jpg	f	burgundy
924376359	Rodney basic beanie	H&M	\N	\N	White	white	#727175	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0294895011.jpg	f	gray
924684163	Co/fl cardigan	H&M	\N	\N	Blue	cobalt	#21202c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0290519024.jpg	f	blue
924806918	David bow sneaker	H&M	\N	\N	Lilac Purple	lilac purple	#ad94bc	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0507181002.jpg	f	purple
924915547	Clubba sunglasses	H&M	\N	\N	Brown	brown	#5d5856	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270381001.jpg	f	gray
925196191	Jersey harem shorts	H&M	\N	\N	Black	black	#312c2f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0275362022.jpg	f	black
925486695	Pinocchio hat	H&M	\N	\N	Mole	mole	#a6978d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224314016.jpg	f	gray
925500526	HARLEY 2-pack basic tee	H&M	\N	\N	Orange	orange	#f3cebd	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0225784039.jpg	f	orange
925603646	Livia Top	H&M	\N	\N	Pink	pink	#a47571	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0380609010.jpg	f	black
926342655	Pamela tee	H&M	\N	\N	Lilac Purple	lilac purple	#3e2532	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215337038.jpg	f	pink
926459587	Harem trousers	H&M	\N	\N	Black	black	#221f22	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0186372011.jpg	f	black
926685651	Otto Beanie	H&M	\N	\N	Yellow	yellow	#be7134	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315497017.jpg	f	brown
927067562	Central padded coat	H&M	\N	\N	Lilac Purple	lilac purple	#684150	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0509530002.jpg	f	pink
927675548	Nora tee	H&M	\N	\N	Blue	cobalt	#8298a9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189955076.jpg	f	sky
927701225	R-Neck Pisa TVP R	H&M	\N	\N	Green	forest green	#17292b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378135029.jpg	f	turquoise
927924674	BO basic OH BB	H&M	\N	\N	Orange	orange	#f55d43	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443696005.jpg	f	red
928200076	Leila sarong (1)	H&M	\N	\N	Orange	orange	#eec4b8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/042/0425217011.jpg	f	orange
928353696	Theron	H&M	\N	\N	Black	black	#1c1a1b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347004.jpg	f	black
928365333	Carolina sweater (1)	H&M	\N	\N	Black	black	#171717	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189691033.jpg	f	black
928552050	Elsa high waist	H&M	\N	\N	Black	black	#222224	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0254940026.jpg	f	black
928611025	Flora hip belt (1)	H&M	\N	\N	Black	black	#2d2b2b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224606019.jpg	f	black
928781513	Austin basic leather hip belt	H&M	\N	\N	Brown	brown	#99553c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0179950002.jpg	f	brown
928964580	CLAY TEE	H&M	\N	\N	Orange	orange	#d66532	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449570034.jpg	f	orange
929033691	Sigge Dressed Belt	H&M	\N	\N	Brown	brown	#483c39	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337991007.jpg	f	black
929057848	Leia Parka	H&M	\N	\N	Khaki green	khaki green	#a69380	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0393447010.jpg	f	beige
929320723	Basic co/fl cardigan	H&M	\N	\N	Turquoise	turquoise	#6ab0c9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0290519011.jpg	f	sky
929503231	Kattis cat sunglasses	H&M	\N	\N	Khaki green	khaki green	#836559	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0268305008.jpg	f	brown
929705736	Glamping	H&M	\N	\N	Mole	mole	#d6cfc6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0396135049.jpg	f	beige
929715609	Sanne treggings (1)	H&M	\N	\N	Grey	gray	#4a4543	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0299668017.jpg	f	black
929826907	Pelle Beanie	H&M	\N	\N	Green	forest green	#293c33	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0322322016.jpg	f	green
929954274	Lilly Twill Shorts	H&M	\N	\N	White	white	#c0bbb1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0392168032.jpg	f	gray
930020222	MOLLY (1)	H&M	\N	\N	Lilac Purple	lilac purple	#c6bad3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508932043.jpg	f	purple
930236950	Cori cropped hood	H&M	\N	\N	Lilac Purple	lilac purple	#e396ca	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0381038032.jpg	f	pink
930606153	Al Car Shoe	H&M	\N	\N	Brown	brown	#694639	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0264713028.jpg	f	brown
930750316	Cori cropped hood	H&M	\N	\N	Green	forest green	#4f4c3d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0381038018.jpg	f	black
931543432	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Turquoise	turquoise	#b5e1e7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071034.jpg	f	turquoise
932485592	Mr Harrington w/hood	H&M	\N	\N	Khaki green	khaki green	#7f735d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0176209025.jpg	f	beige
932537491	Wolf Scarf	H&M	\N	\N	Khaki green	khaki green	#544739	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315509032.jpg	f	beige
932954985	L/S Polo Gnocci	H&M	\N	\N	Beige	beige	#cdc3b4	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378124014.jpg	f	beige
932994564	Sigge Dressed Belt	H&M	\N	\N	Brown	brown	#6f342a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337991002.jpg	f	red
933120179	Bruce skinny	H&M	\N	\N	Beige	beige	#ded5ce	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0416157013.jpg	f	brown
933167149	Austin basic leather hip belt	H&M	\N	\N	Black	black	#2a292d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0179950001.jpg	f	black
933245001	TP Easy iron L/S shirt	H&M	\N	\N	Red	red	#db232d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337777013.jpg	f	red
933670236	BEN fancy crewneck SB	H&M	\N	\N	Yellow	yellow	#283347	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0311059025.jpg	f	blue
934260047	Bracelet Mixalot Pack CO	H&M	\N	\N	Brown	brown	#3e3839	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0416089002.jpg	f	black
934541167	Maja Cardigan	H&M	\N	\N	Yellow	yellow	#f0a328	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0446224043.jpg	f	yellow
934552033	Jerry jogger bottoms	H&M	\N	\N	Grey	gray	#5a5a5e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/011/0118458003.jpg	f	gray
934571967	Visby stretch	H&M	\N	\N	Turquoise	turquoise	#235264	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0501117006.jpg	f	sky
934660241	Carolina sweater (1)	H&M	\N	\N	Khaki green	khaki green	#80836f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189691075.jpg	f	gray
934861748	Kattis cat sunglasses	H&M	\N	\N	Mole	mole	#b98b74	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0268305007.jpg	f	brown
935291245	Teddy jogger.	H&M	\N	\N	Turquoise	turquoise	#bccdd2	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0488561026.jpg	f	turquoise
935673280	Basic jersey pant 1x1rib	H&M	\N	\N	Pink	pink	#e3d4d4	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0350135017.jpg	f	black
935751955	RILEY T-SHIRT	H&M	\N	\N	Orange	orange	#eebdb5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0341782034.jpg	f	red
935851745	Cool Metal John Round	H&M	\N	\N	Lilac Purple	lilac purple	#b8a6d0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0369796026.jpg	f	purple
935988982	Moscow Cross Bag	H&M	\N	\N	Yellow	yellow	#df9939	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/043/0436570028.jpg	f	beige
936195031	Rita Ringer Tee	H&M	\N	\N	Yellow	yellow	#e5b33c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0379780051.jpg	f	yellow
936271148	Lola RW Denim Shorts	H&M	\N	\N	Turquoise	turquoise	#b1c0cb	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0490113017.jpg	f	sky
936340737	TD Ulrik	H&M	\N	\N	White	white	#b2afa9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0394522001.jpg	f	gray
936416706	Claesson Leather Weekend	H&M	\N	\N	Brown	brown	#45342f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0392126003.jpg	f	brown
936513643	Neo running beanie	H&M	\N	\N	Black	black	#353036	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/019/0192960023.jpg	f	black
936836671	TP MAX jersey pants SB	H&M	\N	\N	Green	forest green	#536c68	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885046.jpg	f	gray
937110725	Otto Beanie	H&M	\N	\N	Khaki green	khaki green	#4f6154	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315497016.jpg	f	gray
937127857	Livia Top	H&M	\N	\N	Khaki green	khaki green	#6f6246	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0380609021.jpg	f	beige
937163837	RILEY T-SHIRT	H&M	\N	\N	Khaki green	khaki green	#787a74	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0341782023.jpg	f	gray
937165847	Tail tee	H&M	\N	\N	White	white	#c0bdb6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366686005.jpg	f	white
937395918	Theron (1)	H&M	\N	\N	Blue	cobalt	#5f75a0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347037.jpg	f	blue
938137240	Sigge shorts	H&M	\N	\N	Khaki green	khaki green	#585449	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0375585024.jpg	f	gray
938350483	Cool Alessa Cat	H&M	\N	\N	Pink	pink	#be9999	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0357792008.jpg	f	black
938504096	Jerry jogger bottoms	H&M	\N	\N	Pink	pink	#e3c0c3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/011/0118458034.jpg	f	red
939028302	Wool Scarf Akira	H&M	\N	\N	Lilac Purple	lilac purple	#31182e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0351098028.jpg	f	pink
939086706	CA Gustavsberg	H&M	\N	\N	Green	forest green	#202e2e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395127030.jpg	f	turquoise
939273529	V-Neck Merino Milan	H&M	\N	\N	Beige	beige	#ccbdb3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447011.jpg	f	brown
939525635	Wales sweater	H&M	\N	\N	Red	red	#361d23	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0302311024.jpg	f	burgundy
939717292	Wales sweater	H&M	\N	\N	Khaki green	khaki green	#35342d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0302311022.jpg	f	black
939825565	Sara long (1)	H&M	\N	\N	Mole	mole	#e2d1c3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0352811027.jpg	f	brown
939948432	V-Neck Milan	H&M	\N	\N	Brown	brown	#844a23	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447033.jpg	f	brown
940340744	PELLE Basic S/S jersey polo SB	H&M	\N	\N	Turquoise	turquoise	#99e0ec	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265069026.jpg	f	turquoise
941030872	CHRISTINA BOOT	H&M	\N	\N	Orange	orange	#f4dac7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0401729003.jpg	f	brown
941057035	NATE  basic S/S solid tee BB	H&M	\N	\N	Green	forest green	#03d0b5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0260736030.jpg	f	turquoise
941090127	Lizzie	H&M	\N	\N	Blue	cobalt	#393a48	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0257667061.jpg	f	black
941254856	Nora Cardigan	H&M	\N	\N	Beige	beige	#d8bbb0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396010.jpg	f	brown
941859435	Kevin softshell jacket (1)	H&M	\N	\N	Blue	cobalt	#29303d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0282832014.jpg	f	blue
941884392	Dorian l/s basic	H&M	\N	\N	Grey	gray	#4d4d52	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/014/0145872053.jpg	f	gray
941912053	Jerry jogger bottoms	H&M	\N	\N	Lilac Purple	lilac purple	#6b707d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/011/0118458039.jpg	f	gray
942056840	Basic LS Raglan t-shirt	H&M	\N	\N	Pink	pink	#e2d1d1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0354246017.jpg	f	black
942120508	SUPREME FANCY TIGHTS	H&M	\N	\N	Turquoise	turquoise	#202223	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0498738034.jpg	f	black
942345921	Mr Harrington w/hood	H&M	\N	\N	Brown	brown	#a6684d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0176209033.jpg	f	brown
942370887	LARISSA hood	H&M	\N	\N	Lilac Purple	lilac purple	#733959	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0487750005.jpg	f	pink
942423083	Leon tee	H&M	\N	\N	Brown	brown	#4c2f26	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0445419011.jpg	f	brown
942494689	Canyan shorts C	H&M	\N	\N	Yellow	yellow	#fcab3a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0491036012.jpg	f	orange
942608891	Rut Jumper	H&M	\N	\N	Mole	mole	#ae9189	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0411013007.jpg	f	black
942779595	Reggie solid chino shorts	H&M	\N	\N	Beige	beige	#f2eee2	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366859024.jpg	f	yellow
942944640	Basic cotton fleece leggings	H&M	\N	\N	Red	red	#d60429	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318914007.jpg	f	burgundy
943897408	Basic jersey pant 1x1rib	H&M	\N	\N	Pink	pink	#f1d4d0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0350135015.jpg	f	red
944299662	Eva chelsea boot	H&M	\N	\N	Brown	brown	#75483b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0181160009.jpg	f	brown
944332134	Tom shorts	H&M	\N	\N	Turquoise	turquoise	#166d95	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508640010.jpg	f	sky
944517645	Harry sneakerboot SB	H&M	\N	\N	Yellow	yellow	#d18b46	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0497915003.jpg	f	brown
944556679	BEN basic crewneck SB	H&M	\N	\N	Turquoise	turquoise	#084c5b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0413911030.jpg	f	turquoise
944699973	Easy iron L/S shirt  TP	H&M	\N	\N	White	white	#b7b4b1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337777001.jpg	f	gray
944713559	Beanie Pelle wool mix	H&M	\N	\N	Beige	beige	#9a6b41	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0322322014.jpg	f	brown
944760753	JESSY SKIRT	H&M	\N	\N	Green	forest green	#094349	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0356289076.jpg	f	turquoise
945145432	MILL blocking tights	H&M	\N	\N	Black	black	#221f1b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241486016.jpg	f	black
945306056	Pierre Beanie	H&M	\N	\N	Grey	gray	#4f4f56	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315987005.jpg	f	gray
945647893	Theron (1)	H&M	\N	\N	Orange	orange	#e8b9a9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347031.jpg	f	orange
945940470	Silver lake	H&M	\N	\N	Black	black	#b4b3b5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244267032.jpg	f	gray
946302312	Silver lake	H&M	\N	\N	Blue	cobalt	#21212b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244267001.jpg	f	black
946487999	Rufus 5-pkt trousers	H&M	\N	\N	Brown	brown	#5a3525	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0451243013.jpg	f	brown
946538250	Woody(1)	H&M	\N	\N	Green	forest green	#6f7970	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0456163051.jpg	f	gray
946554711	Nilsson Top	H&M	\N	\N	Lilac Purple	lilac purple	#83506a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0485973034.jpg	f	pink
946588717	Mr Harrington w/hood	H&M	\N	\N	Brown	brown	#b8752c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0176209044.jpg	f	beige
946731873	Wolf Scarf	H&M	\N	\N	Green	forest green	#0d303b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315509036.jpg	f	turquoise
946806766	Howie SS Shirt	H&M	\N	\N	Lilac Purple	lilac purple	#d8bcda	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236020.jpg	f	purple
946899479	Skinny Ankle R.W Brooklyn	H&M	\N	\N	White	white	#cac7bc	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399256005.jpg	f	white
947153853	JOAN SUEDE BOOT	H&M	\N	\N	Brown	brown	#916042	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0320880001.jpg	f	brown
947207454	TUNIS ls 2p (1)	H&M	\N	\N	Green	forest green	#22444b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/046/0463601016.jpg	f	turquoise
947263887	TP BO basic OH BB	H&M	\N	\N	Orange	orange	#f67734	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443696060.jpg	f	orange
947318674	Manson SF slim fit blazer	H&M	\N	\N	Grey	gray	#787273	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241602018.jpg	f	gray
947373923	Tail tee	H&M	\N	\N	Pink	pink	#f0d2da	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366686022.jpg	f	burgundy
947423871	Lima ss	H&M	\N	\N	Orange	orange	#e0c9c2	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0306307043.jpg	f	brown
947472569	Linni tee (1)	H&M	\N	\N	White	white	#ded7cd	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/020/0203027045.jpg	f	beige
947633948	FORTUNA T-SHIRT	H&M	\N	\N	Grey	gray	#2b3245	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0304576027.jpg	f	blue
947663535	Howie SS Shirt	H&M	\N	\N	Turquoise	turquoise	#d3e7e7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236023.jpg	f	turquoise
947700115	Mary Kate L/S	H&M	\N	\N	Khaki green	khaki green	#646853	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0348870006.jpg	f	gray
948036454	V-Neck Merino Milan	H&M	\N	\N	Turquoise	turquoise	#456567	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447021.jpg	f	turquoise
948055432	Didi denim	H&M	\N	\N	Black	black	#1c1a1e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0252298002.jpg	f	black
948057839	MIA	H&M	\N	\N	Red	red	#5a2839	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395658033.jpg	f	pink
949388761	Lima ss	H&M	\N	\N	Pink	pink	#f1dfd7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0306307019.jpg	f	brown
949594734	Zoe Sweater	H&M	\N	\N	Green	forest green	#4c4835	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/043/0438333016.jpg	f	yellow
949860209	Peggy polo	H&M	\N	\N	Grey	gray	#b0afb3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0316085002.jpg	f	gray
949873186	Sigge Dressed Belt	H&M	\N	\N	Brown	brown	#413634	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337991009.jpg	f	black
950004868	Vegas (W)	H&M	\N	\N	Orange	orange	#f5dad3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0403994006.jpg	f	orange
950116580	MAX jersey pants SB	H&M	\N	\N	Green	forest green	#098a62	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885054.jpg	f	turquoise
950610419	Mimmie	H&M	\N	\N	Lilac Purple	lilac purple	#af98a0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0507533001.jpg	f	gray
950676759	Cora T-shirt	H&M	\N	\N	Yellow	yellow	#f9c277	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0294008042.jpg	f	beige
950710975	Danae jeans	H&M	\N	\N	Red	red	#49282d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0252298006.jpg	f	burgundy
950712229	Flirty Chantal earring	H&M	\N	\N	Pink	pink	#821f3b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292453031.jpg	f	burgundy
950845515	Pinocchio hat	H&M	\N	\N	Grey	gray	#bab7b6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224314017.jpg	f	gray
951153246	BEN polo	H&M	\N	\N	Turquoise	turquoise	#acd7e3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508543022.jpg	f	turquoise
951288359	SIRPA	H&M	\N	\N	Yellow	yellow	#d59313	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0501820004.jpg	f	yellow
951456259	Clubba sunglasses	H&M	\N	\N	Black	black	#70717a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270381003.jpg	f	gray
951493494	MARION-SHORTS	H&M	\N	\N	Turquoise	turquoise	#076b6c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0452898024.jpg	f	turquoise
951906919	Classic Vesper watch	H&M	\N	\N	Beige	beige	#e0d0c1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0417427007.jpg	f	beige
952077682	Superskinny	H&M	\N	\N	Blue	cobalt	#1d212b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0300024009.jpg	f	blue
952542092	Heath	H&M	\N	\N	Turquoise	turquoise	#3e4a51	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0491913022.jpg	f	black
952939158	Pierre Beanie	H&M	\N	\N	White	white	#33343a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315987004.jpg	f	black
953099301	KIMBERLY Braided Headband	H&M	\N	\N	Pink	pink	#c19a90	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318066016.jpg	f	brown
953118412	Maria Shorts	H&M	\N	\N	Grey	gray	#3d383f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0307656023.jpg	f	black
953343010	TP TOBIE l/s SB 3-p	H&M	\N	\N	Turquoise	turquoise	#aacbd4	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0503569029.jpg	f	turquoise
903156396	Carolina sweater (1)	H&M	\N	\N	Orange	orange	#edcfca	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189691067.jpg	f	red
914251084	Jerry jogger bottoms	H&M	\N	\N	Black	black	#28272c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/011/0118458028.jpg	f	black
953360959	Basic LS Raglan t-shirt	H&M	\N	\N	Turquoise	turquoise	#b0c5c8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0354246019.jpg	f	turquoise
953491886	Wet Tee (1)	H&M	\N	\N	Lilac Purple	lilac purple	#7e5656	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0507431007.jpg	f	black
953959545	Super skinny denim	H&M	\N	\N	White	white	#cbc5b8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0300024037.jpg	f	beige
954132313	Reggie chino shorts	H&M	\N	\N	Beige	beige	#ceb39e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366859017.jpg	f	brown
954526310	Zero Tee	H&M	\N	\N	Lilac Purple	lilac purple	#897a93	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449263038.jpg	f	gray
954674907	Shaping Skinny R.W	H&M	\N	\N	White	white	#bbb8b8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399136047.jpg	f	white
954915189	Basic Hood	H&M	\N	\N	Grey	gray	#adacaa	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244853002.jpg	f	gray
955027366	Silver lake	H&M	\N	\N	Pink	pink	#e9d2cc	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244267017.jpg	f	brown
955327239	Leia Parka	H&M	\N	\N	Khaki green	khaki green	#696857	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0393447016.jpg	f	gray
955564719	Manson SF slim fit blazer	H&M	\N	\N	Blue	cobalt	#505c7e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241602027.jpg	f	blue
956218189	Howie SS Shirt	H&M	\N	\N	Yellow	yellow	#ebe1c8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236022.jpg	f	yellow
956226970	Basic cotton fleece leggings	H&M	\N	\N	Grey	gray	#b5b3af	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318914016.jpg	f	gray
956375766	Dorian l/s basic	H&M	\N	\N	Grey	gray	#4f4f51	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/014/0145872037.jpg	f	gray
956630958	Pablo coat	H&M	\N	\N	Beige	beige	#bd906b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0312878010.jpg	f	brown
956762381	Karla sunglasses	H&M	\N	\N	Brown	brown	#996e5c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0376172001.jpg	f	brown
956862552	Redford hood	H&M	\N	\N	Lilac Purple	lilac purple	#3e2a34	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/052/0524959004.jpg	f	pink
957021122	Karenina Jacket	H&M	\N	\N	Mole	mole	#806c5b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0316657013.jpg	f	beige
957488660	Frode outdoor beanie	H&M	\N	\N	Grey	gray	#5d5a61	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/020/0204892024.jpg	f	gray
957525063	Skinny Ankel Denim	H&M	\N	\N	Blue	cobalt	#364f6a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136034.jpg	f	sky
957640345	Mimmi sneaker	H&M	\N	\N	White	white	#b1b0ad	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0212042070.jpg	f	gray
957668449	GLASSIG ESPADRILLE	H&M	\N	\N	Pink	pink	#c5a89e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0349301024.jpg	f	brown
957680011	Skinny Ankel Denim	H&M	\N	\N	Blue	cobalt	#394a64	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136020.jpg	f	sky
957758931	Gauss windproof zip top	H&M	\N	\N	Black	black	#282426	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0225286014.jpg	f	black
957765969	GLASSIG ESPADRILLE	H&M	\N	\N	Yellow	yellow	#d7b653	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0349301016.jpg	f	yellow
957780136	HARLEY 2-pack basic tee	H&M	\N	\N	Blue	cobalt	#fcbccc	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0225784037.jpg	f	burgundy
957831725	Cobra Tube.	H&M	\N	\N	Red	red	#6f353a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0312829006.jpg	f	black
957833707	SULIMA jkt	H&M	\N	\N	Lilac Purple	lilac purple	#62555c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0498620007.jpg	f	gray
958087784	KIMBERLY Braided Headband	H&M	\N	\N	Grey	gray	#8a8d91	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318066006.jpg	f	gray
958147510	Howie SS Shirt	H&M	\N	\N	Blue	cobalt	#b1b3b5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236014.jpg	f	gray
958307721	BEN basic crewneck SB	H&M	\N	\N	Yellow	yellow	#dab577	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0413911036.jpg	f	beige
958636839	V-Neck Milan TVP	H&M	\N	\N	Red	red	#3a181d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447029.jpg	f	burgundy
958677340	T-Shirt Allington R-neck!	H&M	\N	\N	Red	red	#db2826	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386859029.jpg	f	red
959048338	Raven skirt	H&M	\N	\N	Red	red	#df0220	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189654046.jpg	f	burgundy
959308216	Mr Harrington w/hood	H&M	\N	\N	Black	black	#3e3736	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0176209023.jpg	f	black
959323836	ANYA vest	H&M	\N	\N	Turquoise	turquoise	#415a65	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0498621001.jpg	f	sky
959356846	Dorian l/s basic	H&M	\N	\N	Black	black	#1c1b1b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/014/0145872001.jpg	f	black
959870682	Lima ss	H&M	\N	\N	Pink	pink	#572533	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0306307005.jpg	f	burgundy
959962501	Sunglasses Hendrix	H&M	\N	\N	Yellow	yellow	#cfc26e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0406724027.jpg	f	yellow
960120537	V-Neck Milan TVP	H&M	\N	\N	Brown	brown	#804522	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447046.jpg	f	brown
960200454	Dorian l/s basic	H&M	\N	\N	White	white	#bababe	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/014/0145872043.jpg	f	white
960379563	BRAX shorts	H&M	\N	\N	Turquoise	turquoise	#b2dfe6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0487800053.jpg	f	turquoise
960392225	Maria Shorts	H&M	\N	\N	Khaki green	khaki green	#6d684f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0307656029.jpg	f	yellow
960544740	Richie Regular Hood	H&M	\N	\N	Red	red	#f01e36	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0387843034.jpg	f	red
960672865	Mr Harrington w/hood	H&M	\N	\N	Grey	gray	#9e9a9c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0176209035.jpg	f	gray
961102359	Cool Betty earring pk	H&M	\N	\N	Orange	orange	#e2c7ba	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386463006.jpg	f	brown
961218152	Izzy t-shirt	H&M	\N	\N	Turquoise	turquoise	#7b8185	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0493425007.jpg	f	gray
961236641	Mary Kate L/S	H&M	\N	\N	Khaki green	khaki green	#7b806b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0348870008.jpg	f	gray
961317421	Moscow Cross Bag	H&M	\N	\N	Yellow	yellow	#e09205	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/043/0436570021.jpg	f	yellow
961369430	PELLE Basic S/S jersey polo SB	H&M	\N	\N	Green	forest green	#10d5c8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265069020.jpg	f	turquoise
961386938	Bob v-neck tee	H&M	\N	\N	Black	black	#1e1a19	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215248002.jpg	f	black
961426909	Matt black SF regular fit blz	H&M	\N	\N	Black	black	#242121	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241590001.jpg	f	black
961526163	Danae jeans	H&M	\N	\N	White	white	#bab6aa	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0252298014.jpg	f	gray
961770940	Pinocchio hat	H&M	\N	\N	Black	black	#1e1c1f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224314007.jpg	f	black
961884021	Lilly Twill Shorts	H&M	\N	\N	Khaki green	khaki green	#857b67	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0392168029.jpg	f	gray
961953577	THOMPSON woven sport pants	H&M	\N	\N	Black	black	#1c1b1c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/015/0150959011.jpg	f	black
962451260	Malin sunglasses	H&M	\N	\N	Yellow	yellow	#c5a495	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0481781006.jpg	f	brown
962651341	Ulrik	H&M	\N	\N	Yellow	yellow	#d2843f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0495884005.jpg	f	brown
962849939	Clubba sunglasses	H&M	\N	\N	Pink	pink	#b2918c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270381007.jpg	f	black
963139185	Cap Paco Solid CO	H&M	\N	\N	Black	black	#29272c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0234187001.jpg	f	black
963175741	Joel basic shorts	H&M	\N	\N	Green	forest green	#868f8c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0442345019.jpg	f	gray
963462388	Howie SS Shirt	H&M	\N	\N	Beige	beige	#dcd3c7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236034.jpg	f	beige
963605307	Sara 3/4	H&M	\N	\N	White	white	#b5b3b3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0398074069.jpg	f	gray
963690228	S/S Polo Highline	H&M	\N	\N	Turquoise	turquoise	#3dbecc	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443860027.jpg	f	turquoise
964023456	Pamela tee	H&M	\N	\N	Pink	pink	#d09195	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215337067.jpg	f	red
964261140	Theron	H&M	\N	\N	Beige	beige	#d2cabf	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347039.jpg	f	beige
964353053	Skinny L.W Bargain (1)	H&M	\N	\N	White	white	#b9b5b5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0397068032.jpg	f	gray
964386150	MARION-SHORTS	H&M	\N	\N	Brown	brown	#5c494f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0452898009.jpg	f	gray
964457766	Lizzie	H&M	\N	\N	Orange	orange	#efd5cf	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0257667055.jpg	f	red
964542867	Stressan light knit jumper	H&M	\N	\N	Red	red	#533639	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0358483009.jpg	f	black
964575697	Vaughan sneaker	H&M	\N	\N	Yellow	yellow	#efe7d3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/047/0470985009.jpg	f	yellow
964843841	BRAX shorts	H&M	\N	\N	Turquoise	turquoise	#44c2df	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0487800014.jpg	f	turquoise
965056032	Cajsa	H&M	\N	\N	Lilac Purple	lilac purple	#938f9b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0504151006.jpg	f	gray
965227782	Austin basic leather hip belt	H&M	\N	\N	Black	black	#282526	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0179950017.jpg	f	black
965444906	Burnie sunglasses	H&M	\N	\N	Brown	brown	#936e4c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270382001.jpg	f	beige
965872771	HAL SHORTS	H&M	\N	\N	Lilac Purple	lilac purple	#312435	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449099043.jpg	f	purple
966074466	Jeggings H.W	H&M	\N	\N	Orange	orange	#69554b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399223030.jpg	f	brown
966461629	BERTIL Basic 2-pack S/S SB	H&M	\N	\N	Black	black	#2f2c2d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/019/0194902033.jpg	f	black
966665836	Mary Kate L/S	H&M	\N	\N	Khaki green	khaki green	#716f60	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0348870011.jpg	f	gray
966696539	Silver lake	H&M	\N	\N	Blue	cobalt	#858b9c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244267021.jpg	f	gray
967114879	Pablo coat	H&M	\N	\N	Khaki green	khaki green	#57523c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0312878005.jpg	f	yellow
967145286	John sunglasses	H&M	\N	\N	Orange	orange	#e8b3a1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0369796004.jpg	f	orange
967334856	Sandra squared	H&M	\N	\N	White	white	#8b5a48	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270375006.jpg	f	brown
967481984	Volly jumper (1)	H&M	\N	\N	Orange	orange	#efbfaf	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0405586009.jpg	f	orange
967571860	Theron (1)	H&M	\N	\N	White	white	#c2c0ba	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347045.jpg	f	white
967742427	Theron	H&M	\N	\N	Pink	pink	#dac3be	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347036.jpg	f	black
968103237	Danae jeans	H&M	\N	\N	Blue	cobalt	#657180	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0252298015.jpg	f	gray
968425663	Kevin softshell jacket	H&M	\N	\N	Khaki green	khaki green	#585c4d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0282832012.jpg	f	gray
968438412	Jonas slim 5 pkt	H&M	\N	\N	Brown	brown	#613e28	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0411758029.jpg	f	brown
968452930	GLASSIG ESPADRILLE	H&M	\N	\N	Pink	pink	#eecfc3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0349301014.jpg	f	orange
969629801	Olja sunglasses	H&M	\N	\N	Green	forest green	#616454	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0220365004.jpg	f	gray
969645501	MIMMI	H&M	\N	\N	White	white	#bcbab5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0357130011.jpg	f	gray
970109043	Silver lake	H&M	\N	\N	Pink	pink	#c6a8a3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244267029.jpg	f	black
970625909	Icona Premium scarf	H&M	\N	\N	Beige	beige	#ba8863	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0402382009.jpg	f	brown
971008156	Carolina sweater (1)	H&M	\N	\N	Red	red	#8d2842	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189691063.jpg	f	burgundy
971185295	Ingrid scallop shorts	H&M	\N	\N	Lilac Purple	lilac purple	#b5a2ad	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/052/0520025004.jpg	f	gray
971290045	S/S Polo Highline	H&M	\N	\N	Yellow	yellow	#d66c10	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443860014.jpg	f	orange
971595494	CA Gustavsberg TVP	H&M	\N	\N	White	white	#91939a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395127001.jpg	f	gray
971615636	Shorts R.W Bargain	H&M	\N	\N	White	white	#bab7b1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0398089002.jpg	f	gray
971748393	Kim superskinny low waist	H&M	\N	\N	Blue	cobalt	#272635	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0262277029.jpg	f	blue
972173916	Connor pants	H&M	\N	\N	Black	black	#282322	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/015/0156610001.jpg	f	black
972319550	BASIC JERSEY TIGHTS OC	H&M	\N	\N	Black	black	#221e1f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0240840032.jpg	f	black
927075817	MAX jersey pants SB	H&M	\N	\N	Green	forest green	#02cfb7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885030.jpg	f	turquoise
927771773	Alicia wrap skirt	H&M	\N	\N	Pink	pink	#7b0738	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0327310016.jpg	f	pink
928955941	Klein	H&M	\N	\N	Orange	orange	#ebd4c9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0316471020.jpg	f	brown
929125384	Indiana Solid Scarf	H&M	\N	\N	Pink	pink	#ddcdc9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0342034014.jpg	f	black
935693137	Karenina Jacket	H&M	\N	\N	Pink	pink	#a16760	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0316657015.jpg	f	black
972513638	Mitch top	H&M	\N	\N	Turquoise	turquoise	#def0ed	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0410624005.jpg	f	turquoise
973674024	Reggie chino shorts	H&M	\N	\N	Red	red	#bd6b6e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366859033.jpg	f	red
973680734	Theron (1)	H&M	\N	\N	Turquoise	turquoise	#c5d6d1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347017.jpg	f	turquoise
973733581	Clubba sunglasses	H&M	\N	\N	Orange	orange	#c9b4ab	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270381013.jpg	f	brown
974094464	TD Hugo Stretch	H&M	\N	\N	Red	red	#51282e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0392938032.jpg	f	burgundy
974429376	Mini cross bag	H&M	\N	\N	Brown	brown	#b06348	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386681018.jpg	f	brown
974453974	V-Neck Milan TVP	H&M	\N	\N	Green	forest green	#112b2f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447030.jpg	f	turquoise
974465991	SOFIE THIN BEANIE	H&M	\N	\N	Red	red	#5b2130	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0359804013.jpg	f	burgundy
974512339	ROCK SHORTS	H&M	\N	\N	Green	forest green	#034848	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0368300014.jpg	f	turquoise
974975654	Day long sleeve	H&M	\N	\N	Turquoise	turquoise	#2f3d45	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0494428006.jpg	f	sky
975003476	Flirty Chantal earring	H&M	\N	\N	Blue	cobalt	#373c58	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292453009.jpg	f	blue
975424450	Dean Drawstring Trousers.	H&M	\N	\N	Khaki green	khaki green	#5d5643	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0212766041.jpg	f	beige
975595071	Jordan	H&M	\N	\N	Orange	orange	#efdad4	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/043/0439793009.jpg	f	brown
975658819	Cool Alessa Cat	H&M	\N	\N	Yellow	yellow	#666350	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0357792007.jpg	f	gray
975865057	Alicia wrap skirt	H&M	\N	\N	Pink	pink	#e6cbc6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0327310015.jpg	f	red
975887056	Pamela tee	H&M	\N	\N	Blue	cobalt	#a8c6e1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215337066.jpg	f	sky
976395446	BO basic OH BB	H&M	\N	\N	Turquoise	turquoise	#b0c1b8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443696019.jpg	f	gray
976806134	Mr Harrington w/hood	H&M	\N	\N	Blue	cobalt	#232f3f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0176209040.jpg	f	sky
977504243	Theron	H&M	\N	\N	Red	red	#3b1e25	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347025.jpg	f	burgundy
977657382	Frode outdoor beanie	H&M	\N	\N	Black	black	#262528	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/020/0204892032.jpg	f	black
977667153	Cornell ss jumper	H&M	\N	\N	Orange	orange	#edc1b6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0409731006.jpg	f	orange
978111561	SULIMA jkt	H&M	\N	\N	Turquoise	turquoise	#25363f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0498620003.jpg	f	sky
978275766	Basic Hood	H&M	\N	\N	Green	forest green	#cbd3c2	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244853032.jpg	f	olive
978468896	Basic LS Raglan t-shirt	H&M	\N	\N	Pink	pink	#e3c1c4	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0354246012.jpg	f	red
979369203	Pierre Beanie	H&M	\N	\N	Beige	beige	#ac7b4a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315987014.jpg	f	beige
979497433	Akoni Flatshoe	H&M	\N	\N	Brown	brown	#7a4c37	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0354307008.jpg	f	brown
979702770	Godfather SF Chino	H&M	\N	\N	Red	red	#3d1d20	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0384482008.jpg	f	black
979849497	Billy cargo pants	H&M	\N	\N	Grey	gray	#4d4948	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0219075014.jpg	f	gray
980211652	Mini cross bag	H&M	\N	\N	White	white	#aea193	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386681014.jpg	f	gray
911122346	Skinny Ankel Denim	H&M	\N	\N	Lilac Purple	lilac purple	#34445a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136022.jpg	f	sky
901901259	Theron	H&M	\N	\N	Mole	mole	#b19a99	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347043.jpg	f	gray
903098820	BEN POLO TP	H&M	\N	\N	Turquoise	turquoise	#a6d8e1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508543040.jpg	f	turquoise
903562026	Swan shorts	H&M	\N	\N	Turquoise	turquoise	#07b5b5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508393002.jpg	f	turquoise
904557351	Rawley Chinos Slim	H&M	\N	\N	Turquoise	turquoise	#19384f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/046/0466595026.jpg	f	sky
909571432	Teddy jogger.	H&M	\N	\N	Turquoise	turquoise	#bbc9c9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0488561035.jpg	f	white
914515763	Pamela tee	H&M	\N	\N	Grey	gray	#b6b6bb	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215337059.jpg	f	gray
932633841	Skinny Ankel Denim	H&M	\N	\N	Blue	cobalt	#2e3954	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136028.jpg	f	blue
933859152	Flirty Chantal earring	H&M	\N	\N	Beige	beige	#d19e8a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292453011.jpg	f	brown
935887818	PELLE Basic S/S jersey polo SB	H&M	\N	\N	Yellow	yellow	#efdea5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265069025.jpg	f	yellow
938597283	TLC Top	H&M	\N	\N	Lilac Purple	lilac purple	#7e4e66	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/051/0516656017.jpg	f	pink
939369725	Rock Relaxed Shorts	H&M	\N	\N	Yellow	yellow	#d7b47c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0368300022.jpg	f	beige
939505147	MOLLY (1)	H&M	\N	\N	Turquoise	turquoise	#598c98	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508932027.jpg	f	turquoise
939957748	Pinocchio hat	H&M	\N	\N	Orange	orange	#b9a098	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224314011.jpg	f	brown
945422285	TP MAX jersey pants SB	H&M	\N	\N	Khaki green	khaki green	#7c7559	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885038.jpg	f	yellow
947062428	Lollo NT 2-pack	H&M	\N	\N	Turquoise	turquoise	#95949b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508182006.jpg	f	gray
947914597	Mimi Superstretch	H&M	\N	\N	Lilac Purple	lilac purple	#422433	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/051/0518328016.jpg	f	pink
948723247	Maria Shorts	H&M	\N	\N	Grey	gray	#b3afb5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0307656018.jpg	f	gray
950809912	Teddy jogger.	H&M	\N	\N	Yellow	yellow	#e5c986	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0488561022.jpg	f	yellow
955158263	Perrie Plain Denim TRS	H&M	\N	\N	Green	forest green	#067b7b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0448509013.jpg	f	turquoise
900659102	Danae jeans	H&M	\N	\N	Khaki green	khaki green	#656356	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0252298016.jpg	f	gray
908491266	Pinocchio hat	H&M	\N	\N	Beige	beige	#d8d1c7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224314018.jpg	f	beige
912785399	Sage Shorts	H&M	\N	\N	Orange	orange	#e0cec9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0384851022.jpg	f	brown
930796427	Nora Cardigan	H&M	\N	\N	Red	red	#633e45	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396018.jpg	f	burgundy
932497734	HM+ Cora tee	H&M	\N	\N	Khaki green	khaki green	#968962	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0294008056.jpg	f	beige
937978167	Flirty Chantal earring	H&M	\N	\N	Orange	orange	#b77b67	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292453014.jpg	f	brown
938166789	SOFIE BEANIE	H&M	\N	\N	Pink	pink	#e3cfcc	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292551012.jpg	f	black
939194109	SOFIE BEANIE	H&M	\N	\N	Grey	gray	#b4b6ba	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292551014.jpg	f	gray
939526834	Cora T-shirt	H&M	\N	\N	Orange	orange	#f89085	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0294008036.jpg	f	red
942047740	Basic co/fl cardigan	H&M	\N	\N	Pink	pink	#daa3b6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0290519017.jpg	f	pink
942492811	Harris cross sandal PQ	H&M	\N	\N	Black	black	#1a171c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0278563001.jpg	f	black
943890664	Nora Cardigan	H&M	\N	\N	Black	black	#1a1a18	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396024.jpg	f	black
944048321	Nora Cardigan	H&M	\N	\N	Black	black	#1e1e21	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396007.jpg	f	black
944881307	Sanne treggings (1)	H&M	\N	\N	Blue	cobalt	#2c374d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0299668018.jpg	f	blue
902790876	VIOLA 2-pack	H&M	\N	\N	Red	red	#60202e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395730040.jpg	f	burgundy
903585144	R-Neck Pisa	H&M	\N	\N	Red	red	#141c29	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378135032.jpg	f	sky
905290671	Livia Top	H&M	\N	\N	Mole	mole	#c2ada8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0380609001.jpg	f	black
912810973	Cori cropped hood	H&M	\N	\N	Orange	orange	#ebcec8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0381038026.jpg	f	red
915797723	V-Neck Milan TVP	H&M	\N	\N	Green	forest green	#1e2f33	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447050.jpg	f	turquoise
915965464	MIKKI SLIP ON SNEAKER	H&M	\N	\N	White	white	#c4b5b5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0365592009.jpg	f	white
900887632	Solid Paco	H&M	\N	\N	Lilac Purple	lilac purple	#724c95	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0359909035.jpg	f	purple
905505744	Basic Endless hoop	H&M	\N	\N	Orange	orange	#f4e7e0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0357751003.jpg	f	brown
905793793	Solid Paco	H&M	\N	\N	Red	red	#7b394d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0359909030.jpg	f	pink
906574066	Theron (1)	H&M	\N	\N	Grey	gray	#b1aead	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347011.jpg	f	gray
909575739	Basic LS Raglan t-shirt	H&M	\N	\N	Yellow	yellow	#e3b446	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0354246014.jpg	f	yellow
915072835	Reggie chino shorts	H&M	\N	\N	Yellow	yellow	#e1c693	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366859034.jpg	f	beige
916244071	Raymond aviator	H&M	\N	\N	Green	forest green	#50bcb6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0361531005.jpg	f	turquoise
922669941	ROCK SHORTS	H&M	\N	\N	Khaki green	khaki green	#706f62	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0368300011.jpg	f	gray
924193115	Basic cotton fleece leggings	H&M	\N	\N	Red	red	#c20a2a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318914026.jpg	f	burgundy
927241562	Akoni Flatshoe	H&M	\N	\N	Mole	mole	#a48f7f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0354307004.jpg	f	brown
927965483	Anton sport pant	H&M	\N	\N	Black	black	#3a3736	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/015/0156610007.jpg	f	black
930848451	John sunglasses	H&M	\N	\N	Orange	orange	#eadad6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0369796035.jpg	f	brown
931737967	Stressan light knit jumper	H&M	\N	\N	Mole	mole	#bca9a6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0358483006.jpg	f	gray
907260184	Fuji jacket	H&M	\N	\N	Red	red	#6f363a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0393993004.jpg	f	black
914381954	Clear glasses Hendrix	H&M	\N	\N	Brown	brown	#dfd4c8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0411565007.jpg	f	beige
919836303	Sunglasses Morris	H&M	\N	\N	Green	forest green	#d27746	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0394292006.jpg	f	brown
920625052	VIOLA 2-pack	H&M	\N	\N	White	white	#9c0423	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395730041.jpg	f	burgundy
921206723	Big Arjuna crossbag	H&M	\N	\N	Brown	brown	#85462e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386678003.jpg	f	brown
921616006	TD Hugo slim fit Stretch PQ	H&M	\N	\N	White	white	#bcbbba	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0392938001.jpg	f	white
923666631	Sian Headband	H&M	\N	\N	Orange	orange	#d8b2a3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0390531007.jpg	f	brown
923859373	Allington R-neck	H&M	\N	\N	Red	red	#49252b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386859061.jpg	f	burgundy
928674529	Rock Relaxed Shorts	H&M	\N	\N	Red	red	#c44249	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0368300015.jpg	f	red
931018969	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Blue	cobalt	#293457	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071013.jpg	f	blue
932965866	PELLE Basic S/S jersey polo SB	H&M	\N	\N	Blue	cobalt	#293453	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265069014.jpg	f	blue
939167160	PELLE Basic S/S jersey polo SB	H&M	\N	\N	White	white	#c0bbb6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265069012.jpg	f	white
980402164	CA Gustavsberg TVP	H&M	\N	\N	Red	red	#452029	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395127012.jpg	f	burgundy
980617252	Sunglasses Hendrix	H&M	\N	\N	Brown	brown	#ba977e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0406724023.jpg	f	brown
980866291	Theron (1)	H&M	\N	\N	Blue	cobalt	#8297aa	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347024.jpg	f	sky
981096126	Woody(1)	H&M	\N	\N	Yellow	yellow	#e5cfa3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0456163064.jpg	f	beige
981411070	Zero Tee	H&M	\N	\N	Green	forest green	#a6b1b2	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449263024.jpg	f	gray
982477434	Sunglasses Edward	H&M	\N	\N	Brown	brown	#6d6f65	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0360950016.jpg	f	gray
941243369	Sigge shorts	H&M	\N	\N	Turquoise	turquoise	#bcd1d5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0375585025.jpg	f	turquoise
944064627	John sunglasses	H&M	\N	\N	Green	forest green	#667066	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0369796007.jpg	f	gray
944298839	Cool Betty earring pk	H&M	\N	\N	Red	red	#e3c198	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386463014.jpg	f	beige
946034933	KRISTOFF Basic jersey polo BB	H&M	\N	\N	White	white	#dee0ed	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071012.jpg	f	blue
951759913	Superstretch Fancy denim	H&M	\N	\N	Grey	gray	#4b4948	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0256151015.jpg	f	black
955683177	Sage Shorts	H&M	\N	\N	Red	red	#732129	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0384851019.jpg	f	red
960016590	Sage Shorts	H&M	\N	\N	Red	red	#d72d40	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0384851023.jpg	f	red
961038579	Tail tee (1)	H&M	\N	\N	Brown	brown	#b08c70	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366686017.jpg	f	brown
962747901	Cool Metal John Round	H&M	\N	\N	Green	forest green	#d6d0c5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0369796027.jpg	f	beige
964434368	R-Neck Pisa TVP R	H&M	\N	\N	Red	red	#36191d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378135033.jpg	f	burgundy
967433820	PELLE Basic S/S jersey polo SB	H&M	\N	\N	Blue	cobalt	#aac7e3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265069024.jpg	f	sky
968442386	R-Neck Pisa	H&M	\N	\N	Yellow	yellow	#dbb122	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378135037.jpg	f	yellow
969863239	Haddock Beanie	H&M	\N	\N	Yellow	yellow	#dcbf3c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0390512010.jpg	f	yellow
973066687	Basic co/fl cardigan	H&M	\N	\N	Grey	gray	#413c45	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0290519008.jpg	f	black
900646801	Theron	H&M	\N	\N	Khaki green	khaki green	#8e8060	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347053.jpg	f	beige
900688141	Pinocchio hat	H&M	\N	\N	Mole	mole	#746460	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224314013.jpg	f	gray
905275537	Bracelet Bangle CO	H&M	\N	\N	Yellow	yellow	#e6d0b1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0408884002.jpg	f	beige
907027196	KIMBERLY Braided Headband	H&M	\N	\N	White	white	#dcd6cb	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318066014.jpg	f	beige
909518086	Alessa cat sunglasses	H&M	\N	\N	Orange	orange	#ceb5ab	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0357792003.jpg	f	brown
902429467	Tess tee (1)	H&M	\N	\N	Orange	orange	#f9d4c9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0240670060.jpg	f	orange
912615261	Indiana Solid Scarf	H&M	\N	\N	Pink	pink	#bf296d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0342034017.jpg	f	pink
900908663	Theron	H&M	\N	\N	Orange	orange	#e8dace	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347052.jpg	f	brown
908500735	Cool Metal John Round	H&M	\N	\N	Pink	pink	#c6b1ea	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0369796023.jpg	f	purple
916330370	Lady Di	H&M	\N	\N	Lilac Purple	lilac purple	#cebebe	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0504154003.jpg	f	white
921477826	Ridley Leather Belt	H&M	\N	\N	Orange	orange	#8b402b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0416387001.jpg	f	orange
984931989	MIA	H&M	\N	\N	Red	red	#e93a57	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395658025.jpg	f	burgundy
928945207	Lima ss	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0306307002.jpg	f	beige
932417226	Super skinny denim	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0300024045.jpg	f	beige
900038933	CA Gustavsberg slim fit TVP	H&M	\N	\N	White	white	#aaa8ad	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395127043.jpg	f	gray
900543102	BEN basic crewneck SB	H&M	\N	\N	Green	forest green	#587978	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0413911035.jpg	f	turquoise
925421132	Sara long (1)	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0352811025.jpg	f	white
939050943	R-neck Allington	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0386859007.jpg	f	beige
901302452	Al Car Shoe	H&M	\N	\N	Blue	cobalt	#151520	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0264713001.jpg	f	blue
902569344	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Orange	orange	#ee8b79	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071021.jpg	f	red
903532373	S.Skinny L.W Epic	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399087040.jpg	f	beige
901181099	Mr Harrington w/hood	H&M	\N	\N	Khaki green	khaki green	#5f543a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0176209039.jpg	f	beige
901707457	Devon basic sweater	H&M	\N	\N	Lilac Purple	lilac purple	#cabfd5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0496111011.jpg	f	purple
903813579	Tail tee (1)	H&M	\N	\N	Khaki green	khaki green	#736e5c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366686018.jpg	f	gray
907823478	Cool Olja round	H&M	\N	\N	Brown	brown	#7cc3d0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0220365001.jpg	f	turquoise
935958149	Heath	H&M	\N	\N	Turquoise	turquoise	#b9c6cc	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0491913014.jpg	f	sky
936199336	Jerry jogger bottoms	H&M	\N	\N	Grey	gray	#686768	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/011/0118458029.jpg	f	gray
942383454	Jerry jogger bottoms	H&M	\N	\N	Grey	gray	#3c3b3c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/011/0118458038.jpg	f	black
967662932	CLAY TEE	H&M	\N	\N	Green	forest green	#839798	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449570032.jpg	f	gray
982649254	Coolio sunglasses	H&M	\N	\N	Black	black	#090508	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215303002.jpg	f	pink
982890711	Malcolm Skinny 5 pocket	H&M	\N	\N	Brown	brown	#916343	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0395619013.jpg	f	brown
983276280	Cool Alessa Cat	H&M	\N	\N	Red	red	#82515a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0357792009.jpg	f	burgundy
983725886	Montana pants	H&M	\N	\N	Lilac Purple	lilac purple	#2f1f29	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0403844008.jpg	f	pink
983802174	Dorian l/s basic	H&M	\N	\N	Blue	cobalt	#323e52	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/014/0145872052.jpg	f	sky
984172922	R-Neck Pisa	H&M	\N	\N	Pink	pink	#c38a8e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378135031.jpg	f	black
984213514	NATE  basic S/S solid tee BB	H&M	\N	\N	Blue	cobalt	#2261a9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0260736029.jpg	f	sky
984256749	Nora Cardigan	H&M	\N	\N	Khaki green	khaki green	#6b5f4a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396023.jpg	f	beige
984358887	NATE  basic S/S solid tee BB	H&M	\N	\N	Pink	pink	#e9d8e0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0260736033.jpg	f	pink
984505561	Godfather SF Chino	H&M	\N	\N	Brown	brown	#965029	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0384482009.jpg	f	brown
984608519	Raven skirt	H&M	\N	\N	Black	black	#151318	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189654001.jpg	f	black
984645256	RILEY T-SHIRT	H&M	\N	\N	Beige	beige	#a67455	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0341782044.jpg	f	brown
984742450	KIMBERLY Braided Headband	H&M	\N	\N	Pink	pink	#bb9d97	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318066013.jpg	f	black
984974976	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Green	forest green	#bce2da	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071028.jpg	f	turquoise
985513284	MIMMI	H&M	\N	\N	Pink	pink	#e9d7db	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0357130017.jpg	f	burgundy
986173919	Roman running hood	H&M	\N	\N	Green	forest green	#2d3333	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0382127032.jpg	f	black
986337963	Dean Drawstring Trousers.	H&M	\N	\N	Grey	gray	#4c484f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0212766045.jpg	f	gray
986565153	Sara 3/4	H&M	\N	\N	Turquoise	turquoise	#0b5165	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0398074046.jpg	f	turquoise
986678010	Hawlin Headband	H&M	\N	\N	Pink	pink	#cbb6af	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0324502008.jpg	f	brown
987628096	Tail tee	H&M	\N	\N	Red	red	#3d181f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366686024.jpg	f	burgundy
987646652	Maria Shorts	H&M	\N	\N	Khaki green	khaki green	#6c6a55	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0307656027.jpg	f	gray
988193012	Basic Hood	H&M	\N	\N	Pink	pink	#e3d3d3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244853030.jpg	f	black
988237334	Theron (1)	H&M	\N	\N	White	white	#e5dbd5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347027.jpg	f	brown
988655361	Billy cargo pants	H&M	\N	\N	Khaki green	khaki green	#716c5a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0219075017.jpg	f	gray
988684449	Lily	H&M	\N	\N	Khaki green	khaki green	#b5bea5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0392168010.jpg	f	olive
988769157	Wolf Scarf	H&M	\N	\N	Brown	brown	#9d836b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315509024.jpg	f	beige
988770682	Flora hip belt	H&M	\N	\N	Orange	orange	#e7d5cd	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0224606025.jpg	f	brown
989171748	R-neck Astrix Lamswool	H&M	\N	\N	Lilac Purple	lilac purple	#38253b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0495695003.jpg	f	purple
989292940	Paco solid flatpeak	H&M	\N	\N	Grey	gray	#969599	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0234187030.jpg	f	gray
989372087	Coolio sunglasses	H&M	\N	\N	Brown	brown	#79473e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215303001.jpg	f	black
989532204	V-Neck Milan TVP	H&M	\N	\N	Beige	beige	#bdb2a7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447055.jpg	f	beige
974346453	Scarf Wolf	H&M	\N	\N	Grey	gray	#b1b1af	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315509033.jpg	f	gray
975123107	Basic Rollerbuckle belt	H&M	\N	\N	Brown	brown	#694845	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0338016003.jpg	f	black
989758683	MIA FANCY	H&M	\N	\N	Lilac Purple	lilac purple	#4f475c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508935003.jpg	f	gray
989842013	Frode outdoor beanie	H&M	\N	\N	Grey	gray	#6b7279	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/020/0204892029.jpg	f	gray
989978304	Rita Ringer Tee	H&M	\N	\N	White	white	#6d202d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0379780040.jpg	f	burgundy
990125292	Jacket Slim	H&M	\N	\N	Beige	beige	#c4ac95	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399061027.jpg	f	beige
990129324	MAX jersey pants SB	H&M	\N	\N	Khaki green	khaki green	#6f634c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885032.jpg	f	beige
990208564	Easy iron L/S shirt TP	H&M	\N	\N	Red	red	#c80326	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337777015.jpg	f	burgundy
990272594	Otto Beanie	H&M	\N	\N	Grey	gray	#a4a6a6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315497012.jpg	f	gray
990473626	Perrie Slim Mom Denim TRS	H&M	\N	\N	Lilac Purple	lilac purple	#d0c5d5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0448509029.jpg	f	purple
990507886	Saya sunglasses	H&M	\N	\N	Orange	orange	#dccfc1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0370594006.jpg	f	beige
990546281	Carolina sweater (1)	H&M	\N	\N	Grey	gray	#b6b3b0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189691044.jpg	f	gray
990559416	V-Neck Milan	H&M	\N	\N	Green	forest green	#085f61	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447034.jpg	f	turquoise
991493462	RILEY T-SHIRT	H&M	\N	\N	Red	red	#693c45	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0341782032.jpg	f	burgundy
991648411	Raven skirt	H&M	\N	\N	Grey	gray	#bbbabc	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189654045.jpg	f	white
991816619	Hawlin Headband	H&M	\N	\N	Mole	mole	#a99b97	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0324502017.jpg	f	gray
992242823	GLASSIG ESPADRILLE	H&M	\N	\N	Orange	orange	#e2302b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0349301048.jpg	f	red
992282667	Classic Clubba	H&M	\N	\N	Orange	orange	#c4a889	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270381011.jpg	f	beige
992400366	Lottie Tee	H&M	\N	\N	Mole	mole	#c0ada9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0381187006.jpg	f	black
993013458	Sigge Dressed Belt	H&M	\N	\N	Brown	brown	#612e23	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337991010.jpg	f	red
993379061	R-Neck Pisa TVP R	H&M	\N	\N	Mole	mole	#907f70	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378135034.jpg	f	gray
993490511	TP BO basic OH BB	H&M	\N	\N	Brown	brown	#935225	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443696058.jpg	f	brown
993668547	Maja Cardigan	H&M	\N	\N	Turquoise	turquoise	#bdd0d3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0446224019.jpg	f	turquoise
993859617	Cora T-shirt	H&M	\N	\N	White	white	#afaeb3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0294008050.jpg	f	gray
994066320	Stressan light knit jumper	H&M	\N	\N	Pink	pink	#ad6e66	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0358483013.jpg	f	black
994127179	Elvis jumper	H&M	\N	\N	Grey	gray	#6b635b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0317348002.jpg	f	gray
994439733	Karenina Jacket	H&M	\N	\N	Khaki green	khaki green	#584c38	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0316657010.jpg	f	beige
994844435	Wallace 2in1 Tee XS-L	H&M	\N	\N	Lilac Purple	lilac purple	#928591	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0446147008.jpg	f	gray
995057922	Theron	H&M	\N	\N	Blue	cobalt	#adbed3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347040.jpg	f	sky
995083925	Howie SS Shirt	H&M	\N	\N	Pink	pink	#ecd6d8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236028.jpg	f	red
995282370	Basic Loose Jerseypants	H&M	\N	\N	Pink	pink	#dccac8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0377239008.jpg	f	black
995520417	Berlin boot	H&M	\N	\N	Black	black	#201c1d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0258650001.jpg	f	black
996118002	Cool Vesper watch	H&M	\N	\N	Beige	beige	#dac5b8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0417427035.jpg	f	brown
996200408	Kevin softshell jacket (1)	H&M	\N	\N	Khaki green	khaki green	#3e3d35	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0282832019.jpg	f	black
996719452	Livia Top	H&M	\N	\N	Pink	pink	#c39090	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0380609038.jpg	f	black
996794640	TP BO basic OH BB	H&M	\N	\N	Yellow	yellow	#dd9a14	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443696061.jpg	f	yellow
997086113	Nora Cardigan	H&M	\N	\N	Grey	gray	#969594	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396025.jpg	f	gray
946502633	Saya sunglasses	H&M	\N	\N	Beige	beige	#d1c4b6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0370594020.jpg	f	beige
952112716	Karla sunglasses	H&M	\N	\N	Khaki green	khaki green	#967368	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0376172006.jpg	f	brown
997718409	Sigge shorts	H&M	\N	\N	Green	forest green	#cce88c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0375585026.jpg	f	olive
998618234	Petit cross bag (1)	H&M	\N	\N	Red	red	#e32f3c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0387444006.jpg	f	red
998848311	Karla sunglasses	H&M	\N	\N	Red	red	#4f2f31	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0376172003.jpg	f	black
999116392	Basic Rollerbuckle belt	H&M	\N	\N	Brown	brown	#613d35	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0338016011.jpg	f	black
999349450	GLASSIG ESPADRILLE	H&M	\N	\N	White	white	#d4bea0	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0349301025.jpg	f	beige
999521769	Superskinny	H&M	\N	\N	Grey	gray	#494649	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0300024058.jpg	f	black
999600040	Maja Cardigan	H&M	\N	\N	Orange	orange	#ebcdc8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0446224012.jpg	f	red
999726887	Sandra squared	H&M	\N	\N	Black	black	#7c5d66	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270375001.jpg	f	gray
936696862	L/S Polo Gnocci TVP	H&M	\N	\N	Red	red	#342023	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378124007.jpg	f	black
936708574	V-Neck Merino Milan	H&M	\N	\N	Yellow	yellow	#cb9d46	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447041.jpg	f	beige
971073218	Cool Olja round	H&M	\N	\N	Orange	orange	#c7b7ac	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/022/0220365007.jpg	f	brown
970531135	NATE  basic S/S solid tee BB	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0260736026.jpg	f	purple
967291703	Icona premium beanie	H&M	\N	\N	Mole	mole	#9c8c88	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/040/0402389014.jpg	f	gray
997304633	Shaun (1)	H&M	\N	\N	Yellow	yellow	#d5870d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/047/0477163013.jpg	f	yellow
938003565	Basic LS t-shirt	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318951002.jpg	f	purple
954724973	TP MAX jersey pants SB	H&M	\N	\N	Orange	orange	#ed5330	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885049.jpg	f	red
961010979	Sara long (1)	H&M	\N	\N	Pink	pink	#dbc9c3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0352811039.jpg	f	brown
922056609	Raven skirt	H&M	\N	\N	Khaki green	khaki green	#6f6755	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189654047.jpg	f	gray
925564399	Carolina sweater (1)	H&M	\N	\N	Khaki green	khaki green	#828771	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/018/0189691051.jpg	f	gray
900411815	Hat Flynn Straw	H&M	\N	\N	Brown	brown	#73563f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0450333001.jpg	f	brown
900790857	2 PK V-N SS SLIM FIT	H&M	\N	\N	Brown	brown	#653b3d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0451541006.jpg	f	black
901056566	Fav polo solid	H&M	\N	\N	Turquoise	turquoise	#b5bfc9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/047/0476315036.jpg	f	sky
908283901	Mr Harrington w/hood	H&M	\N	\N	Grey	gray	#49434f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/017/0176209046.jpg	f	black
984298628	Skinny Ankel Denim	H&M	\N	\N	Blue	cobalt	#808f9e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136023.jpg	f	gray
987383989	Tess tee (1)	H&M	\N	\N	Blue	cobalt	#596275	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0240670058.jpg	f	gray
988739493	Skinny Ankel Denim	H&M	\N	\N	Blue	cobalt	#66788b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136006.jpg	f	sky
990568976	BOAZ FANCY Halloween l/s tee	H&M	\N	\N	Turquoise	turquoise	#207a91	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0508769002.jpg	f	turquoise
991440249	V-Neck Milan	H&M	\N	\N	Pink	pink	#d8c6c7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447024.jpg	f	black
992405835	Kim superskinny low waist	H&M	\N	\N	Blue	cobalt	#1c1e2c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0262277009.jpg	f	blue
996762943	Skinny Ankel Denim	H&M	\N	\N	White	white	#aca7a1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136011.jpg	f	gray
998427853	Sandra squared	H&M	\N	\N	Beige	beige	#78473e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/027/0270375004.jpg	f	black
901530275	TP TOBIE 3-pack l/s	H&M	\N	\N	Turquoise	turquoise	#0488ac	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0503569026.jpg	f	turquoise
902243715	Sunglasses Edward	H&M	\N	\N	Brown	brown	#5b7873	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0360950004.jpg	f	gray
903350687	Leia lap top case	H&M	\N	\N	Lilac Purple	lilac purple	#a88db9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/042/0420378005.jpg	f	purple
914323961	Theron (1)	H&M	\N	\N	Grey	gray	#b5b4b3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347055.jpg	f	gray
914419838	Maja Cardigan	H&M	\N	\N	Green	forest green	#23403e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0446224036.jpg	f	turquoise
919153455	Specter l/s tee	H&M	\N	\N	Green	forest green	#6f8478	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/042/0421941008.jpg	f	gray
920416393	Kim superskinny low waist	H&M	\N	\N	Black	black	#282828	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0262277011.jpg	f	black
922261530	Hood W Zip	H&M	\N	\N	Lilac Purple	lilac purple	#626d7a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/042/0422106017.jpg	f	gray
927089915	Indiana Printed Scarf	H&M	\N	\N	Beige	beige	#c3ac9f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/043/0431570017.jpg	f	brown
928107410	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Yellow	yellow	#f2da9a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071022.jpg	f	yellow
928372738	Rebecka sweater	H&M	\N	\N	Lilac Purple	lilac purple	#eebed4	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0507092003.jpg	f	pink
929705294	Cool Bridget sunglasses	H&M	\N	\N	Lilac Purple	lilac purple	#9376ac	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0499807005.jpg	f	purple
913463719	JONES 5-PKT SHORTS	H&M	\N	\N	Yellow	yellow	#a7571d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/047/0474471012.jpg	f	orange
914947952	CLAY TEE	H&M	\N	\N	Green	forest green	#d1e3a8	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449570053.jpg	f	olive
915157533	Sassy 3-pack hip belt	H&M	\N	\N	Yellow	yellow	#deb266	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0453585009.jpg	f	beige
918035285	Rufus 5-pkt trousers	H&M	\N	\N	Green	forest green	#253634	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0451243005.jpg	f	turquoise
919530207	Astor shorts	H&M	\N	\N	Turquoise	turquoise	#aec1bf	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0485521004.jpg	f	beige
926382114	Bull trousers	H&M	\N	\N	Brown	brown	#9b7859	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0451402002.jpg	f	beige
931145888	Zero Tee	H&M	\N	\N	Yellow	yellow	#d8b44a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449263033.jpg	f	yellow
931840192	Riri sandalina	H&M	\N	\N	Yellow	yellow	#daae45	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0489435015.jpg	f	yellow
935176395	Woody	H&M	\N	\N	Lilac Purple	lilac purple	#755250	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0456163065.jpg	f	black
900618465	Rita Ringer Tee	H&M	\N	\N	Red	red	#501c29	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0379780024.jpg	f	burgundy
906119741	Lory sweatpants (1)	H&M	\N	\N	Black	black	#252120	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0252229001.jpg	f	black
909744076	Tuck cropped sweater	H&M	\N	\N	Turquoise	turquoise	#145b6c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0502186012.jpg	f	turquoise
909766076	KATE TEE	H&M	\N	\N	Turquoise	turquoise	#9fe9e1	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0498740012.jpg	f	turquoise
910052708	Howie SS Shirt	H&M	\N	\N	Khaki green	khaki green	#544d3b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236027.jpg	f	beige
900737868	Otto Beanie	H&M	\N	\N	Grey	gray	#1d1c20	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315497018.jpg	f	black
902135575	PQ Lottie cashmere headband	H&M	\N	\N	Lilac Purple	lilac purple	#ac909e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/052/0522461015.jpg	f	gray
902205829	Lily	H&M	\N	\N	White	white	#c9c3ba	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0392168020.jpg	f	white
903528639	Scarf Wolf	H&M	\N	\N	Grey	gray	#424348	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0315509001.jpg	f	black
904408781	Sigge shorts	H&M	\N	\N	Pink	pink	#e9d6d5	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0375585023.jpg	f	black
904484831	Super skinny denim	H&M	\N	\N	Grey	gray	#343437	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0300024006.jpg	f	black
904521746	Fix it tote bag	H&M	\N	\N	Beige	beige	#d7c6bd	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241436006.jpg	f	brown
904710746	Skinny high waist black	H&M	\N	\N	Blue	cobalt	#425e7c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0297898002.jpg	f	sky
906382893	Ozzy	H&M	\N	\N	Khaki green	khaki green	#7d6c59	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0301364029.jpg	f	beige
906449412	GLASSIG ESPADRILLE	H&M	\N	\N	White	white	#b7b1aa	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0349301011.jpg	f	gray
907940519	Pamela tee	H&M	\N	\N	Khaki green	khaki green	#7c7a6c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215337039.jpg	f	gray
912415153	Chelsea welldressed trouser	H&M	\N	\N	Blue	cobalt	#545559	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0291957007.jpg	f	gray
912469862	Wilma	H&M	\N	\N	Lilac Purple	lilac purple	#5d2139	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/049/0499249002.jpg	f	pink
914130397	Flirty Chantal earring	H&M	\N	\N	Green	forest green	#1f4b49	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292453028.jpg	f	turquoise
921435318	Cori cropped hood	H&M	\N	\N	Khaki green	khaki green	#766f5e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0381038033.jpg	f	gray
922265783	Superskinny	H&M	\N	\N	Turquoise	turquoise	#1e263c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0300024042.jpg	f	blue
902615670	S/S Hugo Stretch C/R	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0394798002.jpg	f	beige
944082034	Easy iron L/S shirt TP	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337777014.jpg	f	white
902399629	Freja Coat	H&M	\N	\N	Red	red	#582c38	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0300908010.jpg	f	burgundy
912680972	Howie SS Shirt	H&M	\N	\N	Red	red	#cf1431	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/028/0283236029.jpg	f	burgundy
917456719	Stressan light knit jumper	H&M	\N	\N	Khaki green	khaki green	#6c604c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/035/0358483007.jpg	f	beige
918537740	Shaping Skinny R.W	H&M	\N	\N	Khaki green	khaki green	#5e5848	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399136011.jpg	f	gray
922904313	Basic cotton fleece leggings	H&M	\N	\N	Green	forest green	#cbe0d2	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318914012.jpg	f	green
960566551	Cora T-shirt	H&M	\N	\N	Pink	pink	#e33565	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0294008044.jpg	f	burgundy
962084550	Skinny Cheapo 89	H&M	\N	\N	Grey	gray	#aaa8aa	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0309864013.jpg	f	gray
962319869	Rodney basic beanie	H&M	\N	\N	Pink	pink	#f94782	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0294895015.jpg	f	pink
964434945	Kattis cat sunglasses	H&M	\N	\N	Black	black	#70575f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0268305001.jpg	f	gray
968532904	Sanne treggings (1)	H&M	\N	\N	Blue	cobalt	#48698d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0299668015.jpg	f	sky
973685126	Superstretch Fancy denim	H&M	\N	\N	Black	black	#2e2c30	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0256151014.jpg	f	black
974311885	Flirty Chantal earring	H&M	\N	\N	Yellow	yellow	#efcb66	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292453034.jpg	f	yellow
977459967	Leon	H&M	\N	\N	Khaki green	khaki green	#655d48	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0304946034.jpg	f	beige
985150631	Flirty Chantal earring	H&M	\N	\N	Mole	mole	#c6bab6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0292453025.jpg	f	white
988561666	Freja Coat	H&M	\N	\N	Grey	gray	#706f6d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0300908004.jpg	f	gray
933964934	TP MAX jersey pants SB	H&M	\N	\N	Brown	brown	#925027	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0326885051.jpg	f	brown
935371751	Basic LS t-shirt	H&M	\N	\N	Grey	gray	#3c383d	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0318951018.jpg	f	black
939681179	Mary Kate L/S	H&M	\N	\N	Khaki green	khaki green	#696753	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/034/0348870009.jpg	f	gray
940405865	Alicia wrap skirt	H&M	\N	\N	Beige	beige	#ceac98	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/032/0327310014.jpg	f	brown
941083431	Maria Shorts	H&M	\N	\N	Pink	pink	#cc9096	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/030/0307656020.jpg	f	red
943933678	NEW Sigge dressed belt	H&M	\N	\N	Brown	brown	#824033	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/033/0337991006.jpg	f	red
945752071	Pamela tee	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215337001.jpg	f	beige
900616063	Manson SF slim fit blazer	H&M	\N	\N	Blue	cobalt	#221d28	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241602028.jpg	f	purple
910712783	Tail tee	H&M	\N	\N	Green	forest green	#666954	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/036/0366686026.jpg	f	gray
911649646	V-Neck Milan TVP	H&M	\N	\N	Orange	orange	#d3b4aa	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/037/0378447043.jpg	f	brown
904453044	KRISTOFF Basic jersey polo BB	H&M	\N	\N	Blue	cobalt	#b6cee9	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0265071020.jpg	f	sky
905918756	Fix it tote bag	H&M	\N	\N	Black	black	#2e2f32	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241436001.jpg	f	black
910514473	Nora Cardigan	H&M	\N	\N	Pink	pink	#92665f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396033.jpg	f	black
910771660	Skinny Ankel Denim	H&M	\N	\N	Blue	cobalt	#74879f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136025.jpg	f	sky
913083074	NATE  basic S/S solid tee BB	H&M	\N	\N	Lilac Purple	lilac purple	#533289	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/026/0260736032.jpg	f	purple
914474811	Manson SF slim fit blazer	H&M	\N	\N	Blue	cobalt	#435476	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0241602024.jpg	f	blue
917981032	Skinny Ankel Denim	H&M	\N	\N	Blue	cobalt	#1d2a35	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0249136019.jpg	f	sky
918124026	Theron (1)	H&M	\N	\N	Turquoise	turquoise	#acb0aa	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347044.jpg	f	gray
918808580	Silver lake	H&M	\N	\N	Blue	cobalt	#696b7f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244267028.jpg	f	gray
919345910	Theron (1)	H&M	\N	\N	Lilac Purple	lilac purple	#b8b3cb	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/023/0237347028.jpg	f	purple
927291049	Nora Cardigan	H&M	\N	\N	Grey	gray	#7e7c81	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/025/0255396006.jpg	f	gray
940461398	Silver lake	H&M	\N	\N	White	white	\N	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/024/0244267004.jpg	f	beige
925410934	Godfather slim chino	H&M	\N	\N	Beige	beige	#b38e67	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/038/0384482002.jpg	f	beige
925845556	Pocketknit	H&M	\N	\N	Mole	mole	#d2c0b3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0399589022.jpg	f	brown
926219784	Sonny Pants.	H&M	\N	\N	Beige	beige	#c4b4a3	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0393772011.jpg	f	beige
927914361	Glamping	H&M	\N	\N	Green	forest green	#80a299	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/039/0396135046.jpg	f	turquoise
921266959	Cobra Tube.	H&M	\N	\N	Pink	pink	#918083	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0312829011.jpg	f	gray
977741997	Polo S/S Highline	H&M	\N	\N	Yellow	yellow	#cd9f5c	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0443860033.jpg	f	beige
979078162	CLAY TEE	H&M	\N	\N	Orange	orange	#eb8c84	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449570057.jpg	f	red
982275831	W Enzo (1)	H&M	\N	\N	Orange	orange	#fce1d6	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/042/0423112004.jpg	f	orange
987378134	Leon tee	H&M	\N	\N	Yellow	yellow	#d7a62f	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0445419015.jpg	f	yellow
988130746	Moscow Cross Bag	H&M	\N	\N	Yellow	yellow	#df9d29	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/043/0436570033.jpg	f	yellow
992956342	Brooke raw cut ss	H&M	\N	\N	Turquoise	turquoise	#cae2e4	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/041/0411413010.jpg	f	turquoise
997918991	THOMPSON woven sport pants	H&M	\N	\N	Grey	gray	#3f3f41	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/015/0150959013.jpg	f	black
947164946	Pamela tee	H&M	\N	\N	Black	black	#202024	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215337003.jpg	f	black
948890242	Coolio sunglasses	H&M	\N	\N	Black	black	#59494e	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/021/0215303005.jpg	f	gray
968750827	Zero Tee (1)	H&M	\N	\N	Lilac Purple	lilac purple	#d1cbda	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/044/0449263027.jpg	f	purple
969218181	PIMA shell ski trousers (1)	H&M	\N	\N	Lilac Purple	lilac purple	#8c6b71	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/050/0501923003.jpg	f	gray
976069883	Bull blazer	H&M	\N	\N	Brown	brown	#af8965	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0451286002.jpg	f	beige
979678881	Fav polo solid	H&M	\N	\N	Lilac Purple	lilac purple	#4d193b	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/047/0476315042.jpg	f	pink
981750986	Skinny Shaping	H&M	\N	\N	Blue	cobalt	#2f476a	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/029/0294076018.jpg	f	sky
984446310	Vintage H.W Shorts	H&M	\N	\N	Yellow	yellow	#dcb058	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/046/0468480028.jpg	f	yellow
986792898	Shaun (1)	H&M	\N	\N	Yellow	yellow	#d3b637	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/047/0477163017.jpg	f	yellow
988361898	DAISY SANDAL	H&M	\N	\N	Yellow	yellow	#e4d975	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/048/0482638014.jpg	f	yellow
993718058	Woody(1)	H&M	\N	\N	Green	forest green	#798481	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/045/0456163086.jpg	f	gray
996970337	RENEE REVERSABLE SCARF	H&M	\N	\N	Pink	pink	#f3cdc7	https://qdrant-nextjs-demo-product-images.s3.us-east-1.amazonaws.com/images/031/0310365019.jpg	f	red
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ix_products_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_products_id ON public.products USING btree (id);


--
-- PostgreSQL database dump complete
--

\unrestrict t4bJH87alwLYI69pCAEOTHoHB6JUB3mEjpLhy1ZyReY4GxAB7btRjH5CuoXPf68

