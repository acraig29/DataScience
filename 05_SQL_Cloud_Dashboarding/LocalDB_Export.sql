--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    categoryid integer NOT NULL,
    categoryname character varying(25),
    description character varying(255),
    picture bytea
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_categoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_categoryid_seq OWNER TO postgres;

--
-- Name: categories_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_categoryid_seq OWNED BY public.categories.categoryid;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customerid character varying(20) NOT NULL,
    customername character varying(50),
    contactname character varying(50),
    contacttitle character varying(50),
    address character varying(150),
    city character varying(20),
    region character varying(20),
    postalcode character varying(10),
    country character varying(35),
    phone character varying(60),
    fax character varying(60)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: employee_territories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_territories (
    employeeid integer NOT NULL,
    territoryid integer NOT NULL
);


ALTER TABLE public.employee_territories OWNER TO postgres;

--
-- Name: employee_territories_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_territories_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_territories_employeeid_seq OWNER TO postgres;

--
-- Name: employee_territories_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_territories_employeeid_seq OWNED BY public.employee_territories.employeeid;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    employeeid integer NOT NULL,
    lastname character varying(35),
    firstname character varying(35),
    title character varying(40),
    titleofcourtesy character varying(10),
    birthdate date,
    hiredate date,
    address character varying(150),
    city character varying(50),
    region character varying(10),
    postalcode character varying(20),
    country character varying(30),
    homephone character varying(60),
    extension character varying(15),
    photo bytea,
    notes character varying(1024),
    reportsto character varying(10),
    photopath character varying(300)
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_employeeid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_employeeid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_employeeid_seq OWNER TO postgres;

--
-- Name: employees_employeeid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_employeeid_seq OWNED BY public.employees.employeeid;


--
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderdetails (
    orderdetailid integer NOT NULL,
    orderid integer,
    productid integer NOT NULL,
    unitprice numeric(5,2),
    quantity integer,
    discount numeric(5,2)
);


ALTER TABLE public.orderdetails OWNER TO postgres;

--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderdetails_orderdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderdetails_orderdetailid_seq OWNER TO postgres;

--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderdetails_orderdetailid_seq OWNED BY public.orderdetails.orderdetailid;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    orderid integer NOT NULL,
    customerid character varying(40),
    employeeid integer,
    orderdate date,
    requireddate date,
    shippeddate date,
    shipvia integer,
    freight numeric(10,2),
    shippername character varying(60),
    shipaddress character varying(150),
    shipcity character varying(80),
    shipregion character varying(40),
    shippostalcode character varying(20),
    shipcountry character varying(80)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_orderid_seq OWNER TO postgres;

--
-- Name: orders_orderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    productname character varying(100),
    supplierid integer,
    categoryid integer,
    unitprice numeric(5,2),
    quantityperunit character varying(200),
    unitsinstock integer,
    unitsonorder integer,
    reorderlevel integer,
    discontinued integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_productid_seq OWNER TO postgres;

--
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    regionid integer NOT NULL,
    regiondescription character varying(50) NOT NULL
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- Name: regions_regionid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_regionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_regionid_seq OWNER TO postgres;

--
-- Name: regions_regionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_regionid_seq OWNED BY public.regions.regionid;


--
-- Name: shippers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippers (
    shipperid integer NOT NULL,
    shippername character varying(25),
    phone character varying(15)
);


ALTER TABLE public.shippers OWNER TO postgres;

--
-- Name: shippers_shipperid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shippers_shipperid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shippers_shipperid_seq OWNER TO postgres;

--
-- Name: shippers_shipperid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shippers_shipperid_seq OWNED BY public.shippers.shipperid;


--
-- Name: suppliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.suppliers (
    supplierid integer NOT NULL,
    suppliername character varying(200),
    contactname character varying(200),
    contacttitle character varying(100),
    address character varying(150),
    city character varying(40),
    region character varying(30),
    postalcode character varying(10),
    country character varying(15),
    phone character varying(35),
    fax character varying(35),
    homepage character varying(250)
);


ALTER TABLE public.suppliers OWNER TO postgres;

--
-- Name: suppliers_supplierid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.suppliers_supplierid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.suppliers_supplierid_seq OWNER TO postgres;

--
-- Name: suppliers_supplierid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.suppliers_supplierid_seq OWNED BY public.suppliers.supplierid;


--
-- Name: territories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.territories (
    territoryid integer NOT NULL,
    territorydescription character varying(100),
    regionid integer
);


ALTER TABLE public.territories OWNER TO postgres;

--
-- Name: categories categoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN categoryid SET DEFAULT nextval('public.categories_categoryid_seq'::regclass);


--
-- Name: employee_territories employeeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_territories ALTER COLUMN employeeid SET DEFAULT nextval('public.employee_territories_employeeid_seq'::regclass);


--
-- Name: employees employeeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN employeeid SET DEFAULT nextval('public.employees_employeeid_seq'::regclass);


--
-- Name: orderdetails orderdetailid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails ALTER COLUMN orderdetailid SET DEFAULT nextval('public.orderdetails_orderdetailid_seq'::regclass);


--
-- Name: orders orderid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);


--
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- Name: regions regionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN regionid SET DEFAULT nextval('public.regions_regionid_seq'::regclass);


--
-- Name: shippers shipperid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippers ALTER COLUMN shipperid SET DEFAULT nextval('public.shippers_shipperid_seq'::regclass);


--
-- Name: suppliers supplierid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers ALTER COLUMN supplierid SET DEFAULT nextval('public.suppliers_supplierid_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (categoryid, categoryname, description, picture) FROM stdin;
1	Beverages	Soft drinks coffees teas beers and ales	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303041303239303030303432344439383239303030303030303030303030353630303030303032383030303030304143303030303030373830303030303030313030303430303030303030303030303030303030303038383042303030303838304230303030303830303030
2	Condiments	Sweet and savory sauces relishes spreads and seasonings	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303041303239303030303432344439383239303030303030303030303030353630303030303032383030303030304143303030303030373830303030303030313030303430303030303030303030303030303030303038383042303030303838304230303030303830303030
3	Confections	Desserts candies and sweet breads	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303041303239303030303432344439383239303030303030303030303030353630303030303032383030303030304143303030303030373830303030303030313030303430303030303030303030303030303030303038383042303030303838304230303030303830303030
4	Dairy Products	Cheeses	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303041303239303030303432344439383239303030303030303030303030353630303030303032383030303030304143303030303030373830303030303030313030303430303030303030303030303030303030303038383042303030303838304230303030303830303030
5	Grains_Cereals	Breads crackers pasta and cereal	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303041303239303030303432344439383239303030303030303030303030353630303030303032383030303030304143303030303030373830303030303030313030303430303030303030303030303030303030303038383042303030303838304230303030303830303030
6	Meat_Poultry	Prepared meats	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303041303239303030303432344439383239303030303030303030303030353630303030303032383030303030304143303030303030373830303030303030313030303430303030303030303030303030303030303038383042303030303838304230303030303830303030
7	Produce	Dried fruit and bean curd	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303041303239303030303432344439383239303030303030303030303030353630303030303032383030303030304143303030303030373830303030303030313030303430303030303030303030303030303030303038383042303030303838304230303030303830303030
8	Seafood	Seaweed and fish	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303041303239303030303432344439383239303030303030303030303030353630303030303032383030303030304143303030303030373830303030303030313030303430303030303030303030303030303030303038383042303030303838304230303030303830303030
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customerid, customername, contactname, contacttitle, address, city, region, postalcode, country, phone, fax) FROM stdin;
ALFKI	Alfreds Futterkiste	Maria Anders	Sales Representative	Obere Str. 57	Berlin	NULL	12209	Germany	030-0074321	030-0076545
ANATR	Ana Trujillo Emparedados y helados	Ana Trujillo	Owner	Avda. de la ConstituciÃ³n 2222	MÃ©xico D.F.	NULL	5021	Mexico	(5) 555-4729	(5) 555-3745
ANTON	Antonio Moreno TaquerÃ­a	Antonio Moreno	Owner	Mataderos  2312	MÃ©xico D.F.	NULL	5023	Mexico	(5) 555-3932	NULL
AROUT	Around the Horn	Thomas Hardy	Sales Representative	120 Hanover Sq.	London	NULL	WA1 1DP	UK	(171) 555-7788	(171) 555-6750
BERGS	Berglunds snabbkÃ¶p	Christina Berglund	Order Administrator	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden	0921-12 34 65	0921-12 34 67
BLAUS	Blauer See Delikatessen	Hanna Moos	Sales Representative	Forsterstr. 57	Mannheim	NULL	68306	Germany	0621-08460	0621-08924
BLONP	Blondesddsl pÃ¨re et fils	FrÃ©dÃ©rique Citeaux	Marketing Manager	24 place KlÃ©ber	Strasbourg	NULL	67000	France	88.60.15.31	88.60.15.32
BOLID	BÃ³lido Comidas preparadas	MartÃ­n Sommer	Owner	67C Araquil	Madrid	NULL	28023	Spain	(91) 555 22 82	(91) 555 91 99
BONAP	Bon app'	Laurence Lebihan	Owner	12 rue des Bouchers	Marseille	NULL	13008	France	91.24.45.40	91.24.45.41
BOTTM	Bottom-Dollar Markets	Elizabeth Lincoln	Accounting Manager	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada	(604) 555-4729	(604) 555-3745
BSBEV	B's Beverages	Victoria Ashworth	Sales Representative	Fauntleroy Circus	London	NULL	EC2 5NT	UK	(171) 555-1212	NULL
CACTU	Cactus Comidas para llevar	Patricio Simpson	Sales Agent	Cerrito 333	Buenos Aires	NULL	1010	Argentina	(1) 135-5555	(1) 135-4892
CENTC	Centro comercial Moctezuma	Francisco Chang	Marketing Manager	Sierras de Granada 9993	MÃ©xico D.F.	NULL	5022	Mexico	(5) 555-3392	(5) 555-7293
CHOPS	Chop-suey Chinese	Yang Wang	Owner	Hauptstr. 29	Bern	NULL	3012	Switzerland	0452-076545	NULL
COMMI	ComÃ©rcio Mineiro	Pedro Afonso	Sales Associate	23 Av. dos LusÃ­adas	Sao Paulo	SP	05432-043	Brazil	(11) 555-7647	NULL
CONSH	Consolidated Holdings	Elizabeth Brown	Sales Representative	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK	(171) 555-2282	(171) 555-9199
DRACD	Drachenblut Delikatessen	Sven Ottlieb	Order Administrator	Walserweg 21	Aachen	NULL	52066	Germany	0241-039123	0241-059428
DUMON	Du monde entier	Janine Labrune	Owner	67 rue des Cinquante Otages	Nantes	NULL	44000	France	40.67.88.88	40.67.89.89
EASTC	Eastern Connection	Ann Devon	Sales Agent	35 King George	London	NULL	WX3 6FW	UK	(171) 555-0297	(171) 555-3373
ERNSH	Ernst Handel	Roland Mendel	Sales Manager	Kirchgasse 6	Graz	NULL	8010	Austria	7675-3425	7675-3426
FAMIA	Familia Arquibaldo	Aria Cruz	Marketing Assistant	Rua OrÃ³s 92	Sao Paulo	SP	05442-030	Brazil	(11) 555-9857	NULL
FISSA	FISSA Fabrica Inter. Salchichas S.A.	Diego Roel	Accounting Manager	C/ Moralzarzal 86	Madrid	NULL	28034	Spain	(91) 555 94 44	(91) 555 55 93
FOLIG	Folies gourmandes	Martine RancÃ©	Assistant Sales Agent	184 chaussÃ©e de Tournai	Lille	NULL	59000	France	20.16.10.16	20.16.10.17
FOLKO	Folk och fÃ¤ HB	Maria Larsson	Owner	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden	0695-34 67 21	NULL
FRANK	Frankenversand	Peter Franken	Marketing Manager	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany	089-0877310	089-0877451
FRANR	France restauration	Carine Schmitt	Marketing Manager	54 rue Royale	Nantes	NULL	44000	France	40.32.21.21	40.32.21.20
FRANS	Franchi S.p.A.	Paolo Accorti	Sales Representative	Via Monte Bianco 34	Torino	NULL	10100	Italy	011-4988260	011-4988261
FURIB	Furia Bacalhau e Frutos do Mar	Lino Rodriguez	Sales Manager	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal	(1) 354-2534	(1) 354-2535
GALED	GalerÃ­a del gastrÃ³nomo	Eduardo Saavedra	Marketing Manager	Rambla de CataluÃ±a 23	Barcelona	NULL	8022	Spain	(93) 203 4560	(93) 203 4561
GODOS	Godos Cocina TÃ­pica	JosÃ© Pedro Freyre	Sales Manager	C/ Romero 33	Sevilla	NULL	41101	Spain	(95) 555 82 82	NULL
GOURL	Gourmet Lanchonetes	AndrÃ© Fonseca	Sales Associate	Av. Brasil 442	Campinas	SP	04876-786	Brazil	(11) 555-9482	NULL
GREAL	Great Lakes Food Market	Howard Snyder	Marketing Manager	2732 Baker Blvd.	Eugene	OR	97403	USA	(503) 555-7555	NULL
GROSR	GROSELLA-Restaurante	Manuel Pereira	Owner	5Âª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela	(2) 283-2951	(2) 283-3397
HANAR	Hanari Carnes	Mario Pontes	Accounting Manager	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil	(21) 555-0091	(21) 555-8765
HILAA	HILARION-Abastos	Carlos HernÃ¡ndez	Sales Representative	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela	(5) 555-1340	(5) 555-1948
HUNGC	Hungry Coyote Import Store	Yoshi Latimer	Sales Representative	City Center Plaza 516 Main St.	Elgin	OR	97827	USA	(503) 555-6874	(503) 555-2376
HUNGO	Hungry Owl All-Night Grocers	Patricia McKenna	Sales Associate	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland	2967 542	2967 3333
ISLAT	Island Trading	Helen Bennett	Marketing Manager	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK	(198) 555-8888	NULL
KOENE	KÃ¶niglich Essen	Philip Cramer	Sales Associate	Maubelstr. 90	Brandenburg	NULL	14776	Germany	0555-09876	NULL
LACOR	La corne d'abondance	Daniel Tonini	Sales Representative	67 avenue de l'Europe	Versailles	NULL	78000	France	30.59.84.10	30.59.85.11
LAMAI	La maison d'Asie	Annette Roulet	Sales Manager	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France	61.77.61.10	61.77.61.11
LAUGB	Laughing Bacchus Wine Cellars	Yoshi Tannamuri	Marketing Assistant	1900 Oak St.	Vancouver	BC	V3F 2K1	Canada	(604) 555-3392	(604) 555-7293
LAZYK	Lazy K Kountry Store	John Steel	Marketing Manager	12 Orchestra Terrace	Walla Walla	WA	99362	USA	(509) 555-7969	(509) 555-6221
LEHMS	Lehmanns Marktstand	Renate Messner	Sales Representative	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany	069-0245984	069-0245874
LETSS	Let's Stop N Shop	Jaime Yorres	Owner	87 Polk St. Suite 5	San Francisco	CA	94117	USA	(415) 555-5938	NULL
LILAS	LILA-Supermercado	Carlos GonzÃ¡lez	Accounting Manager	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela	(9) 331-6954	(9) 331-7256
LINOD	LINO-Delicateses	Felipe Izquierdo	Owner	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela	(8) 34-56-12	(8) 34-93-93
LONEP	Lonesome Pine Restaurant	Fran Wilson	Sales Manager	89 Chiaroscuro Rd.	Portland	OR	97219	USA	(503) 555-9573	(503) 555-9646
MAGAA	Magazzini Alimentari Riuniti	Giovanni Rovelli	Marketing Manager	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy	035-640230	035-640231
MAISD	Maison Dewey	Catherine Dewey	Sales Agent	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium	(02) 201 24 67	(02) 201 24 68
MEREP	MÃ¨re Paillarde	Jean FresniÃ¨re	Marketing Assistant	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada	(514) 555-8054	(514) 555-8055
MORGK	Morgenstern Gesundkost	Alexander Feuer	Marketing Assistant	Heerstr. 22	Leipzig	NULL	4179	Germany	0342-023176	NULL
NORTS	North/South	Simon Crowther	Sales Associate	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK	(171) 555-7733	(171) 555-2530
OCEAN	OcÃ©ano AtlÃ¡ntico Ltda.	Yvonne Moncada	Sales Agent	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina	(1) 135-5333	(1) 135-5535
OLDWO	Old World Delicatessen	Rene Phillips	Sales Representative	2743 Bering St.	Anchorage	AK	99508	USA	(907) 555-7584	(907) 555-2880
OTTIK	Ottilies KÃ¤seladen	Henriette Pfalzheim	Owner	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany	0221-0644327	0221-0765721
PARIS	Paris spÃ©cialitÃ©s	Marie Bertrand	Owner	265 boulevard Charonne	Paris	NULL	75012	France	(1) 42.34.22.66	(1) 42.34.22.77
PERIC	Pericles Comidas clÃ¡sicas	Guillermo FernÃ¡ndez	Sales Representative	Calle Dr. Jorge Cash 321	MÃ©xico D.F.	NULL	5033	Mexico	(5) 552-3745	(5) 545-3745
PICCO	Piccolo und mehr	Georg Pipps	Sales Manager	Geislweg 14	Salzburg	NULL	5020	Austria	6562-9722	6562-9723
PRINI	Princesa Isabel Vinhos	Isabel de Castro	Sales Representative	Estrada da saÃºde n. 58	Lisboa	NULL	1756	Portugal	(1) 356-5634	NULL
QUEDE	Que DelÃ­cia	Bernardo Batista	Accounting Manager	Rua da Panificadora	 12Rio de Janeiro	RJ	02389-673	Brazil	(21) 555-4252	(21) 555-4545
QUEEN	Queen Cozinha	LÃºcia Carvalho	Marketing Assistant	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil	(11) 555-1189	NULL
QUICK	QUICK-Stop	Horst Kloss	Accounting Manager	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany	0372-035188	NULL
RANCH	Rancho grande	Sergio GutiÃ©rrez	Sales Representative	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina	(1) 123-5555	(1) 123-5556
RATTC	Rattlesnake Canyon Grocery	Paula Wilson	Assistant Sales Representative	2817 Milton Dr.	Albuquerque	NM	87110	USA	(505) 555-5939	(505) 555-3620
REGGC	Reggiani Caseifici	Maurizio Moroni	Sales Associate	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy	0522-556721	0522-556722
RICAR	Ricardo Adocicados	Janete Limeira	Assistant Sales Agent	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil	(21) 555-3412	NULL
RICSU	Richter Supermarkt	Michael Holz	Sales Manager	Grenzacherweg 237	GenÃ¨ve	NULL	1203	Switzerland	0897-034214	NULL
ROMEY	Romero y tomillo	Alejandra Camino	Accounting Manager	Gran VÃ­a 1	Madrid	NULL	28001	Spain	(91) 745 6200	(91) 745 6210
SANTG	SantÃ© Gourmet	Jonas Bergulfsen	Owner	Erling Skakkes gate 78	Stavern	NULL	4110	Norway	07-98 92 35	07-98 92 47
SAVEA	Save-a-lot Markets	Jose Pavarotti	Sales Representative	187 Suffolk Ln.	Boise	ID	83720	USA	(208) 555-8097	NULL
SEVES	Seven Seas Imports	Hari Kumar	Sales Manager	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK	(171) 555-1717	(171) 555-5646
SIMOB	Simons bistro	Jytte Petersen	Owner	VinbÃ¦ltet 34	Kobenhavn	NULL	1734	Denmark	31 12 34 56	31 13 35 57
SPECD	SpÃ©cialitÃ©s du monde	Dominique Perrier	Marketing Manager	25 rue Lauriston	Paris	NULL	75016	France	(1) 47.55.60.10	(1) 47.55.60.20
SPLIR	Split Rail Beer & Ale	Art Braunschweiger	Sales Manager	P.O. Box 555	Lander	WY	82520	USA	(307) 555-4680	(307) 555-6525
SUPRD	SuprÃªmes dÃ©lices	Pascale Cartrain	Accounting Manager	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium	(071) 23 67 22 20	(071) 23 67 22 21
THEBI	The Big Cheese	Liz Nixon	Marketing Manager	89 Jefferson Way Suite 2	Portland	OR	97201	USA	(503) 555-3612	NULL
THECR	The Cracker Box	Liu Wong	Marketing Assistant	55 Grizzly Peak Rd.	Butte	MT	59801	USA	(406) 555-5834	(406) 555-8083
TOMSP	Toms SpezialitÃ¤ten	Karin Josephs	Marketing Manager	Luisenstr. 48	MÃ¼nster	NULL	44087	Germany	0251-031259	0251-035695
TORTU	Tortuga Restaurante	Miguel Angel Paolino	Owner	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico	(5) 555-2933	NULL
TRADH	TradiÃ§Ã£o Hipermercados	Anabela Domingues	Sales Representative	Av. InÃªs de Castro 414	Sao Paulo	SP	05634-030	Brazil	(11) 555-2167	(11) 555-2168
TRAIH	Trail's Head Gourmet Provisioners	Helvetius Nagy	Sales Associate	722 DaVinci Blvd.	Kirkland	WA	98034	USA	(206) 555-8257	(206) 555-2174
VAFFE	Vaffeljernet	Palle Ibsen	Sales Manager	Smagsloget 45	Ã…rhus	NULL	8200	Denmark	86 21 32 43	86 22 33 44
VICTE	Victuailles en stock	Mary Saveley	Sales Agent	2 rue du Commerce	Lyon	NULL	69004	France	78.32.54.86	78.32.54.87
VINET	Vins et alcools Chevalier	Paul Henriot	Accounting Manager	59 rue de l'Abbaye	Reims	NULL	51100	France	26.47.15.10	26.47.15.11
WANDK	Die Wandernde Kuh	Rita MÃ¼ller	Sales Representative	Adenauerallee 900	Stuttgart	NULL	70563	Germany	0711-020361	0711-035428
WARTH	Wartian Herkku	Pirkko Koskitalo	Accounting Manager	Torikatu 38	Oulu	NULL	90110	Finland	981-443655	981-443655
WELLI	Wellington Importadora	Paula Parente	Sales Manager	Rua do Mercado 12	Resende	SP	08737-363	Brazil	(14) 555-8122	NULL
WHITC	White Clover Markets	Karl Jablonski	Owner	305 - 14th Ave. S. Suite 3B	Seattle	WA	98128	USA	(206) 555-4112	(206) 555-4115
WILMK	Wilman Kala	Matti Karttunen	Owner/Marketing Assistant	Keskuskatu 45	Helsinki	NULL	21240	Finland	90-224 8858	90-224 8858
WOLZA	Wolski  Zajazd	Zbyszek Piestrzeniewicz	Owner	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland	(26) 642-7012	(26) 642-7012
\.


--
-- Data for Name: employee_territories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee_territories (employeeid, territoryid) FROM stdin;
1	6897
1	19713
2	1581
2	1730
2	1833
2	2116
2	2139
2	2184
2	40222
3	30346
3	31406
3	32859
3	33607
4	20852
4	27403
4	27511
5	2903
5	7960
5	8837
5	10019
5	10038
5	11747
5	14450
6	85014
6	85251
6	98004
6	98052
6	98104
7	60179
7	60601
7	80202
7	80909
7	90405
7	94025
7	94105
7	95008
7	95054
7	95060
8	19428
8	44122
8	45839
8	53404
9	3049
9	3801
9	48075
9	48084
9	48304
9	55113
9	55439
\.


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (employeeid, lastname, firstname, title, titleofcourtesy, birthdate, hiredate, address, city, region, postalcode, country, homephone, extension, photo, notes, reportsto, photopath) FROM stdin;
1	Davolio	Nancy	Sales Representative	Ms.	1948-12-08	1992-05-01	507 20th Ave. E. Apt. 2A	Seattle	WA	98122	USA	(206) 555-9857	5467	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303032303534303030303432344432303534303030303030303030303030373630303030303032383030303030304330303030303030444630303030303030313030303430303030303030303030413035333030303043453045303030304438304530303030303030303030	Education includes a BA in psychology from Colorado State University in 1970.  She also completed The Art of the Cold Call.  Nancy is a member of Toastmasters International.	2	http://accweb/emmployees/davolio.bmp
2	Fuller	Andrew	Vice President Sales	Dr.	1952-02-19	1992-08-14	908 W. Capital Way	Tacoma	WA	98401	USA	(206) 555-9482	3457	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303032303534303030303432344432303534303030303030303030303030373630303030303032383030303030304330303030303030444630303030303030313030303430303030303030303030413035333030303043453045303030304438304530303030303030303030	Andrew received his BTS commercial in 1974 and a Ph.D. in international marketing from the University of Dallas in 1981.  He is fluent in French and Italian and reads German.  He joined the company as a sales representative was promoted to sales manager	NULL	http://accweb/emmployees/fuller.bmp
3	Leverling	Janet	Sales Representative	Ms.	1963-08-30	1992-04-01	722 Moss Bay Blvd.	Kirkland	WA	98033	USA	(206) 555-3412	3355	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303038303534303030303432344438303534303030303030303030303030373630303030303032383030303030304330303030303030453030303030303030313030303430303030303030303030303035343030303043453045303030304438304530303030303030303030	Janet has a BS degree in chemistry from Boston College (1984). She has also completed a certificate program in food retailing management.  Janet was hired as a sales associate in 1991 and promoted to sales representative in February 1992.	2	http://accweb/emmployees/leverling.bmp
4	Peacock	Margaret	Sales Representative	Mrs.	1937-09-19	1993-05-03	4110 Old Redmond Rd.	Redmond	WA	98052	USA	(206) 555-8122	5176	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303032303534303030303432344432303534303030303030303030303030373630303030303032383030303030304330303030303030444630303030303030313030303430303030303030303030413035333030303043453045303030304438304530303030303030303030	Margaret holds a BA in English literature from Concordia College (1958) and an MA from the American Institute of Culinary Arts (1966).  She was assigned to the London office temporarily from July through November 1992.	2	http://accweb/emmployees/peacock.bmp
5	Buchanan	Steven	Sales Manager	Mr.	1955-03-04	1993-10-17	14 Garrett Hill	London	NULL	SW1 8JR	UK	(71) 555-4848	3453	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303032303534303030303432344432303534303030303030303030303030373630303030303032383030303030304330303030303030444630303030303030313030303430303030303030303030413035333030303043453045303030304438304530303030303030303030	Steven Buchanan graduated from St. Andrews University in Scotland with a BSC degree in 1976.  Upon joining the company as a sales representative in 1992 he spent 6 months in an orientation program at the Seattle office.	2	http://accweb/emmployees/buchanan.bmp
6	Suyama	Michael	Sales Representative	Mr.	1963-07-02	1993-10-17	Coventry House Miner Rd.	London	NULL	EC2 7JR	UK	(71) 555-7773	428	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303032303534303030303432344431363534303030303030303030303030373630303030303032383030303030304330303030303030444630303030303030313030303430303030303030303030413035333030303043453045303030304438304530303030303030303030	Michael is a graduate of Sussex University (MA Economics 1983) and the University of California at Los Angeles (MBA marketing 1986).  He has also taken the courses Multi-Cultural Selling and Time Management for the Sales Professional.	5	http://accweb/emmployees/davolio.bmp
7	King	Robert	Sales Representative	Mr.	1960-05-29	1994-01-02	Edgeham Hollow Winchester Way	London	NULL	RG1 9SP	UK	(71) 555-5598	465	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303032303534303030303432344431363534303030303030303030303030373630303030303032383030303030304330303030303030444630303030303030313030303430303030303030303030413035333030303043453045303030304438304530303030303030303030	Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan in 1992 the year he joined the company.	5	http://accweb/emmployees/davolio.bmp
8	Callahan	Laura	Inside Sales Coordinator	Ms.	1958-01-09	1994-03-05	4726 11th Ave. N.E.	Seattle	WA	98105	USA	(206) 555-1189	2344	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303032303534303030303432344431363534303030303030303030303030373630303030303032383030303030304330303030303030444630303030303030313030303430303030303030303030413035333030303043453045303030304438304530303030303030303030	Laura received a BA in psychology from the University of Washington.  She has also completed a course in business French.  She reads and writes French.	2	http://accweb/emmployees/davolio.bmp
9	Dodsworth	Anne	Sales Representative	Ms.	1966-01-27	1994-11-15	7 Houndstooth Rd.	London	NULL	WG2 7LT	UK	(71) 555-4444	452	\\x30783135314332463030303230303030303030443030304530303134303032313030464646464646464634323639373436443631373032303439364436313637363530303530363136393645373432453530363936333734373537323635303030313035303030303032303030303030303730303030303035303432373237353733363830303030303030303030303030303030303032303534303030303432344431363534303030303030303030303030373630303030303032383030303030304330303030303030444630303030303030313030303430303030303030303030413035333030303043453045303030304438304530303030303030303030	Anne has a BA degree in English from St. Lawrence College.  She is fluent in French and German.	5	http://accweb/emmployees/davolio.bmp
\.


