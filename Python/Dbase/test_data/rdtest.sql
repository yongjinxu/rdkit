--
-- PostgreSQL database dump
--

\connect - sysdba

SET search_path = public, pg_catalog;

--
-- TOC entry 2 (OID 18021)
-- Name: ten_elements; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE ten_elements (
    id integer,
    val integer
);


--
-- TOC entry 3 (OID 18077)
-- Name: ten_elements_dups; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE ten_elements_dups (
    id integer,
    val integer
);


--
-- TOC entry 4 (OID 18479)
-- Name: simple_mols; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE simple_mols (
    smiles character varying(15),
    id character varying(7)
);


--
-- TOC entry 5 (OID 18493)
-- Name: simple_mols_fps; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE simple_mols_fps (
    id character varying(7) NOT NULL,
    autofragmentfp bytea
);


--
-- TOC entry 6 (OID 18514)
-- Name: simple_combined; Type: VIEW; Schema: public; Owner: sysdba
--

CREATE VIEW simple_combined AS
    SELECT mols.id, mols.smiles, fps.autofragmentfp FROM (simple_mols mols JOIN simple_mols_fps fps ON ((fps.id = mols.id)));


--
-- TOC entry 7 (OID 19047)
-- Name: ferro_quant; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE ferro_quant (
    compound character varying(7),
    max_ded integer,
    elconc integer,
    atvol integer,
    has3d integer,
    has4d integer,
    has5d integer,
    isferromagnetic integer
);


--
-- TOC entry 8 (OID 19144)
-- Name: ferro_noquant; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE ferro_noquant (
    compound character varying(7),
    elconc double precision,
    atvol double precision,
    has3d integer,
    has4d integer,
    has5d integer,
    max_ded double precision,
    isferromagnetic integer
);


--
-- TOC entry 9 (OID 19249)
-- Name: ferro_noquant_realact; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE ferro_noquant_realact (
    compound character varying(7),
    elconc double precision,
    atvol double precision,
    has3d integer,
    has4d integer,
    has5d integer,
    max_ded double precision,
    isferromagnetic double precision
);


--
-- TOC entry 10 (OID 19368)
-- Name: basic_2class; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE basic_2class (
    id character varying(5),
    val double precision,
    act integer
);


--
-- TOC entry 11 (OID 19382)
-- Name: float_2class; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE float_2class (
    id character varying(5),
    val double precision,
    act double precision
);


--
-- TOC entry 12 (OID 58741)
-- Name: bit_ensemble_test; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE bit_ensemble_test (
    id character varying(10),
    bit_1 smallint,
    bit_3 smallint,
    bit_4 smallint,
    act integer
);


--
-- TOC entry 13 (OID 160034)
-- Name: test_view; Type: VIEW; Schema: public; Owner: sysdba
--

CREATE VIEW test_view AS
    SELECT ten_elements.val, ten_elements.id FROM ten_elements;


--
-- TOC entry 14 (OID 160035)
-- Name: new_table; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE new_table (
    id integer,
    val1 integer,
    val2 integer
);


--
-- TOC entry 15 (OID 160047)
-- Name: fromtext; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE fromtext (
    int_col integer,
    floatcol double precision,
    strcol character varying(4)
);


--
-- TOC entry 16 (OID 160052)
-- Name: fromtext2; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE fromtext2 (
    int_col integer,
    floatcol double precision,
    strcol character varying(4)
);


--
-- TOC entry 17 (OID 160058)
-- Name: storagetest; Type: TABLE; Schema: public; Owner: sysdba
--

CREATE TABLE storagetest (
    id character varying(32) NOT NULL,
    label character varying(40),
    val integer
);


--
-- Data for TOC entry 20 (OID 18021)
-- Name: ten_elements; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY ten_elements (id, val) FROM stdin;
0	11
2	21
4	31
6	41
8	51
10	61
12	71
14	81
16	91
18	101
\.


--
-- Data for TOC entry 21 (OID 18077)
-- Name: ten_elements_dups; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY ten_elements_dups (id, val) FROM stdin;
0	11
0	11
2	21
2	21
4	31
4	31
6	41
6	41
8	51
8	51
10	61
10	61
12	71
12	71
14	81
14	81
16	91
16	91
18	101
18	101
\.


--
-- Data for TOC entry 22 (OID 18479)
-- Name: simple_mols; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY simple_mols (smiles, id) FROM stdin;
COC	ether-1
CC(=O)O	acid-1
c1ccccc1	arom-1
CCOC	ether-2
CCC(=O)O	acid-2
Cc1ccccc1	arom-2
CCOCC	ether-3
CC(C)C(=O)O	acid-3
Cc1cc(C)ccc1	arom-3
CCCOCC	ether-4
CCC(C)C(=O)O	acid-4
Cc1cc(C)cc(C)c1	arom-4
\.


