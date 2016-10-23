--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.0
-- Dumped by pg_dump version 9.6.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: actuals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE actuals (
    employee integer NOT NULL,
    hours numeric,
    day date,
    charge_number character(21)
);


ALTER TABLE actuals OWNER TO postgres;

--
-- Name: actuals_employee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE actuals_employee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE actuals_employee_seq OWNER TO postgres;

--
-- Name: actuals_employee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE actuals_employee_seq OWNED BY actuals.employee;


--
-- Name: charge_numbers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE charge_numbers (
    id character(21) NOT NULL,
    job_id integer NOT NULL
);


ALTER TABLE charge_numbers OWNER TO postgres;

--
-- Name: charge_numbers_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE charge_numbers_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE charge_numbers_job_id_seq OWNER TO postgres;

--
-- Name: charge_numbers_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE charge_numbers_job_id_seq OWNED BY charge_numbers.job_id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE employees (
    id integer NOT NULL,
    name text,
    rate money
);


ALTER TABLE employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: forecast; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE forecast (
    employee integer NOT NULL,
    hours numeric,
    day date,
    charge_number character(21)
);


ALTER TABLE forecast OWNER TO postgres;

--
-- Name: forecast_employee_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE forecast_employee_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE forecast_employee_seq OWNER TO postgres;

--
-- Name: forecast_employee_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE forecast_employee_seq OWNED BY forecast.employee;


--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE jobs (
    id integer NOT NULL,
    name text
);


ALTER TABLE jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE jobs_id_seq OWNED BY jobs.id;


--
-- Name: actuals employee; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actuals ALTER COLUMN employee SET DEFAULT nextval('actuals_employee_seq'::regclass);


--
-- Name: charge_numbers job_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY charge_numbers ALTER COLUMN job_id SET DEFAULT nextval('charge_numbers_job_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: forecast employee; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forecast ALTER COLUMN employee SET DEFAULT nextval('forecast_employee_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobs ALTER COLUMN id SET DEFAULT nextval('jobs_id_seq'::regclass);


--
-- Data for Name: actuals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY actuals (employee, hours, day, charge_number) FROM stdin;
1	4	2016-10-22	NDP000000000000000001
1	4	2016-10-22	NSETA0000000000000003
2	8	2016-10-22	NSETA0000000000000003
1	8	2016-09-22	NDP000000000000000001
\.


--
-- Name: actuals_employee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('actuals_employee_seq', 1, false);


--
-- Data for Name: charge_numbers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY charge_numbers (id, job_id) FROM stdin;
NDP000000000000000001	1
NDP000000000000000002	1
NDP000000000000000003	1
NSETA0000000000000001	2
NSETA0000000000000002	2
NSETA0000000000000003	2
\.


--
-- Name: charge_numbers_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('charge_numbers_job_id_seq', 1, false);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employees (id, name, rate) FROM stdin;
1	Aaron Donovan	$85.00
2	John Smith	$110.00
3	Adam Johnson	$115.00
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employees_id_seq', 3, true);


--
-- Data for Name: forecast; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY forecast (employee, hours, day, charge_number) FROM stdin;
\.


--
-- Name: forecast_employee_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('forecast_employee_seq', 1, false);


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY jobs (id, name) FROM stdin;
1	DPP
2	SETA
\.


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('jobs_id_seq', 2, true);


--
-- Name: charge_numbers charge_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY charge_numbers
    ADD CONSTRAINT charge_numbers_pkey PRIMARY KEY (id);


--
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: actuals actuals_charge_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actuals
    ADD CONSTRAINT actuals_charge_number_fkey FOREIGN KEY (charge_number) REFERENCES charge_numbers(id);


--
-- Name: actuals actuals_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY actuals
    ADD CONSTRAINT actuals_employee_fkey FOREIGN KEY (employee) REFERENCES employees(id);


--
-- Name: charge_numbers charge_numbers_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY charge_numbers
    ADD CONSTRAINT charge_numbers_job_id_fkey FOREIGN KEY (job_id) REFERENCES jobs(id);


--
-- Name: forecast forecast_charge_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forecast
    ADD CONSTRAINT forecast_charge_number_fkey FOREIGN KEY (charge_number) REFERENCES charge_numbers(id);


--
-- Name: forecast forecast_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY forecast
    ADD CONSTRAINT forecast_employee_fkey FOREIGN KEY (employee) REFERENCES employees(id);


--
-- PostgreSQL database dump complete
--