--
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderdetails (orderdetailid, orderid, productid, unitprice, quantity, discount) FROM stdin;
1	10248	11	14.00	12	0.00
2	10248	42	9.80	10	0.00
3	10248	72	34.80	5	0.00
4	10249	14	18.60	9	0.00
5	10249	51	42.40	40	0.00
6	10250	41	7.70	10	0.00
7	10250	51	42.40	35	0.15
8	10250	65	16.80	15	0.15
9	10251	22	16.80	6	0.05
10	10251	57	15.60	15	0.05
11	10251	65	16.80	20	0.00
12	10252	20	64.80	40	0.05
13	10252	33	2.00	25	0.05
14	10252	60	27.20	40	0.00
15	10253	31	10.00	20	0.00
16	10253	39	14.40	42	0.00
17	10253	49	16.00	40	0.00
18	10254	24	3.60	15	0.15
19	10254	55	19.20	21	0.15
20	10254	74	8.00	21	0.00
21	10255	2	15.20	20	0.00
22	10255	16	13.90	35	0.00
23	10255	36	15.20	25	0.00
24	10255	59	44.00	30	0.00
25	10256	53	26.20	15	0.00
26	10256	77	10.40	12	0.00
27	10257	27	35.10	25	0.00
28	10257	39	14.40	6	0.00
29	10257	77	10.40	15	0.00
30	10258	2	15.20	50	0.20
31	10258	5	17.00	65	0.20
32	10258	32	25.60	6	0.20
33	10259	21	8.00	10	0.00
34	10259	37	20.80	1	0.00
35	10260	41	7.70	16	0.25
36	10260	57	15.60	50	0.00
37	10260	62	39.40	15	0.25
38	10260	70	12.00	21	0.25
39	10261	21	8.00	20	0.00
40	10261	35	14.40	20	0.00
41	10262	5	17.00	12	0.20
42	10262	7	24.00	15	0.00
43	10262	56	30.40	2	0.00
44	10263	16	13.90	60	0.25
45	10263	24	3.60	28	0.00
46	10263	30	20.70	60	0.25
47	10263	74	8.00	36	0.25
48	10264	2	15.20	35	0.00
49	10264	41	7.70	25	0.15
50	10265	17	31.20	30	0.00
51	10265	70	12.00	20	0.00
52	10266	12	30.40	12	0.05
53	10267	40	14.70	50	0.00
54	10267	59	44.00	70	0.15
55	10267	76	14.40	15	0.15
56	10268	29	99.00	10	0.00
57	10268	72	27.80	4	0.00
58	10269	33	2.00	60	0.05
59	10269	72	27.80	20	0.05
60	10270	36	15.20	30	0.00
61	10270	43	36.80	25	0.00
62	10271	33	2.00	24	0.00
63	10272	20	64.80	6	0.00
64	10272	31	10.00	40	0.00
65	10272	72	27.80	24	0.00
66	10273	10	24.80	24	0.05
67	10273	31	10.00	15	0.05
68	10273	33	2.00	20	0.00
69	10273	40	14.70	60	0.05
70	10273	76	14.40	33	0.05
71	10274	71	17.20	20	0.00
72	10274	72	27.80	7	0.00
73	10275	24	3.60	12	0.05
74	10275	59	44.00	6	0.05
75	10276	10	24.80	15	0.00
76	10276	13	4.80	10	0.00
77	10277	28	36.40	20	0.00
78	10277	62	39.40	12	0.00
79	10278	44	15.50	16	0.00
80	10278	59	44.00	15	0.00
81	10278	63	35.10	8	0.00
82	10278	73	12.00	25	0.00
83	10279	17	31.20	15	0.25
84	10280	24	3.60	12	0.00
85	10280	55	19.20	20	0.00
86	10280	75	6.20	30	0.00
87	10281	19	7.30	1	0.00
88	10281	24	3.60	6	0.00
89	10281	35	14.40	4	0.00
90	10282	30	20.70	6	0.00
91	10282	57	15.60	2	0.00
92	10283	15	12.40	20	0.00
93	10283	19	7.30	18	0.00
94	10283	60	27.20	35	0.00
95	10283	72	27.80	3	0.00
96	10284	27	35.10	15	0.25
97	10284	44	15.50	21	0.00
98	10284	60	27.20	20	0.25
99	10284	67	11.20	5	0.25
100	10285	1	14.40	45	0.20
101	10285	40	14.70	40	0.20
102	10285	53	26.20	36	0.20
103	10286	35	14.40	100	0.00
104	10286	62	39.40	40	0.00
105	10287	16	13.90	40	0.15
106	10287	34	11.20	20	0.00
107	10287	46	9.60	15	0.15
108	10288	54	5.90	10	0.10
109	10288	68	10.00	3	0.10
110	10289	3	8.00	30	0.00
111	10289	64	26.60	9	0.00
112	10290	5	17.00	20	0.00
113	10290	29	99.00	15	0.00
114	10290	49	16.00	15	0.00
115	10290	77	10.40	10	0.00
116	10291	13	4.80	20	0.10
117	10291	44	15.50	24	0.10
118	10291	51	42.40	2	0.10
119	10292	20	64.80	20	0.00
120	10293	18	50.00	12	0.00
121	10293	24	3.60	10	0.00
122	10293	63	35.10	5	0.00
123	10293	75	6.20	6	0.00
124	10294	1	14.40	18	0.00
125	10294	17	31.20	15	0.00
126	10294	43	36.80	15	0.00
127	10294	60	27.20	21	0.00
128	10294	75	6.20	6	0.00
129	10295	56	30.40	4	0.00
130	10296	11	16.80	12	0.00
131	10296	16	13.90	30	0.00
132	10296	69	28.80	15	0.00
133	10297	39	14.40	60	0.00
134	10297	72	27.80	20	0.00
135	10298	2	15.20	40	0.00
136	10298	36	15.20	40	0.25
137	10298	59	44.00	30	0.25
138	10298	62	39.40	15	0.00
139	10299	19	7.30	15	0.00
140	10299	70	12.00	20	0.00
141	10300	66	13.60	30	0.00
142	10300	68	10.00	20	0.00
143	10301	40	14.70	10	0.00
144	10301	56	30.40	20	0.00
145	10302	17	31.20	40	0.00
146	10302	28	36.40	28	0.00
147	10302	43	36.80	12	0.00
148	10303	40	14.70	40	0.10
149	10303	65	16.80	30	0.10
150	10303	68	10.00	15	0.10
151	10304	49	16.00	30	0.00
152	10304	59	44.00	10	0.00
153	10304	71	17.20	2	0.00
154	10305	18	50.00	25	0.10
155	10305	29	99.00	25	0.10
156	10305	39	14.40	30	0.10
157	10306	30	20.70	10	0.00
158	10306	53	26.20	10	0.00
159	10306	54	5.90	5	0.00
160	10307	62	39.40	10	0.00
161	10307	68	10.00	3	0.00
162	10308	69	28.80	1	0.00
163	10308	70	12.00	5	0.00
164	10309	4	17.60	20	0.00
165	10309	6	20.00	30	0.00
166	10309	42	11.20	2	0.00
167	10309	43	36.80	20	0.00
168	10309	71	17.20	3	0.00
169	10310	16	13.90	10	0.00
170	10310	62	39.40	5	0.00
171	10311	42	11.20	6	0.00
172	10311	69	28.80	7	0.00
173	10312	28	36.40	4	0.00
174	10312	43	36.80	24	0.00
175	10312	53	26.20	20	0.00
176	10312	75	6.20	10	0.00
177	10313	36	15.20	12	0.00
178	10314	32	25.60	40	0.10
179	10314	58	10.60	30	0.10
180	10314	62	39.40	25	0.10
181	10315	34	11.20	14	0.00
182	10315	70	12.00	30	0.00
183	10316	41	7.70	10	0.00
184	10316	62	39.40	70	0.00
185	10317	1	14.40	20	0.00
186	10318	41	7.70	20	0.00
187	10318	76	14.40	6	0.00
188	10319	17	31.20	8	0.00
189	10319	28	36.40	14	0.00
190	10319	76	14.40	30	0.00
191	10320	71	17.20	30	0.00
192	10321	35	14.40	10	0.00
193	10322	52	5.60	20	0.00
194	10323	15	12.40	5	0.00
195	10323	25	11.20	4	0.00
196	10323	39	14.40	4	0.00
197	10324	16	13.90	21	0.15
198	10324	35	14.40	70	0.15
199	10324	46	9.60	30	0.00
200	10324	59	44.00	40	0.15
201	10324	63	35.10	80	0.15
202	10325	6	20.00	6	0.00
203	10325	13	4.80	12	0.00
204	10325	14	18.60	9	0.00
205	10325	31	10.00	4	0.00
206	10325	72	27.80	40	0.00
207	10326	4	17.60	24	0.00
208	10326	57	15.60	16	0.00
209	10326	75	6.20	50	0.00
210	10327	2	15.20	25	0.20
211	10327	11	16.80	50	0.20
212	10327	30	20.70	35	0.20
213	10327	58	10.60	30	0.20
214	10328	59	44.00	9	0.00
215	10328	65	16.80	40	0.00
216	10328	68	10.00	10	0.00
217	10329	19	7.30	10	0.05
218	10329	30	20.70	8	0.05
219	10329	38	210.80	20	0.05
220	10329	56	30.40	12	0.05
221	10330	26	24.90	50	0.15
222	10330	72	27.80	25	0.15
223	10331	54	5.90	15	0.00
224	10332	18	50.00	40	0.20
225	10332	42	11.20	10	0.20
226	10332	47	7.60	16	0.20
227	10333	14	18.60	10	0.00
228	10333	21	8.00	10	0.10
229	10333	71	17.20	40	0.10
230	10334	52	5.60	8	0.00
231	10334	68	10.00	10	0.00
232	10335	2	15.20	7	0.20
233	10335	31	10.00	25	0.20
234	10335	32	25.60	6	0.20
235	10335	51	42.40	48	0.20
236	10336	4	17.60	18	0.10
237	10337	23	7.20	40	0.00
238	10337	26	24.90	24	0.00
239	10337	36	15.20	20	0.00
240	10337	37	20.80	28	0.00
241	10337	72	27.80	25	0.00
242	10338	17	31.20	20	0.00
243	10338	30	20.70	15	0.00
244	10339	4	17.60	10	0.00
245	10339	17	31.20	70	0.05
246	10339	62	39.40	28	0.00
247	10340	18	50.00	20	0.05
248	10340	41	7.70	12	0.05
249	10340	43	36.80	40	0.05
250	10341	33	2.00	8	0.00
251	10341	59	44.00	9	0.15
252	10342	2	15.20	24	0.20
253	10342	31	10.00	56	0.20
254	10342	36	15.20	40	0.20
255	10342	55	19.20	40	0.20
256	10343	64	26.60	50	0.00
257	10343	68	10.00	4	0.05
258	10343	76	14.40	15	0.00
259	10344	4	17.60	35	0.00
260	10344	8	32.00	70	0.25
261	10345	8	32.00	70	0.00
262	10345	19	7.30	80	0.00
263	10345	42	11.20	9	0.00
264	10346	17	31.20	36	0.10
265	10346	56	30.40	20	0.00
266	10347	25	11.20	10	0.00
267	10347	39	14.40	50	0.15
268	10347	40	14.70	4	0.00
269	10347	75	6.20	6	0.15
270	10348	1	14.40	15	0.15
271	10348	23	7.20	25	0.00
272	10349	54	5.90	24	0.00
273	10350	50	13.00	15	0.10
274	10350	69	28.80	18	0.10
275	10351	38	210.80	20	0.05
276	10351	41	7.70	13	0.00
277	10351	44	15.50	77	0.05
278	10351	65	16.80	10	0.05
279	10352	24	3.60	10	0.00
280	10352	54	5.90	20	0.15
281	10353	11	16.80	12	0.20
282	10353	38	210.80	50	0.20
283	10354	1	14.40	12	0.00
284	10354	29	99.00	4	0.00
285	10355	24	3.60	25	0.00
286	10355	57	15.60	25	0.00
287	10356	31	10.00	30	0.00
288	10356	55	19.20	12	0.00
289	10356	69	28.80	20	0.00
290	10357	10	24.80	30	0.20
291	10357	26	24.90	16	0.00
292	10357	60	27.20	8	0.20
293	10358	24	3.60	10	0.05
294	10358	34	11.20	10	0.05
295	10358	36	15.20	20	0.05
296	10359	16	13.90	56	0.05
297	10359	31	10.00	70	0.05
298	10359	60	27.20	80	0.05
299	10360	28	36.40	30	0.00
300	10360	29	99.00	35	0.00
301	10360	38	210.80	10	0.00
302	10360	49	16.00	35	0.00
303	10360	54	5.90	28	0.00
304	10361	39	14.40	54	0.10
305	10361	60	27.20	55	0.10
306	10362	25	11.20	50	0.00
307	10362	51	42.40	20	0.00
308	10362	54	5.90	24	0.00
309	10363	31	10.00	20	0.00
310	10363	75	6.20	12	0.00
311	10363	76	14.40	12	0.00
312	10364	69	28.80	30	0.00
313	10364	71	17.20	5	0.00
314	10365	11	16.80	24	0.00
315	10366	65	16.80	5	0.00
316	10366	77	10.40	5	0.00
317	10367	34	11.20	36	0.00
318	10367	54	5.90	18	0.00
319	10367	65	16.80	15	0.00
320	10367	77	10.40	7	0.00
321	10368	21	8.00	5	0.10
322	10368	28	36.40	13	0.10
323	10368	57	15.60	25	0.00
324	10368	64	26.60	35	0.10
325	10369	29	99.00	20	0.00
326	10369	56	30.40	18	0.25
327	10370	1	14.40	15	0.15
328	10370	64	26.60	30	0.00
329	10370	74	8.00	20	0.15
330	10371	36	15.20	6	0.20
331	10372	20	64.80	12	0.25
332	10372	38	210.80	40	0.25
333	10372	60	27.20	70	0.25
334	10372	72	27.80	42	0.25
335	10373	58	10.60	80	0.20
336	10373	71	17.20	50	0.20
337	10374	31	10.00	30	0.00
338	10374	58	10.60	15	0.00
339	10375	14	18.60	15	0.00
340	10375	54	5.90	10	0.00
341	10376	31	10.00	42	0.05
342	10377	28	36.40	20	0.15
343	10377	39	14.40	20	0.15
344	10378	71	17.20	6	0.00
345	10379	41	7.70	8	0.10
346	10379	63	35.10	16	0.10
347	10379	65	16.80	20	0.10
348	10380	30	20.70	18	0.10
349	10380	53	26.20	20	0.10
350	10380	60	27.20	6	0.10
351	10380	70	12.00	30	0.00
352	10381	74	8.00	14	0.00
353	10382	5	17.00	32	0.00
354	10382	18	50.00	9	0.00
355	10382	29	99.00	14	0.00
356	10382	33	2.00	60	0.00
357	10382	74	8.00	50	0.00
358	10383	13	4.80	20	0.00
359	10383	50	13.00	15	0.00
360	10383	56	30.40	20	0.00
361	10384	20	64.80	28	0.00
362	10384	60	27.20	15	0.00
363	10385	7	24.00	10	0.20
364	10385	60	27.20	20	0.20
365	10385	68	10.00	8	0.20
366	10386	24	3.60	15	0.00
367	10386	34	11.20	10	0.00
368	10387	24	3.60	15	0.00
369	10387	28	36.40	6	0.00
370	10387	59	44.00	12	0.00
371	10387	71	17.20	15	0.00
372	10388	45	7.60	15	0.20
373	10388	52	5.60	20	0.20
374	10388	53	26.20	40	0.00
375	10389	10	24.80	16	0.00
376	10389	55	19.20	15	0.00
377	10389	62	39.40	20	0.00
378	10389	70	12.00	30	0.00
379	10390	31	10.00	60	0.10
380	10390	35	14.40	40	0.10
381	10390	46	9.60	45	0.00
382	10390	72	27.80	24	0.10
383	10391	13	4.80	18	0.00
384	10392	69	28.80	50	0.00
385	10393	2	15.20	25	0.25
386	10393	14	18.60	42	0.25
387	10393	25	11.20	7	0.25
388	10393	26	24.90	70	0.25
389	10393	31	10.00	32	0.00
390	10394	13	4.80	10	0.00
391	10394	62	39.40	10	0.00
392	10395	46	9.60	28	0.10
393	10395	53	26.20	70	0.10
394	10395	69	28.80	8	0.00
395	10396	23	7.20	40	0.00
396	10396	71	17.20	60	0.00
397	10396	72	27.80	21	0.00
398	10397	21	8.00	10	0.15
399	10397	51	42.40	18	0.15
400	10398	35	14.40	30	0.00
401	10398	55	19.20	120	0.10
402	10399	68	10.00	60	0.00
403	10399	71	17.20	30	0.00
404	10399	76	14.40	35	0.00
405	10399	77	10.40	14	0.00
406	10400	29	99.00	21	0.00
407	10400	35	14.40	35	0.00
408	10400	49	16.00	30	0.00
409	10401	30	20.70	18	0.00
410	10401	56	30.40	70	0.00
411	10401	65	16.80	20	0.00
412	10401	71	17.20	60	0.00
413	10402	23	7.20	60	0.00
414	10402	63	35.10	65	0.00
415	10403	16	13.90	21	0.15
416	10403	48	10.20	70	0.15
417	10404	26	24.90	30	0.05
418	10404	42	11.20	40	0.05
419	10404	49	16.00	30	0.05
420	10405	3	8.00	50	0.00
421	10406	1	14.40	10	0.00
422	10406	21	8.00	30	0.10
423	10406	28	36.40	42	0.10
424	10406	36	15.20	5	0.10
425	10406	40	14.70	2	0.10
426	10407	11	16.80	30	0.00
427	10407	69	28.80	15	0.00
428	10407	71	17.20	15	0.00
429	10408	37	20.80	10	0.00
430	10408	54	5.90	6	0.00
431	10408	62	39.40	35	0.00
432	10409	14	18.60	12	0.00
433	10409	21	8.00	12	0.00
434	10410	33	2.00	49	0.00
435	10410	59	44.00	16	0.00
436	10411	41	7.70	25	0.20
437	10411	44	15.50	40	0.20
438	10411	59	44.00	9	0.20
439	10412	14	18.60	20	0.10
440	10413	1	14.40	24	0.00
441	10413	62	39.40	40	0.00
442	10413	76	14.40	14	0.00
443	10414	19	7.30	18	0.05
444	10414	33	2.00	50	0.00
445	10415	17	31.20	2	0.00
446	10415	33	2.00	20	0.00
447	10416	19	7.30	20	0.00
448	10416	53	26.20	10	0.00
449	10416	57	15.60	20	0.00
450	10417	38	210.80	50	0.00
451	10417	46	9.60	2	0.25
452	10417	68	10.00	36	0.25
453	10417	77	10.40	35	0.00
454	10418	2	15.20	60	0.00
455	10418	47	7.60	55	0.00
456	10418	61	22.80	16	0.00
457	10418	74	8.00	15	0.00
458	10419	60	27.20	60	0.05
459	10419	69	28.80	20	0.05
460	10420	9	77.60	20	0.10
461	10420	13	4.80	2	0.10
462	10420	70	12.00	8	0.10
463	10420	73	12.00	20	0.10
464	10421	19	7.30	4	0.15
465	10421	26	24.90	30	0.00
466	10421	53	26.20	15	0.15
467	10421	77	10.40	10	0.15
468	10422	26	24.90	2	0.00
469	10423	31	10.00	14	0.00
470	10423	59	44.00	20	0.00
471	10424	35	14.40	60	0.20
472	10424	38	210.80	49	0.20
473	10424	68	10.00	30	0.20
474	10425	55	19.20	10	0.25
475	10425	76	14.40	20	0.25
476	10426	56	30.40	5	0.00
477	10426	64	26.60	7	0.00
478	10427	14	18.60	35	0.00
479	10428	46	9.60	20	0.00
480	10429	50	13.00	40	0.00
481	10429	63	35.10	35	0.25
482	10430	17	31.20	45	0.20
483	10430	21	8.00	50	0.00
484	10430	56	30.40	30	0.00
485	10430	59	44.00	70	0.20
486	10431	17	31.20	50	0.25
487	10431	40	14.70	50	0.25
488	10431	47	7.60	30	0.25
489	10432	26	24.90	10	0.00
490	10432	54	5.90	40	0.00
491	10433	56	30.40	28	0.00
492	10434	11	16.80	6	0.00
493	10434	76	14.40	18	0.15
494	10435	2	15.20	10	0.00
495	10435	22	16.80	12	0.00
496	10435	72	27.80	10	0.00
497	10436	46	9.60	5	0.00
498	10436	56	30.40	40	0.10
499	10436	64	26.60	30	0.10
500	10436	75	6.20	24	0.10
501	10437	53	26.20	15	0.00
502	10438	19	7.30	15	0.20
503	10438	34	11.20	20	0.20
504	10438	57	15.60	15	0.20
505	10439	12	30.40	15	0.00
506	10439	16	13.90	16	0.00
507	10439	64	26.60	6	0.00
508	10439	74	8.00	30	0.00
509	10440	2	15.20	45	0.15
510	10440	16	13.90	49	0.15
511	10440	29	99.00	24	0.15
512	10440	61	22.80	90	0.15
513	10441	27	35.10	50	0.00
514	10442	11	16.80	30	0.00
515	10442	54	5.90	80	0.00
516	10442	66	13.60	60	0.00
517	10443	11	16.80	6	0.20
518	10443	28	36.40	12	0.00
519	10444	17	31.20	10	0.00
520	10444	26	24.90	15	0.00
521	10444	35	14.40	8	0.00
522	10444	41	7.70	30	0.00
523	10445	39	14.40	6	0.00
524	10445	54	5.90	15	0.00
525	10446	19	7.30	12	0.10
526	10446	24	3.60	20	0.10
527	10446	31	10.00	3	0.10
528	10446	52	5.60	15	0.10
529	10447	19	7.30	40	0.00
530	10447	65	16.80	35	0.00
531	10447	71	17.20	2	0.00
532	10448	26	24.90	6	0.00
533	10448	40	14.70	20	0.00
534	10449	10	24.80	14	0.00
535	10449	52	5.60	20	0.00
536	10449	62	39.40	35	0.00
537	10450	10	24.80	20	0.20
538	10450	54	5.90	6	0.20
539	10451	55	19.20	120	0.10
540	10451	64	26.60	35	0.10
541	10451	65	16.80	28	0.10
542	10451	77	10.40	55	0.10
543	10452	28	36.40	15	0.00
544	10452	44	15.50	100	0.05
545	10453	48	10.20	15	0.10
546	10453	70	12.00	25	0.10
547	10454	16	13.90	20	0.20
548	10454	33	2.00	20	0.20
549	10454	46	9.60	10	0.20
550	10455	39	14.40	20	0.00
551	10455	53	26.20	50	0.00
552	10455	61	22.80	25	0.00
553	10455	71	17.20	30	0.00
554	10456	21	8.00	40	0.15
555	10456	49	16.00	21	0.15
556	10457	59	44.00	36	0.00
557	10458	26	24.90	30	0.00
558	10458	28	36.40	30	0.00
559	10458	43	36.80	20	0.00
560	10458	56	30.40	15	0.00
561	10458	71	17.20	50	0.00
562	10459	7	24.00	16	0.05
563	10459	46	9.60	20	0.05
564	10459	72	27.80	40	0.00
565	10460	68	10.00	21	0.25
566	10460	75	6.20	4	0.25
567	10461	21	8.00	40	0.25
568	10461	30	20.70	28	0.25
569	10461	55	19.20	60	0.25
570	10462	13	4.80	1	0.00
571	10462	23	7.20	21	0.00
572	10463	19	7.30	21	0.00
573	10463	42	11.20	50	0.00
574	10464	4	17.60	16	0.20
575	10464	43	36.80	3	0.00
576	10464	56	30.40	30	0.20
577	10464	60	27.20	20	0.00
578	10465	24	3.60	25	0.00
579	10465	29	99.00	18	0.10
580	10465	40	14.70	20	0.00
581	10465	45	7.60	30	0.10
582	10465	50	13.00	25	0.00
583	10466	11	16.80	10	0.00
584	10466	46	9.60	5	0.00
585	10467	24	3.60	28	0.00
586	10467	25	11.20	12	0.00
587	10468	30	20.70	8	0.00
588	10468	43	36.80	15	0.00
589	10469	2	15.20	40	0.15
590	10469	16	13.90	35	0.15
591	10469	44	15.50	2	0.15
592	10470	18	50.00	30	0.00
593	10470	23	7.20	15	0.00
594	10470	64	26.60	8	0.00
595	10471	7	24.00	30	0.00
596	10471	56	30.40	20	0.00
597	10472	24	3.60	80	0.05
598	10472	51	42.40	18	0.00
599	10473	33	2.00	12	0.00
600	10473	71	17.20	12	0.00
601	10474	14	18.60	12	0.00
602	10474	28	36.40	18	0.00
603	10474	40	14.70	21	0.00
604	10474	75	6.20	10	0.00
605	10475	31	10.00	35	0.15
606	10475	66	13.60	60	0.15
607	10475	76	14.40	42	0.15
608	10476	55	19.20	2	0.05
609	10476	70	12.00	12	0.00
610	10477	1	14.40	15	0.00
611	10477	21	8.00	21	0.25
612	10477	39	14.40	20	0.25
613	10478	10	24.80	20	0.05
614	10479	38	210.80	30	0.00
615	10479	53	26.20	28	0.00
616	10479	59	44.00	60	0.00
617	10479	64	26.60	30	0.00
618	10480	47	7.60	30	0.00
619	10480	59	44.00	12	0.00
620	10481	49	16.00	24	0.00
621	10481	60	27.20	40	0.00
622	10482	40	14.70	10	0.00
623	10483	34	11.20	35	0.05
624	10483	77	10.40	30	0.05
625	10484	21	8.00	14	0.00
626	10484	40	14.70	10	0.00
627	10484	51	42.40	3	0.00
628	10485	2	15.20	20	0.10
629	10485	3	8.00	20	0.10
630	10485	55	19.20	30	0.10
631	10485	70	12.00	60	0.10
632	10486	11	16.80	5	0.00
633	10486	51	42.40	25	0.00
634	10486	74	8.00	16	0.00
635	10487	19	7.30	5	0.00
636	10487	26	24.90	30	0.00
637	10487	54	5.90	24	0.25
638	10488	59	44.00	30	0.00
639	10488	73	12.00	20	0.20
640	10489	11	16.80	15	0.25
641	10489	16	13.90	18	0.00
642	10490	59	44.00	60	0.00
643	10490	68	10.00	30	0.00
644	10490	75	6.20	36	0.00
645	10491	44	15.50	15	0.15
646	10491	77	10.40	7	0.15
647	10492	25	11.20	60	0.05
648	10492	42	11.20	20	0.05
649	10493	65	16.80	15	0.10
650	10493	66	13.60	10	0.10
651	10493	69	28.80	10	0.10
652	10494	56	30.40	30	0.00
653	10495	23	7.20	10	0.00
654	10495	41	7.70	20	0.00
655	10495	77	10.40	5	0.00
656	10496	31	10.00	20	0.05
657	10497	56	30.40	14	0.00
658	10497	72	27.80	25	0.00
659	10497	77	10.40	25	0.00
660	10498	24	4.50	14	0.00
661	10498	40	18.40	5	0.00
662	10498	42	14.00	30	0.00
663	10499	28	45.60	20	0.00
664	10499	49	20.00	25	0.00
665	10500	15	15.50	12	0.05
666	10500	28	45.60	8	0.05
667	10501	54	7.45	20	0.00
668	10502	45	9.50	21	0.00
669	10502	53	32.80	6	0.00
670	10502	67	14.00	30	0.00
671	10503	14	23.25	70	0.00
672	10503	65	21.05	20	0.00
673	10504	2	19.00	12	0.00
674	10504	21	10.00	12	0.00
675	10504	53	32.80	10	0.00
676	10504	61	28.50	25	0.00
677	10505	62	49.30	3	0.00
678	10506	25	14.00	18	0.10
679	10506	70	15.00	14	0.10
680	10507	43	46.00	15	0.15
681	10507	48	12.75	15	0.15
682	10508	13	6.00	10	0.00
683	10508	39	18.00	10	0.00
684	10509	28	45.60	3	0.00
685	10510	29	123.79	36	0.00
686	10510	75	7.75	36	0.10
687	10511	4	22.00	50	0.15
688	10511	7	30.00	50	0.15
689	10511	8	40.00	10	0.15
690	10512	24	4.50	10	0.15
691	10512	46	12.00	9	0.15
692	10512	47	9.50	6	0.15
693	10512	60	34.00	12	0.15
694	10513	21	10.00	40	0.20
695	10513	32	32.00	50	0.20
696	10513	61	28.50	15	0.20
697	10514	20	81.00	39	0.00
698	10514	28	45.60	35	0.00
699	10514	56	38.00	70	0.00
700	10514	65	21.05	39	0.00
701	10514	75	7.75	50	0.00
702	10515	9	97.00	16	0.15
703	10515	16	17.45	50	0.00
704	10515	27	43.90	120	0.00
705	10515	33	2.50	16	0.15
706	10515	60	34.00	84	0.15
707	10516	18	62.50	25	0.10
708	10516	41	9.65	80	0.10
709	10516	42	14.00	20	0.00
710	10517	52	7.00	6	0.00
711	10517	59	55.00	4	0.00
712	10517	70	15.00	6	0.00
713	10518	24	4.50	5	0.00
714	10518	38	263.50	15	0.00
715	10518	44	19.45	9	0.00
716	10519	10	31.00	16	0.05
717	10519	56	38.00	40	0.00
718	10519	60	34.00	10	0.05
719	10520	24	4.50	8	0.00
720	10520	53	32.80	5	0.00
721	10521	35	18.00	3	0.00
722	10521	41	9.65	10	0.00
723	10521	68	12.50	6	0.00
724	10522	1	18.00	40	0.20
725	10522	8	40.00	24	0.00
726	10522	30	25.89	20	0.20
727	10522	40	18.40	25	0.20
728	10523	17	39.00	25	0.10
729	10523	20	81.00	15	0.10
730	10523	37	26.00	18	0.10
731	10523	41	9.65	6	0.10
732	10524	10	31.00	2	0.00
733	10524	30	25.89	10	0.00
734	10524	43	46.00	60	0.00
735	10524	54	7.45	15	0.00
736	10525	36	19.00	30	0.00
737	10525	40	18.40	15	0.10
738	10526	1	18.00	8	0.15
739	10526	13	6.00	10	0.00
740	10526	56	38.00	30	0.15
741	10527	4	22.00	50	0.10
742	10527	36	19.00	30	0.10
743	10528	11	21.00	3	0.00
744	10528	33	2.50	8	0.20
745	10528	72	34.80	9	0.00
746	10529	55	24.00	14	0.00
747	10529	68	12.50	20	0.00
748	10529	69	36.00	10	0.00
749	10530	17	39.00	40	0.00
750	10530	43	46.00	25	0.00
751	10530	61	28.50	20	0.00
752	10530	76	18.00	50	0.00
753	10531	59	55.00	2	0.00
754	10532	30	25.89	15	0.00
755	10532	66	17.00	24	0.00
756	10533	4	22.00	50	0.05
757	10533	72	34.80	24	0.00
758	10533	73	15.00	24	0.05
759	10534	30	25.89	10	0.00
760	10534	40	18.40	10	0.20
761	10534	54	7.45	10	0.20
762	10535	11	21.00	50	0.10
763	10535	40	18.40	10	0.10
764	10535	57	19.50	5	0.10
765	10535	59	55.00	15	0.10
766	10536	12	38.00	15	0.25
767	10536	31	12.50	20	0.00
768	10536	33	2.50	30	0.00
769	10536	60	34.00	35	0.25
770	10537	31	12.50	30	0.00
771	10537	51	53.00	6	0.00
772	10537	58	13.25	20	0.00
773	10537	72	34.80	21	0.00
774	10537	73	15.00	9	0.00
775	10538	70	15.00	7	0.00
776	10538	72	34.80	1	0.00
777	10539	13	6.00	8	0.00
778	10539	21	10.00	15	0.00
779	10539	33	2.50	15	0.00
780	10539	49	20.00	6	0.00
781	10540	3	10.00	60	0.00
782	10540	26	31.23	40	0.00
783	10540	38	263.50	30	0.00
784	10540	68	12.50	35	0.00
785	10541	24	4.50	35	0.10
786	10541	38	263.50	4	0.10
787	10541	65	21.05	36	0.10
788	10541	71	21.50	9	0.10
789	10542	11	21.00	15	0.05
790	10542	54	7.45	24	0.05
791	10543	12	38.00	30	0.15
792	10543	23	9.00	70	0.15
793	10544	28	45.60	7	0.00
794	10544	67	14.00	7	0.00
795	10545	11	21.00	10	0.00
796	10546	7	30.00	10	0.00
797	10546	35	18.00	30	0.00
798	10546	62	49.30	40	0.00
799	10547	32	32.00	24	0.15
800	10547	36	19.00	60	0.00
801	10548	34	14.00	10	0.25
802	10548	41	9.65	14	0.00
803	10549	31	12.50	55	0.15
804	10549	45	9.50	100	0.15
805	10549	51	53.00	48	0.15
806	10550	17	39.00	8	0.10
807	10550	19	9.20	10	0.00
808	10550	21	10.00	6	0.10
809	10550	61	28.50	10	0.10
810	10551	16	17.45	40	0.15
811	10551	35	18.00	20	0.15
812	10551	44	19.45	40	0.00
813	10552	69	36.00	18	0.00
814	10552	75	7.75	30	0.00
815	10553	11	21.00	15	0.00
816	10553	16	17.45	14	0.00
817	10553	22	21.00	24	0.00
818	10553	31	12.50	30	0.00
819	10553	35	18.00	6	0.00
820	10554	16	17.45	30	0.05
821	10554	23	9.00	20	0.05
822	10554	62	49.30	20	0.05
823	10554	77	13.00	10	0.05
824	10555	14	23.25	30	0.20
825	10555	19	9.20	35	0.20
826	10555	24	4.50	18	0.20
827	10555	51	53.00	20	0.20
828	10555	56	38.00	40	0.20
829	10556	72	34.80	24	0.00
830	10557	64	33.25	30	0.00
831	10557	75	7.75	20	0.00
832	10558	47	9.50	25	0.00
833	10558	51	53.00	20	0.00
834	10558	52	7.00	30	0.00
835	10558	53	32.80	18	0.00
836	10558	73	15.00	3	0.00
837	10559	41	9.65	12	0.05
838	10559	55	24.00	18	0.05
839	10560	30	25.89	20	0.00
840	10560	62	49.30	15	0.25
841	10561	44	19.45	10	0.00
842	10561	51	53.00	50	0.00
843	10562	33	2.50	20	0.10
844	10562	62	49.30	10	0.10
845	10563	36	19.00	25	0.00
846	10563	52	7.00	70	0.00
847	10564	17	39.00	16	0.05
848	10564	31	12.50	6	0.05
849	10564	55	24.00	25	0.05
850	10565	24	4.50	25	0.10
851	10565	64	33.25	18	0.10
852	10566	11	21.00	35	0.15
853	10566	18	62.50	18	0.15
854	10566	76	18.00	10	0.00
855	10567	31	12.50	60	0.20
856	10567	51	53.00	3	0.00
857	10567	59	55.00	40	0.20
858	10568	10	31.00	5	0.00
859	10569	31	12.50	35	0.20
860	10569	76	18.00	30	0.00
861	10570	11	21.00	15	0.05
862	10570	56	38.00	60	0.05
863	10571	14	23.25	11	0.15
864	10571	42	14.00	28	0.15
865	10572	16	17.45	12	0.10
866	10572	32	32.00	10	0.10
867	10572	40	18.40	50	0.00
868	10572	75	7.75	15	0.10
869	10573	17	39.00	18	0.00
870	10573	34	14.00	40	0.00
871	10573	53	32.80	25	0.00
872	10574	33	2.50	14	0.00
873	10574	40	18.40	2	0.00
874	10574	62	49.30	10	0.00
875	10574	64	33.25	6	0.00
876	10575	59	55.00	12	0.00
877	10575	63	43.90	6	0.00
878	10575	72	34.80	30	0.00
879	10575	76	18.00	10	0.00
880	10576	1	18.00	10	0.00
881	10576	31	12.50	20	0.00
882	10576	44	19.45	21	0.00
883	10577	39	18.00	10	0.00
884	10577	75	7.75	20	0.00
885	10577	77	13.00	18	0.00
886	10578	35	18.00	20	0.00
887	10578	57	19.50	6	0.00
888	10579	15	15.50	10	0.00
889	10579	75	7.75	21	0.00
890	10580	14	23.25	15	0.05
891	10580	41	9.65	9	0.05
892	10580	65	21.05	30	0.05
893	10581	75	7.75	50	0.20
894	10582	57	19.50	4	0.00
895	10582	76	18.00	14	0.00
896	10583	29	123.79	10	0.00
897	10583	60	34.00	24	0.15
898	10583	69	36.00	10	0.15
899	10584	31	12.50	50	0.05
900	10585	47	9.50	15	0.00
901	10586	52	7.00	4	0.15
902	10587	26	31.23	6	0.00
903	10587	35	18.00	20	0.00
904	10587	77	13.00	20	0.00
905	10588	18	62.50	40	0.20
906	10588	42	14.00	100	0.20
907	10589	35	18.00	4	0.00
908	10590	1	18.00	20	0.00
909	10590	77	13.00	60	0.05
910	10591	3	10.00	14	0.00
911	10591	7	30.00	10	0.00
912	10591	54	7.45	50	0.00
913	10592	15	15.50	25	0.05
914	10592	26	31.23	5	0.05
915	10593	20	81.00	21	0.20
916	10593	69	36.00	20	0.20
917	10593	76	18.00	4	0.20
918	10594	52	7.00	24	0.00
919	10594	58	13.25	30	0.00
920	10595	35	18.00	30	0.25
921	10595	61	28.50	120	0.25
922	10595	69	36.00	65	0.25
923	10596	56	38.00	5	0.20
924	10596	63	43.90	24	0.20
925	10596	75	7.75	30	0.20
926	10597	24	4.50	35	0.20
927	10597	57	19.50	20	0.00
928	10597	65	21.05	12	0.20
929	10598	27	43.90	50	0.00
930	10598	71	21.50	9	0.00
931	10599	62	49.30	10	0.00
932	10600	54	7.45	4	0.00
933	10600	73	15.00	30	0.00
934	10601	13	6.00	60	0.00
935	10601	59	55.00	35	0.00
936	10602	77	13.00	5	0.25
937	10603	22	21.00	48	0.00
938	10603	49	20.00	25	0.05
939	10604	48	12.75	6	0.10
940	10604	76	18.00	10	0.10
941	10605	16	17.45	30	0.05
942	10605	59	55.00	20	0.05
943	10605	60	34.00	70	0.05
944	10605	71	21.50	15	0.05
945	10606	4	22.00	20	0.20
946	10606	55	24.00	20	0.20
947	10606	62	49.30	10	0.20
948	10607	7	30.00	45	0.00
949	10607	17	39.00	100	0.00
950	10607	33	2.50	14	0.00
951	10607	40	18.40	42	0.00
952	10607	72	34.80	12	0.00
953	10608	56	38.00	28	0.00
954	10609	1	18.00	3	0.00
955	10609	10	31.00	10	0.00
956	10609	21	10.00	6	0.00
957	10610	36	19.00	21	0.25
958	10611	1	18.00	6	0.00
959	10611	2	19.00	10	0.00
960	10611	60	34.00	15	0.00
961	10612	10	31.00	70	0.00
962	10612	36	19.00	55	0.00
963	10612	49	20.00	18	0.00
964	10612	60	34.00	40	0.00
965	10612	76	18.00	80	0.00
966	10613	13	6.00	8	0.10
967	10613	75	7.75	40	0.00
968	10614	11	21.00	14	0.00
969	10614	21	10.00	8	0.00
970	10614	39	18.00	5	0.00
971	10615	55	24.00	5	0.00
972	10616	38	263.50	15	0.05
973	10616	56	38.00	14	0.00
974	10616	70	15.00	15	0.05
975	10616	71	21.50	15	0.05
976	10617	59	55.00	30	0.15
977	10618	6	25.00	70	0.00
978	10618	56	38.00	20	0.00
979	10618	68	12.50	15	0.00
980	10619	21	10.00	42	0.00
981	10619	22	21.00	40	0.00
982	10620	24	4.50	5	0.00
983	10620	52	7.00	5	0.00
984	10621	19	9.20	5	0.00
985	10621	23	9.00	10	0.00
986	10621	70	15.00	20	0.00
987	10621	71	21.50	15	0.00
988	10622	2	19.00	20	0.00
989	10622	68	12.50	18	0.20
990	10623	14	23.25	21	0.00
991	10623	19	9.20	15	0.10
992	10623	21	10.00	25	0.10
993	10623	24	4.50	3	0.00
994	10623	35	18.00	30	0.10
995	10624	28	45.60	10	0.00
996	10624	29	123.79	6	0.00
997	10624	44	19.45	10	0.00
998	10625	14	23.25	3	0.00
999	10625	42	14.00	5	0.00
1000	10625	60	34.00	10	0.00
1001	10626	53	32.80	12	0.00
1002	10626	60	34.00	20	0.00
1003	10626	71	21.50	20	0.00
1004	10627	62	49.30	15	0.00
1005	10627	73	15.00	35	0.15
1006	10628	1	18.00	25	0.00
1007	10629	29	123.79	20	0.00
1008	10629	64	33.25	9	0.00
1009	10630	55	24.00	12	0.05
1010	10630	76	18.00	35	0.00
1011	10631	75	7.75	8	0.10
1012	10632	2	19.00	30	0.05
1013	10632	33	2.50	20	0.05
1014	10633	12	38.00	36	0.15
1015	10633	13	6.00	13	0.15
1016	10633	26	31.23	35	0.15
1017	10633	62	49.30	80	0.15
1018	10634	7	30.00	35	0.00
1019	10634	18	62.50	50	0.00
1020	10634	51	53.00	15	0.00
1021	10634	75	7.75	2	0.00
1022	10635	4	22.00	10	0.10
1023	10635	5	21.35	15	0.10
1024	10635	22	21.00	40	0.00
1025	10636	4	22.00	25	0.00
1026	10636	58	13.25	6	0.00
1027	10637	11	21.00	10	0.00
1028	10637	50	16.25	25	0.05
1029	10637	56	38.00	60	0.05
1030	10638	45	9.50	20	0.00
1031	10638	65	21.05	21	0.00
1032	10638	72	34.80	60	0.00
1033	10639	18	62.50	8	0.00
1034	10640	69	36.00	20	0.25
1035	10640	70	15.00	15	0.25
1036	10641	2	19.00	50	0.00
1037	10641	40	18.40	60	0.00
1038	10642	21	10.00	30	0.20
1039	10642	61	28.50	20	0.20
1040	10643	28	45.60	15	0.25
1041	10643	39	18.00	21	0.25
1042	10643	46	12.00	2	0.25
1043	10644	18	62.50	4	0.10
1044	10644	43	46.00	20	0.00
1045	10644	46	12.00	21	0.10
1046	10645	18	62.50	20	0.00
1047	10645	36	19.00	15	0.00
1048	10646	1	18.00	15	0.25
1049	10646	10	31.00	18	0.25
1050	10646	71	21.50	30	0.25
1051	10646	77	13.00	35	0.25
1052	10647	19	9.20	30	0.00
1053	10647	39	18.00	20	0.00
1054	10648	22	21.00	15	0.00
1055	10648	24	4.50	15	0.15
1056	10649	28	45.60	20	0.00
1057	10649	72	34.80	15	0.00
1058	10650	30	25.89	30	0.00
1059	10650	53	32.80	25	0.05
1060	10650	54	7.45	30	0.00
1061	10651	19	9.20	12	0.25
1062	10651	22	21.00	20	0.25
1063	10652	30	25.89	2	0.25
1064	10652	42	14.00	20	0.00
1065	10653	16	17.45	30	0.10
1066	10653	60	34.00	20	0.10
1067	10654	4	22.00	12	0.10
1068	10654	39	18.00	20	0.10
1069	10654	54	7.45	6	0.10
1070	10655	41	9.65	20	0.20
1071	10656	14	23.25	3	0.10
1072	10656	44	19.45	28	0.10
1073	10656	47	9.50	6	0.10
1074	10657	15	15.50	50	0.00
1075	10657	41	9.65	24	0.00
1076	10657	46	12.00	45	0.00
1077	10657	47	9.50	10	0.00
1078	10657	56	38.00	45	0.00
1079	10657	60	34.00	30	0.00
1080	10658	21	10.00	60	0.00
1081	10658	40	18.40	70	0.05
1082	10658	60	34.00	55	0.05
1083	10658	77	13.00	70	0.05
1084	10659	31	12.50	20	0.05
1085	10659	40	18.40	24	0.05
1086	10659	70	15.00	40	0.05
1087	10660	20	81.00	21	0.00
1088	10661	39	18.00	3	0.20
1089	10661	58	13.25	49	0.20
1090	10662	68	12.50	10	0.00
1091	10663	40	18.40	30	0.05
1092	10663	42	14.00	30	0.05
1093	10663	51	53.00	20	0.05
1094	10664	10	31.00	24	0.15
1095	10664	56	38.00	12	0.15
1096	10664	65	21.05	15	0.15
1097	10665	51	53.00	20	0.00
1098	10665	59	55.00	1	0.00
1099	10665	76	18.00	10	0.00
1100	10666	29	123.79	36	0.00
1101	10666	65	21.05	10	0.00
1102	10667	69	36.00	45	0.20
1103	10667	71	21.50	14	0.20
1104	10668	31	12.50	8	0.10
1105	10668	55	24.00	4	0.10
1106	10668	64	33.25	15	0.10
1107	10669	36	19.00	30	0.00
1108	10670	23	9.00	32	0.00
1109	10670	46	12.00	60	0.00
1110	10670	67	14.00	25	0.00
1111	10670	73	15.00	50	0.00
1112	10670	75	7.75	25	0.00
1113	10671	16	17.45	10	0.00
1114	10671	62	49.30	10	0.00
1115	10671	65	21.05	12	0.00
1116	10672	38	263.50	15	0.10
1117	10672	71	21.50	12	0.00
1118	10673	16	17.45	3	0.00
1119	10673	42	14.00	6	0.00
1120	10673	43	46.00	6	0.00
1121	10674	23	9.00	5	0.00
1122	10675	14	23.25	30	0.00
1123	10675	53	32.80	10	0.00
1124	10675	58	13.25	30	0.00
1125	10676	10	31.00	2	0.00
1126	10676	19	9.20	7	0.00
1127	10676	44	19.45	21	0.00
1128	10677	26	31.23	30	0.15
1129	10677	33	2.50	8	0.15
1130	10678	12	38.00	100	0.00
1131	10678	33	2.50	30	0.00
1132	10678	41	9.65	120	0.00
1133	10678	54	7.45	30	0.00
1134	10679	59	55.00	12	0.00
1135	10680	16	17.45	50	0.25
1136	10680	31	12.50	20	0.25
1137	10680	42	14.00	40	0.25
1138	10681	19	9.20	30	0.10
1139	10681	21	10.00	12	0.10
1140	10681	64	33.25	28	0.00
1141	10682	33	2.50	30	0.00
1142	10682	66	17.00	4	0.00
1143	10682	75	7.75	30	0.00
1144	10683	52	7.00	9	0.00
1145	10684	40	18.40	20	0.00
1146	10684	47	9.50	40	0.00
1147	10684	60	34.00	30	0.00
1148	10685	10	31.00	20	0.00
1149	10685	41	9.65	4	0.00
1150	10685	47	9.50	15	0.00
1151	10686	17	39.00	30	0.20
1152	10686	26	31.23	15	0.00
1153	10687	9	97.00	50	0.25
1154	10687	29	123.79	10	0.00
1155	10687	36	19.00	6	0.25
1156	10688	10	31.00	18	0.10
1157	10688	28	45.60	60	0.10
1158	10688	34	14.00	14	0.00
1159	10689	1	18.00	35	0.25
1160	10690	56	38.00	20	0.25
1161	10690	77	13.00	30	0.25
1162	10691	1	18.00	30	0.00
1163	10691	29	123.79	40	0.00
1164	10691	43	46.00	40	0.00
1165	10691	44	19.45	24	0.00
1166	10691	62	49.30	48	0.00
1167	10692	63	43.90	20	0.00
1168	10693	9	97.00	6	0.00
1169	10693	54	7.45	60	0.15
1170	10693	69	36.00	30	0.15
1171	10693	73	15.00	15	0.15
1172	10694	7	30.00	90	0.00
1173	10694	59	55.00	25	0.00
1174	10694	70	15.00	50	0.00
1175	10695	8	40.00	10	0.00
1176	10695	12	38.00	4	0.00
1177	10695	24	4.50	20	0.00
1178	10696	17	39.00	20	0.00
1179	10696	46	12.00	18	0.00
1180	10697	19	9.20	7	0.25
1181	10697	35	18.00	9	0.25
1182	10697	58	13.25	30	0.25
1183	10697	70	15.00	30	0.25
1184	10698	11	21.00	15	0.00
1185	10698	17	39.00	8	0.05
1186	10698	29	123.79	12	0.05
1187	10698	65	21.05	65	0.05
1188	10698	70	15.00	8	0.05
1189	10699	47	9.50	12	0.00
1190	10700	1	18.00	5	0.20
1191	10700	34	14.00	12	0.20
1192	10700	68	12.50	40	0.20
1193	10700	71	21.50	60	0.20
1194	10701	59	55.00	42	0.15
1195	10701	71	21.50	20	0.15
1196	10701	76	18.00	35	0.15
1197	10702	3	10.00	6	0.00
1198	10702	76	18.00	15	0.00
1199	10703	2	19.00	5	0.00
1200	10703	59	55.00	35	0.00
1201	10703	73	15.00	35	0.00
1202	10704	4	22.00	6	0.00
1203	10704	24	4.50	35	0.00
1204	10704	48	12.75	24	0.00
1205	10705	31	12.50	20	0.00
1206	10705	32	32.00	4	0.00
1207	10706	16	17.45	20	0.00
1208	10706	43	46.00	24	0.00
1209	10706	59	55.00	8	0.00
1210	10707	55	24.00	21	0.00
1211	10707	57	19.50	40	0.00
1212	10707	70	15.00	28	0.15
1213	10708	5	21.35	4	0.00
1214	10708	36	19.00	5	0.00
1215	10709	8	40.00	40	0.00
1216	10709	51	53.00	28	0.00
1217	10709	60	34.00	10	0.00
1218	10710	19	9.20	5	0.00
1219	10710	47	9.50	5	0.00
1220	10711	19	9.20	12	0.00
1221	10711	41	9.65	42	0.00
1222	10711	53	32.80	120	0.00
1223	10712	53	32.80	3	0.05
1224	10712	56	38.00	30	0.00
1225	10713	10	31.00	18	0.00
1226	10713	26	31.23	30	0.00
1227	10713	45	9.50	110	0.00
1228	10713	46	12.00	24	0.00
1229	10714	2	19.00	30	0.25
1230	10714	17	39.00	27	0.25
1231	10714	47	9.50	50	0.25
1232	10714	56	38.00	18	0.25
1233	10714	58	13.25	12	0.25
1234	10715	10	31.00	21	0.00
1235	10715	71	21.50	30	0.00
1236	10716	21	10.00	5	0.00
1237	10716	51	53.00	7	0.00
1238	10716	61	28.50	10	0.00
1239	10717	21	10.00	32	0.05
1240	10717	54	7.45	15	0.00
1241	10717	69	36.00	25	0.05
1242	10718	12	38.00	36	0.00
1243	10718	16	17.45	20	0.00
1244	10718	36	19.00	40	0.00
1245	10718	62	49.30	20	0.00
1246	10719	18	62.50	12	0.25
1247	10719	30	25.89	3	0.25
1248	10719	54	7.45	40	0.25
1249	10720	35	18.00	21	0.00
1250	10720	71	21.50	8	0.00
1251	10721	44	19.45	50	0.05
1252	10722	2	19.00	3	0.00
1253	10722	31	12.50	50	0.00
1254	10722	68	12.50	45	0.00
1255	10722	75	7.75	42	0.00
1256	10723	26	31.23	15	0.00
1257	10724	10	31.00	16	0.00
1258	10724	61	28.50	5	0.00
1259	10725	41	9.65	12	0.00
1260	10725	52	7.00	4	0.00
1261	10725	55	24.00	6	0.00
1262	10726	4	22.00	25	0.00
1263	10726	11	21.00	5	0.00
1264	10727	17	39.00	20	0.05
1265	10727	56	38.00	10	0.05
1266	10727	59	55.00	10	0.05
1267	10728	30	25.89	15	0.00
1268	10728	40	18.40	6	0.00
1269	10728	55	24.00	12	0.00
1270	10728	60	34.00	15	0.00
1271	10729	1	18.00	50	0.00
1272	10729	21	10.00	30	0.00
1273	10729	50	16.25	40	0.00
1274	10730	16	17.45	15	0.05
1275	10730	31	12.50	3	0.05
1276	10730	65	21.05	10	0.05
1277	10731	21	10.00	40	0.05
1278	10731	51	53.00	30	0.05
1279	10732	76	18.00	20	0.00
1280	10733	14	23.25	16	0.00
1281	10733	28	45.60	20	0.00
1282	10733	52	7.00	25	0.00
1283	10734	6	25.00	30	0.00
1284	10734	30	25.89	15	0.00
1285	10734	76	18.00	20	0.00
1286	10735	61	28.50	20	0.10
1287	10735	77	13.00	2	0.10
1288	10736	65	21.05	40	0.00
1289	10736	75	7.75	20	0.00
1290	10737	13	6.00	4	0.00
1291	10737	41	9.65	12	0.00
1292	10738	16	17.45	3	0.00
1293	10739	36	19.00	6	0.00
1294	10739	52	7.00	18	0.00
1295	10740	28	45.60	5	0.20
1296	10740	35	18.00	35	0.20
1297	10740	45	9.50	40	0.20
1298	10740	56	38.00	14	0.20
1299	10741	2	19.00	15	0.20
1300	10742	3	10.00	20	0.00
1301	10742	60	34.00	50	0.00
1302	10742	72	34.80	35	0.00
1303	10743	46	12.00	28	0.05
1304	10744	40	18.40	50	0.20
1305	10745	18	62.50	24	0.00
1306	10745	44	19.45	16	0.00
1307	10745	59	55.00	45	0.00
1308	10745	72	34.80	7	0.00
1309	10746	13	6.00	6	0.00
1310	10746	42	14.00	28	0.00
1311	10746	62	49.30	9	0.00
1312	10746	69	36.00	40	0.00
1313	10747	31	12.50	8	0.00
1314	10747	41	9.65	35	0.00
1315	10747	63	43.90	9	0.00
1316	10747	69	36.00	30	0.00
1317	10748	23	9.00	44	0.00
1318	10748	40	18.40	40	0.00
1319	10748	56	38.00	28	0.00
1320	10749	56	38.00	15	0.00
1321	10749	59	55.00	6	0.00
1322	10749	76	18.00	10	0.00
1323	10750	14	23.25	5	0.15
1324	10750	45	9.50	40	0.15
1325	10750	59	55.00	25	0.15
1326	10751	26	31.23	12	0.10
1327	10751	30	25.89	30	0.00
1328	10751	50	16.25	20	0.10
1329	10751	73	15.00	15	0.00
1330	10752	1	18.00	8	0.00
1331	10752	69	36.00	3	0.00
1332	10753	45	9.50	4	0.00
1333	10753	74	10.00	5	0.00
1334	10754	40	18.40	3	0.00
1335	10755	47	9.50	30	0.25
1336	10755	56	38.00	30	0.25
1337	10755	57	19.50	14	0.25
1338	10755	69	36.00	25	0.25
1339	10756	18	62.50	21	0.20
1340	10756	36	19.00	20	0.20
1341	10756	68	12.50	6	0.20
1342	10756	69	36.00	20	0.20
1343	10757	34	14.00	30	0.00
1344	10757	59	55.00	7	0.00
1345	10757	62	49.30	30	0.00
1346	10757	64	33.25	24	0.00
1347	10758	26	31.23	20	0.00
1348	10758	52	7.00	60	0.00
1349	10758	70	15.00	40	0.00
1350	10759	32	32.00	10	0.00
1351	10760	25	14.00	12	0.25
1352	10760	27	43.90	40	0.00
1353	10760	43	46.00	30	0.25
1354	10761	25	14.00	35	0.25
1355	10761	75	7.75	18	0.00
1356	10762	39	18.00	16	0.00
1357	10762	47	9.50	30	0.00
1358	10762	51	53.00	28	0.00
1359	10762	56	38.00	60	0.00
1360	10763	21	10.00	40	0.00
1361	10763	22	21.00	6	0.00
1362	10763	24	4.50	20	0.00
1363	10764	3	10.00	20	0.10
1364	10764	39	18.00	130	0.10
1365	10765	65	21.05	80	0.10
1366	10766	2	19.00	40	0.00
1367	10766	7	30.00	35	0.00
1368	10766	68	12.50	40	0.00
1369	10767	42	14.00	2	0.00
1370	10768	22	21.00	4	0.00
1371	10768	31	12.50	50	0.00
1372	10768	60	34.00	15	0.00
1373	10768	71	21.50	12	0.00
1374	10769	41	9.65	30	0.05
1375	10769	52	7.00	15	0.05
1376	10769	61	28.50	20	0.00
1377	10769	62	49.30	15	0.00
1378	10770	11	21.00	15	0.25
1379	10771	71	21.50	16	0.00
1380	10772	29	123.79	18	0.00
1381	10772	59	55.00	25	0.00
1382	10773	17	39.00	33	0.00
1383	10773	31	12.50	70	0.20
1384	10773	75	7.75	7	0.20
1385	10774	31	12.50	2	0.25
1386	10774	66	17.00	50	0.00
1387	10775	10	31.00	6	0.00
1388	10775	67	14.00	3	0.00
1389	10776	31	12.50	16	0.05
1390	10776	42	14.00	12	0.05
1391	10776	45	9.50	27	0.05
1392	10776	51	53.00	120	0.05
1393	10777	42	14.00	20	0.20
1394	10778	41	9.65	10	0.00
1395	10779	16	17.45	20	0.00
1396	10779	62	49.30	20	0.00
1397	10780	70	15.00	35	0.00
1398	10780	77	13.00	15	0.00
1399	10781	54	7.45	3	0.20
1400	10781	56	38.00	20	0.20
1401	10781	74	10.00	35	0.00
1402	10782	31	12.50	1	0.00
1403	10783	31	12.50	10	0.00
1404	10783	38	263.50	5	0.00
1405	10784	36	19.00	30	0.00
1406	10784	39	18.00	2	0.15
1407	10784	72	34.80	30	0.15
1408	10785	10	31.00	10	0.00
1409	10785	75	7.75	10	0.00
1410	10786	8	40.00	30	0.20
1411	10786	30	25.89	15	0.20
1412	10786	75	7.75	42	0.20
1413	10787	2	19.00	15	0.05
1414	10787	29	123.79	20	0.05
1415	10788	19	9.20	50	0.05
1416	10788	75	7.75	40	0.05
1417	10789	18	62.50	30	0.00
1418	10789	35	18.00	15	0.00
1419	10789	63	43.90	30	0.00
1420	10789	68	12.50	18	0.00
1421	10790	7	30.00	3	0.15
1422	10790	56	38.00	20	0.15
1423	10791	29	123.79	14	0.05
1424	10791	41	9.65	20	0.05
1425	10792	2	19.00	10	0.00
1426	10792	54	7.45	3	0.00
1427	10792	68	12.50	15	0.00
1428	10793	41	9.65	14	0.00
1429	10793	52	7.00	8	0.00
1430	10794	14	23.25	15	0.20
1431	10794	54	7.45	6	0.20
1432	10795	16	17.45	65	0.00
1433	10795	17	39.00	35	0.25
1434	10796	26	31.23	21	0.20
1435	10796	44	19.45	10	0.00
1436	10796	64	33.25	35	0.20
1437	10796	69	36.00	24	0.20
1438	10797	11	21.00	20	0.00
1439	10798	62	49.30	2	0.00
1440	10798	72	34.80	10	0.00
1441	10799	13	6.00	20	0.15
1442	10799	24	4.50	20	0.15
1443	10799	59	55.00	25	0.00
1444	10800	11	21.00	50	0.10
1445	10800	51	53.00	10	0.10
1446	10800	54	7.45	7	0.10
1447	10801	17	39.00	40	0.25
1448	10801	29	123.79	20	0.25
1449	10802	30	25.89	25	0.25
1450	10802	51	53.00	30	0.25
1451	10802	55	24.00	60	0.25
1452	10802	62	49.30	5	0.25
1453	10803	19	9.20	24	0.05
1454	10803	25	14.00	15	0.05
1455	10803	59	55.00	15	0.05
1456	10804	10	31.00	36	0.00
1457	10804	28	45.60	24	0.00
1458	10804	49	20.00	4	0.15
1459	10805	34	14.00	10	0.00
1460	10805	38	263.50	10	0.00
1461	10806	2	19.00	20	0.25
1462	10806	65	21.05	2	0.00
1463	10806	74	10.00	15	0.25
1464	10807	40	18.40	1	0.00
1465	10808	56	38.00	20	0.15
1466	10808	76	18.00	50	0.15
1467	10809	52	7.00	20	0.00
1468	10810	13	6.00	7	0.00
1469	10810	25	14.00	5	0.00
1470	10810	70	15.00	5	0.00
1471	10811	19	9.20	15	0.00
1472	10811	23	9.00	18	0.00
1473	10811	40	18.40	30	0.00
1474	10812	31	12.50	16	0.10
1475	10812	72	34.80	40	0.10
1476	10812	77	13.00	20	0.00
1477	10813	2	19.00	12	0.20
1478	10813	46	12.00	35	0.00
1479	10814	41	9.65	20	0.00
1480	10814	43	46.00	20	0.15
1481	10814	48	12.75	8	0.15
1482	10814	61	28.50	30	0.15
1483	10815	33	2.50	16	0.00
1484	10816	38	263.50	30	0.05
1485	10816	62	49.30	20	0.05
1486	10817	26	31.23	40	0.15
1487	10817	38	263.50	30	0.00
1488	10817	40	18.40	60	0.15
1489	10817	62	49.30	25	0.15
1490	10818	32	32.00	20	0.00
1491	10818	41	9.65	20	0.00
1492	10819	43	46.00	7	0.00
1493	10819	75	7.75	20	0.00
1494	10820	56	38.00	30	0.00
1495	10821	35	18.00	20	0.00
1496	10821	51	53.00	6	0.00
1497	10822	62	49.30	3	0.00
1498	10822	70	15.00	6	0.00
1499	10823	11	21.00	20	0.10
1500	10823	57	19.50	15	0.00
1501	10823	59	55.00	40	0.10
1502	10823	77	13.00	15	0.10
1503	10824	41	9.65	12	0.00
1504	10824	70	15.00	9	0.00
1505	10825	26	31.23	12	0.00
1506	10825	53	32.80	20	0.00
1507	10826	31	12.50	35	0.00
1508	10826	57	19.50	15	0.00
1509	10827	10	31.00	15	0.00
1510	10827	39	18.00	21	0.00
1511	10828	20	81.00	5	0.00
1512	10828	38	263.50	2	0.00
1513	10829	2	19.00	10	0.00
1514	10829	8	40.00	20	0.00
1515	10829	13	6.00	10	0.00
1516	10829	60	34.00	21	0.00
1517	10830	6	25.00	6	0.00
1518	10830	39	18.00	28	0.00
1519	10830	60	34.00	30	0.00
1520	10830	68	12.50	24	0.00
1521	10831	19	9.20	2	0.00
1522	10831	35	18.00	8	0.00
1523	10831	38	263.50	8	0.00
1524	10831	43	46.00	9	0.00
1525	10832	13	6.00	3	0.20
1526	10832	25	14.00	10	0.20
1527	10832	44	19.45	16	0.20
1528	10832	64	33.25	3	0.00
1529	10833	7	30.00	20	0.10
1530	10833	31	12.50	9	0.10
1531	10833	53	32.80	9	0.10
1532	10834	29	123.79	8	0.05
1533	10834	30	25.89	20	0.05
1534	10835	59	55.00	15	0.00
1535	10835	77	13.00	2	0.20
1536	10836	22	21.00	52	0.00
1537	10836	35	18.00	6	0.00
1538	10836	57	19.50	24	0.00
1539	10836	60	34.00	60	0.00
1540	10836	64	33.25	30	0.00
1541	10837	13	6.00	6	0.00
1542	10837	40	18.40	25	0.00
1543	10837	47	9.50	40	0.25
1544	10837	76	18.00	21	0.25
1545	10838	1	18.00	4	0.25
1546	10838	18	62.50	25	0.25
1547	10838	36	19.00	50	0.25
1548	10839	58	13.25	30	0.10
1549	10839	72	34.80	15	0.10
1550	10840	25	14.00	6	0.20
1551	10840	39	18.00	10	0.20
1552	10841	10	31.00	16	0.00
1553	10841	56	38.00	30	0.00
1554	10841	59	55.00	50	0.00
1555	10841	77	13.00	15	0.00
1556	10842	11	21.00	15	0.00
1557	10842	43	46.00	5	0.00
1558	10842	68	12.50	20	0.00
1559	10842	70	15.00	12	0.00
1560	10843	51	53.00	4	0.25
1561	10844	22	21.00	35	0.00
1562	10845	23	9.00	70	0.10
1563	10845	35	18.00	25	0.10
1564	10845	42	14.00	42	0.10
1565	10845	58	13.25	60	0.10
1566	10845	64	33.25	48	0.00
1567	10846	4	22.00	21	0.00
1568	10846	70	15.00	30	0.00
1569	10846	74	10.00	20	0.00
1570	10847	1	18.00	80	0.20
1571	10847	19	9.20	12	0.20
1572	10847	37	26.00	60	0.20
1573	10847	45	9.50	36	0.20
1574	10847	60	34.00	45	0.20
1575	10847	71	21.50	55	0.20
1576	10848	5	21.35	30	0.00
1577	10848	9	97.00	3	0.00
1578	10849	3	10.00	49	0.00
1579	10849	26	31.23	18	0.15
1580	10850	25	14.00	20	0.15
1581	10850	33	2.50	4	0.15
1582	10850	70	15.00	30	0.15
1583	10851	2	19.00	5	0.05
1584	10851	25	14.00	10	0.05
1585	10851	57	19.50	10	0.05
1586	10851	59	55.00	42	0.05
1587	10852	2	19.00	15	0.00
1588	10852	17	39.00	6	0.00
1589	10852	62	49.30	50	0.00
1590	10853	18	62.50	10	0.00
1591	10854	10	31.00	100	0.15
1592	10854	13	6.00	65	0.15
1593	10855	16	17.45	50	0.00
1594	10855	31	12.50	14	0.00
1595	10855	56	38.00	24	0.00
1596	10855	65	21.05	15	0.15
1597	10856	2	19.00	20	0.00
1598	10856	42	14.00	20	0.00
1599	10857	3	10.00	30	0.00
1600	10857	26	31.23	35	0.25
1601	10857	29	123.79	10	0.25
1602	10858	7	30.00	5	0.00
1603	10858	27	43.90	10	0.00
1604	10858	70	15.00	4	0.00
1605	10859	24	4.50	40	0.25
1606	10859	54	7.45	35	0.25
1607	10859	64	33.25	30	0.25
1608	10860	51	53.00	3	0.00
1609	10860	76	18.00	20	0.00
1610	10861	17	39.00	42	0.00
1611	10861	18	62.50	20	0.00
1612	10861	21	10.00	40	0.00
1613	10861	33	2.50	35	0.00
1614	10861	62	49.30	3	0.00
1615	10862	11	21.00	25	0.00
1616	10862	52	7.00	8	0.00
1617	10863	1	18.00	20	0.15
1618	10863	58	13.25	12	0.15
1619	10864	35	18.00	4	0.00
1620	10864	67	14.00	15	0.00
1621	10865	38	263.50	60	0.05
1622	10865	39	18.00	80	0.05
1623	10866	2	19.00	21	0.25
1624	10866	24	4.50	6	0.25
1625	10866	30	25.89	40	0.25
1626	10867	53	32.80	3	0.00
1627	10868	26	31.23	20	0.00
1628	10868	35	18.00	30	0.00
1629	10868	49	20.00	42	0.10
1630	10869	1	18.00	40	0.00
1631	10869	11	21.00	10	0.00
1632	10869	23	9.00	50	0.00
1633	10869	68	12.50	20	0.00
1634	10870	35	18.00	3	0.00
1635	10870	51	53.00	2	0.00
1636	10871	6	25.00	50	0.05
1637	10871	16	17.45	12	0.05
1638	10871	17	39.00	16	0.05
1639	10872	55	24.00	10	0.05
1640	10872	62	49.30	20	0.05
1641	10872	64	33.25	15	0.05
1642	10872	65	21.05	21	0.05
1643	10873	21	10.00	20	0.00
1644	10873	28	45.60	3	0.00
1645	10874	10	31.00	10	0.00
1646	10875	19	9.20	25	0.00
1647	10875	47	9.50	21	0.10
1648	10875	49	20.00	15	0.00
1649	10876	46	12.00	21	0.00
1650	10876	64	33.25	20	0.00
1651	10877	16	17.45	30	0.25
1652	10877	18	62.50	25	0.00
1653	10878	20	81.00	20	0.05
1654	10879	40	18.40	12	0.00
1655	10879	65	21.05	10	0.00
1656	10879	76	18.00	10	0.00
1657	10880	23	9.00	30	0.20
1658	10880	61	28.50	30	0.20
1659	10880	70	15.00	50	0.20
1660	10881	73	15.00	10	0.00
1661	10882	42	14.00	25	0.00
1662	10882	49	20.00	20	0.15
1663	10882	54	7.45	32	0.15
1664	10883	24	4.50	8	0.00
1665	10884	21	10.00	40	0.05
1666	10884	56	38.00	21	0.05
1667	10884	65	21.05	12	0.05
1668	10885	2	19.00	20	0.00
1669	10885	24	4.50	12	0.00
1670	10885	70	15.00	30	0.00
1671	10885	77	13.00	25	0.00
1672	10886	10	31.00	70	0.00
1673	10886	31	12.50	35	0.00
1674	10886	77	13.00	40	0.00
1675	10887	25	14.00	5	0.00
1676	10888	2	19.00	20	0.00
1677	10888	68	12.50	18	0.00
1678	10889	11	21.00	40	0.00
1679	10889	38	263.50	40	0.00
1680	10890	17	39.00	15	0.00
1681	10890	34	14.00	10	0.00
1682	10890	41	9.65	14	0.00
1683	10891	30	25.89	15	0.05
1684	10892	59	55.00	40	0.05
1685	10893	8	40.00	30	0.00
1686	10893	24	4.50	10	0.00
1687	10893	29	123.79	24	0.00
1688	10893	30	25.89	35	0.00
1689	10893	36	19.00	20	0.00
1690	10894	13	6.00	28	0.05
1691	10894	69	36.00	50	0.05
1692	10894	75	7.75	120	0.05
1693	10895	24	4.50	110	0.00
1694	10895	39	18.00	45	0.00
1695	10895	40	18.40	91	0.00
1696	10895	60	34.00	100	0.00
1697	10896	45	9.50	15	0.00
1698	10896	56	38.00	16	0.00
1699	10897	29	123.79	80	0.00
1700	10897	30	25.89	36	0.00
1701	10898	13	6.00	5	0.00
1702	10899	39	18.00	8	0.15
1703	10900	70	15.00	3	0.25
1704	10901	41	9.65	30	0.00
1705	10901	71	21.50	30	0.00
1706	10902	55	24.00	30	0.15
1707	10902	62	49.30	6	0.15
1708	10903	13	6.00	40	0.00
1709	10903	65	21.05	21	0.00
1710	10903	68	12.50	20	0.00
1711	10904	58	13.25	15	0.00
1712	10904	62	49.30	35	0.00
1713	10905	1	18.00	20	0.05
1714	10906	61	28.50	15	0.00
1715	10907	75	7.75	14	0.00
1716	10908	7	30.00	20	0.05
1717	10908	52	7.00	14	0.05
1718	10909	7	30.00	12	0.00
1719	10909	16	17.45	15	0.00
1720	10909	41	9.65	5	0.00
1721	10910	19	9.20	12	0.00
1722	10910	49	20.00	10	0.00
1723	10910	61	28.50	5	0.00
1724	10911	1	18.00	10	0.00
1725	10911	17	39.00	12	0.00
1726	10911	67	14.00	15	0.00
1727	10912	11	21.00	40	0.25
1728	10912	29	123.79	60	0.25
1729	10913	4	22.00	30	0.25
1730	10913	33	2.50	40	0.25
1731	10913	58	13.25	15	0.00
1732	10914	71	21.50	25	0.00
1733	10915	17	39.00	10	0.00
1734	10915	33	2.50	30	0.00
1735	10915	54	7.45	10	0.00
1736	10916	16	17.45	6	0.00
1737	10916	32	32.00	6	0.00
1738	10916	57	19.50	20	0.00
1739	10917	30	25.89	1	0.00
1740	10917	60	34.00	10	0.00
1741	10918	1	18.00	60	0.25
1742	10918	60	34.00	25	0.25
1743	10919	16	17.45	24	0.00
1744	10919	25	14.00	24	0.00
1745	10919	40	18.40	20	0.00
1746	10920	50	16.25	24	0.00
1747	10921	35	18.00	10	0.00
1748	10921	63	43.90	40	0.00
1749	10922	17	39.00	15	0.00
1750	10922	24	4.50	35	0.00
1751	10923	42	14.00	10	0.20
1752	10923	43	46.00	10	0.20
1753	10923	67	14.00	24	0.20
1754	10924	10	31.00	20	0.10
1755	10924	28	45.60	30	0.10
1756	10924	75	7.75	6	0.00
1757	10925	36	19.00	25	0.15
1758	10925	52	7.00	12	0.15
1759	10926	11	21.00	2	0.00
1760	10926	13	6.00	10	0.00
1761	10926	19	9.20	7	0.00
1762	10926	72	34.80	10	0.00
1763	10927	20	81.00	5	0.00
1764	10927	52	7.00	5	0.00
1765	10927	76	18.00	20	0.00
1766	10928	47	9.50	5	0.00
1767	10928	76	18.00	5	0.00
1768	10929	21	10.00	60	0.00
1769	10929	75	7.75	49	0.00
1770	10929	77	13.00	15	0.00
1771	10930	21	10.00	36	0.00
1772	10930	27	43.90	25	0.00
1773	10930	55	24.00	25	0.20
1774	10930	58	13.25	30	0.20
1775	10931	13	6.00	42	0.15
1776	10931	57	19.50	30	0.00
1777	10932	16	17.45	30	0.10
1778	10932	62	49.30	14	0.10
1779	10932	72	34.80	16	0.00
1780	10932	75	7.75	20	0.10
1781	10933	53	32.80	2	0.00
1782	10933	61	28.50	30	0.00
1783	10934	6	25.00	20	0.00
1784	10935	1	18.00	21	0.00
1785	10935	18	62.50	4	0.25
1786	10935	23	9.00	8	0.25
1787	10936	36	19.00	30	0.20
1788	10937	28	45.60	8	0.00
1789	10937	34	14.00	20	0.00
1790	10938	13	6.00	20	0.25
1791	10938	43	46.00	24	0.25
1792	10938	60	34.00	49	0.25
1793	10938	71	21.50	35	0.25
1794	10939	2	19.00	10	0.15
1795	10939	67	14.00	40	0.15
1796	10940	7	30.00	8	0.00
1797	10940	13	6.00	20	0.00
1798	10941	31	12.50	44	0.25
1799	10941	62	49.30	30	0.25
1800	10941	68	12.50	80	0.25
1801	10941	72	34.80	50	0.00
1802	10942	49	20.00	28	0.00
1803	10943	13	6.00	15	0.00
1804	10943	22	21.00	21	0.00
1805	10943	46	12.00	15	0.00
1806	10944	11	21.00	5	0.25
1807	10944	44	19.45	18	0.25
1808	10944	56	38.00	18	0.00
1809	10945	13	6.00	20	0.00
1810	10945	31	12.50	10	0.00
1811	10946	10	31.00	25	0.00
1812	10946	24	4.50	25	0.00
1813	10946	77	13.00	40	0.00
1814	10947	59	55.00	4	0.00
1815	10948	50	16.25	9	0.00
1816	10948	51	53.00	40	0.00
1817	10948	55	24.00	4	0.00
1818	10949	6	25.00	12	0.00
1819	10949	10	31.00	30	0.00
1820	10949	17	39.00	6	0.00
1821	10949	62	49.30	60	0.00
1822	10950	4	22.00	5	0.00
1823	10951	33	2.50	15	0.05
1824	10951	41	9.65	6	0.05
1825	10951	75	7.75	50	0.05
1826	10952	6	25.00	16	0.05
1827	10952	28	45.60	2	0.00
1828	10953	20	81.00	50	0.05
1829	10953	31	12.50	50	0.05
1830	10954	16	17.45	28	0.15
1831	10954	31	12.50	25	0.15
1832	10954	45	9.50	30	0.00
1833	10954	60	34.00	24	0.15
1834	10955	75	7.75	12	0.20
1835	10956	21	10.00	12	0.00
1836	10956	47	9.50	14	0.00
1837	10956	51	53.00	8	0.00
1838	10957	30	25.89	30	0.00
1839	10957	35	18.00	40	0.00
1840	10957	64	33.25	8	0.00
1841	10958	5	21.35	20	0.00
1842	10958	7	30.00	6	0.00
1843	10958	72	34.80	5	0.00
1844	10959	75	7.75	20	0.15
1845	10960	24	4.50	10	0.25
1846	10960	41	9.65	24	0.00
1847	10961	52	7.00	6	0.05
1848	10961	76	18.00	60	0.00
1849	10962	7	30.00	45	0.00
1850	10962	13	6.00	77	0.00
1851	10962	53	32.80	20	0.00
1852	10962	69	36.00	9	0.00
1853	10962	76	18.00	44	0.00
1854	10963	60	34.00	2	0.15
1855	10964	18	62.50	6	0.00
1856	10964	38	263.50	5	0.00
1857	10964	69	36.00	10	0.00
1858	10965	51	53.00	16	0.00
1859	10966	37	26.00	8	0.00
1860	10966	56	38.00	12	0.15
1861	10966	62	49.30	12	0.15
1862	10967	19	9.20	12	0.00
1863	10967	49	20.00	40	0.00
1864	10968	12	38.00	30	0.00
1865	10968	24	4.50	30	0.00
1866	10968	64	33.25	4	0.00
1867	10969	46	12.00	9	0.00
1868	10970	52	7.00	40	0.20
1869	10971	29	123.79	14	0.00
1870	10972	17	39.00	6	0.00
1871	10972	33	2.50	7	0.00
1872	10973	26	31.23	5	0.00
1873	10973	41	9.65	6	0.00
1874	10973	75	7.75	10	0.00
1875	10974	63	43.90	10	0.00
1876	10975	8	40.00	16	0.00
1877	10975	75	7.75	10	0.00
1878	10976	28	45.60	20	0.00
1879	10977	39	18.00	30	0.00
1880	10977	47	9.50	30	0.00
1881	10977	51	53.00	10	0.00
1882	10977	63	43.90	20	0.00
1883	10978	8	40.00	20	0.15
1884	10978	21	10.00	40	0.15
1885	10978	40	18.40	10	0.00
1886	10978	44	19.45	6	0.15
1887	10979	7	30.00	18	0.00
1888	10979	12	38.00	20	0.00
1889	10979	24	4.50	80	0.00
1890	10979	27	43.90	30	0.00
1891	10979	31	12.50	24	0.00
1892	10979	63	43.90	35	0.00
1893	10980	75	7.75	40	0.20
1894	10981	38	263.50	60	0.00
1895	10982	7	30.00	20	0.00
1896	10982	43	46.00	9	0.00
1897	10983	13	6.00	84	0.15
1898	10983	57	19.50	15	0.00
1899	10984	16	17.45	55	0.00
1900	10984	24	4.50	20	0.00
1901	10984	36	19.00	40	0.00
1902	10985	16	17.45	36	0.10
1903	10985	18	62.50	8	0.10
1904	10985	32	32.00	35	0.10
1905	10986	11	21.00	30	0.00
1906	10986	20	81.00	15	0.00
1907	10986	76	18.00	10	0.00
1908	10986	77	13.00	15	0.00
1909	10987	7	30.00	60	0.00
1910	10987	43	46.00	6	0.00
1911	10987	72	34.80	20	0.00
1912	10988	7	30.00	60	0.00
1913	10988	62	49.30	40	0.10
1914	10989	6	25.00	40	0.00
1915	10989	11	21.00	15	0.00
1916	10989	41	9.65	4	0.00
1917	10990	21	10.00	65	0.00
1918	10990	34	14.00	60	0.15
1919	10990	55	24.00	65	0.15
1920	10990	61	28.50	66	0.15
1921	10991	2	19.00	50	0.20
1922	10991	70	15.00	20	0.20
1923	10991	76	18.00	90	0.20
1924	10992	72	34.80	2	0.00
1925	10993	29	123.79	50	0.25
1926	10993	41	9.65	35	0.25
1927	10994	59	55.00	18	0.05
1928	10995	51	53.00	20	0.00
1929	10995	60	34.00	4	0.00
1930	10996	42	14.00	40	0.00
1931	10997	32	32.00	50	0.00
1932	10997	46	12.00	20	0.25
1933	10997	52	7.00	20	0.25
1934	10998	24	4.50	12	0.00
1935	10998	61	28.50	7	0.00
1936	10998	74	10.00	20	0.00
1937	10998	75	7.75	30	0.00
1938	10999	41	9.65	20	0.05
1939	10999	51	53.00	15	0.05
1940	10999	77	13.00	21	0.05
1941	11000	4	22.00	25	0.25
1942	11000	24	4.50	30	0.25
1943	11000	77	13.00	30	0.00
1944	11001	7	30.00	60	0.00
1945	11001	22	21.00	25	0.00
1946	11001	46	12.00	25	0.00
1947	11001	55	24.00	6	0.00
1948	11002	13	6.00	56	0.00
1949	11002	35	18.00	15	0.15
1950	11002	42	14.00	24	0.15
1951	11002	55	24.00	40	0.00
1952	11003	1	18.00	4	0.00
1953	11003	40	18.40	10	0.00
1954	11003	52	7.00	10	0.00
1955	11004	26	31.23	6	0.00
1956	11004	76	18.00	6	0.00
1957	11005	1	18.00	2	0.00
1958	11005	59	55.00	10	0.00
1959	11006	1	18.00	8	0.00
1960	11006	29	123.79	2	0.25
1961	11007	8	40.00	30	0.00
1962	11007	29	123.79	10	0.00
1963	11007	42	14.00	14	0.00
1964	11008	28	45.60	70	0.05
1965	11008	34	14.00	90	0.05
1966	11008	71	21.50	21	0.00
1967	11009	24	4.50	12	0.00
1968	11009	36	19.00	18	0.25
1969	11009	60	34.00	9	0.00
1970	11010	7	30.00	20	0.00
1971	11010	24	4.50	10	0.00
1972	11011	58	13.25	40	0.05
1973	11011	71	21.50	20	0.00
1974	11012	19	9.20	50	0.05
1975	11012	60	34.00	36	0.05
1976	11012	71	21.50	60	0.05
1977	11013	23	9.00	10	0.00
1978	11013	42	14.00	4	0.00
1979	11013	45	9.50	20	0.00
1980	11013	68	12.50	2	0.00
1981	11014	41	9.65	28	0.10
1982	11015	30	25.89	15	0.00
1983	11015	77	13.00	18	0.00
1984	11016	31	12.50	15	0.00
1985	11016	36	19.00	16	0.00
1986	11017	3	10.00	25	0.00
1987	11017	59	55.00	110	0.00
1988	11017	70	15.00	30	0.00
1989	11018	12	38.00	20	0.00
1990	11018	18	62.50	10	0.00
1991	11018	56	38.00	5	0.00
1992	11019	46	12.00	3	0.00
1993	11019	49	20.00	2	0.00
1994	11020	10	31.00	24	0.15
1995	11021	2	19.00	11	0.25
1996	11021	20	81.00	15	0.00
1997	11021	26	31.23	63	0.00
1998	11021	51	53.00	44	0.25
1999	11021	72	34.80	35	0.00
2000	11022	19	9.20	35	0.00
2001	11022	69	36.00	30	0.00
2002	11023	7	30.00	4	0.00
2003	11023	43	46.00	30	0.00
2004	11024	26	31.23	12	0.00
2005	11024	33	2.50	30	0.00
2006	11024	65	21.05	21	0.00
2007	11024	71	21.50	50	0.00
2008	11025	1	18.00	10	0.10
2009	11025	13	6.00	20	0.10
2010	11026	18	62.50	8	0.00
2011	11026	51	53.00	10	0.00
2012	11027	24	4.50	30	0.25
2013	11027	62	49.30	21	0.25
2014	11028	55	24.00	35	0.00
2015	11028	59	55.00	24	0.00
2016	11029	56	38.00	20	0.00
2017	11029	63	43.90	12	0.00
2018	11030	2	19.00	100	0.25
2019	11030	5	21.35	70	0.00
2020	11030	29	123.79	60	0.25
2021	11030	59	55.00	100	0.25
2022	11031	1	18.00	45	0.00
2023	11031	13	6.00	80	0.00
2024	11031	24	4.50	21	0.00
2025	11031	64	33.25	20	0.00
2026	11031	71	21.50	16	0.00
2027	11032	36	19.00	35	0.00
2028	11032	38	263.50	25	0.00
2029	11032	59	55.00	30	0.00
2030	11033	53	32.80	70	0.10
2031	11033	69	36.00	36	0.10
2032	11034	21	10.00	15	0.10
2033	11034	44	19.45	12	0.00
2034	11034	61	28.50	6	0.00
2035	11035	1	18.00	10	0.00
2036	11035	35	18.00	60	0.00
2037	11035	42	14.00	30	0.00
2038	11035	54	7.45	10	0.00
2039	11036	13	6.00	7	0.00
2040	11036	59	55.00	30	0.00
2041	11037	70	15.00	4	0.00
2042	11038	40	18.40	5	0.20
2043	11038	52	7.00	2	0.00
2044	11038	71	21.50	30	0.00
2045	11039	28	45.60	20	0.00
2046	11039	35	18.00	24	0.00
2047	11039	49	20.00	60	0.00
2048	11039	57	19.50	28	0.00
2049	11040	21	10.00	20	0.00
2050	11041	2	19.00	30	0.20
2051	11041	63	43.90	30	0.00
2052	11042	44	19.45	15	0.00
2053	11042	61	28.50	4	0.00
2054	11043	11	21.00	10	0.00
2055	11044	62	49.30	12	0.00
2056	11045	33	2.50	15	0.00
2057	11045	51	53.00	24	0.00
2058	11046	12	38.00	20	0.05
2059	11046	32	32.00	15	0.05
2060	11046	35	18.00	18	0.05
2061	11047	1	18.00	25	0.25
2062	11047	5	21.35	30	0.25
2063	11048	68	12.50	42	0.00
2064	11049	2	19.00	10	0.20
2065	11049	12	38.00	4	0.20
2066	11050	76	18.00	50	0.10
2067	11051	24	4.50	10	0.20
2068	11052	43	46.00	30	0.20
2069	11052	61	28.50	10	0.20
2070	11053	18	62.50	35	0.20
2071	11053	32	32.00	20	0.00
2072	11053	64	33.25	25	0.20
2073	11054	33	2.50	10	0.00
2074	11054	67	14.00	20	0.00
2075	11055	24	4.50	15	0.00
2076	11055	25	14.00	15	0.00
2077	11055	51	53.00	20	0.00
2078	11055	57	19.50	20	0.00
2079	11056	7	30.00	40	0.00
2080	11056	55	24.00	35	0.00
2081	11056	60	34.00	50	0.00
2082	11057	70	15.00	3	0.00
2083	11058	21	10.00	3	0.00
2084	11058	60	34.00	21	0.00
2085	11058	61	28.50	4	0.00
2086	11059	13	6.00	30	0.00
2087	11059	17	39.00	12	0.00
2088	11059	60	34.00	35	0.00
2089	11060	60	34.00	4	0.00
2090	11060	77	13.00	10	0.00
2091	11061	60	34.00	15	0.00
2092	11062	53	32.80	10	0.20
2093	11062	70	15.00	12	0.20
2094	11063	34	14.00	30	0.00
2095	11063	40	18.40	40	0.10
2096	11063	41	9.65	30	0.10
2097	11064	17	39.00	77	0.10
2098	11064	41	9.65	12	0.00
2099	11064	53	32.80	25	0.10
2100	11064	55	24.00	4	0.10
2101	11064	68	12.50	55	0.00
2102	11065	30	25.89	4	0.25
2103	11065	54	7.45	20	0.25
2104	11066	16	17.45	3	0.00
2105	11066	19	9.20	42	0.00
2106	11066	34	14.00	35	0.00
2107	11067	41	9.65	9	0.00
2108	11068	28	45.60	8	0.15
2109	11068	43	46.00	36	0.15
2110	11068	77	13.00	28	0.15
2111	11069	39	18.00	20	0.00
2112	11070	1	18.00	40	0.15
2113	11070	2	19.00	20	0.15
2114	11070	16	17.45	30	0.15
2115	11070	31	12.50	20	0.00
2116	11071	7	30.00	15	0.05
2117	11071	13	6.00	10	0.05
2118	11072	2	19.00	8	0.00
2119	11072	41	9.65	40	0.00
2120	11072	50	16.25	22	0.00
2121	11072	64	33.25	130	0.00
2122	11073	11	21.00	10	0.00
2123	11073	24	4.50	20	0.00
2124	11074	16	17.45	14	0.05
2125	11075	2	19.00	10	0.15
2126	11075	46	12.00	30	0.15
2127	11075	76	18.00	2	0.15
2128	11076	6	25.00	20	0.25
2129	11076	14	23.25	20	0.25
2130	11076	19	9.20	10	0.25
2131	11077	2	19.00	24	0.20
2132	11077	3	10.00	4	0.00
2133	11077	4	22.00	1	0.00
2134	11077	6	25.00	1	0.02
2135	11077	7	30.00	1	0.05
2136	11077	8	40.00	2	0.10
2137	11077	10	31.00	1	0.00
2138	11077	12	38.00	2	0.05
2139	11077	13	6.00	4	0.00
2140	11077	14	23.25	1	0.03
2141	11077	16	17.45	2	0.03
2142	11077	20	81.00	1	0.04
2143	11077	23	9.00	2	0.00
2144	11077	32	32.00	1	0.00
2145	11077	39	18.00	2	0.05
2146	11077	41	9.65	3	0.00
2147	11077	46	12.00	3	0.02
2148	11077	52	7.00	2	0.00
2149	11077	55	24.00	2	0.00
2150	11077	60	34.00	2	0.06
2151	11077	64	33.25	2	0.03
2152	11077	66	17.00	1	0.00
2153	11077	73	15.00	2	0.01
2154	11077	75	7.75	4	0.00
2155	11077	77	13.00	2	0.00
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (orderid, customerid, employeeid, orderdate, requireddate, shippeddate, shipvia, freight, shippername, shipaddress, shipcity, shipregion, shippostalcode, shipcountry) FROM stdin;
10248	VINET	5	1996-07-04	1996-08-01	1996-07-16	3	32.38	Vins et alcools Chevalier	59 rue de lAbbaye	Reims	NULL	51100	France
10249	TOMSP	6	1996-07-05	1996-08-16	1996-07-10	1	11.61	Toms SpezialitÃ¤ten	Luisenstr. 48	MÃ¼nster	NULL	44087	Germany
10250	HANAR	4	1996-07-08	1996-08-05	1996-07-12	2	65.83	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10251	VICTE	3	1996-07-08	1996-08-05	1996-07-15	1	41.34	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10252	SUPRD	4	1996-07-09	1996-08-06	1996-07-11	2	51.30	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10253	HANAR	3	1996-07-10	1996-07-24	1996-07-16	2	58.17	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10254	CHOPS	5	1996-07-11	1996-08-08	1996-07-23	2	22.98	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
10255	RICSU	9	1996-07-12	1996-08-09	1996-07-15	3	148.33	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
10256	WELLI	3	1996-07-15	1996-08-12	1996-07-17	2	13.97	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10257	HILAA	4	1996-07-16	1996-08-13	1996-07-22	3	81.91	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10258	ERNSH	1	1996-07-17	1996-08-14	1996-07-23	1	140.51	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10259	CENTC	4	1996-07-18	1996-08-15	1996-07-25	3	3.25	Centro comercial Moctezuma	Sierras de Granada 9993	MÃ©xico D.F.	NULL	5022	Mexico
10260	OTTIK	4	1996-07-19	1996-08-16	1996-07-29	1	55.09	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10261	QUEDE	4	1996-07-19	1996-08-16	1996-07-30	2	3.05	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10262	RATTC	8	1996-07-22	1996-08-19	1996-07-25	3	48.29	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10263	ERNSH	9	1996-07-23	1996-08-20	1996-07-31	3	146.06	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10264	FOLKO	6	1996-07-24	1996-08-21	1996-08-23	3	3.67	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10265	BLONP	2	1996-07-25	1996-08-22	1996-08-12	1	55.28	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10266	WARTH	3	1996-07-26	1996-09-06	1996-07-31	3	25.73	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10267	FRANK	4	1996-07-29	1996-08-26	1996-08-06	1	208.58	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10268	GROSR	8	1996-07-30	1996-08-27	1996-08-02	3	66.29	GROSELLA-Restaurante	5Âª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
10269	WHITC	5	1996-07-31	1996-08-14	1996-08-09	1	4.56	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10270	WARTH	1	1996-08-01	1996-08-29	1996-08-02	1	136.54	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10271	SPLIR	6	1996-08-01	1996-08-29	1996-08-30	2	4.54	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10272	RATTC	6	1996-08-02	1996-08-30	1996-08-06	2	98.03	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10273	QUICK	3	1996-08-05	1996-09-02	1996-08-12	3	76.07	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10274	VINET	6	1996-08-06	1996-09-03	1996-08-16	1	6.01	Vins et alcools Chevalier	59 rue de lAbbaye	Reims	NULL	51100	France
10275	MAGAA	1	1996-08-07	1996-09-04	1996-08-09	1	26.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10276	TORTU	8	1996-08-08	1996-08-22	1996-08-14	3	13.84	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10277	MORGK	2	1996-08-09	1996-09-06	1996-08-13	3	125.77	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	4179	Germany
10278	BERGS	8	1996-08-12	1996-09-09	1996-08-16	2	92.69	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10279	LEHMS	8	1996-08-13	1996-09-10	1996-08-16	2	25.83	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10281	ROMEY	4	1996-08-14	1996-08-28	1996-08-21	1	2.94	Romero y tomillo	Gran VÃ­a 1	Madrid	NULL	28001	Spain
10280	BERGS	2	1996-08-14	1996-09-11	1996-09-12	1	8.98	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10282	ROMEY	4	1996-08-15	1996-09-12	1996-08-21	1	12.69	Romero y tomillo	Gran VÃ­a 1	Madrid	NULL	28001	Spain
10283	LILAS	3	1996-08-16	1996-09-13	1996-08-23	3	84.81	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10284	LEHMS	4	1996-08-19	1996-09-16	1996-08-27	1	76.56	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10285	QUICK	1	1996-08-20	1996-09-17	1996-08-26	2	76.83	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10286	QUICK	8	1996-08-21	1996-09-18	1996-08-30	3	229.24	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10287	RICAR	8	1996-08-22	1996-09-19	1996-08-28	3	12.76	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10288	REGGC	4	1996-08-23	1996-09-20	1996-09-03	1	7.45	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10289	BSBEV	7	1996-08-26	1996-09-23	1996-08-28	3	22.77	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10290	COMMI	8	1996-08-27	1996-09-24	1996-09-03	1	79.70	ComÃ©rcio Mineiro	Av. dos LusÃ­adas 23	Sao Paulo	SP	05432-043	Brazil
10291	QUEDE	6	1996-08-27	1996-09-24	1996-09-04	2	6.40	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10292	TRADH	1	1996-08-28	1996-09-25	1996-09-02	2	1.35	TradiÃ§ao Hipermercados	Av. InÃªs de Castro 414	Sao Paulo	SP	05634-030	Brazil
10293	TORTU	1	1996-08-29	1996-09-26	1996-09-11	3	21.18	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10294	RATTC	4	1996-08-30	1996-09-27	1996-09-05	2	147.26	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10295	VINET	2	1996-09-02	1996-09-30	1996-09-10	2	1.15	Vins et alcools Chevalier	59 rue de lAbbaye	Reims	NULL	51100	France
10296	LILAS	6	1996-09-03	1996-10-01	1996-09-11	1	0.12	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10297	BLONP	5	1996-09-04	1996-10-16	1996-09-10	2	5.74	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10298	HUNGO	6	1996-09-05	1996-10-03	1996-09-11	2	168.22	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10299	RICAR	4	1996-09-06	1996-10-04	1996-09-13	2	29.76	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10301	WANDK	8	1996-09-09	1996-10-07	1996-09-17	2	45.08	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10300	MAGAA	2	1996-09-09	1996-10-07	1996-09-18	2	17.68	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10302	SUPRD	4	1996-09-10	1996-10-08	1996-10-09	2	6.27	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10303	GODOS	7	1996-09-11	1996-10-09	1996-09-18	2	107.83	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
10304	TORTU	1	1996-09-12	1996-10-10	1996-09-17	2	63.79	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10305	OLDWO	8	1996-09-13	1996-10-11	1996-10-09	3	257.62	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10306	ROMEY	1	1996-09-16	1996-10-14	1996-09-23	3	7.56	Romero y tomillo	Gran VÃ­a 1	Madrid	NULL	28001	Spain
10307	LONEP	2	1996-09-17	1996-10-15	1996-09-25	2	0.56	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10308	ANATR	7	1996-09-18	1996-10-16	1996-09-24	3	1.61	Ana Trujillo Emparedados y helados	Avda. de la ConstituciÃ³n 2222	MÃ©xico D.F.	NULL	5021	Mexico
10309	HUNGO	3	1996-09-19	1996-10-17	1996-10-23	1	47.30	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10311	DUMON	1	1996-09-20	1996-10-04	1996-09-26	3	24.69	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
10310	THEBI	8	1996-09-20	1996-10-18	1996-09-27	2	17.52	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
10312	WANDK	2	1996-09-23	1996-10-21	1996-10-03	2	40.26	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10313	QUICK	2	1996-09-24	1996-10-22	1996-10-04	2	1.96	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10314	RATTC	1	1996-09-25	1996-10-23	1996-10-04	2	74.16	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10315	ISLAT	4	1996-09-26	1996-10-24	1996-10-03	2	41.76	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10316	RATTC	1	1996-09-27	1996-10-25	1996-10-08	3	150.15	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10317	LONEP	6	1996-09-30	1996-10-28	1996-10-10	1	12.69	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10318	ISLAT	8	1996-10-01	1996-10-29	1996-10-04	2	4.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10319	TORTU	7	1996-10-02	1996-10-30	1996-10-11	3	64.50	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10321	ISLAT	3	1996-10-03	1996-10-31	1996-10-11	2	3.43	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10320	WARTH	5	1996-10-03	1996-10-17	1996-10-18	3	34.57	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10322	PERIC	7	1996-10-04	1996-11-01	1996-10-23	3	0.40	Pericles Comidas clÃ¡sicas	Calle Dr. Jorge Cash 321	MÃ©xico D.F.	NULL	5033	Mexico
10323	KOENE	4	1996-10-07	1996-11-04	1996-10-14	1	4.88	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10324	SAVEA	9	1996-10-08	1996-11-05	1996-10-10	1	214.27	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10325	KOENE	1	1996-10-09	1996-10-23	1996-10-14	3	64.86	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10326	BOLID	4	1996-10-10	1996-11-07	1996-10-14	2	77.92	BÃ³lido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
10327	FOLKO	2	1996-10-11	1996-11-08	1996-10-14	1	63.36	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10328	FURIB	4	1996-10-14	1996-11-11	1996-10-17	3	87.03	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
10329	SPLIR	4	1996-10-15	1996-11-26	1996-10-23	2	191.67	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10331	BONAP	9	1996-10-16	1996-11-27	1996-10-21	1	10.19	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10330	LILAS	3	1996-10-16	1996-11-13	1996-10-28	1	12.75	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10332	MEREP	3	1996-10-17	1996-11-28	1996-10-21	2	52.84	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10333	WARTH	5	1996-10-18	1996-11-15	1996-10-25	3	0.59	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10334	VICTE	8	1996-10-21	1996-11-18	1996-10-28	2	8.56	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10335	HUNGO	7	1996-10-22	1996-11-19	1996-10-24	2	42.11	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10336	PRINI	7	1996-10-23	1996-11-20	1996-10-25	2	15.51	Princesa Isabel Vinhos	Estrada da saÃºde n. 58	Lisboa	NULL	1756	Portugal
10337	FRANK	4	1996-10-24	1996-11-21	1996-10-29	3	108.26	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10338	OLDWO	4	1996-10-25	1996-11-22	1996-10-29	3	84.21	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10339	MEREP	2	1996-10-28	1996-11-25	1996-11-04	2	15.66	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10341	SIMOB	7	1996-10-29	1996-11-26	1996-11-05	3	26.78	Simons bistro	VinbÃ¦ltet 34	Kobenhavn	NULL	1734	Denmark
10340	BONAP	1	1996-10-29	1996-11-26	1996-11-08	3	166.31	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10342	FRANK	4	1996-10-30	1996-11-13	1996-11-04	2	54.83	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10343	LEHMS	4	1996-10-31	1996-11-28	1996-11-06	1	110.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10344	WHITC	4	1996-11-01	1996-11-29	1996-11-05	2	23.29	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10345	QUICK	2	1996-11-04	1996-12-02	1996-11-11	2	249.06	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10346	RATTC	3	1996-11-05	1996-12-17	1996-11-08	3	142.08	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10347	FAMIA	4	1996-11-06	1996-12-04	1996-11-08	3	3.10	Familia Arquibaldo	Rua OrÃ³s 92	Sao Paulo	SP	05442-030	Brazil
10348	WANDK	4	1996-11-07	1996-12-05	1996-11-15	2	0.78	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10349	SPLIR	7	1996-11-08	1996-12-06	1996-11-15	1	8.63	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10351	ERNSH	1	1996-11-11	1996-12-09	1996-11-20	1	162.33	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10350	LAMAI	6	1996-11-11	1996-12-09	1996-12-03	2	64.19	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10352	FURIB	3	1996-11-12	1996-11-26	1996-11-18	3	1.30	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
10353	PICCO	7	1996-11-13	1996-12-11	1996-11-25	3	360.63	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10354	PERIC	8	1996-11-14	1996-12-12	1996-11-20	3	53.80	Pericles Comidas clÃ¡sicas	Calle Dr. Jorge Cash 321	MÃ©xico D.F.	NULL	5033	Mexico
10355	AROUT	6	1996-11-15	1996-12-13	1996-11-20	1	41.95	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10356	WANDK	6	1996-11-18	1996-12-16	1996-11-27	2	36.71	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10357	LILAS	1	1996-11-19	1996-12-17	1996-12-02	3	34.88	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10358	LAMAI	5	1996-11-20	1996-12-18	1996-11-27	1	19.64	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10359	SEVES	5	1996-11-21	1996-12-19	1996-11-26	3	288.43	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10360	BLONP	4	1996-11-22	1996-12-20	1996-12-02	3	131.70	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10361	QUICK	1	1996-11-22	1996-12-20	1996-12-03	2	183.17	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10362	BONAP	3	1996-11-25	1996-12-23	1996-11-28	1	96.04	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10363	DRACD	4	1996-11-26	1996-12-24	1996-12-04	3	30.54	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
10364	EASTC	1	1996-11-26	1997-01-07	1996-12-04	1	71.97	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
10365	ANTON	3	1996-11-27	1996-12-25	1996-12-02	2	22.00	Antonio Moreno TaquerÃ­a	Mataderos  2312	MÃ©xico D.F.	NULL	5023	Mexico
10367	VAFFE	7	1996-11-28	1996-12-26	1996-12-02	3	13.55	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10366	GALED	8	1996-11-28	1997-01-09	1996-12-30	2	10.14	GalerÃ­a del gastronÃ³mo	Rambla de CataluÃ±a 23	Barcelona	NULL	8022	Spain
10368	ERNSH	2	1996-11-29	1996-12-27	1996-12-02	2	101.95	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10369	SPLIR	8	1996-12-02	1996-12-30	1996-12-09	2	195.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10371	LAMAI	1	1996-12-03	1996-12-31	1996-12-24	1	0.45	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10370	CHOPS	6	1996-12-03	1996-12-31	1996-12-27	2	1.17	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
10372	QUEEN	5	1996-12-04	1997-01-01	1996-12-09	2	890.78	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10374	WOLZA	1	1996-12-05	1997-01-02	1996-12-09	3	3.94	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
10373	HUNGO	4	1996-12-05	1997-01-02	1996-12-11	3	124.12	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10375	HUNGC	3	1996-12-06	1997-01-03	1996-12-09	2	20.12	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10376	MEREP	1	1996-12-09	1997-01-06	1996-12-13	2	20.39	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10377	SEVES	1	1996-12-09	1997-01-06	1996-12-13	3	22.21	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10378	FOLKO	5	1996-12-10	1997-01-07	1996-12-19	3	5.44	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10379	QUEDE	2	1996-12-11	1997-01-08	1996-12-13	1	45.03	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10381	LILAS	3	1996-12-12	1997-01-09	1996-12-13	3	7.99	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10380	HUNGO	8	1996-12-12	1997-01-09	1997-01-16	3	35.03	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10382	ERNSH	4	1996-12-13	1997-01-10	1996-12-16	1	94.77	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10383	AROUT	8	1996-12-16	1997-01-13	1996-12-18	3	34.24	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10384	BERGS	3	1996-12-16	1997-01-13	1996-12-20	3	168.64	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10385	SPLIR	1	1996-12-17	1997-01-14	1996-12-23	2	30.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10387	SANTG	1	1996-12-18	1997-01-15	1996-12-20	2	93.63	SantÃ© Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
10386	FAMIA	9	1996-12-18	1997-01-01	1996-12-25	3	13.99	Familia Arquibaldo	Rua OrÃ³s 92	Sao Paulo	SP	05442-030	Brazil
10388	SEVES	2	1996-12-19	1997-01-16	1996-12-20	1	34.86	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10389	BOTTM	4	1996-12-20	1997-01-17	1996-12-24	2	47.42	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10390	ERNSH	6	1996-12-23	1997-01-20	1996-12-26	1	126.38	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10391	DRACD	3	1996-12-23	1997-01-20	1996-12-31	3	5.45	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
10392	PICCO	2	1996-12-24	1997-01-21	1997-01-01	3	122.46	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10393	SAVEA	1	1996-12-25	1997-01-22	1997-01-03	3	126.56	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10394	HUNGC	1	1996-12-25	1997-01-22	1997-01-03	3	30.34	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10395	HILAA	6	1996-12-26	1997-01-23	1997-01-03	1	184.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10397	PRINI	5	1996-12-27	1997-01-24	1997-01-02	1	60.26	Princesa Isabel Vinhos	Estrada da saÃºde n. 58	Lisboa	NULL	1756	Portugal
10396	FRANK	1	1996-12-27	1997-01-10	1997-01-06	3	135.35	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10398	SAVEA	2	1996-12-30	1997-01-27	1997-01-09	3	89.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10399	VAFFE	8	1996-12-31	1997-01-14	1997-01-08	3	27.36	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10401	RATTC	1	1997-01-01	1997-01-29	1997-01-10	1	12.51	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10400	EASTC	1	1997-01-01	1997-01-29	1997-01-16	3	83.93	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
10402	ERNSH	8	1997-01-02	1997-02-13	1997-01-10	2	67.88	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10404	MAGAA	2	1997-01-03	1997-01-31	1997-01-08	1	155.97	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10403	ERNSH	4	1997-01-03	1997-01-31	1997-01-09	3	73.79	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10405	LINOD	1	1997-01-06	1997-02-03	1997-01-22	1	34.82	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10406	QUEEN	7	1997-01-07	1997-02-18	1997-01-13	1	108.04	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10407	OTTIK	2	1997-01-07	1997-02-04	1997-01-30	2	91.48	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10408	FOLIG	8	1997-01-08	1997-02-05	1997-01-14	1	11.26	Folies gourmandes	184 chaussÃ©e de Tournai	Lille	NULL	59000	France
10409	OCEAN	3	1997-01-09	1997-02-06	1997-01-14	1	29.83	OcÃ©ano AtlÃ¡ntico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
10410	BOTTM	3	1997-01-10	1997-02-07	1997-01-15	3	2.40	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10411	BOTTM	9	1997-01-10	1997-02-07	1997-01-21	3	23.65	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10412	WARTH	8	1997-01-13	1997-02-10	1997-01-15	2	3.77	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10413	LAMAI	3	1997-01-14	1997-02-11	1997-01-16	2	95.66	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10414	FAMIA	2	1997-01-14	1997-02-11	1997-01-17	3	21.48	Familia Arquibaldo	Rua OrÃ³s 92	Sao Paulo	SP	05442-030	Brazil
10415	HUNGC	3	1997-01-15	1997-02-12	1997-01-24	1	0.20	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10416	WARTH	8	1997-01-16	1997-02-13	1997-01-27	3	22.72	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10417	SIMOB	4	1997-01-16	1997-02-13	1997-01-28	3	70.29	Simons bistro	VinbÃ¦ltet 34	Kobenhavn	NULL	1734	Denmark
10418	QUICK	4	1997-01-17	1997-02-14	1997-01-24	1	17.55	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10419	RICSU	4	1997-01-20	1997-02-17	1997-01-30	2	137.35	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
10420	WELLI	3	1997-01-21	1997-02-18	1997-01-27	1	44.12	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10421	QUEDE	8	1997-01-21	1997-03-04	1997-01-27	1	99.23	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10422	FRANS	2	1997-01-22	1997-02-19	1997-01-31	1	3.02	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
10424	MEREP	7	1997-01-23	1997-02-20	1997-01-27	2	370.61	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10423	GOURL	6	1997-01-23	1997-02-06	1997-02-24	3	24.50	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
10425	LAMAI	6	1997-01-24	1997-02-21	1997-02-14	2	7.93	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10426	GALED	4	1997-01-27	1997-02-24	1997-02-06	1	18.69	GalerÃ­a del gastronÃ³mo	Rambla de CataluÃ±a 23	Barcelona	NULL	8022	Spain
10427	PICCO	4	1997-01-27	1997-02-24	1997-03-03	2	31.29	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10428	REGGC	7	1997-01-28	1997-02-25	1997-02-04	1	11.09	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10429	HUNGO	3	1997-01-29	1997-03-12	1997-02-07	2	56.63	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10430	ERNSH	4	1997-01-30	1997-02-13	1997-02-03	1	458.78	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10431	BOTTM	4	1997-01-30	1997-02-13	1997-02-07	2	44.17	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10432	SPLIR	3	1997-01-31	1997-02-14	1997-02-07	2	4.34	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10434	FOLKO	3	1997-02-03	1997-03-03	1997-02-13	2	17.92	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10433	PRINI	3	1997-02-03	1997-03-03	1997-03-04	3	73.83	Princesa Isabel Vinhos	Estrada da saÃºde n. 58	Lisboa	NULL	1756	Portugal
10435	CONSH	8	1997-02-04	1997-03-18	1997-02-07	2	9.21	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
10436	BLONP	3	1997-02-05	1997-03-05	1997-02-11	2	156.66	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10437	WARTH	8	1997-02-05	1997-03-05	1997-02-12	1	19.97	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10438	TOMSP	3	1997-02-06	1997-03-06	1997-02-14	2	8.24	Toms SpezialitÃ¤ten	Luisenstr. 48	MÃ¼nster	NULL	44087	Germany
10439	MEREP	6	1997-02-07	1997-03-07	1997-02-10	3	4.07	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10440	SAVEA	4	1997-02-10	1997-03-10	1997-02-28	2	86.53	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10441	OLDWO	3	1997-02-10	1997-03-24	1997-03-14	2	73.02	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10442	ERNSH	3	1997-02-11	1997-03-11	1997-02-18	2	47.94	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10443	REGGC	8	1997-02-12	1997-03-12	1997-02-14	1	13.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10444	BERGS	3	1997-02-12	1997-03-12	1997-02-21	3	3.50	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10445	BERGS	3	1997-02-13	1997-03-13	1997-02-20	1	9.30	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10446	TOMSP	6	1997-02-14	1997-03-14	1997-02-19	1	14.68	Toms SpezialitÃ¤ten	Luisenstr. 48	MÃ¼nster	NULL	44087	Germany
10447	RICAR	4	1997-02-14	1997-03-14	1997-03-07	2	68.66	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10448	RANCH	4	1997-02-17	1997-03-17	1997-02-24	2	38.82	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
10449	BLONP	3	1997-02-18	1997-03-18	1997-02-27	2	53.30	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10450	VICTE	8	1997-02-19	1997-03-19	1997-03-11	2	7.23	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10451	QUICK	4	1997-02-19	1997-03-05	1997-03-12	3	189.09	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10452	SAVEA	8	1997-02-20	1997-03-20	1997-02-26	1	140.26	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10454	LAMAI	4	1997-02-21	1997-03-21	1997-02-25	3	2.74	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10453	AROUT	1	1997-02-21	1997-03-21	1997-02-26	2	25.36	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10455	WARTH	8	1997-02-24	1997-04-07	1997-03-03	2	180.45	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10456	KOENE	8	1997-02-25	1997-04-08	1997-02-28	2	8.12	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10457	KOENE	2	1997-02-25	1997-03-25	1997-03-03	1	11.57	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10458	SUPRD	7	1997-02-26	1997-03-26	1997-03-04	3	147.06	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10459	VICTE	4	1997-02-27	1997-03-27	1997-02-28	2	25.09	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10460	FOLKO	8	1997-02-28	1997-03-28	1997-03-03	1	16.27	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10461	LILAS	1	1997-02-28	1997-03-28	1997-03-05	3	148.61	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10462	CONSH	2	1997-03-03	1997-03-31	1997-03-18	1	6.17	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
10463	SUPRD	5	1997-03-04	1997-04-01	1997-03-06	3	14.78	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10464	FURIB	4	1997-03-04	1997-04-01	1997-03-14	2	89.00	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
10465	VAFFE	1	1997-03-05	1997-04-02	1997-03-14	3	145.04	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10467	MAGAA	8	1997-03-06	1997-04-03	1997-03-11	2	4.93	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10466	COMMI	4	1997-03-06	1997-04-03	1997-03-13	1	11.93	ComÃ©rcio Mineiro	Av. dos LusÃ­adas 23	Sao Paulo	SP	05432-043	Brazil
10468	KOENE	3	1997-03-07	1997-04-04	1997-03-12	3	44.12	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10469	WHITC	1	1997-03-10	1997-04-07	1997-03-14	1	60.18	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10470	BONAP	4	1997-03-11	1997-04-08	1997-03-14	2	64.56	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10471	BSBEV	2	1997-03-11	1997-04-08	1997-03-18	3	45.59	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10472	SEVES	8	1997-03-12	1997-04-09	1997-03-19	1	4.20	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10473	ISLAT	1	1997-03-13	1997-03-27	1997-03-21	3	16.37	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10474	PERIC	5	1997-03-13	1997-04-10	1997-03-21	2	83.49	Pericles Comidas clÃ¡sicas	Calle Dr. Jorge Cash 321	MÃ©xico D.F.	NULL	5033	Mexico
10475	SUPRD	9	1997-03-14	1997-04-11	1997-04-04	1	68.52	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10476	HILAA	8	1997-03-17	1997-04-14	1997-03-24	3	4.41	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10477	PRINI	5	1997-03-17	1997-04-14	1997-03-25	2	13.02	Princesa Isabel Vinhos	Estrada da saÃºde n. 58	Lisboa	NULL	1756	Portugal
10478	VICTE	2	1997-03-18	1997-04-01	1997-03-26	3	4.81	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10479	RATTC	3	1997-03-19	1997-04-16	1997-03-21	3	708.95	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10480	FOLIG	6	1997-03-20	1997-04-17	1997-03-24	2	1.35	Folies gourmandes	184 chaussÃ©e de Tournai	Lille	NULL	59000	France
10481	RICAR	8	1997-03-20	1997-04-17	1997-03-25	2	64.33	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10482	LAZYK	1	1997-03-21	1997-04-18	1997-04-10	3	7.48	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
10484	BSBEV	3	1997-03-24	1997-04-21	1997-04-01	3	6.88	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10483	WHITC	7	1997-03-24	1997-04-21	1997-04-25	2	15.28	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10485	LINOD	4	1997-03-25	1997-04-08	1997-03-31	2	64.45	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10487	QUEEN	2	1997-03-26	1997-04-23	1997-03-28	2	71.07	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10486	HILAA	1	1997-03-26	1997-04-23	1997-04-02	2	30.53	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10488	FRANK	8	1997-03-27	1997-04-24	1997-04-02	2	4.93	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10489	PICCO	6	1997-03-28	1997-04-25	1997-04-09	2	5.29	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10490	HILAA	7	1997-03-31	1997-04-28	1997-04-03	2	210.19	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10491	FURIB	8	1997-03-31	1997-04-28	1997-04-08	3	16.96	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
10492	BOTTM	3	1997-04-01	1997-04-29	1997-04-11	1	62.89	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10494	COMMI	4	1997-04-02	1997-04-30	1997-04-09	2	65.99	ComÃ©rcio Mineiro	Av. dos LusÃ­adas 23	Sao Paulo	SP	05432-043	Brazil
10493	LAMAI	4	1997-04-02	1997-04-30	1997-04-10	3	10.64	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10495	LAUGB	3	1997-04-03	1997-05-01	1997-04-11	3	4.65	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10496	TRADH	7	1997-04-04	1997-05-02	1997-04-07	2	46.77	TradiÃ§ao Hipermercados	Av. InÃªs de Castro 414	Sao Paulo	SP	05634-030	Brazil
10497	LEHMS	7	1997-04-04	1997-05-02	1997-04-07	1	36.21	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10498	HILAA	8	1997-04-07	1997-05-05	1997-04-11	2	29.75	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10499	LILAS	4	1997-04-08	1997-05-06	1997-04-16	2	102.02	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10501	BLAUS	9	1997-04-09	1997-05-07	1997-04-16	3	8.85	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
10500	LAMAI	6	1997-04-09	1997-05-07	1997-04-17	1	42.68	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10502	PERIC	2	1997-04-10	1997-05-08	1997-04-29	1	69.32	Pericles Comidas clÃ¡sicas	Calle Dr. Jorge Cash 321	MÃ©xico D.F.	NULL	5033	Mexico
10503	HUNGO	6	1997-04-11	1997-05-09	1997-04-16	2	16.74	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10504	WHITC	4	1997-04-11	1997-05-09	1997-04-18	3	59.13	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10505	MEREP	3	1997-04-14	1997-05-12	1997-04-21	3	7.13	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10507	ANTON	7	1997-04-15	1997-05-13	1997-04-22	1	47.45	Antonio Moreno TaquerÃ­a	Mataderos  2312	MÃ©xico D.F.	NULL	5023	Mexico
10506	KOENE	9	1997-04-15	1997-05-13	1997-05-02	2	21.19	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10508	OTTIK	1	1997-04-16	1997-05-14	1997-05-13	2	4.99	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10509	BLAUS	4	1997-04-17	1997-05-15	1997-04-29	1	0.15	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
10511	BONAP	4	1997-04-18	1997-05-16	1997-04-21	3	350.64	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10510	SAVEA	6	1997-04-18	1997-05-16	1997-04-28	3	367.63	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10512	FAMIA	7	1997-04-21	1997-05-19	1997-04-24	2	3.53	Familia Arquibaldo	Rua OrÃ³s 92	Sao Paulo	SP	05442-030	Brazil
10513	WANDK	7	1997-04-22	1997-06-03	1997-04-28	1	105.65	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10514	ERNSH	3	1997-04-22	1997-05-20	1997-05-16	2	789.95	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10515	QUICK	2	1997-04-23	1997-05-07	1997-05-23	1	204.47	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10517	NORTS	3	1997-04-24	1997-05-22	1997-04-29	3	32.07	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
10516	HUNGO	2	1997-04-24	1997-05-22	1997-05-01	3	62.78	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10518	TORTU	4	1997-04-25	1997-05-09	1997-05-05	2	218.15	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10519	CHOPS	6	1997-04-28	1997-05-26	1997-05-01	3	91.76	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
10520	SANTG	7	1997-04-29	1997-05-27	1997-05-01	1	13.37	SantÃ© Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
10521	CACTU	8	1997-04-29	1997-05-27	1997-05-02	2	17.22	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
10522	LEHMS	4	1997-04-30	1997-05-28	1997-05-06	1	45.33	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10524	BERGS	1	1997-05-01	1997-05-29	1997-05-07	2	244.79	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10523	SEVES	7	1997-05-01	1997-05-29	1997-05-30	2	77.63	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10525	BONAP	1	1997-05-02	1997-05-30	1997-05-23	2	11.06	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10527	QUICK	7	1997-05-05	1997-06-02	1997-05-07	1	41.90	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10526	WARTH	4	1997-05-05	1997-06-02	1997-05-15	2	58.59	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10528	GREAL	6	1997-05-06	1997-05-20	1997-05-09	2	3.35	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10529	MAISD	5	1997-05-07	1997-06-04	1997-05-09	2	66.69	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
10530	PICCO	3	1997-05-08	1997-06-05	1997-05-12	2	339.22	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10531	OCEAN	7	1997-05-08	1997-06-05	1997-05-19	1	8.12	OcÃ©ano AtlÃ¡ntico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
10532	EASTC	7	1997-05-09	1997-06-06	1997-05-12	3	74.46	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
10534	LEHMS	8	1997-05-12	1997-06-09	1997-05-14	2	27.94	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10533	FOLKO	8	1997-05-12	1997-06-09	1997-05-22	1	188.04	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10535	ANTON	4	1997-05-13	1997-06-10	1997-05-21	1	15.64	Antonio Moreno TaquerÃ­a	Mataderos  2312	MÃ©xico D.F.	NULL	5023	Mexico
10537	RICSU	1	1997-05-14	1997-05-28	1997-05-19	1	78.85	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
10536	LEHMS	3	1997-05-14	1997-06-11	1997-06-06	2	58.88	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10538	BSBEV	9	1997-05-15	1997-06-12	1997-05-16	3	4.87	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10539	BSBEV	6	1997-05-16	1997-06-13	1997-05-23	3	12.36	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10541	HANAR	2	1997-05-19	1997-06-16	1997-05-29	1	68.65	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10540	QUICK	3	1997-05-19	1997-06-16	1997-06-13	3	1007.64	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10542	KOENE	1	1997-05-20	1997-06-17	1997-05-26	3	10.95	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10543	LILAS	8	1997-05-21	1997-06-18	1997-05-23	2	48.17	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10544	LONEP	4	1997-05-21	1997-06-18	1997-05-30	1	24.91	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10545	LAZYK	8	1997-05-22	1997-06-19	1997-06-26	2	11.92	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	WA	99362	USA
10546	VICTE	1	1997-05-23	1997-06-20	1997-05-27	3	194.72	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10547	SEVES	3	1997-05-23	1997-06-20	1997-06-02	2	178.43	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10548	TOMSP	3	1997-05-26	1997-06-23	1997-06-02	2	1.43	Toms SpezialitÃ¤ten	Luisenstr. 48	MÃ¼nster	NULL	44087	Germany
10549	QUICK	5	1997-05-27	1997-06-10	1997-05-30	1	171.24	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10550	GODOS	7	1997-05-28	1997-06-25	1997-06-06	3	4.32	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
10551	FURIB	4	1997-05-28	1997-07-09	1997-06-06	3	72.95	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
10552	HILAA	2	1997-05-29	1997-06-26	1997-06-05	1	83.22	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10553	WARTH	2	1997-05-30	1997-06-27	1997-06-03	2	149.49	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10554	OTTIK	4	1997-05-30	1997-06-27	1997-06-05	3	120.97	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10555	SAVEA	6	1997-06-02	1997-06-30	1997-06-04	3	252.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10557	LEHMS	9	1997-06-03	1997-06-17	1997-06-06	2	96.72	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10556	SIMOB	2	1997-06-03	1997-07-15	1997-06-13	1	9.80	Simons bistro	VinbÃ¦ltet 34	Kobenhavn	NULL	1734	Denmark
10558	AROUT	1	1997-06-04	1997-07-02	1997-06-10	2	72.97	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10559	BLONP	6	1997-06-05	1997-07-03	1997-06-13	1	8.05	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10560	FRANK	8	1997-06-06	1997-07-04	1997-06-09	1	36.65	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10561	FOLKO	2	1997-06-06	1997-07-04	1997-06-09	2	242.21	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10562	REGGC	1	1997-06-09	1997-07-07	1997-06-12	1	22.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10564	RATTC	4	1997-06-10	1997-07-08	1997-06-16	3	13.75	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10563	RICAR	2	1997-06-10	1997-07-22	1997-06-24	2	60.43	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10565	MEREP	8	1997-06-11	1997-07-09	1997-06-18	2	7.15	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10567	HUNGO	1	1997-06-12	1997-07-10	1997-06-17	1	33.97	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10566	BLONP	9	1997-06-12	1997-07-10	1997-06-18	1	88.40	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10568	GALED	3	1997-06-13	1997-07-11	1997-07-09	3	6.54	GalerÃ­a del gastronÃ³mo	Rambla de CataluÃ±a 23	Barcelona	NULL	8022	Spain
10569	RATTC	5	1997-06-16	1997-07-14	1997-07-11	1	58.98	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10570	MEREP	3	1997-06-17	1997-07-15	1997-06-19	3	188.99	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10571	ERNSH	8	1997-06-17	1997-07-29	1997-07-04	3	26.06	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10572	BERGS	3	1997-06-18	1997-07-16	1997-06-25	2	116.43	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10573	ANTON	7	1997-06-19	1997-07-17	1997-06-20	3	84.84	Antonio Moreno TaquerÃ­a	Mataderos  2312	MÃ©xico D.F.	NULL	5023	Mexico
10574	TRAIH	4	1997-06-19	1997-07-17	1997-06-30	2	37.60	Trails Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10575	MORGK	5	1997-06-20	1997-07-04	1997-06-30	1	127.34	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	4179	Germany
10576	TORTU	3	1997-06-23	1997-07-07	1997-06-30	3	18.56	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10577	TRAIH	9	1997-06-23	1997-08-04	1997-06-30	2	25.41	Trails Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10578	BSBEV	4	1997-06-24	1997-07-22	1997-07-25	3	29.60	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10579	LETSS	1	1997-06-25	1997-07-23	1997-07-04	2	13.73	Lets Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
10580	OTTIK	4	1997-06-26	1997-07-24	1997-07-01	3	75.89	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10581	FAMIA	3	1997-06-26	1997-07-24	1997-07-02	1	3.01	Familia Arquibaldo	Rua OrÃ³s 92	Sao Paulo	SP	05442-030	Brazil
10582	BLAUS	3	1997-06-27	1997-07-25	1997-07-14	2	27.71	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
10583	WARTH	2	1997-06-30	1997-07-28	1997-07-04	2	7.28	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10584	BLONP	4	1997-06-30	1997-07-28	1997-07-04	1	59.14	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10585	WELLI	7	1997-07-01	1997-07-29	1997-07-10	1	13.41	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10586	REGGC	9	1997-07-02	1997-07-30	1997-07-09	1	0.48	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10587	QUEDE	1	1997-07-02	1997-07-30	1997-07-09	1	62.52	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10588	QUICK	2	1997-07-03	1997-07-31	1997-07-10	3	194.67	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10589	GREAL	8	1997-07-04	1997-08-01	1997-07-14	2	4.42	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10590	MEREP	4	1997-07-07	1997-08-04	1997-07-14	3	44.77	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10591	VAFFE	1	1997-07-07	1997-07-21	1997-07-16	1	55.92	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10592	LEHMS	3	1997-07-08	1997-08-05	1997-07-16	1	32.10	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10594	OLDWO	3	1997-07-09	1997-08-06	1997-07-16	2	5.24	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10593	LEHMS	7	1997-07-09	1997-08-06	1997-08-13	2	174.20	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10595	ERNSH	2	1997-07-10	1997-08-07	1997-07-14	1	96.78	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10597	PICCO	7	1997-07-11	1997-08-08	1997-07-18	3	35.12	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10596	WHITC	8	1997-07-11	1997-08-08	1997-08-12	1	16.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10598	RATTC	1	1997-07-14	1997-08-11	1997-07-18	3	44.42	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10599	BSBEV	6	1997-07-15	1997-08-26	1997-07-21	3	29.98	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10600	HUNGC	4	1997-07-16	1997-08-13	1997-07-21	1	45.13	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10601	HILAA	7	1997-07-16	1997-08-27	1997-07-22	1	58.30	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10602	VAFFE	8	1997-07-17	1997-08-14	1997-07-22	2	2.92	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10604	FURIB	1	1997-07-18	1997-08-15	1997-07-29	1	7.46	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
10603	SAVEA	8	1997-07-18	1997-08-15	1997-08-08	2	48.77	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10605	MEREP	1	1997-07-21	1997-08-18	1997-07-29	2	379.13	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10607	SAVEA	5	1997-07-22	1997-08-19	1997-07-25	1	200.24	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10606	TRADH	4	1997-07-22	1997-08-19	1997-07-31	3	79.40	TradiÃ§ao Hipermercados	Av. InÃªs de Castro 414	Sao Paulo	SP	05634-030	Brazil
10608	TOMSP	4	1997-07-23	1997-08-20	1997-08-01	2	27.79	Toms SpezialitÃ¤ten	Luisenstr. 48	MÃ¼nster	NULL	44087	Germany
10609	DUMON	7	1997-07-24	1997-08-21	1997-07-30	2	1.85	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
10611	WOLZA	6	1997-07-25	1997-08-22	1997-08-01	2	80.65	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
10610	LAMAI	8	1997-07-25	1997-08-22	1997-08-06	1	26.78	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10612	SAVEA	1	1997-07-28	1997-08-25	1997-08-01	2	544.08	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10613	HILAA	4	1997-07-29	1997-08-26	1997-08-01	2	8.11	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10614	BLAUS	8	1997-07-29	1997-08-26	1997-08-01	3	1.93	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
10615	WILMK	2	1997-07-30	1997-08-27	1997-08-06	3	0.75	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
10617	GREAL	4	1997-07-31	1997-08-28	1997-08-04	2	18.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10616	GREAL	1	1997-07-31	1997-08-28	1997-08-05	2	116.53	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10618	MEREP	1	1997-08-01	1997-09-12	1997-08-08	1	154.68	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10619	MEREP	3	1997-08-04	1997-09-01	1997-08-07	3	91.05	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10621	ISLAT	4	1997-08-05	1997-09-02	1997-08-11	2	23.73	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10620	LAUGB	2	1997-08-05	1997-09-02	1997-08-14	3	0.94	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10622	RICAR	4	1997-08-06	1997-09-03	1997-08-11	3	50.97	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10623	FRANK	8	1997-08-07	1997-09-04	1997-08-12	2	97.18	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10624	THECR	4	1997-08-07	1997-09-04	1997-08-19	2	94.80	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
10625	ANATR	3	1997-08-08	1997-09-05	1997-08-14	1	43.90	Ana Trujillo Emparedados y helados	Avda. de la ConstituciÃ³n 2222	MÃ©xico D.F.	NULL	5021	Mexico
10626	BERGS	1	1997-08-11	1997-09-08	1997-08-20	2	138.69	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10627	SAVEA	8	1997-08-11	1997-09-22	1997-08-21	3	107.46	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10628	BLONP	4	1997-08-12	1997-09-09	1997-08-20	3	30.36	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10629	GODOS	4	1997-08-12	1997-09-09	1997-08-20	3	85.46	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
10630	KOENE	1	1997-08-13	1997-09-10	1997-08-19	2	32.35	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10631	LAMAI	8	1997-08-14	1997-09-11	1997-08-15	1	0.87	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10632	WANDK	8	1997-08-14	1997-09-11	1997-08-19	1	41.38	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10633	ERNSH	7	1997-08-15	1997-09-12	1997-08-18	3	477.90	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10634	FOLIG	4	1997-08-15	1997-09-12	1997-08-21	3	487.38	Folies gourmandes	184 chaussÃ©e de Tournai	Lille	NULL	59000	France
10635	MAGAA	8	1997-08-18	1997-09-15	1997-08-21	3	47.46	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10636	WARTH	4	1997-08-19	1997-09-16	1997-08-26	1	1.15	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10637	QUEEN	6	1997-08-19	1997-09-16	1997-08-26	1	201.29	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10639	SANTG	7	1997-08-20	1997-09-17	1997-08-27	3	38.64	SantÃ© Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
10638	LINOD	3	1997-08-20	1997-09-17	1997-09-01	1	158.44	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10640	WANDK	4	1997-08-21	1997-09-18	1997-08-28	1	23.55	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10641	HILAA	4	1997-08-22	1997-09-19	1997-08-26	2	179.61	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10642	SIMOB	7	1997-08-22	1997-09-19	1997-09-05	3	41.89	Simons bistro	VinbÃ¦ltet 34	Kobenhavn	NULL	1734	Denmark
10644	WELLI	3	1997-08-25	1997-09-22	1997-09-01	2	0.14	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10643	ALFKI	6	1997-08-25	1997-09-22	1997-09-02	1	29.46	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
10645	HANAR	4	1997-08-26	1997-09-23	1997-09-02	1	12.41	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10646	HUNGO	9	1997-08-27	1997-10-08	1997-09-03	3	142.33	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10647	QUEDE	4	1997-08-27	1997-09-10	1997-09-03	2	45.54	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10649	MAISD	5	1997-08-28	1997-09-25	1997-08-29	3	6.20	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
10648	RICAR	5	1997-08-28	1997-10-09	1997-09-09	2	14.25	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10650	FAMIA	5	1997-08-29	1997-09-26	1997-09-03	3	176.81	Familia Arquibaldo	Rua OrÃ³s 92	Sao Paulo	SP	05442-030	Brazil
10652	GOURL	4	1997-09-01	1997-09-29	1997-09-08	2	7.14	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
10651	WANDK	8	1997-09-01	1997-09-29	1997-09-11	2	20.60	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10654	BERGS	5	1997-09-02	1997-09-30	1997-09-11	1	55.26	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10653	FRANK	1	1997-09-02	1997-09-30	1997-09-19	1	93.25	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10655	REGGC	1	1997-09-03	1997-10-01	1997-09-11	2	4.41	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10656	GREAL	6	1997-09-04	1997-10-02	1997-09-10	1	57.15	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10657	SAVEA	2	1997-09-04	1997-10-02	1997-09-15	2	352.69	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10658	QUICK	4	1997-09-05	1997-10-03	1997-09-08	1	364.15	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10659	QUEEN	7	1997-09-05	1997-10-03	1997-09-10	2	105.81	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10660	HUNGC	8	1997-09-08	1997-10-06	1997-10-15	1	111.29	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	OR	97827	USA
10661	HUNGO	7	1997-09-09	1997-10-07	1997-09-15	3	17.55	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10662	LONEP	3	1997-09-09	1997-10-07	1997-09-18	2	1.28	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10664	FURIB	1	1997-09-10	1997-10-08	1997-09-19	3	1.27	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
10663	BONAP	2	1997-09-10	1997-09-24	1997-10-03	2	113.15	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10665	LONEP	1	1997-09-11	1997-10-09	1997-09-17	2	26.31	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10667	ERNSH	7	1997-09-12	1997-10-10	1997-09-19	1	78.09	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10666	RICSU	7	1997-09-12	1997-10-10	1997-09-22	2	232.42	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
10669	SIMOB	2	1997-09-15	1997-10-13	1997-09-22	1	24.39	Simons bistro	VinbÃ¦ltet 34	Kobenhavn	NULL	1734	Denmark
10668	WANDK	1	1997-09-15	1997-10-13	1997-09-23	2	47.22	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
10670	FRANK	4	1997-09-16	1997-10-14	1997-09-18	1	203.48	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10671	FRANR	1	1997-09-17	1997-10-15	1997-09-24	1	30.34	France restauration	54 rue Royale	Nantes	NULL	44000	France
10672	BERGS	9	1997-09-17	1997-10-01	1997-09-26	2	95.75	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10673	WILMK	2	1997-09-18	1997-10-16	1997-09-19	1	22.76	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
10674	ISLAT	4	1997-09-18	1997-10-16	1997-09-30	2	0.90	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10675	FRANK	5	1997-09-19	1997-10-17	1997-09-23	2	31.85	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10677	ANTON	1	1997-09-22	1997-10-20	1997-09-26	3	4.03	Antonio Moreno TaquerÃ­a	Mataderos  2312	MÃ©xico D.F.	NULL	5023	Mexico
10676	TORTU	2	1997-09-22	1997-10-20	1997-09-29	2	2.01	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10679	BLONP	8	1997-09-23	1997-10-21	1997-09-30	3	27.94	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10678	SAVEA	7	1997-09-23	1997-10-21	1997-10-16	3	388.98	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10680	OLDWO	1	1997-09-24	1997-10-22	1997-09-26	1	26.61	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10681	GREAL	3	1997-09-25	1997-10-23	1997-09-30	3	76.13	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10682	ANTON	3	1997-09-25	1997-10-23	1997-10-01	2	36.13	Antonio Moreno TaquerÃ­a	Mataderos  2312	MÃ©xico D.F.	NULL	5023	Mexico
10684	OTTIK	3	1997-09-26	1997-10-24	1997-09-30	1	145.63	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10683	DUMON	2	1997-09-26	1997-10-24	1997-10-01	1	4.40	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
10685	GOURL	4	1997-09-29	1997-10-13	1997-10-03	2	33.75	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
10686	PICCO	2	1997-09-30	1997-10-28	1997-10-08	1	96.50	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10687	HUNGO	9	1997-09-30	1997-10-28	1997-10-30	2	296.43	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10688	VAFFE	4	1997-10-01	1997-10-15	1997-10-07	2	299.09	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10689	BERGS	1	1997-10-01	1997-10-29	1997-10-07	2	13.42	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10690	HANAR	1	1997-10-02	1997-10-30	1997-10-03	1	15.80	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10692	ALFKI	4	1997-10-03	1997-10-31	1997-10-13	2	61.02	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
10691	QUICK	2	1997-10-03	1997-11-14	1997-10-22	2	810.05	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10694	QUICK	8	1997-10-06	1997-11-03	1997-10-09	3	398.36	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10693	WHITC	3	1997-10-06	1997-10-20	1997-10-10	3	139.34	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10695	WILMK	7	1997-10-07	1997-11-18	1997-10-14	1	16.72	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
10696	WHITC	8	1997-10-08	1997-11-19	1997-10-14	3	102.55	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10697	LINOD	3	1997-10-08	1997-11-05	1997-10-14	1	45.52	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10699	MORGK	3	1997-10-09	1997-11-06	1997-10-13	3	0.58	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	4179	Germany
10698	ERNSH	4	1997-10-09	1997-11-06	1997-10-17	1	272.47	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10700	SAVEA	3	1997-10-10	1997-11-07	1997-10-16	1	65.10	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10701	HUNGO	6	1997-10-13	1997-10-27	1997-10-15	3	220.31	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10702	ALFKI	4	1997-10-13	1997-11-24	1997-10-21	1	23.94	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
10703	FOLKO	6	1997-10-14	1997-11-11	1997-10-20	2	152.30	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10704	QUEEN	6	1997-10-14	1997-11-11	1997-11-07	1	4.78	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10705	HILAA	9	1997-10-15	1997-11-12	1997-11-18	2	3.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10706	OLDWO	8	1997-10-16	1997-11-13	1997-10-21	3	135.63	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10707	AROUT	4	1997-10-16	1997-10-30	1997-10-23	3	21.74	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10708	THEBI	6	1997-10-17	1997-11-28	1997-11-05	2	2.96	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
10709	GOURL	1	1997-10-17	1997-11-14	1997-11-20	3	210.80	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
10710	FRANS	1	1997-10-20	1997-11-17	1997-10-23	1	4.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
10711	SAVEA	5	1997-10-21	1997-12-02	1997-10-29	2	52.41	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10712	HUNGO	3	1997-10-21	1997-11-18	1997-10-31	1	89.93	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10713	SAVEA	1	1997-10-22	1997-11-19	1997-10-24	1	167.05	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10714	SAVEA	5	1997-10-22	1997-11-19	1997-10-27	3	24.49	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10715	BONAP	3	1997-10-23	1997-11-06	1997-10-29	1	63.20	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10716	RANCH	4	1997-10-24	1997-11-21	1997-10-27	2	22.57	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
10717	FRANK	1	1997-10-24	1997-11-21	1997-10-29	2	59.25	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10718	KOENE	1	1997-10-27	1997-11-24	1997-10-29	3	170.88	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10719	LETSS	8	1997-10-27	1997-11-24	1997-11-05	2	51.44	Lets Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
10720	QUEDE	8	1997-10-28	1997-11-11	1997-11-05	2	9.53	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10721	QUICK	5	1997-10-29	1997-11-26	1997-10-31	3	48.92	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10722	SAVEA	8	1997-10-29	1997-12-10	1997-11-04	1	74.58	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10724	MEREP	8	1997-10-30	1997-12-11	1997-11-05	2	57.75	MÃ¨re Paillarde	43 rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada
10723	WHITC	3	1997-10-30	1997-11-27	1997-11-25	1	21.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10725	FAMIA	4	1997-10-31	1997-11-28	1997-11-05	3	10.83	Familia Arquibaldo	Rua OrÃ³s 92	Sao Paulo	SP	05442-030	Brazil
10726	EASTC	4	1997-11-03	1997-11-17	1997-12-05	1	16.56	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
10727	REGGC	2	1997-11-03	1997-12-01	1997-12-05	1	89.90	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10728	QUEEN	4	1997-11-04	1997-12-02	1997-11-11	2	58.33	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10729	LINOD	8	1997-11-04	1997-12-16	1997-11-14	3	141.06	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10730	BONAP	5	1997-11-05	1997-12-03	1997-11-14	1	20.12	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10732	BONAP	3	1997-11-06	1997-12-04	1997-11-07	1	16.97	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10731	CHOPS	7	1997-11-06	1997-12-04	1997-11-14	1	96.65	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
10733	BERGS	1	1997-11-07	1997-12-05	1997-11-10	3	110.11	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10734	GOURL	2	1997-11-07	1997-12-05	1997-11-12	3	1.63	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
10735	LETSS	6	1997-11-10	1997-12-08	1997-11-21	2	45.97	Lets Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
10737	VINET	2	1997-11-11	1997-12-09	1997-11-18	2	7.79	Vins et alcools Chevalier	59 rue de lAbbaye	Reims	NULL	51100	France
10736	HUNGO	9	1997-11-11	1997-12-09	1997-11-21	2	44.10	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10739	VINET	3	1997-11-12	1997-12-10	1997-11-17	3	11.08	Vins et alcools Chevalier	59 rue de lAbbaye	Reims	NULL	51100	France
10738	SPECD	2	1997-11-12	1997-12-10	1997-11-18	1	2.91	SpÃ©cialitÃ©s du monde	25 rue Lauriston	Paris	NULL	75016	France
10740	WHITC	4	1997-11-13	1997-12-11	1997-11-25	2	81.88	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10741	AROUT	4	1997-11-14	1997-11-28	1997-11-18	3	10.96	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10742	BOTTM	3	1997-11-14	1997-12-12	1997-11-18	3	243.73	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10743	AROUT	1	1997-11-17	1997-12-15	1997-11-21	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10744	VAFFE	6	1997-11-17	1997-12-15	1997-11-24	1	69.19	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10745	QUICK	9	1997-11-18	1997-12-16	1997-11-27	1	3.52	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10746	CHOPS	1	1997-11-19	1997-12-17	1997-11-21	3	31.43	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
10747	PICCO	6	1997-11-19	1997-12-17	1997-11-26	1	117.33	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10748	SAVEA	3	1997-11-20	1997-12-18	1997-11-28	1	232.55	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10749	ISLAT	4	1997-11-20	1997-12-18	1997-12-19	2	61.53	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10750	WARTH	9	1997-11-21	1997-12-19	1997-11-24	1	79.30	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10752	NORTS	2	1997-11-24	1997-12-22	1997-11-28	3	1.39	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
10751	RICSU	3	1997-11-24	1997-12-22	1997-12-03	3	130.79	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
10753	FRANS	3	1997-11-25	1997-12-23	1997-11-27	1	7.70	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
10754	MAGAA	6	1997-11-25	1997-12-23	1997-11-27	3	2.38	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10755	BONAP	4	1997-11-26	1997-12-24	1997-11-28	2	16.71	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10756	SPLIR	8	1997-11-27	1997-12-25	1997-12-02	2	73.21	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10757	SAVEA	6	1997-11-27	1997-12-25	1997-12-15	1	8.19	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10758	RICSU	3	1997-11-28	1997-12-26	1997-12-04	3	138.17	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
10759	ANATR	3	1997-11-28	1997-12-26	1997-12-12	3	11.99	Ana Trujillo Emparedados y helados	Avda. de la ConstituciÃ³n 2222	MÃ©xico D.F.	NULL	5021	Mexico
10760	MAISD	4	1997-12-01	1997-12-29	1997-12-10	1	155.64	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
10761	RATTC	5	1997-12-02	1997-12-30	1997-12-08	2	18.66	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10762	FOLKO	3	1997-12-02	1997-12-30	1997-12-09	1	328.74	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10763	FOLIG	3	1997-12-03	1997-12-31	1997-12-08	3	37.35	Folies gourmandes	184 chaussÃ©e de Tournai	Lille	NULL	59000	France
10764	ERNSH	6	1997-12-03	1997-12-31	1997-12-08	3	145.45	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10765	QUICK	3	1997-12-04	1998-01-01	1997-12-09	3	42.74	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10766	OTTIK	4	1997-12-05	1998-01-02	1997-12-09	1	157.55	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10767	SUPRD	4	1997-12-05	1998-01-02	1997-12-15	3	1.59	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10769	VAFFE	3	1997-12-08	1998-01-05	1997-12-12	1	65.06	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10768	AROUT	3	1997-12-08	1998-01-05	1997-12-15	2	146.32	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10770	HANAR	8	1997-12-09	1998-01-06	1997-12-17	3	5.32	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10772	LEHMS	3	1997-12-10	1998-01-07	1997-12-19	2	91.28	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10771	ERNSH	9	1997-12-10	1998-01-07	1998-01-02	2	11.19	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10774	FOLKO	4	1997-12-11	1997-12-25	1997-12-12	1	48.20	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10773	ERNSH	1	1997-12-11	1998-01-08	1997-12-16	3	96.43	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10775	THECR	7	1997-12-12	1998-01-09	1997-12-26	1	20.25	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
10776	ERNSH	1	1997-12-15	1998-01-12	1997-12-18	3	351.53	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10777	GOURL	7	1997-12-15	1997-12-29	1998-01-21	2	3.01	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
10778	BERGS	3	1997-12-16	1998-01-13	1997-12-24	1	6.79	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10780	LILAS	2	1997-12-16	1997-12-30	1997-12-25	1	42.13	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10779	MORGK	3	1997-12-16	1998-01-13	1998-01-14	2	58.13	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	4179	Germany
10781	WARTH	2	1997-12-17	1998-01-14	1997-12-19	3	73.16	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
10782	CACTU	9	1997-12-17	1998-01-14	1997-12-22	3	1.10	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
10783	HANAR	4	1997-12-18	1998-01-15	1997-12-19	2	124.98	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10784	MAGAA	4	1997-12-18	1998-01-15	1997-12-22	3	70.09	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10785	GROSR	1	1997-12-18	1998-01-15	1997-12-24	3	1.51	GROSELLA-Restaurante	5Âª Ave. Los Palos Grandes	Caracas	DF	1081	Venezuela
10786	QUEEN	8	1997-12-19	1998-01-16	1997-12-23	1	110.87	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10787	LAMAI	2	1997-12-19	1998-01-02	1997-12-26	1	249.93	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10790	GOURL	6	1997-12-22	1998-01-19	1997-12-26	1	28.23	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
10789	FOLIG	1	1997-12-22	1998-01-19	1997-12-31	2	100.60	Folies gourmandes	184 chaussÃ©e de Tournai	Lille	NULL	59000	France
10788	QUICK	1	1997-12-22	1998-01-19	1998-01-19	2	42.70	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10792	WOLZA	1	1997-12-23	1998-01-20	1997-12-31	3	23.79	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
10791	FRANK	6	1997-12-23	1998-01-20	1998-01-01	2	16.85	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10794	QUEDE	6	1997-12-24	1998-01-21	1998-01-02	1	21.49	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10793	AROUT	3	1997-12-24	1998-01-21	1998-01-08	3	4.52	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10795	ERNSH	8	1997-12-24	1998-01-21	1998-01-20	2	126.66	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10797	DRACD	7	1997-12-25	1998-01-22	1998-01-05	2	33.35	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
10796	HILAA	3	1997-12-25	1998-01-22	1998-01-14	1	26.52	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10798	ISLAT	2	1997-12-26	1998-01-23	1998-01-05	1	2.33	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10799	KOENE	9	1997-12-26	1998-02-06	1998-01-05	3	30.76	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10800	SEVES	1	1997-12-26	1998-01-23	1998-01-05	3	137.44	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10801	BOLID	4	1997-12-29	1998-01-26	1997-12-31	2	97.09	BÃ³lido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
10802	SIMOB	4	1997-12-29	1998-01-26	1998-01-02	2	257.26	Simons bistro	VinbÃ¦ltet 34	Kobenhavn	NULL	1734	Denmark
10803	WELLI	4	1997-12-30	1998-01-27	1998-01-06	1	55.23	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10804	SEVES	6	1997-12-30	1998-01-27	1998-01-07	2	27.33	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10805	THEBI	2	1997-12-30	1998-01-27	1998-01-09	3	237.34	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
10806	VICTE	3	1997-12-31	1998-01-28	1998-01-05	2	22.11	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10807	FRANS	4	1997-12-31	1998-01-28	1998-01-30	1	1.36	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
10809	WELLI	7	1998-01-01	1998-01-29	1998-01-07	1	4.87	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10810	LAUGB	2	1998-01-01	1998-01-29	1998-01-07	3	4.33	Laughing Bacchus Wine Cellars	2319 Elm St.	Vancouver	BC	V3F 2K1	Canada
10808	OLDWO	2	1998-01-01	1998-01-29	1998-01-09	3	45.53	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10811	LINOD	8	1998-01-02	1998-01-30	1998-01-08	1	31.22	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10812	REGGC	5	1998-01-02	1998-01-30	1998-01-12	1	59.78	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10813	RICAR	1	1998-01-05	1998-02-02	1998-01-09	1	47.38	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10814	VICTE	3	1998-01-05	1998-02-02	1998-01-14	3	130.94	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10815	SAVEA	2	1998-01-05	1998-02-02	1998-01-14	3	14.62	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10817	KOENE	3	1998-01-06	1998-01-20	1998-01-13	2	306.07	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10816	GREAL	4	1998-01-06	1998-02-03	1998-02-04	2	719.78	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10818	MAGAA	7	1998-01-07	1998-02-04	1998-01-12	3	65.48	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10820	RATTC	3	1998-01-07	1998-02-04	1998-01-13	2	37.52	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10819	CACTU	2	1998-01-07	1998-02-04	1998-01-16	3	19.76	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
10821	SPLIR	1	1998-01-08	1998-02-05	1998-01-15	1	36.68	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10822	TRAIH	6	1998-01-08	1998-02-05	1998-01-16	3	7.00	Trails Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	WA	98034	USA
10823	LILAS	5	1998-01-09	1998-02-06	1998-01-13	2	163.97	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10825	DRACD	1	1998-01-09	1998-02-06	1998-01-14	1	79.25	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
10824	FOLKO	8	1998-01-09	1998-02-06	1998-01-30	1	1.23	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10826	BLONP	6	1998-01-12	1998-02-09	1998-02-06	1	7.09	Blondel pÃ¨re et fils	24 place KlÃ©ber	Strasbourg	NULL	67000	France
10827	BONAP	1	1998-01-12	1998-01-26	1998-02-06	2	63.54	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10830	TRADH	4	1998-01-13	1998-02-24	1998-01-21	2	81.83	TradiÃ§ao Hipermercados	Av. InÃªs de Castro 414	Sao Paulo	SP	05634-030	Brazil
10829	ISLAT	9	1998-01-13	1998-02-10	1998-01-23	1	154.72	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10828	RANCH	9	1998-01-13	1998-01-27	1998-02-04	1	90.85	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
10832	LAMAI	2	1998-01-14	1998-02-11	1998-01-19	2	43.26	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10831	SANTG	3	1998-01-14	1998-02-11	1998-01-23	2	72.19	SantÃ© Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
10834	TRADH	1	1998-01-15	1998-02-12	1998-01-19	3	29.78	TradiÃ§ao Hipermercados	Av. InÃªs de Castro 414	Sao Paulo	SP	05634-030	Brazil
10835	ALFKI	1	1998-01-15	1998-02-12	1998-01-21	3	69.53	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
10833	OTTIK	6	1998-01-15	1998-02-12	1998-01-23	2	71.49	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10836	ERNSH	7	1998-01-16	1998-02-13	1998-01-21	1	411.88	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10837	BERGS	9	1998-01-16	1998-02-13	1998-01-23	3	13.32	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10839	TRADH	3	1998-01-19	1998-02-16	1998-01-22	3	35.43	TradiÃ§ao Hipermercados	Av. InÃªs de Castro 414	Sao Paulo	SP	05634-030	Brazil
10838	LINOD	3	1998-01-19	1998-02-16	1998-01-23	3	59.28	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10840	LINOD	4	1998-01-19	1998-03-02	1998-02-16	2	2.71	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10841	SUPRD	5	1998-01-20	1998-02-17	1998-01-29	2	424.30	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10842	TORTU	1	1998-01-20	1998-02-17	1998-01-29	3	54.42	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10843	VICTE	4	1998-01-21	1998-02-18	1998-01-26	2	9.26	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10844	PICCO	8	1998-01-21	1998-02-18	1998-01-26	2	25.22	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
10845	QUICK	8	1998-01-21	1998-02-04	1998-01-30	1	212.98	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10846	SUPRD	2	1998-01-22	1998-03-05	1998-01-23	3	56.46	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10847	SAVEA	4	1998-01-22	1998-02-05	1998-02-10	3	487.57	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10848	CONSH	7	1998-01-23	1998-02-20	1998-01-29	2	38.24	Consolidated Holdings	Berkeley Gardens 12  Brewery	London	NULL	WX1 6LT	UK
10849	KOENE	9	1998-01-23	1998-02-20	1998-01-30	2	0.56	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10850	VICTE	1	1998-01-23	1998-03-06	1998-01-30	1	49.19	Victuailles en stock	2 rue du Commerce	Lyon	NULL	69004	France
10852	RATTC	8	1998-01-26	1998-02-09	1998-01-30	1	174.05	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10851	RICAR	5	1998-01-26	1998-02-23	1998-02-02	1	160.55	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10853	BLAUS	9	1998-01-27	1998-02-24	1998-02-03	2	53.83	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
10855	OLDWO	3	1998-01-27	1998-02-24	1998-02-04	1	170.97	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10854	ERNSH	3	1998-01-27	1998-02-24	1998-02-05	2	100.22	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10857	BERGS	8	1998-01-28	1998-02-25	1998-02-06	2	188.85	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10856	ANTON	3	1998-01-28	1998-02-25	1998-02-10	2	58.43	Antonio Moreno TaquerÃ­a	Mataderos  2312	MÃ©xico D.F.	NULL	5023	Mexico
10859	FRANK	1	1998-01-29	1998-02-26	1998-02-02	2	76.10	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10858	LACOR	2	1998-01-29	1998-02-26	1998-02-03	1	52.51	La corne dabondance	67 avenue de lEurope	Versailles	NULL	78000	France
10860	FRANR	3	1998-01-29	1998-02-26	1998-02-04	3	19.26	France restauration	54 rue Royale	Nantes	NULL	44000	France
10862	LEHMS	8	1998-01-30	1998-03-13	1998-02-02	2	53.23	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10861	WHITC	4	1998-01-30	1998-02-27	1998-02-17	2	14.93	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10864	AROUT	4	1998-02-02	1998-03-02	1998-02-09	2	3.04	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10865	QUICK	2	1998-02-02	1998-02-16	1998-02-12	1	348.14	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10863	HILAA	4	1998-02-02	1998-03-02	1998-02-17	2	30.26	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10867	LONEP	6	1998-02-03	1998-03-17	1998-02-11	1	1.93	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10866	BERGS	5	1998-02-03	1998-03-03	1998-02-12	1	109.11	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10869	SEVES	5	1998-02-04	1998-03-04	1998-02-09	1	143.28	Seven Seas Imports	90 Wadhurst Rd.	London	NULL	OX15 4NB	UK
10870	WOLZA	5	1998-02-04	1998-03-04	1998-02-13	3	12.04	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
10868	QUEEN	7	1998-02-04	1998-03-04	1998-02-23	2	191.27	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10872	GODOS	5	1998-02-05	1998-03-05	1998-02-09	2	175.32	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
10871	BONAP	9	1998-02-05	1998-03-05	1998-02-10	2	112.27	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10873	WILMK	4	1998-02-06	1998-03-06	1998-02-09	1	0.82	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
10874	GODOS	5	1998-02-06	1998-03-06	1998-02-11	2	19.58	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
10875	BERGS	4	1998-02-06	1998-03-06	1998-03-03	2	32.37	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10876	BONAP	7	1998-02-09	1998-03-09	1998-02-12	3	60.42	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10877	RICAR	1	1998-02-09	1998-03-09	1998-02-19	1	38.06	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
10878	QUICK	4	1998-02-10	1998-03-10	1998-02-12	1	46.69	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10879	WILMK	3	1998-02-10	1998-03-10	1998-02-12	3	8.50	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
10880	FOLKO	7	1998-02-10	1998-03-24	1998-02-18	1	88.01	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10881	CACTU	4	1998-02-11	1998-03-11	1998-02-18	1	2.84	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
10882	SAVEA	4	1998-02-11	1998-03-11	1998-02-20	3	23.10	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10884	LETSS	4	1998-02-12	1998-03-12	1998-02-13	2	90.97	Lets Stop N Shop	87 Polk St. Suite 5	San Francisco	CA	94117	USA
10885	SUPRD	6	1998-02-12	1998-03-12	1998-02-18	3	5.64	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10883	LONEP	8	1998-02-12	1998-03-12	1998-02-20	3	0.53	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
10887	GALED	8	1998-02-13	1998-03-13	1998-02-16	3	1.25	GalerÃ­a del gastronÃ³mo	Rambla de CataluÃ±a 23	Barcelona	NULL	8022	Spain
10886	HANAR	1	1998-02-13	1998-03-13	1998-03-02	1	4.99	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10890	DUMON	7	1998-02-16	1998-03-16	1998-02-18	1	32.76	Du monde entier	67 rue des Cinquante Otages	Nantes	NULL	44000	France
10888	GODOS	1	1998-02-16	1998-03-16	1998-02-23	2	51.87	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
10889	RATTC	9	1998-02-16	1998-03-16	1998-02-23	3	280.61	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10891	LEHMS	7	1998-02-17	1998-03-17	1998-02-19	2	20.37	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10892	MAISD	4	1998-02-17	1998-03-17	1998-02-19	2	120.27	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
10893	KOENE	9	1998-02-18	1998-03-18	1998-02-20	2	77.78	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
10894	SAVEA	1	1998-02-18	1998-03-18	1998-02-20	1	116.13	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10895	ERNSH	3	1998-02-18	1998-03-18	1998-02-23	1	162.75	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10897	HUNGO	3	1998-02-19	1998-03-19	1998-02-25	2	603.54	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10896	MAISD	7	1998-02-19	1998-03-19	1998-02-27	3	32.45	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
10899	LILAS	5	1998-02-20	1998-03-20	1998-02-26	3	1.21	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10959	GOURL	6	1998-03-18	1998-04-29	1998-03-23	2	4.98	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
10900	WELLI	1	1998-02-20	1998-03-20	1998-03-04	2	1.66	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10898	OCEAN	4	1998-02-20	1998-03-20	1998-03-06	2	1.27	OcÃ©ano AtlÃ¡ntico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
10901	HILAA	4	1998-02-23	1998-03-23	1998-02-26	1	62.09	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10902	FOLKO	1	1998-02-23	1998-03-23	1998-03-03	1	44.15	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10904	WHITC	3	1998-02-24	1998-03-24	1998-02-27	3	162.95	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
10903	HANAR	3	1998-02-24	1998-03-24	1998-03-04	3	36.71	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10905	WELLI	9	1998-02-24	1998-03-24	1998-03-06	2	13.72	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10907	SPECD	6	1998-02-25	1998-03-25	1998-02-27	3	9.19	SpÃ©cialitÃ©s du monde	25 rue Lauriston	Paris	NULL	75016	France
10906	WOLZA	4	1998-02-25	1998-03-11	1998-03-03	3	26.29	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
10910	WILMK	1	1998-02-26	1998-03-26	1998-03-04	3	38.11	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
10913	QUEEN	4	1998-02-26	1998-03-26	1998-03-04	1	33.05	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10911	GODOS	3	1998-02-26	1998-03-26	1998-03-05	1	38.19	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
10908	REGGC	4	1998-02-26	1998-03-26	1998-03-06	2	32.96	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10909	SANTG	1	1998-02-26	1998-03-26	1998-03-10	2	53.05	SantÃ© Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
10912	HUNGO	2	1998-02-26	1998-03-26	1998-03-18	2	580.91	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10914	QUEEN	6	1998-02-27	1998-03-27	1998-03-02	1	21.19	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10915	TORTU	2	1998-02-27	1998-03-27	1998-03-02	2	3.51	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
10916	RANCH	1	1998-02-27	1998-03-27	1998-03-09	2	63.77	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
10919	LINOD	2	1998-03-02	1998-03-30	1998-03-04	2	19.80	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10917	ROMEY	4	1998-03-02	1998-03-30	1998-03-11	2	8.29	Romero y tomillo	Gran VÃ­a 1	Madrid	NULL	28001	Spain
10918	BOTTM	3	1998-03-02	1998-03-30	1998-03-11	3	48.83	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10922	HANAR	5	1998-03-03	1998-03-31	1998-03-05	3	62.74	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10920	AROUT	4	1998-03-03	1998-03-31	1998-03-09	2	29.61	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10921	VAFFE	1	1998-03-03	1998-04-14	1998-03-09	1	176.48	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10923	LAMAI	7	1998-03-03	1998-04-14	1998-03-13	3	68.26	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
10926	ANATR	4	1998-03-04	1998-04-01	1998-03-11	3	39.92	Ana Trujillo Emparedados y helados	Avda. de la ConstituciÃ³n 2222	MÃ©xico D.F.	NULL	5021	Mexico
10925	HANAR	3	1998-03-04	1998-04-01	1998-03-13	1	2.27	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10924	BERGS	3	1998-03-04	1998-04-01	1998-04-08	2	151.52	Berglunds snabbkÃ¶p	BerguvsvÃ¤gen  8	LuleÃ¥	NULL	S-958 22	Sweden
10929	FRANK	6	1998-03-05	1998-04-02	1998-03-12	1	33.93	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
10928	GALED	1	1998-03-05	1998-04-02	1998-03-18	1	1.36	GalerÃ­a del gastronÃ³mo	Rambla de CataluÃ±a 23	Barcelona	NULL	8022	Spain
10927	LACOR	4	1998-03-05	1998-04-02	1998-04-08	1	19.79	La corne dabondance	67 avenue de lEurope	Versailles	NULL	78000	France
10933	ISLAT	6	1998-03-06	1998-04-03	1998-03-16	3	54.15	Island Trading	Garden House Crowther Way	Cowes	Isle of Wight	PO31 7PJ	UK
10930	SUPRD	4	1998-03-06	1998-04-17	1998-03-18	3	15.55	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
10931	RICSU	4	1998-03-06	1998-03-20	1998-03-19	2	13.60	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
10932	BONAP	8	1998-03-06	1998-04-03	1998-03-24	1	134.64	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10934	LEHMS	3	1998-03-09	1998-04-06	1998-03-12	3	32.01	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
10935	WELLI	4	1998-03-09	1998-04-06	1998-03-18	3	47.59	Wellington Importadora	Rua do Mercado 12	Resende	SP	08737-363	Brazil
10936	GREAL	3	1998-03-09	1998-04-06	1998-03-18	2	33.68	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
10937	CACTU	7	1998-03-10	1998-03-24	1998-03-13	3	31.51	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
10939	MAGAA	2	1998-03-10	1998-04-07	1998-03-13	2	76.33	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10938	QUICK	3	1998-03-10	1998-04-07	1998-03-16	2	31.89	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10942	REGGC	9	1998-03-11	1998-04-08	1998-03-18	3	17.95	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
10943	BSBEV	4	1998-03-11	1998-04-08	1998-03-19	2	2.17	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10941	SAVEA	7	1998-03-11	1998-04-08	1998-03-20	2	400.81	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10940	BONAP	8	1998-03-11	1998-04-08	1998-03-23	3	19.77	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
10944	BOTTM	6	1998-03-12	1998-03-26	1998-03-13	3	52.92	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10945	MORGK	4	1998-03-12	1998-04-09	1998-03-18	1	10.22	Morgenstern Gesundkost	Heerstr. 22	Leipzig	NULL	4179	Germany
10946	VAFFE	1	1998-03-12	1998-04-09	1998-03-19	2	27.20	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10947	BSBEV	3	1998-03-13	1998-04-10	1998-03-16	2	3.26	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
10949	BOTTM	2	1998-03-13	1998-04-10	1998-03-17	3	74.44	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10948	GODOS	3	1998-03-13	1998-04-10	1998-03-19	3	23.39	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
10950	MAGAA	1	1998-03-16	1998-04-13	1998-03-23	2	2.50	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	NULL	24100	Italy
10952	ALFKI	1	1998-03-16	1998-04-27	1998-03-24	1	40.42	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
10953	AROUT	9	1998-03-16	1998-03-30	1998-03-25	2	23.72	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
10951	RICSU	9	1998-03-16	1998-04-27	1998-04-07	2	30.85	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
10954	LINOD	5	1998-03-17	1998-04-28	1998-03-20	1	27.91	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
10955	FOLKO	8	1998-03-17	1998-04-14	1998-03-20	2	3.26	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10956	BLAUS	6	1998-03-17	1998-04-28	1998-03-20	2	44.65	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
10957	HILAA	8	1998-03-18	1998-04-15	1998-03-27	3	105.36	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10958	OCEAN	7	1998-03-18	1998-04-15	1998-03-27	2	49.56	OcÃ©ano AtlÃ¡ntico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
10962	QUICK	8	1998-03-19	1998-04-16	1998-03-23	2	275.79	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10963	FURIB	9	1998-03-19	1998-04-16	1998-03-26	3	2.70	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	NULL	1675	Portugal
10961	QUEEN	8	1998-03-19	1998-04-16	1998-03-30	1	104.47	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
10960	HILAA	3	1998-03-19	1998-04-02	1998-04-08	1	2.08	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10964	SPECD	3	1998-03-20	1998-04-17	1998-03-24	2	87.38	SpÃ©cialitÃ©s du monde	25 rue Lauriston	Paris	NULL	75016	France
10965	OLDWO	6	1998-03-20	1998-04-17	1998-03-30	3	144.38	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
10966	CHOPS	4	1998-03-20	1998-04-17	1998-04-08	1	27.19	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
10969	COMMI	1	1998-03-23	1998-04-20	1998-03-30	2	0.21	ComÃ©rcio Mineiro	Av. dos LusÃ­adas 23	Sao Paulo	SP	05432-043	Brazil
10968	ERNSH	1	1998-03-23	1998-04-20	1998-04-01	3	74.60	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10967	TOMSP	2	1998-03-23	1998-04-20	1998-04-02	2	62.22	Toms SpezialitÃ¤ten	Luisenstr. 48	MÃ¼nster	NULL	44087	Germany
10972	LACOR	4	1998-03-24	1998-04-21	1998-03-26	2	0.02	La corne dabondance	67 avenue de lEurope	Versailles	NULL	78000	France
10973	LACOR	6	1998-03-24	1998-04-21	1998-03-27	2	15.17	La corne dabondance	67 avenue de lEurope	Versailles	NULL	78000	France
10971	FRANR	2	1998-03-24	1998-04-21	1998-04-02	2	121.82	France restauration	54 rue Royale	Nantes	NULL	44000	France
10970	BOLID	9	1998-03-24	1998-04-07	1998-04-24	1	16.16	BÃ³lido Comidas preparadas	C/ Araquil 67	Madrid	NULL	28023	Spain
10975	BOTTM	1	1998-03-25	1998-04-22	1998-03-27	3	32.27	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10974	SPLIR	3	1998-03-25	1998-04-08	1998-04-03	3	12.96	Split Rail Beer & Ale	P.O. Box 555	Lander	WY	82520	USA
10976	HILAA	1	1998-03-25	1998-05-06	1998-04-03	1	37.97	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
10979	ERNSH	8	1998-03-26	1998-04-23	1998-03-31	2	353.07	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10977	FOLKO	8	1998-03-26	1998-04-23	1998-04-10	3	208.50	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10978	MAISD	9	1998-03-26	1998-04-23	1998-04-23	2	32.82	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
10981	HANAR	1	1998-03-27	1998-04-24	1998-04-02	2	193.37	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
10983	SAVEA	2	1998-03-27	1998-04-24	1998-04-06	2	657.54	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10982	BOTTM	2	1998-03-27	1998-04-24	1998-04-08	1	14.01	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
10980	FOLKO	4	1998-03-27	1998-05-08	1998-04-17	1	1.26	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10985	HUNGO	2	1998-03-30	1998-04-27	1998-04-02	1	91.51	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
10984	SAVEA	1	1998-03-30	1998-04-27	1998-04-03	3	211.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
10986	OCEAN	8	1998-03-30	1998-04-27	1998-04-21	2	217.86	OcÃ©ano AtlÃ¡ntico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	NULL	1010	Argentina
10989	QUEDE	2	1998-03-31	1998-04-28	1998-04-02	1	34.76	Que DelÃ­cia	Rua da Panificadora 12	Rio de Janeiro	RJ	02389-673	Brazil
10987	EASTC	8	1998-03-31	1998-04-28	1998-04-06	1	185.48	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
10988	RATTC	3	1998-03-31	1998-04-28	1998-04-10	2	61.14	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
10992	THEBI	1	1998-04-01	1998-04-29	1998-04-03	3	4.27	The Big Cheese	89 Jefferson Way Suite 2	Portland	OR	97201	USA
10990	ERNSH	2	1998-04-01	1998-05-13	1998-04-07	3	117.61	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
10991	QUICK	1	1998-04-01	1998-04-29	1998-04-07	1	38.51	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10993	FOLKO	7	1998-04-01	1998-04-29	1998-04-10	3	8.81	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
10995	PERIC	1	1998-04-02	1998-04-30	1998-04-06	3	46.00	Pericles Comidas clÃ¡sicas	Calle Dr. Jorge Cash 321	MÃ©xico D.F.	NULL	5033	Mexico
10994	VAFFE	2	1998-04-02	1998-04-16	1998-04-09	3	65.53	Vaffeljernet	Smagsloget 45	Ã…rhus	NULL	8200	Denmark
10996	QUICK	4	1998-04-02	1998-04-30	1998-04-10	2	1.12	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
10999	OTTIK	6	1998-04-03	1998-05-01	1998-04-10	2	96.35	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
10997	LILAS	8	1998-04-03	1998-05-15	1998-04-13	2	73.91	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
10998	WOLZA	8	1998-04-03	1998-04-17	1998-04-17	2	20.31	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
11003	THECR	3	1998-04-06	1998-05-04	1998-04-08	3	14.91	The Cracker Box	55 Grizzly Peak Rd.	Butte	MT	59801	USA
11000	RATTC	2	1998-04-06	1998-05-04	1998-04-14	3	55.12	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
11001	FOLKO	2	1998-04-06	1998-05-04	1998-04-14	2	197.30	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
11002	SAVEA	4	1998-04-06	1998-05-04	1998-04-16	1	141.16	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11005	WILMK	2	1998-04-07	1998-05-05	1998-04-10	1	0.75	Wilman Kala	Keskuskatu 45	Helsinki	NULL	21240	Finland
11006	GREAL	3	1998-04-07	1998-05-05	1998-04-15	2	25.19	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11004	MAISD	3	1998-04-07	1998-05-05	1998-04-20	1	44.84	Maison Dewey	Rue Joseph-Bens 532	Bruxelles	NULL	B-1180	Belgium
11009	GODOS	2	1998-04-08	1998-05-06	1998-04-10	1	59.11	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
11007	PRINI	8	1998-04-08	1998-05-06	1998-04-13	2	202.24	Princesa Isabel Vinhos	Estrada da saÃºde n. 58	Lisboa	NULL	1756	Portugal
11008	ERNSH	7	1998-04-08	1998-05-06	1998-04-17	3	79.46	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
11013	ROMEY	2	1998-04-09	1998-05-07	1998-04-10	1	32.99	Romero y tomillo	Gran VÃ­a 1	Madrid	NULL	28001	Spain
11011	ALFKI	3	1998-04-09	1998-05-07	1998-04-13	1	1.21	Alfreds Futterkiste	Obere Str. 57	Berlin	NULL	12209	Germany
11012	FRANK	1	1998-04-09	1998-04-23	1998-04-17	3	242.95	Frankenversand	Berliner Platz 43	MÃ¼nchen	NULL	80805	Germany
11010	REGGC	2	1998-04-09	1998-05-07	1998-04-21	2	28.71	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
11016	AROUT	9	1998-04-10	1998-05-08	1998-04-13	2	33.80	Around the Horn	Brook Farm Stratford St. Mary	Colchester	Essex	CO7 6JX	UK
11014	LINOD	2	1998-04-10	1998-05-08	1998-04-15	3	23.60	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
11015	SANTG	2	1998-04-10	1998-04-24	1998-04-20	2	4.62	SantÃ© Gourmet	Erling Skakkes gate 78	Stavern	NULL	4110	Norway
11018	LONEP	4	1998-04-13	1998-05-11	1998-04-16	2	11.65	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	OR	97219	USA
11017	ERNSH	9	1998-04-13	1998-05-11	1998-04-20	2	754.26	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
11019	RANCH	6	1998-04-13	1998-05-11	1998-04-22	3	3.17	Rancho grande	Av. del Libertador 900	Buenos Aires	NULL	1010	Argentina
11020	OTTIK	2	1998-04-14	1998-05-12	1998-04-16	2	43.30	Ottilies KÃ¤seladen	Mehrheimerstr. 369	KÃ¶ln	NULL	50739	Germany
11021	QUICK	3	1998-04-14	1998-05-12	1998-04-21	1	297.18	QUICK-Stop	TaucherstraÃŸe 10	Cunewalde	NULL	1307	Germany
11023	BSBEV	1	1998-04-14	1998-04-28	1998-04-24	2	123.83	Bs Beverages	Fauntleroy Circus	London	NULL	EC2 5NT	UK
11022	HANAR	9	1998-04-14	1998-05-12	1998-05-04	2	6.27	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
11024	EASTC	4	1998-04-15	1998-05-13	1998-04-20	1	74.36	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
11025	WARTH	6	1998-04-15	1998-05-13	1998-04-24	3	29.17	Wartian Herkku	Torikatu 38	Oulu	NULL	90110	Finland
11026	FRANS	4	1998-04-15	1998-05-13	1998-04-28	1	47.09	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
11027	BOTTM	1	1998-04-16	1998-05-14	1998-04-20	1	52.52	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11028	KOENE	2	1998-04-16	1998-05-14	1998-04-22	1	29.59	KÃ¶niglich Essen	Maubelstr. 90	Brandenburg	NULL	14776	Germany
11029	CHOPS	4	1998-04-16	1998-05-14	1998-04-27	1	47.84	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
11032	WHITC	2	1998-04-17	1998-05-15	1998-04-23	3	606.19	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
11033	RICSU	7	1998-04-17	1998-05-15	1998-04-23	3	84.74	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
11031	SAVEA	6	1998-04-17	1998-05-15	1998-04-24	2	227.22	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11030	SAVEA	7	1998-04-17	1998-05-15	1998-04-27	2	830.75	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11036	DRACD	8	1998-04-20	1998-05-18	1998-04-22	3	149.47	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
11035	SUPRD	2	1998-04-20	1998-05-18	1998-04-24	2	0.17	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
11034	OLDWO	8	1998-04-20	1998-06-01	1998-04-27	1	40.32	Old World Delicatessen	2743 Bering St.	Anchorage	AK	99508	USA
11037	GODOS	7	1998-04-21	1998-05-19	1998-04-27	1	3.20	Godos Cocina TÃ­pica	C/ Romero 33	Sevilla	NULL	41101	Spain
11038	SUPRD	1	1998-04-21	1998-05-19	1998-04-30	2	29.59	SuprÃªmes dÃ©lices	Boulevard Tirou 255	Charleroi	NULL	B-6000	Belgium
11039	LINOD	1	1998-04-21	1998-05-19	1998-04-30	2	65.00	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	Nueva Esparta	4980	Venezuela
11041	CHOPS	3	1998-04-22	1998-05-20	1998-04-28	2	48.22	Chop-suey Chinese	Hauptstr. 31	Bern	NULL	3012	Switzerland
11043	SPECD	5	1998-04-22	1998-05-20	1998-04-29	2	8.80	SpÃ©cialitÃ©s du monde	25 rue Lauriston	Paris	NULL	75016	France
11042	COMMI	2	1998-04-22	1998-05-06	1998-05-01	1	29.99	ComÃ©rcio Mineiro	Av. dos LusÃ­adas 23	Sao Paulo	SP	05432-043	Brazil
11040	GREAL	4	1998-04-22	1998-05-20	1998-05-01	3	18.84	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11046	WANDK	8	1998-04-23	1998-05-21	1998-04-24	2	71.64	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	NULL	70563	Germany
11044	WOLZA	4	1998-04-23	1998-05-21	1998-05-01	1	8.72	Wolski Zajazd	ul. Filtrowa 68	Warszawa	NULL	01-012	Poland
11045	BOTTM	6	1998-04-23	1998-05-21	1998-05-02	2	70.58	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11048	BOTTM	7	1998-04-24	1998-05-22	1998-04-30	3	24.12	Bottom-Dollar Markets	23 Tsawassen Blvd.	Tsawassen	BC	T2F 8M4	Canada
11047	EASTC	7	1998-04-24	1998-05-22	1998-05-01	3	46.62	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
11049	GOURL	3	1998-04-24	1998-05-22	1998-05-04	1	8.34	Gourmet Lanchonetes	Av. Brasil 442	Campinas	SP	04876-786	Brazil
11053	PICCO	2	1998-04-27	1998-05-25	1998-04-29	2	53.05	Piccolo und mehr	Geislweg 14	Salzburg	NULL	5020	Austria
11052	HANAR	3	1998-04-27	1998-05-25	1998-05-01	1	67.26	Hanari Carnes	Rua do PaÃ§o 67	Rio de Janeiro	RJ	05454-876	Brazil
11050	FOLKO	8	1998-04-27	1998-05-25	1998-05-05	2	59.41	Folk och fÃ¤ HB	Ã…kergatan 24	BrÃ¤cke	NULL	S-844 67	Sweden
11051	LAMAI	7	1998-04-27	1998-05-25	1998-05-06	3	2.79	La maison dAsie	1 rue Alsace-Lorraine	Toulouse	NULL	31000	France
11056	EASTC	8	1998-04-28	1998-05-12	1998-05-01	2	278.96	Eastern Connection	35 King George	London	NULL	WX3 6FW	UK
11055	HILAA	7	1998-04-28	1998-05-26	1998-05-05	2	120.92	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San CristÃ³bal	TÃ¡chira	5022	Venezuela
11054	CACTU	8	1998-04-28	1998-05-26	1998-05-07	1	0.33	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	NULL	1010	Argentina
11057	NORTS	3	1998-04-29	1998-05-27	1998-05-01	3	4.13	North/South	South House 300 Queensbridge	London	NULL	SW7 1RZ	UK
11058	BLAUS	9	1998-04-29	1998-05-27	1998-05-08	3	31.14	Blauer See Delikatessen	Forsterstr. 57	Mannheim	NULL	68306	Germany
11059	RICAR	2	1998-04-29	1998-06-10	1998-05-08	2	85.80	Ricardo Adocicados	Av. Copacabana 267	Rio de Janeiro	RJ	02389-890	Brazil
11060	FRANS	2	1998-04-30	1998-05-28	1998-05-04	2	10.98	Franchi S.p.A.	Via Monte Bianco 34	Torino	NULL	10100	Italy
11063	HUNGO	3	1998-04-30	1998-05-28	1998-05-06	2	81.73	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	Co. Cork	NULL	Ireland
11061	GREAL	4	1998-04-30	1998-06-11	1998-05-09	3	14.01	Great Lakes Food Market	2732 Baker Blvd.	Eugene	OR	97403	USA
11062	REGGC	4	1998-04-30	1998-05-28	1998-05-09	2	29.93	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	NULL	42100	Italy
11064	SAVEA	1	1998-05-01	1998-05-29	1998-05-04	1	30.09	Save-a-lot Markets	187 Suffolk Ln.	Boise	ID	83720	USA
11066	WHITC	7	1998-05-01	1998-05-29	1998-05-04	2	44.72	White Clover Markets	1029 - 12th Ave. S.	Seattle	WA	98124	USA
11065	LILAS	8	1998-05-01	1998-05-29	1998-05-10	1	12.91	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
11067	DRACD	1	1998-05-04	1998-05-18	1998-05-06	2	7.98	Drachenblut Delikatessen	Walserweg 21	Aachen	NULL	52066	Germany
11069	TORTU	1	1998-05-04	1998-06-01	1998-05-06	2	15.67	Tortuga Restaurante	Avda. Azteca 123	MÃ©xico D.F.	NULL	5033	Mexico
11068	QUEEN	8	1998-05-04	1998-06-01	1998-05-13	2	81.75	Queen Cozinha	Alameda dos CanÃ rios 891	Sao Paulo	SP	05487-020	Brazil
11070	LEHMS	2	1998-05-05	1998-06-02	1998-05-14	1	136.00	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	NULL	60528	Germany
11071	LILAS	1	1998-05-05	1998-06-02	1998-05-14	1	0.93	LILA-Supermercado	Carrera 52 con Ave. BolÃ­var #65-98 Llano Largo	Barquisimeto	Lara	3508	Venezuela
11072	ERNSH	4	1998-05-05	1998-06-02	1998-05-14	2	258.64	Ernst Handel	Kirchgasse 6	Graz	NULL	8010	Austria
11073	PERIC	2	1998-05-05	1998-06-02	1998-05-14	2	24.95	Pericles Comidas clÃ¡sicas	Calle Dr. Jorge Cash 321	MÃ©xico D.F.	NULL	5033	Mexico
11074	SIMOB	7	1998-05-06	1998-06-03	1998-05-15	2	18.44	Simons bistro	VinbÃ¦ltet 34	Kobenhavn	NULL	1734	Denmark
11075	RICSU	8	1998-05-06	1998-06-03	1998-05-15	2	6.19	Richter Supermarkt	Starenweg 5	GenÃ¨ve	NULL	1204	Switzerland
11076	BONAP	4	1998-05-06	1998-06-03	1998-05-15	2	38.28	Bon app	12 rue des Bouchers	Marseille	NULL	13008	France
11077	RATTC	1	1998-05-06	1998-06-03	1998-05-15	2	8.53	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	NM	87110	USA
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (productid, productname, supplierid, categoryid, unitprice, quantityperunit, unitsinstock, unitsonorder, reorderlevel, discontinued) FROM stdin;
1	Chai	1	1	18.00	10 boxes x 20 bags	39	0	10	0
2	Chang	1	1	19.00	24 - 12 oz bottles	17	40	25	0
3	Aniseed Syrup	1	2	10.00	12 - 550 ml bottles	13	70	25	0
4	Chef Anton's Cajun Seasoning	2	2	22.00	48 - 6 oz jars	53	0	0	0
5	Chef Anton's Gumbo Mix	2	2	21.35	36 boxes	0	0	0	1
6	Grandma's Boysenberry Spread	3	2	25.00	12 - 8 oz jars	120	0	25	0
7	Uncle Bob's Organic Dried Pears	3	7	30.00	12 - 1 lb pkgs.	15	0	10	0
8	Northwoods Cranberry Sauce	3	2	40.00	12 - 12 oz jars	6	0	0	0
9	Mishi Kobe Niku	4	6	97.00	18 - 500 g pkgs.	29	0	0	1
10	Ikura	4	8	31.00	12 - 200 ml jars	31	0	0	0
11	Queso Cabrales	5	4	21.00	1 kg pkg.	22	30	30	0
12	Queso Manchego La Pastora	5	4	38.00	10 - 500 g pkgs.	86	0	0	0
13	Konbu	6	8	6.00	2 kg box	24	0	5	0
14	Tofu	6	7	23.25	40 - 100 g pkgs.	35	0	0	0
15	Genen Shouyu	6	2	15.50	24 - 250 ml bottles	39	0	5	0
16	Pavlova	7	3	17.45	32 - 500 g boxes	29	0	10	0
17	Alice Mutton	7	6	39.00	20 - 1 kg tins	0	0	0	1
18	Carnarvon Tigers	7	8	62.50	16 kg pkg.	42	0	0	0
19	Teatime Chocolate Biscuits	8	3	9.20	10 boxes x 12 pieces	25	0	5	0
20	Sir Rodney's Marmalade	8	3	81.00	30 gift boxes	40	0	0	0
21	Sir Rodney's Scones	8	3	10.00	24 pkgs. x 4 pieces	3	40	5	0
22	Gustaf's KnÃ¤ckebrÃ¶d	9	5	21.00	24 - 500 g pkgs.	104	0	25	0
23	TunnbrÃ¶d	9	5	9.00	12 - 250 g pkgs.	61	0	25	0
24	GuaranÃ¡ FantÃ¡stica	10	1	4.50	12 - 355 ml cans	20	0	0	1
25	NuNuCa NuÃŸ-Nougat-Creme	11	3	14.00	20 - 450 g glasses	76	0	30	0
26	GumbÃ¤r GummibÃ¤rchen	11	3	31.23	100 - 250 g bags	15	0	0	0
27	Schoggi Schokolade	11	3	43.90	100 - 100 g pieces	49	0	30	0
28	RÃ¶ssle Sauerkraut	12	7	45.60	25 - 825 g cans	26	0	0	1
29	ThÃ¼ringer Rostbratwurst	12	6	123.79	50 bags x 30 sausgs.	0	0	0	1
30	Nord-Ost Matjeshering	13	8	25.89	10 - 200 g glasses	10	0	15	0
31	Gorgonzola Telino	14	4	12.50	12 - 100 g pkgs	0	70	20	0
32	Mascarpone Fabioli	14	4	32.00	24 - 200 g pkgs.	9	40	25	0
33	Geitost	15	4	2.50	500 g	112	0	20	0
34	Sasquatch Ale	16	1	14.00	24 - 12 oz bottles	111	0	15	0
35	Steeleye Stout	16	1	18.00	24 - 12 oz bottles	20	0	15	0
36	Inlagd Sill	17	8	19.00	24 - 250 g  jars	112	0	20	0
37	Gravad lax	17	8	26.00	12 - 500 g pkgs.	11	50	25	0
38	CÃ´te de Blaye	18	1	263.50	12 - 75 cl bottles	17	0	15	0
39	Chartreuse verte	18	1	18.00	750 cc per bottle	69	0	5	0
40	Boston Crab Meat	19	8	18.40	24 - 4 oz tins	123	0	30	0
41	Jack's New England Clam Chowder	19	8	9.65	12 - 12 oz cans	85	0	10	0
42	Singaporean Hokkien Fried Mee	20	5	14.00	32 - 1 kg pkgs.	26	0	0	1
43	Ipoh Coffee	20	1	46.00	16 - 500 g tins	17	10	25	0
44	Gula Malacca	20	2	19.45	20 - 2 kg bags	27	0	15	0
45	Rogede sild	21	8	9.50	1k pkg.	5	70	15	0
46	Spegesild	21	8	12.00	4 - 450 g glasses	95	0	0	0
47	Zaanse koeken	22	3	9.50	10 - 4 oz boxes	36	0	0	0
48	Chocolade	22	3	12.75	10 pkgs.	15	70	25	0
49	Maxilaku	23	3	20.00	24 - 50 g pkgs.	10	60	15	0
50	Valkoinen suklaa	23	3	16.25	12 - 100 g bars	65	0	30	0
51	Manjimup Dried Apples	24	7	53.00	50 - 300 g pkgs.	20	0	10	0
52	Filo Mix	24	5	7.00	16 - 2 kg boxes	38	0	25	0
53	Perth Pasties	24	6	32.80	48 pieces	0	0	0	1
54	TourtiÃ¨re	25	6	7.45	16 pies	21	0	10	0
55	PÃ¢tÃ© chinois	25	6	24.00	24 boxes x 2 pies	115	0	20	0
56	Gnocchi di nonna Alice	26	5	38.00	24 - 250 g pkgs.	21	10	30	0
57	Ravioli Angelo	26	5	19.50	24 - 250 g pkgs.	36	0	20	0
58	Escargots de Bourgogne	27	8	13.25	24 pieces	62	0	20	0
59	Raclette Courdavault	28	4	55.00	5 kg pkg.	79	0	0	0
60	Camembert Pierrot	28	4	34.00	15 - 300 g rounds	19	0	0	0
61	Sirop d'Ã©rable	29	2	28.50	24 - 500 ml bottles	113	0	25	0
62	Tarte au sucre	29	3	49.30	48 pies	17	0	0	0
63	Vegie-spread	7	2	43.90	15 - 625 g jars	24	0	5	0
64	Wimmers gute SemmelknÃ¶del	12	5	33.25	20 bags x 4 pieces	22	80	30	0
65	Louisiana Fiery Hot Pepper Sauce	2	2	21.05	32 - 8 oz bottles	76	0	0	0
66	Louisiana Hot Spiced Okra	2	2	17.00	24 - 8 oz jars	4	100	20	0
67	Laughing Lumberjack Lager	16	1	14.00	24 - 12 oz bottles	52	0	10	0
68	Scottish Longbreads	8	3	12.50	10 boxes x 8 pieces	6	10	15	0
69	Gudbrandsdalsost	15	4	36.00	10 kg pkg.	26	0	15	0
70	Outback Lager	7	1	15.00	24 - 355 ml bottles	15	10	30	0
71	Flotemysost	15	4	21.50	10 - 500 g pkgs.	26	0	0	0
72	Mozzarella di Giovanni	14	4	34.80	24 - 200 g pkgs.	14	0	0	0
73	RÃ¶d Kaviar	17	8	15.00	24 - 150 g jars	101	0	5	0
74	Longlife Tofu	4	7	10.00	5 kg pkg.	4	20	5	0
75	RhÃ¶nbrÃ¤u Klosterbier	12	1	7.75	24 - 0.5 l bottles	125	0	25	0
76	LakkalikÃ¶Ã¶ri	23	1	18.00	500 ml	57	0	20	0
77	Original Frankfurter grÃ¼ne SoÃŸe	12	2	13.00	12 boxes	32	0	15	0
\.


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.regions (regionid, regiondescription) FROM stdin;
1	Eastern
2	Western
3	Northern
4	Southern
\.


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shippers (shipperid, shippername, phone) FROM stdin;
1	Speedy Express	(503) 555-9831
2	United Package	(503) 555-3199
3	Federal Shipping	(503) 555-9931
\.


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.suppliers (supplierid, suppliername, contactname, contacttitle, address, city, region, postalcode, country, phone, fax, homepage) FROM stdin;
1	Exotic Liquids	Charlotte Cooper	Purchasing Manager	49 Gilbert St.	London	NULL	EC1 4SD	UK	(171) 555-2222	NULL	NULL
2	New Orleans Cajun Delights	Shelley Burke	Order Administrator	P.O. Box 78934	New Orleans	LA	70117	USA	(100) 555-4822	NULL	#CAJUN.HTM#
3	Grandma Kellys Homestead	Regina Murphy	Sales Representative	707 Oxford Rd.	Ann Arbor	MI	48104	USA	(313) 555-5735	(313) 555-3349	NULL
4	Tokyo Traders	Yoshi Nagase	Marketing Manager	9-8 Sekimai Musashino-shi	Tokyo	NULL	100	Japan	(03) 3555-5011	NULL	NULL
5	Cooperativa de Quesos Las Cabras	Antonio del Valle Saavedra	Export Administrator	Calle del Rosal 4	Oviedo	Asturias	33007	Spain	(98) 598 76 54	NULL	NULL
6	Mayumis	Mayumi Ohno	Marketing Representative	92 Setsuko Chuo-ku	Osaka	NULL	545	Japan	(06) 431-7877	NULL	Mayumis (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#
7	Pavlova Ltd.	Ian Devling	Marketing Manager	74 Rose St. Moonie Ponds	Melbourne	Victoria	3058	Australia	(03) 444-2343	(03) 444-6588	NULL
8	Specialty Biscuits Ltd.	Peter Wilson	Sales Representative	29 Kings Way	Manchester	NULL	M14 GSD	UK	(161) 555-4448	NULL	NULL
9	PB KnÃ¤ckebrÃ¶d AB	Lars Peterson	Sales Agent	Kaloadagatan 13	GÃ¶teborg	NULL	S-345 67	Sweden	031-987 65 43	031-987 65 91	NULL
10	Refrescos Americanas LTDA	Carlos Diaz	Marketing Manager	Av. das Americanas 12.890	Sao Paulo	NULL	5442	Brazil	(11) 555 4640	NULL	NULL
11	Heli SÃ¼ÃŸwaren GmbH & Co. KG	Petra Winkler	Sales Manager	TiergartenstraÃŸe 5	Berlin	NULL	10785	Germany	(010) 9984510	NULL	NULL
12	Plutzer LebensmittelgroÃŸmÃ¤rkte AG	Martin Bein	International Marketing Mgr.	Bogenallee 51	Frankfurt	NULL	60439	Germany	(069) 992755	NULL	Plutzer (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#
13	Nord-Ost-Fisch Handelsgesellschaft mbH	Sven Petersen	Coordinator Foreign Markets	Frahmredder 112a	Cuxhaven	NULL	27478	Germany	(04721) 8713	(04721) 8714	NULL
14	Formaggi Fortini s.r.l.	Elio Rossi	Sales Representative	Viale Dante 75	Ravenna	NULL	48100	Italy	(0544) 60323	(0544) 60603	#FORMAGGI.HTM#
15	Norske Meierier	Beate Vileid	Marketing Manager	Hatlevegen 5	Sandvika	NULL	1320	Norway	(0)2-953010	NULL	NULL
16	Bigfoot Breweries	Cheryl Saylor	Regional Account Rep.	3400 - 8th Avenue Suite 210	Bend	OR	97101	USA	(503) 555-9931	NULL	NULL
17	Svensk SjÃ¶fÃ¶da AB	Michael BjÃ¶rn	Sales Representative	BrovallavÃ¤gen 231	Stockholm	NULL	S-123 45	Sweden	08-123 45 67	NULL	NULL
18	Aux joyeux ecclÃ©siastiques	GuylÃ¨ne Nodier	Sales Manager	203 Rue des Francs-Bourgeois	Paris	NULL	75004	France	(1) 03.83.00.68	(1) 03.83.00.62	NULL
19	New England Seafood Cannery	Robb Merchant	Wholesale Account Agent	Order Processing Dept. 2100 Paul Revere Blvd.	Boston	MA	2134	USA	(617) 555-3267	(617) 555-3389	NULL
20	Leka Trading	Chandra Leka	Owner	471 Serangoon Loop Suite #402	Singapore	NULL	512	Singapore	555-8787	NULL	NULL
21	Lyngbysild	Niels Petersen	Sales Manager	Lyngbysild Fiskebakken 10	Lyngby	NULL	2800	Denmark	43844108	43844115	NULL
22	Zaanse Snoepfabriek	Dirk Luchte	Accounting Manager	Verkoop Rijnweg 22	Zaandam	NULL	9999 ZZ	Netherlands	(12345) 1212	(12345) 1210	NULL
23	Karkki Oy	Anne Heikkonen	Product Manager	Valtakatu 12	Lappeenranta	NULL	53120	Finland	(953) 10956	NULL	NULL
24	Gday Mate	Wendy Mackenzie	Sales Representative	170 Prince Edward Parade Hunters Hill	Sydney	NSW	2042	Australia	(02) 555-5914	(02) 555-4873	Gday Mate (on the World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#
25	Ma Maison	Jean-Guy Lauzon	Marketing Manager	2960 Rue St. Laurent	MontrÃ©al	QuÃ©bec	H1J 1C3	Canada	(514) 555-9022	NULL	NULL
26	Pasta Buttini s.r.l.	Giovanni Giudici	Order Administrator	Via dei Gelsomini 153	Salerno	NULL	84100	Italy	(089) 6547665	(089) 6547667	NULL
27	Escargots Nouveaux	Marie Delamare	Sales Manager	22 rue H. Voiron	Montceau	NULL	71300	France	85.57.00.07	NULL	NULL
28	Gai pÃ¢turage	Eliane Noz	Sales Representative	Bat. B 3 rue des Alpes	Annecy	NULL	74000	France	38.76.98.06	38.76.98.58	NULL
29	ForÃªts dÃ©rables	Chantal Goulet	Accounting Manager	148 rue Chasseur	Ste-Hyacinthe	QuÃ©bec	J2S 7S8	Canada	(514) 555-2955	(514) 555-2921	NULL
\.


--
-- Data for Name: territories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.territories (territoryid, territorydescription, regionid) FROM stdin;
1581	Westboro	1
1730	Bedford	1
1833	Georgetow	1
2116	Boston	1
2139	Cambridge	1
2184	Braintree	1
2903	Providence	1
3049	Hollis	3
3801	Portsmouth	3
6897	Wilton	1
7960	Morristown	1
8837	Edison	1
10019	NewYork	1
10038	NewYork	1
11747	Mellvile	1
14450	Fairport	1
19428	Philadelphia	3
19713	Neward	1
20852	Rockville	1
27403	Greensboro	1
27511	Cary	1
29202	Columbia	4
30346	Atlanta	4
31406	Savannah	4
32859	Orlando	4
33607	Tampa	4
40222	Louisville	1
44122	Beachwood	3
45839	Findlay	3
48075	Southfield	3
48084	Troy	3
48304	BloomfieldHills	3
53404	Racine	3
55113	Roseville	3
55439	Minneapolis	3
60179	HoffmanEstates	2
60601	Chicago	2
72716	Bentonville	4
75234	Dallas	4
78759	Austin	4
80202	Denver	2
80909	ColoradoSprings	2
85014	Phoenix	2
85251	Scottsdale	2
90405	SantaMonica	2
94025	MenloPark	2
94105	SanFrancisco	2
95008	Campbell	2
95054	SantaClara	2
95060	SantaCruz	2
98004	Bellevue	2
98052	Redmond	2
98104	Seattle	2
\.


--
-- Name: categories_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_categoryid_seq', 1, false);


--
-- Name: employee_territories_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_territories_employeeid_seq', 1, false);


--
-- Name: employees_employeeid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_employeeid_seq', 1, false);


--
-- Name: orderdetails_orderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderdetails_orderdetailid_seq', 1, false);


--
-- Name: orders_orderid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_orderid_seq', 1, false);


--
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_productid_seq', 1, false);


--
-- Name: regions_regionid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_regionid_seq', 1, false);


--
-- Name: shippers_shipperid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shippers_shipperid_seq', 1, false);


--
-- Name: suppliers_supplierid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.suppliers_supplierid_seq', 1, false);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customerid);


--
-- Name: employee_territories employee_territories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_territories
    ADD CONSTRAINT employee_territories_pkey PRIMARY KEY (employeeid, territoryid);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (employeeid);


--
-- Name: orderdetails orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (orderdetailid, productid);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (regionid);


--
-- Name: shippers shippers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (shipperid);


--
-- Name: suppliers suppliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplierid);


--
-- Name: territories territories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT territories_pkey PRIMARY KEY (territoryid);


--
-- Name: employee_territories employee_territories_territoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_territories
    ADD CONSTRAINT employee_territories_territoryid_fkey FOREIGN KEY (territoryid) REFERENCES public.territories(territoryid);


--
-- Name: orderdetails orderdetails_orderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid);


--
-- Name: orderdetails orderdetails_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid);


--
-- Name: orders orders_customerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(customerid);


--
-- Name: orders orders_employeeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employees(employeeid);


--
-- Name: orders orders_shipvia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shipvia_fkey FOREIGN KEY (shipvia) REFERENCES public.shippers(shipperid);


--
-- Name: products products_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.categories(categoryid);


--
-- Name: products products_supplierid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_supplierid_fkey FOREIGN KEY (supplierid) REFERENCES public.suppliers(supplierid);


--
-- Name: territories territories_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.territories
    ADD CONSTRAINT territories_regionid_fkey FOREIGN KEY (regionid) REFERENCES public.regions(regionid);


--
-- PostgreSQL database dump complete
--

