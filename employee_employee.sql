--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    id_department integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_department; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee_department (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.employee_department OWNER TO postgres;

--
-- Name: employee_hobby; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employee_hobby (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.employee_hobby OWNER TO postgres;

--
-- Name: have_hobby; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE have_hobby (
    id_hobby integer NOT NULL,
    id_employee integer NOT NULL
);


ALTER TABLE public.have_hobby OWNER TO postgres;

--
-- Name: is_boss; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE is_boss (
    id_employee integer NOT NULL,
    id_boss integer NOT NULL
);


ALTER TABLE public.is_boss OWNER TO postgres;

--
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee (id, first_name, last_name, id_department) FROM stdin;
1	carlos	delgado	\N
2	sara	ramirez	\N
3	wilmer	maduro	\N
4	lucy	montenegro	\N
\.


--
-- Data for Name: employee_department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee_department (id, name, description) FROM stdin;
11	ventas	v
22	rrhh	r
33	pedidos	p
44	soldaduras	s
55	soldadura	s
66	maquinas	m
77	computadoras	c
\.


--
-- Data for Name: employee_hobby; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employee_hobby (id, name, description) FROM stdin;
1	correr	correr
2	caminar	caminar
3	manejar	manejar
\.


--
-- Data for Name: have_hobby; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY have_hobby (id_hobby, id_employee) FROM stdin;
1	1
1	2
2	1
2	2
3	2
3	3
3	4
2	3
2	4
\.


--
-- Data for Name: is_boss; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY is_boss (id_employee, id_boss) FROM stdin;
\.


--
-- Name: employee_department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee_department
    ADD CONSTRAINT employee_department_pkey PRIMARY KEY (id);


--
-- Name: employee_hobby_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee_hobby
    ADD CONSTRAINT employee_hobby_pkey PRIMARY KEY (id);


--
-- Name: employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- Name: have_hobby_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY have_hobby
    ADD CONSTRAINT have_hobby_pkey PRIMARY KEY (id_hobby, id_employee);


--
-- Name: is_boss_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY is_boss
    ADD CONSTRAINT is_boss_pkey PRIMARY KEY (id_employee);


--
-- Name: employee_id_department_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_id_department_fkey FOREIGN KEY (id_department) REFERENCES employee_department(id);


--
-- Name: have_hobby_id_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY have_hobby
    ADD CONSTRAINT have_hobby_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES employee(id);


--
-- Name: have_hobby_id_hobby_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY have_hobby
    ADD CONSTRAINT have_hobby_id_hobby_fkey FOREIGN KEY (id_hobby) REFERENCES employee_hobby(id);


--
-- Name: is_boss_id_boss_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY is_boss
    ADD CONSTRAINT is_boss_id_boss_fkey FOREIGN KEY (id_boss) REFERENCES employee(id);


--
-- Name: is_boss_id_employee_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY is_boss
    ADD CONSTRAINT is_boss_id_employee_fkey FOREIGN KEY (id_employee) REFERENCES employee(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