--
-- Data for TOC entry 23 (OID 18493)
-- Name: simple_mols_fps; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY simple_mols_fps (id, autofragmentfp) FROM stdin;
ether-1	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(U\\025����\\200\\000\\000\\000\\010\\000\\000\\000@6\\022\\002\\014\\036\\016,\\002tRq\\002.
acid-1	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(U&����\\200\\000\\000\\000\\031\\000\\000\\000\\002(\\000\\006\\006\\000\\014\\004\\000\\000\\012\\012\\006\\000\\022\\020\\004\\026\\006\\000\\004\\020\\010\\000\\000\\020tRq\\002.
arom-1	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(U$����\\200\\000\\000\\000\\027\\000\\000\\000:\\020\\000\\010\\000\\024\\026\\006\\010\\002\\014\\002\\000\\006\\010\\014\\012\\000\\000\\004\\004\\000\\010\\004tRq\\002.
ether-2	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(U ����\\200\\000\\000\\000\\023\\000\\000\\000(\\026\\016\\002\\000\\014\\022\\022\\000\\000\\014\\004\\000\\026\\010\\004\\036\\002\\010\\002tRq\\002.
acid-2	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(U2����\\200\\000\\000\\000%\\000\\000\\000\\002\\010\\022\\006\\002\\000\\006\\004\\000\\000\\006\\004\\004\\000\\000\\012\\010\\000\\006\\000\\022\\000\\016\\004\\020\\002\\000\\002\\002\\000\\004\\004\\000\\010\\010\\000\\000\\020tRq\\002.
arom-2	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(UF����\\200\\000\\000\\0009\\000\\000\\000\\002\\000\\016\\016\\000\\006\\012\\010\\000\\002\\000\\000\\006\\000\\000\\000\\004\\000\\000\\000\\006\\000\\016\\000\\000\\000\\004\\000\\000\\004\\000\\002\\002\\002\\002\\000\\002\\000\\000\\000\\002\\010\\004\\000\\000\\002\\000\\010\\000\\000\\000\\002\\000\\002\\000\\010\\000\\002tRq\\002.
ether-3	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(U"����\\200\\000\\000\\000\\025\\000\\000\\000\\030\\016\\026\\016\\002\\000\\014\\022\\022\\000\\000\\014\\004\\000\\026\\010\\000\\002\\036\\002\\010\\002tRq\\002.
acid-3	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(U<����\\200\\000\\000\\000/\\000\\000\\000\\002\\010\\022\\006\\002\\000\\000\\004\\004\\000\\000\\002\\002\\004\\000\\002\\000\\000\\000\\010\\004\\002\\000\\000\\004\\000\\016\\002\\000\\016\\004\\020\\002\\000\\002\\002\\000\\004\\004\\000\\004\\002\\010\\000\\000\\010\\000\\004tRq\\002.
arom-3	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(Ud����\\000\\001\\000\\000W\\000\\000\\000\\004\\016\\030\\000\\002\\004\\006\\000\\004\\000\\000\\006\\000\\002\\004\\000\\014\\016\\000\\000\\002\\000\\000\\000\\000\\004\\004\\012\\000\\002\\004\\014\\004\\000\\000\\002\\000\\010\\000\\002\\002\\000\\016\\000\\004\\014\\022\\000\\004\\000\\016\\006\\004\\010\\002\\002\\006\\000\\000\\004\\016\\002\\002\\004\\000\\006\\000\\000\\000\\002\\002\\002\\004\\000\\000\\000\\002\\020\\000\\000\\000\\000\\004\\006\\012\\000\\010\\004tRq\\002.
ether-4	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(U,����\\200\\000\\000\\000\\037\\000\\000\\000\\000\\012\\012\\006\\006\\014\\010\\016\\002\\000\\014\\010\\010\\020\\000\\000\\000\\014\\004\\000\\020\\002\\000\\002\\004\\000\\002\\004\\030\\002\\010\\002tRq\\002.
acid-4	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(UO����\\200\\000\\000\\000B\\000\\000\\000\\000\\000\\010\\000\\004\\012\\000\\004\\002\\000\\000\\004\\002\\000\\000\\000\\002\\000\\000\\000\\002\\000\\002\\000\\000\\000\\004\\002\\004\\002\\000\\000\\002\\000\\000\\002\\002\\000\\004\\002\\000\\010\\000\\002\\004\\000\\002\\012\\002\\000\\002\\002\\000\\004\\004\\000\\002\\000\\000\\000\\010\\000\\000\\004\\002\\000\\004tRq\\002.
arom-4	cDataStructs.cDataStructs\\012ExplicitBitVect\\012q\\001(Uh����\\000\\001\\000\\000[\\000\\000\\000\\004\\016\\030\\000\\002\\004\\006\\000\\004\\000\\000\\006\\000\\002\\004\\000\\014\\016\\000\\000\\002\\000\\000\\000\\000\\004\\004\\012\\000\\002\\004\\014\\004\\000\\000\\002\\000\\010\\000\\002\\002\\000\\016\\000\\004\\014\\022\\000\\000\\002\\000\\016\\006\\004\\010\\002\\002\\006\\000\\000\\004\\016\\002\\002\\004\\000\\006\\000\\000\\000\\002\\000\\000\\002\\004\\000\\000\\000\\002\\004\\012\\000\\000\\000\\000\\004\\000\\004\\012\\000\\010\\004tRq\\002.
\.


--
-- Data for TOC entry 24 (OID 19047)
-- Name: ferro_quant; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY ferro_quant (compound, max_ded, elconc, atvol, has3d, has4d, has5d, isferromagnetic) FROM stdin;
AlFe3	2	1	1	1	0	0	1
Co2Nb	1	0	2	1	1	0	0
Co2Y	1	0	2	1	1	0	0
Co3Ir	1	2	1	1	0	1	1
Co3Ir7	1	2	1	1	0	1	0
Co3Pt	1	2	1	1	0	1	1
Co3Rh	1	2	1	1	1	0	1
Co4Os	1	2	0	1	0	1	1
Co4Rh	1	2	0	1	1	0	1
Co4Ru	1	2	0	1	1	0	1
CoHf	1	0	2	1	0	1	0
CoIr	1	1	1	1	0	1	0
CoOs	1	1	1	1	0	1	0
CoRu	1	1	1	1	1	0	0
CoSc	1	0	2	1	0	0	0
CoTi	1	0	1	1	0	0	0
CoTi2	1	0	2	1	0	0	0
CoV3	1	0	1	1	0	0	0
CoZr	1	0	2	1	1	0	0
Cr	2	0	1	1	0	0	0
Cr2Hf	2	0	2	1	0	1	0
Cr2Nb	2	0	2	1	1	0	0
Cr2Ta	2	0	2	1	0	1	0
Cr2Ti	2	0	2	1	0	0	0
Cr2Zr	2	0	2	1	1	0	0
Cr3Ir	2	0	1	1	0	1	0
Cr3Os	2	0	1	1	0	1	0
Cr3Pt	2	0	1	1	0	1	0
Cr3Rh	2	0	1	1	1	0	0
Cr3Ru	2	0	1	1	1	0	0
CrPt3	2	1	2	1	0	1	1
CrPt3	2	1	2	1	0	1	1
CrPt4	2	1	2	1	0	1	1
Fe	2	1	1	1	0	0	1
Fe13Pd7	2	1	1	1	1	0	1
Fe13Pt7	2	1	1	1	0	1	1
Fe16Rh	2	1	1	1	1	0	1
Fe32Pt	2	1	1	1	0	1	1
Fe3Pd	2	1	1	1	1	0	1
Fe3Pt	2	1	1	1	0	1	1
Fe3Pt17	2	1	2	1	0	1	1
Fe3Rh7	2	1	1	1	1	0	1
Fe9Pt	2	1	1	1	0	1	1
Fe9Rh	2	1	1	1	1	0	1
FeCo	2	2	0	1	0	0	1
FeNi3	2	2	0	1	0	0	1
FePd26	2	1	2	1	1	0	1
FePt	2	1	1	1	0	1	1
FePt3	2	1	1	1	0	1	1
FeRh	2	1	1	1	1	0	1
HfIr3	0	0	2	0	0	1	0
HfMo2	1	0	2	0	1	1	0
HfNi2	1	0	2	1	0	1	0
HfOs	1	0	2	0	0	1	0
HfPt	0	0	2	0	0	1	0
HfRh3	0	0	2	0	1	1	0
HfRu	1	0	2	0	1	1	0
HfTc	1	0	2	0	1	1	0
HfV2	1	0	2	1	0	1	0
HfW2	1	0	2	0	0	1	0
Ir	0	1	1	0	0	1	0
Ir2Sc	0	0	2	1	0	1	0
Ir2Y	0	0	2	0	1	1	0
Ir2Zr	0	0	2	0	1	1	0
Ir3Nb	1	0	2	0	1	1	0
Ir3Ta	0	0	2	0	0	1	0
Ir3Ti	0	0	1	1	0	1	0
Ir3V	1	1	1	1	0	1	0
IrNb3	1	0	2	0	1	1	0
IrSc	0	0	2	1	0	1	0
IrTi3	0	0	2	1	0	1	0
IrV3	1	0	1	1	0	1	0
IrY	0	0	2	0	1	1	0
IrZr	0	0	2	0	1	1	0
Mn	2	1	1	1	0	0	1
Mn2Pt3	2	1	2	1	0	1	1
Mn3Pt	2	1	1	1	0	1	1
MnNi	2	1	1	1	0	0	1
MnNi3	2	2	0	1	0	0	1
MnPd	2	1	2	1	1	0	1
MnPd3	2	1	1	1	1	0	1
MnPt	2	1	2	1	0	1	1
MnPt3	2	1	2	1	0	1	1
Mo	1	0	2	0	1	0	0
Nb	1	0	2	0	1	0	0
Ni	1	2	0	1	0	0	1
NiPd	1	2	1	1	1	0	1
NiPt	1	2	1	1	0	1	1
NiRh	1	2	1	1	1	0	0
Pd	0	1	2	0	1	0	0
Pt	0	1	2	0	0	1	0
Rh	0	1	1	0	1	0	0
Ta	0	0	2	0	0	1	0
V	1	0	1	1	0	0	0
W	1	0	2	0	0	1	0
\.


--
-- Data for TOC entry 25 (OID 19144)
-- Name: ferro_noquant; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY ferro_noquant (compound, elconc, atvol, has3d, has4d, has5d, max_ded, isferromagnetic) FROM stdin;
FeCo	0.734059888337	11.579436685	1	0	0	3.53454303741	1
Ni	0.917132325319	10.903552	1	0	0	1.89935600758	1
Fe	0.676821728076	11.8199515	1	0	0	3.53454303741	1
AlFe3	0.55352822994	12.1945	1	0	0	3.53454303741	1
Mn	0.592219012066	11.8199515	1	0	0	4.20857000351	1
FeNi3	0.847581242231	11.2083650825	1	0	0	3.53454303741	1
Fe3Pd	0.610901434436	13.9138648575	1	1	0	3.53454303741	1
HfV2	0.139474782705	33.458855975	1	0	1	2.28774404526	0
Pd	0.679533993934	14.71596725	0	1	0	0	0
FePt3	0.654602335855	14.5126277125	1	0	1	3.53454303741	1
CrPt3	0.619669341609	14.523874905	1	0	1	3.67481803894	1
Fe3Pt	0.655167614325	12.97377925	1	0	1	3.53454303741	1
Cr3Rh	0.528844066155	12.76368675	1	1	0	3.67481803894	1
Pt	0.66405154315	15.059072	0	0	1	0.708856999874	0
Cr3Ir	0.525127756509	12.8540148875	1	0	1	3.67481803894	0
V	0.363060641874	13.771804	1	0	0	2.28774404526	0
Cr3Ru	0.507626409314	12.80469235	1	1	0	3.67481803894	0
Co2Nb	0.295973106247	25.9032544	1	1	0	2.7561609745	0
CoTi2	0.223081584245	25.4017680833	1	0	0	2.7561609745	0
Cr3Os	0.506002525507	12.8457856875	1	0	1	3.67481803894	0
CoTi	0.483896935837	13.43261244	1	0	0	2.7561609745	0
Nb	0.278264741075	17.9685	0	1	0	2.32224798203	0
Cr3Pt	0.537319075144	13.027640975	1	0	1	3.67481803894	0
Cr2Nb	0.202560378073	27.9751979167	1	1	0	3.67481803894	0
Rh	0.656072313748	13.718	0	1	0	1.34492301941	0
IrTi3	0.334192112374	15.7095269625	1	0	1	1.65175902843	0
Ta	0.27575031592	18.1323455	0	0	1	1.56566202641	0
CoZr	0.398968508292	16.29201269	1	1	0	2.7561609745	0
Co2Y	0.223929923609	31.2597793417	1	1	0	2.7561609745	0
Cr2Ta	0.20160161711	28.1082401417	1	0	1	3.67481803894	0
Ir2Sc	0.211811319911	33.0482809083	1	0	1	1.65175902843	0
CoHf	0.410425114374	15.83723747	1	0	1	2.7561609745	0
Ir2Zr	0.220813826304	33.210480775	0	1	1	1.65175902843	0
Ir	0.635782877604	14.155776	0	0	1	1.65175902843	0
IrNb3	0.354710173223	16.9152182625	0	1	1	2.32224798203	0
IrV3	0.437299330113	13.7205789875	1	0	1	2.28774404526	0
IrZr	0.355888707002	18.264136715	0	1	1	1.65175902843	0
CoV3	0.469782020722	12.7718808625	1	0	0	2.7561609745	0
HfRh3	0.518200999109	14.9555867575	0	1	1	1.34492301941	0
HfIr3	0.512284018996	15.128326695	0	0	1	1.65175902843	0
HfTc	0.314593269655	17.4828915	0	1	1	2.99570298195	0
HfPt	0.415451631385	16.8491335	0	0	1	1.00957000256	0
Ir3Ti	0.545346664721	14.2111440325	1	0	1	1.65175902843	0
Cr	0.502346965021	11.943936	1	0	0	3.67481803894	0
HfNi2	0.291468422875	27.4472271167	1	0	1	1.89935600758	0
Mo	0.38392782157	15.6279375	0	1	0	2.92410993576	0
Cr2Zr	0.170400540374	31.2988052833	1	1	0	3.67481803894	0
Ir2Y	0.197054630259	35.5231439667	0	1	1	1.65175902843	0
Cr2Hf	0.175826907904	30.332862	1	0	1	3.67481803894	0
Ir3V	0.577685281306	13.8483708325	1	0	1	2.28774404526	0
HfMo2	0.14900548029	35.7928669667	0	1	1	2.92410993576	0
Cr2Ti	0.190316268905	28.023528225	1	0	0	3.67481803894	0
CoSc	0.385761868518	15.553636815	1	0	0	2.7561609745	0
W	0.380294459465	15.777248	0	0	1	2.13846206665	0
HfW2	0.146370867336	36.43712325	0	0	1	2.13846206665	0
IrY	0.305312436393	19.652	0	1	1	1.65175902843	0
Ir3Nb	0.542371383308	14.75004074	0	1	1	2.32224798203	0
Ir3Ta	0.545307648931	14.670617615	0	0	1	1.65175902843	0
HfRu	0.357760253062	16.771007815	0	1	1	1.89930105209	0
IrSc	0.364158701622	16.47633291	1	0	1	1.65175902843	0
HfOs	0.353141211025	16.99037046	0	0	1	2.19160604477	0
CoPt	0.711237553343	13.357	1	0	1	2.7561609745	1
MnNi	0.715485369808	11.88004725	1	0	0	4.20857000351	1
MnPd	0.57281499373	14.8389970462	1	1	0	4.20857000351	1
MnPt	0.579019073569	14.68	1	0	1	4.20857000351	1
NiPt	0.762940221016	13.1071868078	1	0	1	1.89935600758	1
CoPt3	0.693630451435	14.0564762977	1	0	1	2.7561609745	1
Cr3Pt	0.52048373619	13.4490273437	1	0	1	3.67481803894	1
CrPt3	0.619669341641	14.5238749043	1	0	1	3.67481803894	1
FePt	0.63528643082	14.1668380803	1	0	1	3.53454303741	1
Mn3Pt	0.550484678757	14.0785026343	1	0	1	4.20857000351	1
MnNi3	0.797682514859	11.5960922143	1	0	0	4.20857000351	1
MnPt3	0.627116911982	14.7500407392	1	0	1	4.20857000351	1
Cr4Pt	0.521967101489	13.027640977	1	0	1	3.67481803894	1
FeRh	0.636606657779	13.3520438345	1	1	0	3.53454303741	1
Co3Pt	0.749745284698	12.337523408	1	0	1	2.7561609745	1
Co4Os	0.773638394777	11.37482325	1	0	1	2.7561609745	1
Co4Ru	0.767173483555	11.470678	1	1	0	2.7561609745	1
CoRh	0.728289934974	12.35771575	1	1	0	2.7561609745	1
CrPt	0.529327190925	15.113525504	1	0	1	3.67481803894	1
CrPt4	0.631970074197	14.557651344	1	0	1	3.67481803894	1
Fe13Pd7	0.641773222364	13.5561904063	1	1	0	3.53454303741	1
Fe13Pt7	0.644834950054	13.4918245347	1	0	1	3.53454303741	1
Fe3Pt17	0.657625302294	14.7500407392	1	0	1	3.53454303741	1
Fe3Rh7	0.648586371291	13.4137878702	1	1	0	3.53454303741	1
FePd26	0.675906847437	14.6853460112	1	1	0	3.53454303741	1
Mn2Pt3	0.59614900293	14.761410246	1	0	1	4.20857000351	1
MnPd3	0.692173333021	13.3637046657	1	1	0	4.20857000351	1
NiPd	0.752482590563	13.289344	1	1	0	1.89935600758	1
NiRh	0.759710124228	12.5047695128	1	1	0	1.89935600758	0
Fe2Hf	0.46150987372	14.4453391927	1	0	1	3.53454303741	1
Fe2Zr	0.449503092939	14.8311919793	1	1	0	3.53454303741	1
Co3Ir	0.750380223096	11.9939195131	1	0	1	2.7561609745	1
Co3Ir7	0.744357269808	12.0909680943	1	0	1	2.7561609745	0
Co3Rh	0.750380223096	11.9939195131	1	1	0	2.7561609745	1
Co4Rh	0.772980027292	11.6432503845	1	1	0	2.7561609745	1
CoIr	0.720410936244	12.4928697598	1	0	1	2.7561609745	0
CoOs	0.680645456475	12.4881462429	1	0	1	2.7561609745	0
CoRu	0.697198731059	12.1916458269	1	1	0	2.7561609745	0
Fe16Rh	0.668851387723	12.0487505556	1	1	0	3.53454303741	1
Fe32Pt	0.672765581933	11.9812996935	1	0	1	3.53454303741	1
Fe9Pt	0.662584205604	12.3757854936	1	0	1	3.53454303741	1
Fe9Rh	0.664715105171	12.1856716313	1	1	0	3.53454303741	1
\.


--
-- Data for TOC entry 26 (OID 19249)
-- Name: ferro_noquant_realact; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY ferro_noquant_realact (compound, elconc, atvol, has3d, has4d, has5d, max_ded, isferromagnetic) FROM stdin;
FeCo	0.734059888337	11.579436685	1	0	0	3.53454303741	1.1
Ni	0.917132325319	10.903552	1	0	0	1.89935600758	1.1
Fe	0.676821728076	11.8199515	1	0	0	3.53454303741	1.1
AlFe3	0.55352822994	12.1945	1	0	0	3.53454303741	1.1
Mn	0.592219012066	11.8199515	1	0	0	4.20857000351	1.1
FeNi3	0.847581242231	11.2083650825	1	0	0	3.53454303741	1.1
Fe3Pd	0.610901434436	13.9138648575	1	1	0	3.53454303741	1.1
HfV2	0.139474782705	33.458855975	1	0	1	2.28774404526	0.1
Pd	0.679533993934	14.71596725	0	1	0	0	0.1
FePt3	0.654602335855	14.5126277125	1	0	1	3.53454303741	1.1
CrPt3	0.619669341609	14.523874905	1	0	1	3.67481803894	1.1
Fe3Pt	0.655167614325	12.97377925	1	0	1	3.53454303741	1.1
Cr3Rh	0.528844066155	12.76368675	1	1	0	3.67481803894	1.1
Pt	0.66405154315	15.059072	0	0	1	0.708856999874	0.1
Cr3Ir	0.525127756509	12.8540148875	1	0	1	3.67481803894	0.1
V	0.363060641874	13.771804	1	0	0	2.28774404526	0.1
Cr3Ru	0.507626409314	12.80469235	1	1	0	3.67481803894	0.1
Co2Nb	0.295973106247	25.9032544	1	1	0	2.7561609745	0.1
CoTi2	0.223081584245	25.4017680833	1	0	0	2.7561609745	0.1
Cr3Os	0.506002525507	12.8457856875	1	0	1	3.67481803894	0.1
CoTi	0.483896935837	13.43261244	1	0	0	2.7561609745	0.1
Nb	0.278264741075	17.9685	0	1	0	2.32224798203	0.1
Cr3Pt	0.537319075144	13.027640975	1	0	1	3.67481803894	0.1
Cr2Nb	0.202560378073	27.9751979167	1	1	0	3.67481803894	0.1
Rh	0.656072313748	13.718	0	1	0	1.34492301941	0.1
IrTi3	0.334192112374	15.7095269625	1	0	1	1.65175902843	0.1
Ta	0.27575031592	18.1323455	0	0	1	1.56566202641	0.1
CoZr	0.398968508292	16.29201269	1	1	0	2.7561609745	0.1
Co2Y	0.223929923609	31.2597793417	1	1	0	2.7561609745	0.1
Cr2Ta	0.20160161711	28.1082401417	1	0	1	3.67481803894	0.1
Ir2Sc	0.211811319911	33.0482809083	1	0	1	1.65175902843	0.1
CoHf	0.410425114374	15.83723747	1	0	1	2.7561609745	0.1
Ir2Zr	0.220813826304	33.210480775	0	1	1	1.65175902843	0.1
Ir	0.635782877604	14.155776	0	0	1	1.65175902843	0.1
IrNb3	0.354710173223	16.9152182625	0	1	1	2.32224798203	0.1
IrV3	0.437299330113	13.7205789875	1	0	1	2.28774404526	0.1
IrZr	0.355888707002	18.264136715	0	1	1	1.65175902843	0.1
CoV3	0.469782020722	12.7718808625	1	0	0	2.7561609745	0.1
HfRh3	0.518200999109	14.9555867575	0	1	1	1.34492301941	0.1
HfIr3	0.512284018996	15.128326695	0	0	1	1.65175902843	0.1
HfTc	0.314593269655	17.4828915	0	1	1	2.99570298195	0.1
HfPt	0.415451631385	16.8491335	0	0	1	1.00957000256	0.1
Ir3Ti	0.545346664721	14.2111440325	1	0	1	1.65175902843	0.1
Cr	0.502346965021	11.943936	1	0	0	3.67481803894	0.1
HfNi2	0.291468422875	27.4472271167	1	0	1	1.89935600758	0.1
Mo	0.38392782157	15.6279375	0	1	0	2.92410993576	0.1
Cr2Zr	0.170400540374	31.2988052833	1	1	0	3.67481803894	0.1
Ir2Y	0.197054630259	35.5231439667	0	1	1	1.65175902843	0.1
Cr2Hf	0.175826907904	30.332862	1	0	1	3.67481803894	0.1
Ir3V	0.577685281306	13.8483708325	1	0	1	2.28774404526	0.1
HfMo2	0.14900548029	35.7928669667	0	1	1	2.92410993576	0.1
Cr2Ti	0.190316268905	28.023528225	1	0	0	3.67481803894	0.1
CoSc	0.385761868518	15.553636815	1	0	0	2.7561609745	0.1
W	0.380294459465	15.777248	0	0	1	2.13846206665	0.1
HfW2	0.146370867336	36.43712325	0	0	1	2.13846206665	0.1
IrY	0.305312436393	19.652	0	1	1	1.65175902843	0.1
Ir3Nb	0.542371383308	14.75004074	0	1	1	2.32224798203	0.1
Ir3Ta	0.545307648931	14.670617615	0	0	1	1.65175902843	0.1
HfRu	0.357760253062	16.771007815	0	1	1	1.89930105209	0.1
IrSc	0.364158701622	16.47633291	1	0	1	1.65175902843	0.1
HfOs	0.353141211025	16.99037046	0	0	1	2.19160604477	0.1
CoPt	0.711237553343	13.357	1	0	1	2.7561609745	1.1
MnNi	0.715485369808	11.88004725	1	0	0	4.20857000351	1.1
MnPd	0.57281499373	14.8389970462	1	1	0	4.20857000351	1.1
MnPt	0.579019073569	14.68	1	0	1	4.20857000351	1.1
NiPt	0.762940221016	13.1071868078	1	0	1	1.89935600758	1.1
CoPt3	0.693630451435	14.0564762977	1	0	1	2.7561609745	1.1
Cr3Pt	0.52048373619	13.4490273437	1	0	1	3.67481803894	1.1
CrPt3	0.619669341641	14.5238749043	1	0	1	3.67481803894	1.1
FePt	0.63528643082	14.1668380803	1	0	1	3.53454303741	1.1
Mn3Pt	0.550484678757	14.0785026343	1	0	1	4.20857000351	1.1
MnNi3	0.797682514859	11.5960922143	1	0	0	4.20857000351	1.1
MnPt3	0.627116911982	14.7500407392	1	0	1	4.20857000351	1.1
Cr4Pt	0.521967101489	13.027640977	1	0	1	3.67481803894	1.1
FeRh	0.636606657779	13.3520438345	1	1	0	3.53454303741	1.1
Co3Pt	0.749745284698	12.337523408	1	0	1	2.7561609745	1.1
Co4Os	0.773638394777	11.37482325	1	0	1	2.7561609745	1.1
Co4Ru	0.767173483555	11.470678	1	1	0	2.7561609745	1.1
CoRh	0.728289934974	12.35771575	1	1	0	2.7561609745	1.1
CrPt	0.529327190925	15.113525504	1	0	1	3.67481803894	1.1
CrPt4	0.631970074197	14.557651344	1	0	1	3.67481803894	1.1
Fe13Pd7	0.641773222364	13.5561904063	1	1	0	3.53454303741	1.1
Fe13Pt7	0.644834950054	13.4918245347	1	0	1	3.53454303741	1.1
Fe3Pt17	0.657625302294	14.7500407392	1	0	1	3.53454303741	1.1
Fe3Rh7	0.648586371291	13.4137878702	1	1	0	3.53454303741	1.1
FePd26	0.675906847437	14.6853460112	1	1	0	3.53454303741	1.1
Mn2Pt3	0.59614900293	14.761410246	1	0	1	4.20857000351	1.1
MnPd3	0.692173333021	13.3637046657	1	1	0	4.20857000351	1.1
NiPd	0.752482590563	13.289344	1	1	0	1.89935600758	1.1
NiRh	0.759710124228	12.5047695128	1	1	0	1.89935600758	0.1
Fe2Hf	0.46150987372	14.4453391927	1	0	1	3.53454303741	1.1
Fe2Zr	0.449503092939	14.8311919793	1	1	0	3.53454303741	1.1
Co3Ir	0.750380223096	11.9939195131	1	0	1	2.7561609745	1.1
Co3Ir7	0.744357269808	12.0909680943	1	0	1	2.7561609745	0.1
Co3Rh	0.750380223096	11.9939195131	1	1	0	2.7561609745	1.1
Co4Rh	0.772980027292	11.6432503845	1	1	0	2.7561609745	1.1
CoIr	0.720410936244	12.4928697598	1	0	1	2.7561609745	0.1
CoOs	0.680645456475	12.4881462429	1	0	1	2.7561609745	0.1
CoRu	0.697198731059	12.1916458269	1	1	0	2.7561609745	0.1
Fe16Rh	0.668851387723	12.0487505556	1	1	0	3.53454303741	1.1
Fe32Pt	0.672765581933	11.9812996935	1	0	1	3.53454303741	1.1
Fe9Pt	0.662584205604	12.3757854936	1	0	1	3.53454303741	1.1
Fe9Rh	0.664715105171	12.1856716313	1	1	0	3.53454303741	1.1
\.


--
-- Data for TOC entry 27 (OID 19368)
-- Name: basic_2class; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY basic_2class (id, val, act) FROM stdin;
id-1	1	0
id-2	23	1
id-3	4	0
id-4	6	1
id-5	321	0
id-6	885	1
id-7	252	0
id-8	1351.1	1
id-9	3215	0
id-10	2585	1
id-11	55	0
id-12	12	1
\.


--
-- Data for TOC entry 28 (OID 19382)
-- Name: float_2class; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY float_2class (id, val, act) FROM stdin;
id-1	1	-0.1
id-2	23	1.2
id-3	4	0.5
id-4	6	1.01
id-5	321	0.7
id-6	885	2
id-7	252	0
id-8	1351.1	1.1
id-9	3215	-0.9
id-10	2585	1.3
id-11	55	0.9
id-12	12	3
\.


--
-- Data for TOC entry 29 (OID 58741)
-- Name: bit_ensemble_test; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY bit_ensemble_test (id, bit_1, bit_3, bit_4, act) FROM stdin;
foo	0	0	0	1
foo	1	1	0	1
foo	1	0	1	1
foo	1	0	1	1
\.


--
-- Data for TOC entry 30 (OID 160035)
-- Name: new_table; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY new_table (id, val1, val2) FROM stdin;
0	1	0
1	2	2
2	3	4
3	4	6
4	5	8
5	6	10
6	7	12
7	8	14
8	9	16
9	10	18
\.


--
-- Data for TOC entry 31 (OID 160047)
-- Name: fromtext; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY fromtext (int_col, floatcol, strcol) FROM stdin;
1	1	1
2	2.4	1
3	3	fiib
\.


--
-- Data for TOC entry 32 (OID 160052)
-- Name: fromtext2; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY fromtext2 (int_col, floatcol, strcol) FROM stdin;
1	1	1
2	2.4	1
3	3	fiib
4	\N	foo
\.


--
-- Data for TOC entry 33 (OID 160058)
-- Name: storagetest; Type: TABLE DATA; Schema: public; Owner: sysdba
--

COPY storagetest (id, label, val) FROM stdin;
RDCmpd-000-001-1	label1	1
RDCmpd-000-002-2	label2	1
RDCmpd-000-010-1	label10	1
\.


--
-- TOC entry 18 (OID 18498)
-- Name: simple_mols_fps_pkey; Type: CONSTRAINT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY simple_mols_fps
    ADD CONSTRAINT simple_mols_fps_pkey PRIMARY KEY (id);


--
-- TOC entry 19 (OID 160060)
-- Name: storagetest_pkey; Type: CONSTRAINT; Schema: public; Owner: sysdba
--

ALTER TABLE ONLY storagetest
    ADD CONSTRAINT storagetest_pkey PRIMARY KEY (id);

