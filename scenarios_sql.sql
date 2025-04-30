--
-- PostgreSQL database dump
--

-- Dumped from database version 15.10 (Debian 15.10-1.pgdg120+1)
-- Dumped by pg_dump version 16.6

-- Started on 2025-03-07 16:40:02

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
-- TOC entry 223 (class 1259 OID 16449)
-- Name: scenarios; Type: TABLE; Schema: marble; Owner: postgres
--

CREATE TABLE marble.scenarios (
    id uuid DEFAULT marble.uuid_generate_v4() NOT NULL,
    org_id uuid NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    trigger_object_type character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    live_scenario_iteration_id uuid,
    decision_to_case_inbox_id uuid,
    decision_to_case_outcomes character varying(50)[],
    decision_to_case_workflow_type character varying(255) DEFAULT 'DISABLED'::character varying NOT NULL,
    decision_to_case_name_template json
);


ALTER TABLE marble.scenarios OWNER TO postgres;

--
-- TOC entry 3585 (class 0 OID 16449)
-- Dependencies: 223
-- Data for Name: scenarios; Type: TABLE DATA; Schema: marble; Owner: postgres
--

COPY marble.scenarios (id, org_id, name, description, trigger_object_type, created_at, deleted_at, live_scenario_iteration_id, decision_to_case_inbox_id, decision_to_case_outcomes, decision_to_case_workflow_type, decision_to_case_name_template) FROM stdin;
d6f147f9-5b4a-4a9d-9d0e-b821e958d85a	d6f147f9-a1c2-47cc-bad4-d9629c2d704b	test		transaction	2025-02-13 16:16:22.809817+00	\N	d6f147f9-89ba-4a3c-969e-2a06d3ca5a4f	\N	\N	DISABLED	\N
d6f147f9-752f-472d-acd0-dfe44b8b8545	d6f147f9-a1c2-47cc-bad4-d9629c2d704b	Amounts equal or greater than 200,000		transactions	2025-02-14 05:04:30.546654+00	\N	d6f147f9-f79b-42b8-8cdf-b86f54f08bc0	\N	\N	DISABLED	\N
d6f147f9-2c44-4b85-b468-9950893dae5a	d6f147f9-a1c2-47cc-bad4-d9629c2d704b	Amounts greater than or equal to100,000		transactions	2025-02-14 04:47:24.140182+00	\N	\N	\N	\N	DISABLED	\N
d6f147f9-e498-4260-8088-537559266939	d6f147f9-a1c2-47cc-bad4-d9629c2d704b	amounts greater than 1,000,000		transactions	2025-02-27 12:56:38.12931+00	\N	\N	\N	\N	DISABLED	\N
d6f147f9-cb8b-40b1-aa20-74a9ee37dbef	d6f147f9-a1c2-47cc-bad4-d9629c2d704b	test2		transactions	2025-03-03 11:22:05.788562+00	\N	\N	\N	\N	DISABLED	\N
d6f147f9-2b24-4172-a388-89b538e83fb4	d6f147f9-a1c2-47cc-bad4-d9629c2d704b	karrabo_transaction_scenario		transaction_model	2025-03-06 11:13:16.044149+00	\N	\N	\N	\N	DISABLED	\N
\.


--
-- TOC entry 3439 (class 2606 OID 16457)
-- Name: scenarios scenarios_pkey; Type: CONSTRAINT; Schema: marble; Owner: postgres
--

ALTER TABLE ONLY marble.scenarios
    ADD CONSTRAINT scenarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3440 (class 2606 OID 16502)
-- Name: scenarios fk_scenarios_live_scenario_iteration; Type: FK CONSTRAINT; Schema: marble; Owner: postgres
--

ALTER TABLE ONLY marble.scenarios
    ADD CONSTRAINT fk_scenarios_live_scenario_iteration FOREIGN KEY (live_scenario_iteration_id) REFERENCES marble.scenario_iterations(id) ON DELETE CASCADE;


--
-- TOC entry 3441 (class 2606 OID 16458)
-- Name: scenarios fk_scenarios_org; Type: FK CONSTRAINT; Schema: marble; Owner: postgres
--

ALTER TABLE ONLY marble.scenarios
    ADD CONSTRAINT fk_scenarios_org FOREIGN KEY (org_id) REFERENCES marble.organizations(id) ON DELETE CASCADE;


--
-- TOC entry 3442 (class 2606 OID 16985)
-- Name: scenarios scenarios_decision_to_case_inbox_id_fkey; Type: FK CONSTRAINT; Schema: marble; Owner: postgres
--

ALTER TABLE ONLY marble.scenarios
    ADD CONSTRAINT scenarios_decision_to_case_inbox_id_fkey FOREIGN KEY (decision_to_case_inbox_id) REFERENCES marble.inboxes(id) ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2025-03-07 16:40:03

--
-- PostgreSQL database dump complete
--

