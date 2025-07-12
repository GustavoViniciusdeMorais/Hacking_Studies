--
-- PostgreSQL database dump
--

-- Dumped from database version 13.11 (Debian 13.11-0+deb11u1)
-- Dumped by pg_dump version 13.11 (Debian 13.11-0+deb11u1)

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
-- Name: api_keys; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.api_keys (
    id integer NOT NULL,
    token text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.api_keys OWNER TO msf;

--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.api_keys_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_keys_id_seq OWNER TO msf;

--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.api_keys_id_seq OWNED BY public.api_keys.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO msf;

--
-- Name: async_callbacks; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.async_callbacks (
    id integer NOT NULL,
    uuid character varying NOT NULL,
    "timestamp" integer NOT NULL,
    listener_uri character varying,
    target_host character varying,
    target_port character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.async_callbacks OWNER TO msf;

--
-- Name: async_callbacks_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.async_callbacks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.async_callbacks_id_seq OWNER TO msf;

--
-- Name: async_callbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.async_callbacks_id_seq OWNED BY public.async_callbacks.id;


--
-- Name: automatic_exploitation_match_results; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.automatic_exploitation_match_results (
    id integer NOT NULL,
    match_id integer,
    run_id integer,
    state character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.automatic_exploitation_match_results OWNER TO msf;

--
-- Name: automatic_exploitation_match_results_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.automatic_exploitation_match_results_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.automatic_exploitation_match_results_id_seq OWNER TO msf;

--
-- Name: automatic_exploitation_match_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.automatic_exploitation_match_results_id_seq OWNED BY public.automatic_exploitation_match_results.id;


--
-- Name: automatic_exploitation_match_sets; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.automatic_exploitation_match_sets (
    id integer NOT NULL,
    workspace_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.automatic_exploitation_match_sets OWNER TO msf;

--
-- Name: automatic_exploitation_match_sets_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.automatic_exploitation_match_sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.automatic_exploitation_match_sets_id_seq OWNER TO msf;

--
-- Name: automatic_exploitation_match_sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.automatic_exploitation_match_sets_id_seq OWNED BY public.automatic_exploitation_match_sets.id;


--
-- Name: automatic_exploitation_matches; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.automatic_exploitation_matches (
    id integer NOT NULL,
    module_detail_id integer,
    state character varying,
    nexpose_data_vulnerability_definition_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    match_set_id integer,
    matchable_type character varying,
    matchable_id integer,
    module_fullname text
);


ALTER TABLE public.automatic_exploitation_matches OWNER TO msf;

--
-- Name: automatic_exploitation_matches_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.automatic_exploitation_matches_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.automatic_exploitation_matches_id_seq OWNER TO msf;

--
-- Name: automatic_exploitation_matches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.automatic_exploitation_matches_id_seq OWNED BY public.automatic_exploitation_matches.id;


--
-- Name: automatic_exploitation_runs; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.automatic_exploitation_runs (
    id integer NOT NULL,
    workspace_id integer,
    user_id integer,
    match_set_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.automatic_exploitation_runs OWNER TO msf;

--
-- Name: automatic_exploitation_runs_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.automatic_exploitation_runs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.automatic_exploitation_runs_id_seq OWNER TO msf;

--
-- Name: automatic_exploitation_runs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.automatic_exploitation_runs_id_seq OWNED BY public.automatic_exploitation_runs.id;


--
-- Name: clients; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    host_id integer,
    created_at timestamp without time zone,
    ua_string character varying(1024) NOT NULL,
    ua_name character varying(64),
    ua_ver character varying(32),
    updated_at timestamp without time zone
);


ALTER TABLE public.clients OWNER TO msf;

--
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clients_id_seq OWNER TO msf;

--
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- Name: credential_cores_tasks; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.credential_cores_tasks (
    core_id integer,
    task_id integer
);


ALTER TABLE public.credential_cores_tasks OWNER TO msf;

--
-- Name: credential_logins_tasks; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.credential_logins_tasks (
    login_id integer,
    task_id integer
);


ALTER TABLE public.credential_logins_tasks OWNER TO msf;

--
-- Name: creds; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.creds (
    id integer NOT NULL,
    service_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "user" character varying(2048),
    pass character varying(4096),
    active boolean DEFAULT true,
    proof character varying(4096),
    ptype character varying(256),
    source_id integer,
    source_type character varying
);


ALTER TABLE public.creds OWNER TO msf;

--
-- Name: creds_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.creds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.creds_id_seq OWNER TO msf;

--
-- Name: creds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.creds_id_seq OWNED BY public.creds.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.events (
    id integer NOT NULL,
    workspace_id integer,
    host_id integer,
    created_at timestamp without time zone,
    name character varying,
    updated_at timestamp without time zone,
    critical boolean,
    seen boolean,
    username character varying,
    info text
);


ALTER TABLE public.events OWNER TO msf;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO msf;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: exploit_attempts; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.exploit_attempts (
    id integer NOT NULL,
    host_id integer,
    service_id integer,
    vuln_id integer,
    attempted_at timestamp without time zone,
    exploited boolean,
    fail_reason character varying,
    username character varying,
    module text,
    session_id integer,
    loot_id integer,
    port integer,
    proto character varying,
    fail_detail text
);


ALTER TABLE public.exploit_attempts OWNER TO msf;

--
-- Name: exploit_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.exploit_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exploit_attempts_id_seq OWNER TO msf;

--
-- Name: exploit_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.exploit_attempts_id_seq OWNED BY public.exploit_attempts.id;


--
-- Name: exploited_hosts; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.exploited_hosts (
    id integer NOT NULL,
    host_id integer NOT NULL,
    service_id integer,
    session_uuid character varying(8),
    name character varying(2048),
    payload character varying(2048),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.exploited_hosts OWNER TO msf;

--
-- Name: exploited_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.exploited_hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exploited_hosts_id_seq OWNER TO msf;

--
-- Name: exploited_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.exploited_hosts_id_seq OWNED BY public.exploited_hosts.id;


--
-- Name: host_details; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.host_details (
    id integer NOT NULL,
    host_id integer,
    nx_console_id integer,
    nx_device_id integer,
    src character varying,
    nx_site_name character varying,
    nx_site_importance character varying,
    nx_scan_template character varying,
    nx_risk_score double precision
);


ALTER TABLE public.host_details OWNER TO msf;

--
-- Name: host_details_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.host_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.host_details_id_seq OWNER TO msf;

--
-- Name: host_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.host_details_id_seq OWNED BY public.host_details.id;


--
-- Name: hosts; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.hosts (
    id integer NOT NULL,
    created_at timestamp without time zone,
    address inet NOT NULL,
    mac character varying,
    comm character varying,
    name character varying,
    state character varying,
    os_name character varying,
    os_flavor character varying,
    os_sp character varying,
    os_lang character varying,
    arch character varying,
    workspace_id integer NOT NULL,
    updated_at timestamp without time zone,
    purpose text,
    info character varying(65536),
    comments text,
    scope text,
    virtual_host text,
    note_count integer DEFAULT 0,
    vuln_count integer DEFAULT 0,
    service_count integer DEFAULT 0,
    host_detail_count integer DEFAULT 0,
    exploit_attempt_count integer DEFAULT 0,
    cred_count integer DEFAULT 0,
    detected_arch character varying,
    os_family character varying
);


ALTER TABLE public.hosts OWNER TO msf;

--
-- Name: hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hosts_id_seq OWNER TO msf;

--
-- Name: hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.hosts_id_seq OWNED BY public.hosts.id;


--
-- Name: hosts_tags; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.hosts_tags (
    host_id integer,
    tag_id integer,
    id integer NOT NULL
);


ALTER TABLE public.hosts_tags OWNER TO msf;

--
-- Name: hosts_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.hosts_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hosts_tags_id_seq OWNER TO msf;

--
-- Name: hosts_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.hosts_tags_id_seq OWNED BY public.hosts_tags.id;


--
-- Name: listeners; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.listeners (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    workspace_id integer DEFAULT 1 NOT NULL,
    task_id integer,
    enabled boolean DEFAULT true,
    owner text,
    payload text,
    address text,
    port integer,
    options bytea,
    macro text
);


ALTER TABLE public.listeners OWNER TO msf;

--
-- Name: listeners_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.listeners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.listeners_id_seq OWNER TO msf;

--
-- Name: listeners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.listeners_id_seq OWNED BY public.listeners.id;


--
-- Name: loots; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.loots (
    id integer NOT NULL,
    workspace_id integer DEFAULT 1 NOT NULL,
    host_id integer,
    service_id integer,
    ltype character varying(512),
    path character varying(1024),
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    content_type character varying,
    name text,
    info text,
    module_run_id integer
);


ALTER TABLE public.loots OWNER TO msf;

--
-- Name: loots_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.loots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loots_id_seq OWNER TO msf;

--
-- Name: loots_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.loots_id_seq OWNED BY public.loots.id;


--
-- Name: macros; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.macros (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner text,
    name text,
    description text,
    actions bytea,
    prefs bytea
);


ALTER TABLE public.macros OWNER TO msf;

--
-- Name: macros_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.macros_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.macros_id_seq OWNER TO msf;

--
-- Name: macros_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.macros_id_seq OWNED BY public.macros.id;


--
-- Name: metasploit_credential_cores; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_cores (
    id integer NOT NULL,
    origin_type character varying NOT NULL,
    origin_id integer NOT NULL,
    private_id integer,
    public_id integer,
    realm_id integer,
    workspace_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    logins_count integer DEFAULT 0
);


ALTER TABLE public.metasploit_credential_cores OWNER TO msf;

--
-- Name: metasploit_credential_cores_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_cores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_cores_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_cores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_cores_id_seq OWNED BY public.metasploit_credential_cores.id;


--
-- Name: metasploit_credential_logins; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_logins (
    id integer NOT NULL,
    core_id integer NOT NULL,
    service_id integer NOT NULL,
    access_level character varying,
    status character varying NOT NULL,
    last_attempted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.metasploit_credential_logins OWNER TO msf;

--
-- Name: metasploit_credential_logins_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_logins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_logins_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_logins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_logins_id_seq OWNED BY public.metasploit_credential_logins.id;


--
-- Name: metasploit_credential_origin_cracked_passwords; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_origin_cracked_passwords (
    id integer NOT NULL,
    metasploit_credential_core_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.metasploit_credential_origin_cracked_passwords OWNER TO msf;

--
-- Name: metasploit_credential_origin_cracked_passwords_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_origin_cracked_passwords_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_origin_cracked_passwords_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_origin_cracked_passwords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_origin_cracked_passwords_id_seq OWNED BY public.metasploit_credential_origin_cracked_passwords.id;


--
-- Name: metasploit_credential_origin_imports; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_origin_imports (
    id integer NOT NULL,
    filename text NOT NULL,
    task_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.metasploit_credential_origin_imports OWNER TO msf;

--
-- Name: metasploit_credential_origin_imports_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_origin_imports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_origin_imports_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_origin_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_origin_imports_id_seq OWNED BY public.metasploit_credential_origin_imports.id;


--
-- Name: metasploit_credential_origin_manuals; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_origin_manuals (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.metasploit_credential_origin_manuals OWNER TO msf;

--
-- Name: metasploit_credential_origin_manuals_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_origin_manuals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_origin_manuals_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_origin_manuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_origin_manuals_id_seq OWNED BY public.metasploit_credential_origin_manuals.id;


--
-- Name: metasploit_credential_origin_services; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_origin_services (
    id integer NOT NULL,
    service_id integer NOT NULL,
    module_full_name text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.metasploit_credential_origin_services OWNER TO msf;

--
-- Name: metasploit_credential_origin_services_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_origin_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_origin_services_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_origin_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_origin_services_id_seq OWNED BY public.metasploit_credential_origin_services.id;


--
-- Name: metasploit_credential_origin_sessions; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_origin_sessions (
    id integer NOT NULL,
    post_reference_name text NOT NULL,
    session_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.metasploit_credential_origin_sessions OWNER TO msf;

--
-- Name: metasploit_credential_origin_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_origin_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_origin_sessions_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_origin_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_origin_sessions_id_seq OWNED BY public.metasploit_credential_origin_sessions.id;


--
-- Name: metasploit_credential_privates; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_privates (
    id integer NOT NULL,
    type character varying NOT NULL,
    data text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    jtr_format character varying
);


ALTER TABLE public.metasploit_credential_privates OWNER TO msf;

--
-- Name: metasploit_credential_privates_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_privates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_privates_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_privates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_privates_id_seq OWNED BY public.metasploit_credential_privates.id;


--
-- Name: metasploit_credential_publics; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_publics (
    id integer NOT NULL,
    username character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying NOT NULL
);


ALTER TABLE public.metasploit_credential_publics OWNER TO msf;

--
-- Name: metasploit_credential_publics_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_publics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_publics_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_publics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_publics_id_seq OWNED BY public.metasploit_credential_publics.id;


--
-- Name: metasploit_credential_realms; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.metasploit_credential_realms (
    id integer NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.metasploit_credential_realms OWNER TO msf;

--
-- Name: metasploit_credential_realms_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.metasploit_credential_realms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metasploit_credential_realms_id_seq OWNER TO msf;

--
-- Name: metasploit_credential_realms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.metasploit_credential_realms_id_seq OWNED BY public.metasploit_credential_realms.id;


--
-- Name: mod_refs; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.mod_refs (
    id integer NOT NULL,
    module character varying(1024),
    mtype character varying(128),
    ref text
);


ALTER TABLE public.mod_refs OWNER TO msf;

--
-- Name: mod_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.mod_refs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mod_refs_id_seq OWNER TO msf;

--
-- Name: mod_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.mod_refs_id_seq OWNED BY public.mod_refs.id;


--
-- Name: module_actions; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_actions (
    id integer NOT NULL,
    detail_id integer,
    name text
);


ALTER TABLE public.module_actions OWNER TO msf;

--
-- Name: module_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_actions_id_seq OWNER TO msf;

--
-- Name: module_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_actions_id_seq OWNED BY public.module_actions.id;


--
-- Name: module_archs; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_archs (
    id integer NOT NULL,
    detail_id integer,
    name text
);


ALTER TABLE public.module_archs OWNER TO msf;

--
-- Name: module_archs_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_archs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_archs_id_seq OWNER TO msf;

--
-- Name: module_archs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_archs_id_seq OWNED BY public.module_archs.id;


--
-- Name: module_authors; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_authors (
    id integer NOT NULL,
    detail_id integer,
    name text,
    email text
);


ALTER TABLE public.module_authors OWNER TO msf;

--
-- Name: module_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_authors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_authors_id_seq OWNER TO msf;

--
-- Name: module_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_authors_id_seq OWNED BY public.module_authors.id;


--
-- Name: module_details; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_details (
    id integer NOT NULL,
    mtime timestamp without time zone,
    file text,
    mtype character varying,
    refname text,
    fullname text,
    name text,
    rank integer,
    description text,
    license character varying,
    privileged boolean,
    disclosure_date timestamp without time zone,
    default_target integer,
    default_action text,
    stance character varying,
    ready boolean
);


ALTER TABLE public.module_details OWNER TO msf;

--
-- Name: module_details_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_details_id_seq OWNER TO msf;

--
-- Name: module_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_details_id_seq OWNED BY public.module_details.id;


--
-- Name: module_mixins; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_mixins (
    id integer NOT NULL,
    detail_id integer,
    name text
);


ALTER TABLE public.module_mixins OWNER TO msf;

--
-- Name: module_mixins_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_mixins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_mixins_id_seq OWNER TO msf;

--
-- Name: module_mixins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_mixins_id_seq OWNED BY public.module_mixins.id;


--
-- Name: module_platforms; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_platforms (
    id integer NOT NULL,
    detail_id integer,
    name text
);


ALTER TABLE public.module_platforms OWNER TO msf;

--
-- Name: module_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_platforms_id_seq OWNER TO msf;

--
-- Name: module_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_platforms_id_seq OWNED BY public.module_platforms.id;


--
-- Name: module_refs; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_refs (
    id integer NOT NULL,
    detail_id integer,
    name text
);


ALTER TABLE public.module_refs OWNER TO msf;

--
-- Name: module_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_refs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_refs_id_seq OWNER TO msf;

--
-- Name: module_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_refs_id_seq OWNED BY public.module_refs.id;


--
-- Name: module_runs; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_runs (
    id integer NOT NULL,
    attempted_at timestamp without time zone,
    fail_detail text,
    fail_reason character varying,
    module_fullname text,
    port integer,
    proto character varying,
    session_id integer,
    status character varying,
    trackable_id integer,
    trackable_type character varying,
    user_id integer,
    username character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.module_runs OWNER TO msf;

--
-- Name: module_runs_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_runs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_runs_id_seq OWNER TO msf;

--
-- Name: module_runs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_runs_id_seq OWNED BY public.module_runs.id;


--
-- Name: module_targets; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.module_targets (
    id integer NOT NULL,
    detail_id integer,
    index integer,
    name text
);


ALTER TABLE public.module_targets OWNER TO msf;

--
-- Name: module_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.module_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.module_targets_id_seq OWNER TO msf;

--
-- Name: module_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.module_targets_id_seq OWNED BY public.module_targets.id;


--
-- Name: nexpose_consoles; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.nexpose_consoles (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    enabled boolean DEFAULT true,
    owner text,
    address text,
    port integer DEFAULT 3780,
    username text,
    password text,
    status text,
    version text,
    cert text,
    cached_sites bytea,
    name text
);


ALTER TABLE public.nexpose_consoles OWNER TO msf;

--
-- Name: nexpose_consoles_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.nexpose_consoles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nexpose_consoles_id_seq OWNER TO msf;

--
-- Name: nexpose_consoles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.nexpose_consoles_id_seq OWNED BY public.nexpose_consoles.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    created_at timestamp without time zone,
    ntype character varying(512),
    workspace_id integer DEFAULT 1 NOT NULL,
    service_id integer,
    host_id integer,
    updated_at timestamp without time zone,
    critical boolean,
    seen boolean,
    data text,
    vuln_id integer
);


ALTER TABLE public.notes OWNER TO msf;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.notes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notes_id_seq OWNER TO msf;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: payloads; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.payloads (
    id integer NOT NULL,
    name character varying,
    uuid character varying,
    uuid_mask integer,
    "timestamp" integer,
    arch character varying,
    platform character varying,
    urls character varying,
    description character varying,
    raw_payload character varying,
    raw_payload_hash character varying,
    build_status character varying,
    build_opts character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.payloads OWNER TO msf;

--
-- Name: payloads_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.payloads_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payloads_id_seq OWNER TO msf;

--
-- Name: payloads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.payloads_id_seq OWNED BY public.payloads.id;


--
-- Name: profiles; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.profiles (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active boolean DEFAULT true,
    name text,
    owner text,
    settings bytea
);


ALTER TABLE public.profiles OWNER TO msf;

--
-- Name: profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profiles_id_seq OWNER TO msf;

--
-- Name: profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.profiles_id_seq OWNED BY public.profiles.id;


--
-- Name: refs; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.refs (
    id integer NOT NULL,
    ref_id integer,
    created_at timestamp without time zone,
    name character varying(512),
    updated_at timestamp without time zone
);


ALTER TABLE public.refs OWNER TO msf;

--
-- Name: refs_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.refs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refs_id_seq OWNER TO msf;

--
-- Name: refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.refs_id_seq OWNED BY public.refs.id;


--
-- Name: report_templates; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.report_templates (
    id integer NOT NULL,
    workspace_id integer DEFAULT 1 NOT NULL,
    created_by character varying,
    path character varying(1024),
    name text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.report_templates OWNER TO msf;

--
-- Name: report_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.report_templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_templates_id_seq OWNER TO msf;

--
-- Name: report_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.report_templates_id_seq OWNED BY public.report_templates.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    workspace_id integer DEFAULT 1 NOT NULL,
    created_by character varying,
    rtype character varying,
    path character varying(1024),
    options text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    downloaded_at timestamp without time zone,
    task_id integer,
    name character varying(63)
);


ALTER TABLE public.reports OWNER TO msf;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO msf;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.routes (
    id integer NOT NULL,
    session_id integer,
    subnet character varying,
    netmask character varying
);


ALTER TABLE public.routes OWNER TO msf;

--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.routes_id_seq OWNER TO msf;

--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO msf;

--
-- Name: services; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.services (
    id integer NOT NULL,
    host_id integer,
    created_at timestamp without time zone,
    port integer NOT NULL,
    proto character varying(16) NOT NULL,
    state character varying,
    name character varying,
    updated_at timestamp without time zone,
    info text
);


ALTER TABLE public.services OWNER TO msf;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO msf;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: session_events; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.session_events (
    id integer NOT NULL,
    session_id integer,
    etype character varying,
    command bytea,
    output bytea,
    remote_path character varying,
    local_path character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.session_events OWNER TO msf;

--
-- Name: session_events_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.session_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_events_id_seq OWNER TO msf;

--
-- Name: session_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.session_events_id_seq OWNED BY public.session_events.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    host_id integer,
    stype character varying,
    via_exploit character varying,
    via_payload character varying,
    "desc" character varying,
    port integer,
    platform character varying,
    datastore text,
    opened_at timestamp without time zone NOT NULL,
    closed_at timestamp without time zone,
    close_reason character varying,
    local_id integer,
    last_seen timestamp without time zone,
    module_run_id integer
);


ALTER TABLE public.sessions OWNER TO msf;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO msf;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    user_id integer,
    name character varying(1024),
    "desc" text,
    report_summary boolean DEFAULT false NOT NULL,
    report_detail boolean DEFAULT false NOT NULL,
    critical boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tags OWNER TO msf;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO msf;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: task_creds; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.task_creds (
    id integer NOT NULL,
    task_id integer NOT NULL,
    cred_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.task_creds OWNER TO msf;

--
-- Name: task_creds_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.task_creds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_creds_id_seq OWNER TO msf;

--
-- Name: task_creds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.task_creds_id_seq OWNED BY public.task_creds.id;


--
-- Name: task_hosts; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.task_hosts (
    id integer NOT NULL,
    task_id integer NOT NULL,
    host_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.task_hosts OWNER TO msf;

--
-- Name: task_hosts_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.task_hosts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_hosts_id_seq OWNER TO msf;

--
-- Name: task_hosts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.task_hosts_id_seq OWNED BY public.task_hosts.id;


--
-- Name: task_services; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.task_services (
    id integer NOT NULL,
    task_id integer NOT NULL,
    service_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.task_services OWNER TO msf;

--
-- Name: task_services_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.task_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_services_id_seq OWNER TO msf;

--
-- Name: task_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.task_services_id_seq OWNED BY public.task_services.id;


--
-- Name: task_sessions; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.task_sessions (
    id integer NOT NULL,
    task_id integer NOT NULL,
    session_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.task_sessions OWNER TO msf;

--
-- Name: task_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.task_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_sessions_id_seq OWNER TO msf;

--
-- Name: task_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.task_sessions_id_seq OWNED BY public.task_sessions.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.tasks (
    id integer NOT NULL,
    workspace_id integer DEFAULT 1 NOT NULL,
    created_by character varying,
    module character varying,
    completed_at timestamp without time zone,
    path character varying(1024),
    info character varying,
    description character varying,
    progress integer,
    options text,
    error text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    result text,
    module_uuid character varying(8),
    settings bytea
);


ALTER TABLE public.tasks OWNER TO msf;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tasks_id_seq OWNER TO msf;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.tasks_id_seq OWNED BY public.tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying,
    crypted_password character varying,
    password_salt character varying,
    persistence_token character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    fullname character varying,
    email character varying,
    phone character varying,
    company character varying,
    prefs character varying(524288),
    admin boolean DEFAULT true NOT NULL
);


ALTER TABLE public.users OWNER TO msf;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO msf;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: vuln_attempts; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.vuln_attempts (
    id integer NOT NULL,
    vuln_id integer,
    attempted_at timestamp without time zone,
    exploited boolean,
    fail_reason character varying,
    username character varying,
    module text,
    session_id integer,
    loot_id integer,
    fail_detail text
);


ALTER TABLE public.vuln_attempts OWNER TO msf;

--
-- Name: vuln_attempts_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.vuln_attempts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vuln_attempts_id_seq OWNER TO msf;

--
-- Name: vuln_attempts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.vuln_attempts_id_seq OWNED BY public.vuln_attempts.id;


--
-- Name: vuln_details; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.vuln_details (
    id integer NOT NULL,
    vuln_id integer,
    cvss_score double precision,
    cvss_vector character varying,
    title character varying,
    description text,
    solution text,
    proof bytea,
    nx_console_id integer,
    nx_device_id integer,
    nx_vuln_id character varying,
    nx_severity double precision,
    nx_pci_severity double precision,
    nx_published timestamp without time zone,
    nx_added timestamp without time zone,
    nx_modified timestamp without time zone,
    nx_tags text,
    nx_vuln_status text,
    nx_proof_key text,
    src character varying,
    nx_scan_id integer,
    nx_vulnerable_since timestamp without time zone,
    nx_pci_compliance_status character varying
);


ALTER TABLE public.vuln_details OWNER TO msf;

--
-- Name: vuln_details_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.vuln_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vuln_details_id_seq OWNER TO msf;

--
-- Name: vuln_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.vuln_details_id_seq OWNED BY public.vuln_details.id;


--
-- Name: vulns; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.vulns (
    id integer NOT NULL,
    host_id integer,
    service_id integer,
    created_at timestamp without time zone,
    name character varying,
    updated_at timestamp without time zone,
    info character varying(65536),
    exploited_at timestamp without time zone,
    vuln_detail_count integer DEFAULT 0,
    vuln_attempt_count integer DEFAULT 0,
    origin_id integer,
    origin_type character varying
);


ALTER TABLE public.vulns OWNER TO msf;

--
-- Name: vulns_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.vulns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulns_id_seq OWNER TO msf;

--
-- Name: vulns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.vulns_id_seq OWNED BY public.vulns.id;


--
-- Name: vulns_refs; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.vulns_refs (
    ref_id integer,
    vuln_id integer,
    id integer NOT NULL
);


ALTER TABLE public.vulns_refs OWNER TO msf;

--
-- Name: vulns_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.vulns_refs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vulns_refs_id_seq OWNER TO msf;

--
-- Name: vulns_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.vulns_refs_id_seq OWNED BY public.vulns_refs.id;


--
-- Name: web_forms; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.web_forms (
    id integer NOT NULL,
    web_site_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    path text,
    method character varying(1024),
    params text,
    query text
);


ALTER TABLE public.web_forms OWNER TO msf;

--
-- Name: web_forms_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.web_forms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_forms_id_seq OWNER TO msf;

--
-- Name: web_forms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.web_forms_id_seq OWNED BY public.web_forms.id;


--
-- Name: web_pages; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.web_pages (
    id integer NOT NULL,
    web_site_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    path text,
    query text,
    code integer NOT NULL,
    cookie text,
    auth text,
    ctype text,
    mtime timestamp without time zone,
    location text,
    headers text,
    body bytea,
    request bytea
);


ALTER TABLE public.web_pages OWNER TO msf;

--
-- Name: web_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.web_pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_pages_id_seq OWNER TO msf;

--
-- Name: web_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.web_pages_id_seq OWNED BY public.web_pages.id;


--
-- Name: web_sites; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.web_sites (
    id integer NOT NULL,
    service_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    vhost character varying(2048),
    comments text,
    options text
);


ALTER TABLE public.web_sites OWNER TO msf;

--
-- Name: web_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.web_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_sites_id_seq OWNER TO msf;

--
-- Name: web_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.web_sites_id_seq OWNED BY public.web_sites.id;


--
-- Name: web_vulns; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.web_vulns (
    id integer NOT NULL,
    web_site_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    path text NOT NULL,
    method character varying(1024) NOT NULL,
    params text,
    pname text,
    risk integer NOT NULL,
    name character varying(1024) NOT NULL,
    query text,
    category text NOT NULL,
    confidence integer NOT NULL,
    description text,
    blame text,
    request bytea,
    proof bytea NOT NULL,
    owner character varying,
    payload text
);


ALTER TABLE public.web_vulns OWNER TO msf;

--
-- Name: web_vulns_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.web_vulns_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.web_vulns_id_seq OWNER TO msf;

--
-- Name: web_vulns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.web_vulns_id_seq OWNED BY public.web_vulns.id;


--
-- Name: wmap_requests; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.wmap_requests (
    id integer NOT NULL,
    host character varying,
    address inet,
    port integer,
    ssl integer,
    meth character varying(32),
    path text,
    headers text,
    query text,
    body text,
    respcode character varying(16),
    resphead text,
    response text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.wmap_requests OWNER TO msf;

--
-- Name: wmap_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.wmap_requests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wmap_requests_id_seq OWNER TO msf;

--
-- Name: wmap_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.wmap_requests_id_seq OWNED BY public.wmap_requests.id;


--
-- Name: wmap_targets; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.wmap_targets (
    id integer NOT NULL,
    host character varying,
    address inet,
    port integer,
    ssl integer,
    selected integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.wmap_targets OWNER TO msf;

--
-- Name: wmap_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.wmap_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wmap_targets_id_seq OWNER TO msf;

--
-- Name: wmap_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.wmap_targets_id_seq OWNED BY public.wmap_targets.id;


--
-- Name: workspace_members; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.workspace_members (
    workspace_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.workspace_members OWNER TO msf;

--
-- Name: workspaces; Type: TABLE; Schema: public; Owner: msf
--

CREATE TABLE public.workspaces (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    boundary character varying(4096),
    description character varying(4096),
    owner_id integer,
    limit_to_network boolean DEFAULT false NOT NULL,
    import_fingerprint boolean DEFAULT false
);


ALTER TABLE public.workspaces OWNER TO msf;

--
-- Name: workspaces_id_seq; Type: SEQUENCE; Schema: public; Owner: msf
--

CREATE SEQUENCE public.workspaces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workspaces_id_seq OWNER TO msf;

--
-- Name: workspaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: msf
--

ALTER SEQUENCE public.workspaces_id_seq OWNED BY public.workspaces.id;


--
-- Name: api_keys id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.api_keys ALTER COLUMN id SET DEFAULT nextval('public.api_keys_id_seq'::regclass);


--
-- Name: async_callbacks id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.async_callbacks ALTER COLUMN id SET DEFAULT nextval('public.async_callbacks_id_seq'::regclass);


--
-- Name: automatic_exploitation_match_results id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.automatic_exploitation_match_results ALTER COLUMN id SET DEFAULT nextval('public.automatic_exploitation_match_results_id_seq'::regclass);


--
-- Name: automatic_exploitation_match_sets id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.automatic_exploitation_match_sets ALTER COLUMN id SET DEFAULT nextval('public.automatic_exploitation_match_sets_id_seq'::regclass);


--
-- Name: automatic_exploitation_matches id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.automatic_exploitation_matches ALTER COLUMN id SET DEFAULT nextval('public.automatic_exploitation_matches_id_seq'::regclass);


--
-- Name: automatic_exploitation_runs id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.automatic_exploitation_runs ALTER COLUMN id SET DEFAULT nextval('public.automatic_exploitation_runs_id_seq'::regclass);


--
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- Name: creds id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.creds ALTER COLUMN id SET DEFAULT nextval('public.creds_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: exploit_attempts id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.exploit_attempts ALTER COLUMN id SET DEFAULT nextval('public.exploit_attempts_id_seq'::regclass);


--
-- Name: exploited_hosts id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.exploited_hosts ALTER COLUMN id SET DEFAULT nextval('public.exploited_hosts_id_seq'::regclass);


--
-- Name: host_details id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.host_details ALTER COLUMN id SET DEFAULT nextval('public.host_details_id_seq'::regclass);


--
-- Name: hosts id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.hosts ALTER COLUMN id SET DEFAULT nextval('public.hosts_id_seq'::regclass);


--
-- Name: hosts_tags id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.hosts_tags ALTER COLUMN id SET DEFAULT nextval('public.hosts_tags_id_seq'::regclass);


--
-- Name: listeners id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.listeners ALTER COLUMN id SET DEFAULT nextval('public.listeners_id_seq'::regclass);


--
-- Name: loots id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.loots ALTER COLUMN id SET DEFAULT nextval('public.loots_id_seq'::regclass);


--
-- Name: macros id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.macros ALTER COLUMN id SET DEFAULT nextval('public.macros_id_seq'::regclass);


--
-- Name: metasploit_credential_cores id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_cores ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_cores_id_seq'::regclass);


--
-- Name: metasploit_credential_logins id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_logins ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_logins_id_seq'::regclass);


--
-- Name: metasploit_credential_origin_cracked_passwords id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_cracked_passwords ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_origin_cracked_passwords_id_seq'::regclass);


--
-- Name: metasploit_credential_origin_imports id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_imports ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_origin_imports_id_seq'::regclass);


--
-- Name: metasploit_credential_origin_manuals id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_manuals ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_origin_manuals_id_seq'::regclass);


--
-- Name: metasploit_credential_origin_services id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_services ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_origin_services_id_seq'::regclass);


--
-- Name: metasploit_credential_origin_sessions id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_sessions ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_origin_sessions_id_seq'::regclass);


--
-- Name: metasploit_credential_privates id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_privates ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_privates_id_seq'::regclass);


--
-- Name: metasploit_credential_publics id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_publics ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_publics_id_seq'::regclass);


--
-- Name: metasploit_credential_realms id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_realms ALTER COLUMN id SET DEFAULT nextval('public.metasploit_credential_realms_id_seq'::regclass);


--
-- Name: mod_refs id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.mod_refs ALTER COLUMN id SET DEFAULT nextval('public.mod_refs_id_seq'::regclass);


--
-- Name: module_actions id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_actions ALTER COLUMN id SET DEFAULT nextval('public.module_actions_id_seq'::regclass);


--
-- Name: module_archs id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_archs ALTER COLUMN id SET DEFAULT nextval('public.module_archs_id_seq'::regclass);


--
-- Name: module_authors id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_authors ALTER COLUMN id SET DEFAULT nextval('public.module_authors_id_seq'::regclass);


--
-- Name: module_details id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_details ALTER COLUMN id SET DEFAULT nextval('public.module_details_id_seq'::regclass);


--
-- Name: module_mixins id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_mixins ALTER COLUMN id SET DEFAULT nextval('public.module_mixins_id_seq'::regclass);


--
-- Name: module_platforms id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_platforms ALTER COLUMN id SET DEFAULT nextval('public.module_platforms_id_seq'::regclass);


--
-- Name: module_refs id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_refs ALTER COLUMN id SET DEFAULT nextval('public.module_refs_id_seq'::regclass);


--
-- Name: module_runs id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_runs ALTER COLUMN id SET DEFAULT nextval('public.module_runs_id_seq'::regclass);


--
-- Name: module_targets id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_targets ALTER COLUMN id SET DEFAULT nextval('public.module_targets_id_seq'::regclass);


--
-- Name: nexpose_consoles id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.nexpose_consoles ALTER COLUMN id SET DEFAULT nextval('public.nexpose_consoles_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: payloads id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.payloads ALTER COLUMN id SET DEFAULT nextval('public.payloads_id_seq'::regclass);


--
-- Name: profiles id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.profiles ALTER COLUMN id SET DEFAULT nextval('public.profiles_id_seq'::regclass);


--
-- Name: refs id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.refs ALTER COLUMN id SET DEFAULT nextval('public.refs_id_seq'::regclass);


--
-- Name: report_templates id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.report_templates ALTER COLUMN id SET DEFAULT nextval('public.report_templates_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: session_events id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.session_events ALTER COLUMN id SET DEFAULT nextval('public.session_events_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: task_creds id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.task_creds ALTER COLUMN id SET DEFAULT nextval('public.task_creds_id_seq'::regclass);


--
-- Name: task_hosts id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.task_hosts ALTER COLUMN id SET DEFAULT nextval('public.task_hosts_id_seq'::regclass);


--
-- Name: task_services id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.task_services ALTER COLUMN id SET DEFAULT nextval('public.task_services_id_seq'::regclass);


--
-- Name: task_sessions id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.task_sessions ALTER COLUMN id SET DEFAULT nextval('public.task_sessions_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.tasks ALTER COLUMN id SET DEFAULT nextval('public.tasks_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: vuln_attempts id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.vuln_attempts ALTER COLUMN id SET DEFAULT nextval('public.vuln_attempts_id_seq'::regclass);


--
-- Name: vuln_details id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.vuln_details ALTER COLUMN id SET DEFAULT nextval('public.vuln_details_id_seq'::regclass);


--
-- Name: vulns id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.vulns ALTER COLUMN id SET DEFAULT nextval('public.vulns_id_seq'::regclass);


--
-- Name: vulns_refs id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.vulns_refs ALTER COLUMN id SET DEFAULT nextval('public.vulns_refs_id_seq'::regclass);


--
-- Name: web_forms id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.web_forms ALTER COLUMN id SET DEFAULT nextval('public.web_forms_id_seq'::regclass);


--
-- Name: web_pages id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.web_pages ALTER COLUMN id SET DEFAULT nextval('public.web_pages_id_seq'::regclass);


--
-- Name: web_sites id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.web_sites ALTER COLUMN id SET DEFAULT nextval('public.web_sites_id_seq'::regclass);


--
-- Name: web_vulns id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.web_vulns ALTER COLUMN id SET DEFAULT nextval('public.web_vulns_id_seq'::regclass);


--
-- Name: wmap_requests id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.wmap_requests ALTER COLUMN id SET DEFAULT nextval('public.wmap_requests_id_seq'::regclass);


--
-- Name: wmap_targets id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.wmap_targets ALTER COLUMN id SET DEFAULT nextval('public.wmap_targets_id_seq'::regclass);


--
-- Name: workspaces id; Type: DEFAULT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.workspaces ALTER COLUMN id SET DEFAULT nextval('public.workspaces_id_seq'::regclass);


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.api_keys (id, token, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2025-07-12 13:40:02.929796	2025-07-12 13:40:02.929796
\.


--
-- Data for Name: async_callbacks; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.async_callbacks (id, uuid, "timestamp", listener_uri, target_host, target_port, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: automatic_exploitation_match_results; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.automatic_exploitation_match_results (id, match_id, run_id, state, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: automatic_exploitation_match_sets; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.automatic_exploitation_match_sets (id, workspace_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: automatic_exploitation_matches; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.automatic_exploitation_matches (id, module_detail_id, state, nexpose_data_vulnerability_definition_id, created_at, updated_at, match_set_id, matchable_type, matchable_id, module_fullname) FROM stdin;
\.


--
-- Data for Name: automatic_exploitation_runs; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.automatic_exploitation_runs (id, workspace_id, user_id, match_set_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.clients (id, host_id, created_at, ua_string, ua_name, ua_ver, updated_at) FROM stdin;
\.


--
-- Data for Name: credential_cores_tasks; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.credential_cores_tasks (core_id, task_id) FROM stdin;
\.


--
-- Data for Name: credential_logins_tasks; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.credential_logins_tasks (login_id, task_id) FROM stdin;
\.


--
-- Data for Name: creds; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.creds (id, service_id, created_at, updated_at, "user", pass, active, proof, ptype, source_id, source_type) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.events (id, workspace_id, host_id, created_at, name, updated_at, critical, seen, username, info) FROM stdin;
1	1	\N	2025-07-12 13:40:23.307237	ui_start	2025-07-12 13:40:23.307237	\N	\N	\N	BAh7BjoNcmV2aXNpb24iDyRSZXZpc2lvbiQ=\n
2	1	\N	2025-07-12 13:40:23.311406	ui_command	2025-07-12 13:40:23.311406	\N	\N	\N	BAh7BjoMY29tbWFuZCILYmFubmVy\n
3	1	\N	2025-07-12 13:41:25.696416	ui_command	2025-07-12 13:41:25.696416	\N	\N	\N	BAh7BjoMY29tbWFuZCIeZGJfbm1hcCAtc24gMTcyLjIwLjAuMC8xNg==\n
4	1	\N	2025-07-12 13:47:20.524319	ui_command	2025-07-12 13:47:20.524319	\N	\N	\N	BAh7BjoMY29tbWFuZCIeZGJfbm1hcCAtdiAtc1YgMTcyLjIwLjAuNg==\n
\.


--
-- Data for Name: exploit_attempts; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.exploit_attempts (id, host_id, service_id, vuln_id, attempted_at, exploited, fail_reason, username, module, session_id, loot_id, port, proto, fail_detail) FROM stdin;
\.


--
-- Data for Name: exploited_hosts; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.exploited_hosts (id, host_id, service_id, session_uuid, name, payload, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: host_details; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.host_details (id, host_id, nx_console_id, nx_device_id, src, nx_site_name, nx_site_importance, nx_scan_template, nx_risk_score) FROM stdin;
\.


--
-- Data for Name: hosts; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.hosts (id, created_at, address, mac, comm, name, state, os_name, os_flavor, os_sp, os_lang, arch, workspace_id, updated_at, purpose, info, comments, scope, virtual_host, note_count, vuln_count, service_count, host_detail_count, exploit_attempt_count, cred_count, detected_arch, os_family) FROM stdin;
1	2025-07-12 13:49:53.584359	172.20.0.6	ba:1b:61:b0:96:4e		exploit.hacking_studies_kali-app-network	alive	Linux	\N	\N	\N	\N	1	2025-07-12 13:49:54.574565	server	\N	\N	\N	\N	0	0	21	0	0	0	\N	Linux
\.


--
-- Data for Name: hosts_tags; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.hosts_tags (host_id, tag_id, id) FROM stdin;
\.


--
-- Data for Name: listeners; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.listeners (id, created_at, updated_at, workspace_id, task_id, enabled, owner, payload, address, port, options, macro) FROM stdin;
\.


--
-- Data for Name: loots; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.loots (id, workspace_id, host_id, service_id, ltype, path, data, created_at, updated_at, content_type, name, info, module_run_id) FROM stdin;
\.


--
-- Data for Name: macros; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.macros (id, created_at, updated_at, owner, name, description, actions, prefs) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_cores; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_cores (id, origin_type, origin_id, private_id, public_id, realm_id, workspace_id, created_at, updated_at, logins_count) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_logins; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_logins (id, core_id, service_id, access_level, status, last_attempted_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_origin_cracked_passwords; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_origin_cracked_passwords (id, metasploit_credential_core_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_origin_imports; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_origin_imports (id, filename, task_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_origin_manuals; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_origin_manuals (id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_origin_services; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_origin_services (id, service_id, module_full_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_origin_sessions; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_origin_sessions (id, post_reference_name, session_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_privates; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_privates (id, type, data, created_at, updated_at, jtr_format) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_publics; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_publics (id, username, created_at, updated_at, type) FROM stdin;
\.


--
-- Data for Name: metasploit_credential_realms; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.metasploit_credential_realms (id, key, value, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mod_refs; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.mod_refs (id, module, mtype, ref) FROM stdin;
\.


--
-- Data for Name: module_actions; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_actions (id, detail_id, name) FROM stdin;
\.


--
-- Data for Name: module_archs; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_archs (id, detail_id, name) FROM stdin;
\.


--
-- Data for Name: module_authors; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_authors (id, detail_id, name, email) FROM stdin;
\.


--
-- Data for Name: module_details; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_details (id, mtime, file, mtype, refname, fullname, name, rank, description, license, privileged, disclosure_date, default_target, default_action, stance, ready) FROM stdin;
\.


--
-- Data for Name: module_mixins; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_mixins (id, detail_id, name) FROM stdin;
\.


--
-- Data for Name: module_platforms; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_platforms (id, detail_id, name) FROM stdin;
\.


--
-- Data for Name: module_refs; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_refs (id, detail_id, name) FROM stdin;
\.


--
-- Data for Name: module_runs; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_runs (id, attempted_at, fail_detail, fail_reason, module_fullname, port, proto, session_id, status, trackable_id, trackable_type, user_id, username, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: module_targets; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.module_targets (id, detail_id, index, name) FROM stdin;
\.


--
-- Data for Name: nexpose_consoles; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.nexpose_consoles (id, created_at, updated_at, enabled, owner, address, port, username, password, status, version, cert, cached_sites, name) FROM stdin;
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.notes (id, created_at, ntype, workspace_id, service_id, host_id, updated_at, critical, seen, data, vuln_id) FROM stdin;
\.


--
-- Data for Name: payloads; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.payloads (id, name, uuid, uuid_mask, "timestamp", arch, platform, urls, description, raw_payload, raw_payload_hash, build_status, build_opts, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: profiles; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.profiles (id, created_at, updated_at, active, name, owner, settings) FROM stdin;
\.


--
-- Data for Name: refs; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.refs (id, ref_id, created_at, name, updated_at) FROM stdin;
\.


--
-- Data for Name: report_templates; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.report_templates (id, workspace_id, created_by, path, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.reports (id, workspace_id, created_by, rtype, path, options, created_at, updated_at, downloaded_at, task_id, name) FROM stdin;
\.


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.routes (id, session_id, subnet, netmask) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.schema_migrations (version) FROM stdin;
0
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
20100819123300
20100824151500
20100908001428
20100911122000
20100916151530
20100916175000
20100920012100
20100926214000
20101001000000
20101002000000
20101007000000
20101008111800
20101009023300
20101104135100
20101203000000
20101203000001
20101206212033
20110112154300
20110204112800
20110317144932
20110414180600
20110415175705
20110422000000
20110425095900
20110513143900
20110517160800
20110527000000
20110527000001
20110606000001
20110622000000
20110624000001
20110625000001
20110630000001
20110630000002
20110717000001
20110727163801
20110730000001
20110812000001
20110922000000
20110928101300
20111011110000
20111203000000
20111204000000
20111210000000
20120126110000
20120411173220
20120601152442
20120625000000
20120625000001
20120625000002
20120625000003
20120625000004
20120625000005
20120625000006
20120625000007
20120625000008
20120718202805
20130228214900
20130412154159
20130412171844
20130412173121
20130412173640
20130412174254
20130412174719
20130412175040
20130423211152
20130430151353
20130430162145
20130510021637
20130515164311
20130515172727
20130516204810
20130522001343
20130522032517
20130522041110
20130525015035
20130525212420
20130531144949
20130604145732
20130717150737
20131002004641
20131002164449
20131008213344
20131011184338
20131017150735
20131021185657
20140331173835
20140407212345
20140410132401
20140410161611
20140410191213
20140410205410
20140411142102
20140411205325
20140414192550
20140417140933
20140520140817
20140603163708
20140605173747
20140702184622
20140703144541
20140722174919
20140728191933
20140801150537
20140905031549
20140922170030
20150106201450
20150112203945
20150205192745
20150209195939
20150212214222
20150219173821
20150219215039
20150226151459
20150312155312
20150317145455
20150326183742
20150421211719
20150514182921
20160415153312
20161004165612
20161107153145
20161107203710
20161227212223
20180904120211
20190308134512
20190507120211
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.services (id, host_id, created_at, port, proto, state, name, updated_at, info) FROM stdin;
1	1	2025-07-12 13:49:53.601119	21	tcp	open	ftp	2025-07-12 13:49:53.601119	vsftpd 2.3.4
2	1	2025-07-12 13:49:54.519451	22	tcp	open	ssh	2025-07-12 13:49:54.519451	OpenSSH 4.7p1 Debian 8ubuntu1 protocol 2.0
3	1	2025-07-12 13:49:54.534541	23	tcp	open	telnet	2025-07-12 13:49:54.534541	Linux telnetd
4	1	2025-07-12 13:49:54.549497	25	tcp	open	smtp	2025-07-12 13:49:54.549497	Postfix smtpd
5	1	2025-07-12 13:49:54.564433	80	tcp	open	http	2025-07-12 13:49:54.564433	Apache httpd 2.2.8 (Ubuntu) DAV/2
6	1	2025-07-12 13:49:54.582852	111	tcp	open	rpcbind	2025-07-12 13:49:54.582852	2 RPC #100000
7	1	2025-07-12 13:49:54.599505	139	tcp	open	netbios-ssn	2025-07-12 13:49:54.599505	Samba smbd 3.X - 4.X workgroup: WORKGROUP
8	1	2025-07-12 13:49:54.615986	445	tcp	open	netbios-ssn	2025-07-12 13:49:54.615986	Samba smbd 3.X - 4.X workgroup: WORKGROUP
9	1	2025-07-12 13:49:54.632045	512	tcp	open	exec	2025-07-12 13:49:54.632045	
10	1	2025-07-12 13:49:54.64752	513	tcp	open	login	2025-07-12 13:49:54.64752	
11	1	2025-07-12 13:49:54.663408	514	tcp	open	tcpwrapped	2025-07-12 13:49:54.663408	
12	1	2025-07-12 13:49:54.678644	1099	tcp	open	java-rmi	2025-07-12 13:49:54.678644	GNU Classpath grmiregistry
13	1	2025-07-12 13:49:54.693682	1524	tcp	open	ingreslock	2025-07-12 13:49:54.693682	
14	1	2025-07-12 13:49:54.708932	2121	tcp	open	ftp	2025-07-12 13:49:54.708932	ProFTPD 1.3.1
15	1	2025-07-12 13:49:54.724994	3306	tcp	open	mysql	2025-07-12 13:49:54.724994	MySQL 5.0.51a-3ubuntu5
16	1	2025-07-12 13:49:54.740764	5432	tcp	open	postgresql	2025-07-12 13:49:54.740764	PostgreSQL DB 8.3.0 - 8.3.7
17	1	2025-07-12 13:49:54.755728	5900	tcp	open	vnc	2025-07-12 13:49:54.755728	VNC protocol 3.3
18	1	2025-07-12 13:49:54.771086	6000	tcp	open	x11	2025-07-12 13:49:54.771086	access denied
19	1	2025-07-12 13:49:54.786479	6667	tcp	open	irc	2025-07-12 13:49:54.786479	UnrealIRCd
20	1	2025-07-12 13:49:54.802277	8009	tcp	open	ajp13	2025-07-12 13:49:54.802277	Apache Jserv Protocol v1.3
21	1	2025-07-12 13:49:54.817923	8180	tcp	open	http	2025-07-12 13:49:54.817923	Apache Tomcat/Coyote JSP engine 1.1
\.


--
-- Data for Name: session_events; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.session_events (id, session_id, etype, command, output, remote_path, local_path, created_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.sessions (id, host_id, stype, via_exploit, via_payload, "desc", port, platform, datastore, opened_at, closed_at, close_reason, local_id, last_seen, module_run_id) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.tags (id, user_id, name, "desc", report_summary, report_detail, critical, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: task_creds; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.task_creds (id, task_id, cred_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: task_hosts; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.task_hosts (id, task_id, host_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: task_services; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.task_services (id, task_id, service_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: task_sessions; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.task_sessions (id, task_id, session_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.tasks (id, workspace_id, created_by, module, completed_at, path, info, description, progress, options, error, created_at, updated_at, result, module_uuid, settings) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.users (id, username, crypted_password, password_salt, persistence_token, created_at, updated_at, fullname, email, phone, company, prefs, admin) FROM stdin;
\.


--
-- Data for Name: vuln_attempts; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.vuln_attempts (id, vuln_id, attempted_at, exploited, fail_reason, username, module, session_id, loot_id, fail_detail) FROM stdin;
\.


--
-- Data for Name: vuln_details; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.vuln_details (id, vuln_id, cvss_score, cvss_vector, title, description, solution, proof, nx_console_id, nx_device_id, nx_vuln_id, nx_severity, nx_pci_severity, nx_published, nx_added, nx_modified, nx_tags, nx_vuln_status, nx_proof_key, src, nx_scan_id, nx_vulnerable_since, nx_pci_compliance_status) FROM stdin;
\.


--
-- Data for Name: vulns; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.vulns (id, host_id, service_id, created_at, name, updated_at, info, exploited_at, vuln_detail_count, vuln_attempt_count, origin_id, origin_type) FROM stdin;
\.


--
-- Data for Name: vulns_refs; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.vulns_refs (ref_id, vuln_id, id) FROM stdin;
\.


--
-- Data for Name: web_forms; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.web_forms (id, web_site_id, created_at, updated_at, path, method, params, query) FROM stdin;
\.


--
-- Data for Name: web_pages; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.web_pages (id, web_site_id, created_at, updated_at, path, query, code, cookie, auth, ctype, mtime, location, headers, body, request) FROM stdin;
\.


--
-- Data for Name: web_sites; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.web_sites (id, service_id, created_at, updated_at, vhost, comments, options) FROM stdin;
\.


--
-- Data for Name: web_vulns; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.web_vulns (id, web_site_id, created_at, updated_at, path, method, params, pname, risk, name, query, category, confidence, description, blame, request, proof, owner, payload) FROM stdin;
\.


--
-- Data for Name: wmap_requests; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.wmap_requests (id, host, address, port, ssl, meth, path, headers, query, body, respcode, resphead, response, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: wmap_targets; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.wmap_targets (id, host, address, port, ssl, selected, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: workspace_members; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.workspace_members (workspace_id, user_id) FROM stdin;
\.


--
-- Data for Name: workspaces; Type: TABLE DATA; Schema: public; Owner: msf
--

COPY public.workspaces (id, name, created_at, updated_at, boundary, description, owner_id, limit_to_network, import_fingerprint) FROM stdin;
1	default	2025-07-12 13:40:23.293094	2025-07-12 13:40:23.293094	\N	\N	\N	f	f
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.api_keys_id_seq', 1, false);


--
-- Name: async_callbacks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.async_callbacks_id_seq', 1, false);


--
-- Name: automatic_exploitation_match_results_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.automatic_exploitation_match_results_id_seq', 1, false);


--
-- Name: automatic_exploitation_match_sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.automatic_exploitation_match_sets_id_seq', 1, false);


--
-- Name: automatic_exploitation_matches_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.automatic_exploitation_matches_id_seq', 1, false);


--
-- Name: automatic_exploitation_runs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.automatic_exploitation_runs_id_seq', 1, false);


--
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.clients_id_seq', 1, false);


--
-- Name: creds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.creds_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.events_id_seq', 4, true);


--
-- Name: exploit_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.exploit_attempts_id_seq', 1, false);


--
-- Name: exploited_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.exploited_hosts_id_seq', 1, false);


--
-- Name: host_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.host_details_id_seq', 1, false);


--
-- Name: hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.hosts_id_seq', 1, true);


--
-- Name: hosts_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.hosts_tags_id_seq', 1, false);


--
-- Name: listeners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.listeners_id_seq', 1, false);


--
-- Name: loots_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.loots_id_seq', 1, false);


--
-- Name: macros_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.macros_id_seq', 1, false);


--
-- Name: metasploit_credential_cores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_cores_id_seq', 1, false);


--
-- Name: metasploit_credential_logins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_logins_id_seq', 1, false);


--
-- Name: metasploit_credential_origin_cracked_passwords_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_origin_cracked_passwords_id_seq', 1, false);


--
-- Name: metasploit_credential_origin_imports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_origin_imports_id_seq', 1, false);


--
-- Name: metasploit_credential_origin_manuals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_origin_manuals_id_seq', 1, false);


--
-- Name: metasploit_credential_origin_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_origin_services_id_seq', 1, false);


--
-- Name: metasploit_credential_origin_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_origin_sessions_id_seq', 1, false);


--
-- Name: metasploit_credential_privates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_privates_id_seq', 1, false);


--
-- Name: metasploit_credential_publics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_publics_id_seq', 1, false);


--
-- Name: metasploit_credential_realms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.metasploit_credential_realms_id_seq', 1, false);


--
-- Name: mod_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.mod_refs_id_seq', 1, false);


--
-- Name: module_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_actions_id_seq', 1, false);


--
-- Name: module_archs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_archs_id_seq', 1, false);


--
-- Name: module_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_authors_id_seq', 1, false);


--
-- Name: module_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_details_id_seq', 1, false);


--
-- Name: module_mixins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_mixins_id_seq', 1, false);


--
-- Name: module_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_platforms_id_seq', 1, false);


--
-- Name: module_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_refs_id_seq', 1, false);


--
-- Name: module_runs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_runs_id_seq', 1, false);


--
-- Name: module_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.module_targets_id_seq', 1, false);


--
-- Name: nexpose_consoles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.nexpose_consoles_id_seq', 1, false);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.notes_id_seq', 1, false);


--
-- Name: payloads_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.payloads_id_seq', 1, false);


--
-- Name: profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.profiles_id_seq', 1, false);


--
-- Name: refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.refs_id_seq', 1, false);


--
-- Name: report_templates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.report_templates_id_seq', 1, false);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.reports_id_seq', 1, false);


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.routes_id_seq', 1, false);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.services_id_seq', 21, true);


--
-- Name: session_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.session_events_id_seq', 1, false);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.sessions_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.tags_id_seq', 1, false);


--
-- Name: task_creds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.task_creds_id_seq', 1, false);


--
-- Name: task_hosts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.task_hosts_id_seq', 1, false);


--
-- Name: task_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.task_services_id_seq', 1, false);


--
-- Name: task_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.task_sessions_id_seq', 1, false);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.tasks_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: vuln_attempts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.vuln_attempts_id_seq', 1, false);


--
-- Name: vuln_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.vuln_details_id_seq', 1, false);


--
-- Name: vulns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.vulns_id_seq', 1, false);


--
-- Name: vulns_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.vulns_refs_id_seq', 1, false);


--
-- Name: web_forms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.web_forms_id_seq', 1, false);


--
-- Name: web_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.web_pages_id_seq', 1, false);


--
-- Name: web_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.web_sites_id_seq', 1, false);


--
-- Name: web_vulns_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.web_vulns_id_seq', 1, false);


--
-- Name: wmap_requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.wmap_requests_id_seq', 1, false);


--
-- Name: wmap_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.wmap_targets_id_seq', 1, false);


--
-- Name: workspaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: msf
--

SELECT pg_catalog.setval('public.workspaces_id_seq', 1, true);


--
-- Name: api_keys api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: async_callbacks async_callbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.async_callbacks
    ADD CONSTRAINT async_callbacks_pkey PRIMARY KEY (id);


--
-- Name: automatic_exploitation_match_results automatic_exploitation_match_results_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.automatic_exploitation_match_results
    ADD CONSTRAINT automatic_exploitation_match_results_pkey PRIMARY KEY (id);


--
-- Name: automatic_exploitation_match_sets automatic_exploitation_match_sets_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.automatic_exploitation_match_sets
    ADD CONSTRAINT automatic_exploitation_match_sets_pkey PRIMARY KEY (id);


--
-- Name: automatic_exploitation_matches automatic_exploitation_matches_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.automatic_exploitation_matches
    ADD CONSTRAINT automatic_exploitation_matches_pkey PRIMARY KEY (id);


--
-- Name: automatic_exploitation_runs automatic_exploitation_runs_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.automatic_exploitation_runs
    ADD CONSTRAINT automatic_exploitation_runs_pkey PRIMARY KEY (id);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- Name: creds creds_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.creds
    ADD CONSTRAINT creds_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: exploit_attempts exploit_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.exploit_attempts
    ADD CONSTRAINT exploit_attempts_pkey PRIMARY KEY (id);


--
-- Name: exploited_hosts exploited_hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.exploited_hosts
    ADD CONSTRAINT exploited_hosts_pkey PRIMARY KEY (id);


--
-- Name: host_details host_details_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.host_details
    ADD CONSTRAINT host_details_pkey PRIMARY KEY (id);


--
-- Name: hosts hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.hosts
    ADD CONSTRAINT hosts_pkey PRIMARY KEY (id);


--
-- Name: hosts_tags hosts_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.hosts_tags
    ADD CONSTRAINT hosts_tags_pkey PRIMARY KEY (id);


--
-- Name: listeners listeners_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.listeners
    ADD CONSTRAINT listeners_pkey PRIMARY KEY (id);


--
-- Name: loots loots_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.loots
    ADD CONSTRAINT loots_pkey PRIMARY KEY (id);


--
-- Name: macros macros_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.macros
    ADD CONSTRAINT macros_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_cores metasploit_credential_cores_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_cores
    ADD CONSTRAINT metasploit_credential_cores_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_logins metasploit_credential_logins_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_logins
    ADD CONSTRAINT metasploit_credential_logins_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_origin_cracked_passwords metasploit_credential_origin_cracked_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_cracked_passwords
    ADD CONSTRAINT metasploit_credential_origin_cracked_passwords_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_origin_imports metasploit_credential_origin_imports_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_imports
    ADD CONSTRAINT metasploit_credential_origin_imports_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_origin_manuals metasploit_credential_origin_manuals_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_manuals
    ADD CONSTRAINT metasploit_credential_origin_manuals_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_origin_services metasploit_credential_origin_services_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_services
    ADD CONSTRAINT metasploit_credential_origin_services_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_origin_sessions metasploit_credential_origin_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_origin_sessions
    ADD CONSTRAINT metasploit_credential_origin_sessions_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_privates metasploit_credential_privates_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_privates
    ADD CONSTRAINT metasploit_credential_privates_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_publics metasploit_credential_publics_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_publics
    ADD CONSTRAINT metasploit_credential_publics_pkey PRIMARY KEY (id);


--
-- Name: metasploit_credential_realms metasploit_credential_realms_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.metasploit_credential_realms
    ADD CONSTRAINT metasploit_credential_realms_pkey PRIMARY KEY (id);


--
-- Name: mod_refs mod_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.mod_refs
    ADD CONSTRAINT mod_refs_pkey PRIMARY KEY (id);


--
-- Name: module_actions module_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_actions
    ADD CONSTRAINT module_actions_pkey PRIMARY KEY (id);


--
-- Name: module_archs module_archs_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_archs
    ADD CONSTRAINT module_archs_pkey PRIMARY KEY (id);


--
-- Name: module_authors module_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_authors
    ADD CONSTRAINT module_authors_pkey PRIMARY KEY (id);


--
-- Name: module_details module_details_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_details
    ADD CONSTRAINT module_details_pkey PRIMARY KEY (id);


--
-- Name: module_mixins module_mixins_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_mixins
    ADD CONSTRAINT module_mixins_pkey PRIMARY KEY (id);


--
-- Name: module_platforms module_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_platforms
    ADD CONSTRAINT module_platforms_pkey PRIMARY KEY (id);


--
-- Name: module_refs module_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_refs
    ADD CONSTRAINT module_refs_pkey PRIMARY KEY (id);


--
-- Name: module_runs module_runs_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_runs
    ADD CONSTRAINT module_runs_pkey PRIMARY KEY (id);


--
-- Name: module_targets module_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.module_targets
    ADD CONSTRAINT module_targets_pkey PRIMARY KEY (id);


--
-- Name: nexpose_consoles nexpose_consoles_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.nexpose_consoles
    ADD CONSTRAINT nexpose_consoles_pkey PRIMARY KEY (id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: payloads payloads_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.payloads
    ADD CONSTRAINT payloads_pkey PRIMARY KEY (id);


--
-- Name: profiles profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (id);


--
-- Name: refs refs_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.refs
    ADD CONSTRAINT refs_pkey PRIMARY KEY (id);


--
-- Name: report_templates report_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.report_templates
    ADD CONSTRAINT report_templates_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: session_events session_events_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.session_events
    ADD CONSTRAINT session_events_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: task_creds task_creds_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.task_creds
    ADD CONSTRAINT task_creds_pkey PRIMARY KEY (id);


--
-- Name: task_hosts task_hosts_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.task_hosts
    ADD CONSTRAINT task_hosts_pkey PRIMARY KEY (id);


--
-- Name: task_services task_services_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.task_services
    ADD CONSTRAINT task_services_pkey PRIMARY KEY (id);


--
-- Name: task_sessions task_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.task_sessions
    ADD CONSTRAINT task_sessions_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vuln_attempts vuln_attempts_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.vuln_attempts
    ADD CONSTRAINT vuln_attempts_pkey PRIMARY KEY (id);


--
-- Name: vuln_details vuln_details_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.vuln_details
    ADD CONSTRAINT vuln_details_pkey PRIMARY KEY (id);


--
-- Name: vulns vulns_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.vulns
    ADD CONSTRAINT vulns_pkey PRIMARY KEY (id);


--
-- Name: vulns_refs vulns_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.vulns_refs
    ADD CONSTRAINT vulns_refs_pkey PRIMARY KEY (id);


--
-- Name: web_forms web_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.web_forms
    ADD CONSTRAINT web_forms_pkey PRIMARY KEY (id);


--
-- Name: web_pages web_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.web_pages
    ADD CONSTRAINT web_pages_pkey PRIMARY KEY (id);


--
-- Name: web_sites web_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.web_sites
    ADD CONSTRAINT web_sites_pkey PRIMARY KEY (id);


--
-- Name: web_vulns web_vulns_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.web_vulns
    ADD CONSTRAINT web_vulns_pkey PRIMARY KEY (id);


--
-- Name: wmap_requests wmap_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.wmap_requests
    ADD CONSTRAINT wmap_requests_pkey PRIMARY KEY (id);


--
-- Name: wmap_targets wmap_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.wmap_targets
    ADD CONSTRAINT wmap_targets_pkey PRIMARY KEY (id);


--
-- Name: workspaces workspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: msf
--

ALTER TABLE ONLY public.workspaces
    ADD CONSTRAINT workspaces_pkey PRIMARY KEY (id);


--
-- Name: index_automatic_exploitation_match_results_on_match_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_match_results_on_match_id ON public.automatic_exploitation_match_results USING btree (match_id);


--
-- Name: index_automatic_exploitation_match_results_on_run_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_match_results_on_run_id ON public.automatic_exploitation_match_results USING btree (run_id);


--
-- Name: index_automatic_exploitation_match_sets_on_user_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_match_sets_on_user_id ON public.automatic_exploitation_match_sets USING btree (user_id);


--
-- Name: index_automatic_exploitation_match_sets_on_workspace_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_match_sets_on_workspace_id ON public.automatic_exploitation_match_sets USING btree (workspace_id);


--
-- Name: index_automatic_exploitation_matches_on_module_detail_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_matches_on_module_detail_id ON public.automatic_exploitation_matches USING btree (module_detail_id);


--
-- Name: index_automatic_exploitation_matches_on_module_fullname; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_matches_on_module_fullname ON public.automatic_exploitation_matches USING btree (module_fullname);


--
-- Name: index_automatic_exploitation_runs_on_match_set_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_runs_on_match_set_id ON public.automatic_exploitation_runs USING btree (match_set_id);


--
-- Name: index_automatic_exploitation_runs_on_user_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_runs_on_user_id ON public.automatic_exploitation_runs USING btree (user_id);


--
-- Name: index_automatic_exploitation_runs_on_workspace_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_automatic_exploitation_runs_on_workspace_id ON public.automatic_exploitation_runs USING btree (workspace_id);


--
-- Name: index_hosts_on_name; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_hosts_on_name ON public.hosts USING btree (name);


--
-- Name: index_hosts_on_os_flavor; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_hosts_on_os_flavor ON public.hosts USING btree (os_flavor);


--
-- Name: index_hosts_on_os_name; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_hosts_on_os_name ON public.hosts USING btree (os_name);


--
-- Name: index_hosts_on_purpose; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_hosts_on_purpose ON public.hosts USING btree (purpose);


--
-- Name: index_hosts_on_state; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_hosts_on_state ON public.hosts USING btree (state);


--
-- Name: index_hosts_on_workspace_id_and_address; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX index_hosts_on_workspace_id_and_address ON public.hosts USING btree (workspace_id, address);


--
-- Name: index_loots_on_module_run_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_loots_on_module_run_id ON public.loots USING btree (module_run_id);


--
-- Name: index_metasploit_credential_cores_on_origin_type_and_origin_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_metasploit_credential_cores_on_origin_type_and_origin_id ON public.metasploit_credential_cores USING btree (origin_type, origin_id);


--
-- Name: index_metasploit_credential_cores_on_private_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_metasploit_credential_cores_on_private_id ON public.metasploit_credential_cores USING btree (private_id);


--
-- Name: index_metasploit_credential_cores_on_public_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_metasploit_credential_cores_on_public_id ON public.metasploit_credential_cores USING btree (public_id);


--
-- Name: index_metasploit_credential_cores_on_realm_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_metasploit_credential_cores_on_realm_id ON public.metasploit_credential_cores USING btree (realm_id);


--
-- Name: index_metasploit_credential_cores_on_workspace_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_metasploit_credential_cores_on_workspace_id ON public.metasploit_credential_cores USING btree (workspace_id);


--
-- Name: index_metasploit_credential_logins_on_core_id_and_service_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX index_metasploit_credential_logins_on_core_id_and_service_id ON public.metasploit_credential_logins USING btree (core_id, service_id);


--
-- Name: index_metasploit_credential_logins_on_service_id_and_core_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX index_metasploit_credential_logins_on_service_id_and_core_id ON public.metasploit_credential_logins USING btree (service_id, core_id);


--
-- Name: index_metasploit_credential_origin_imports_on_task_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_metasploit_credential_origin_imports_on_task_id ON public.metasploit_credential_origin_imports USING btree (task_id);


--
-- Name: index_metasploit_credential_origin_manuals_on_user_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_metasploit_credential_origin_manuals_on_user_id ON public.metasploit_credential_origin_manuals USING btree (user_id);


--
-- Name: index_metasploit_credential_privates_on_type_and_data; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX index_metasploit_credential_privates_on_type_and_data ON public.metasploit_credential_privates USING btree (type, data) WHERE (NOT ((type)::text = 'Metasploit::Credential::SSHKey'::text));


--
-- Name: index_metasploit_credential_privates_on_type_and_data_sshkey; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX index_metasploit_credential_privates_on_type_and_data_sshkey ON public.metasploit_credential_privates USING btree (type, decode(md5(data), 'hex'::text)) WHERE ((type)::text = 'Metasploit::Credential::SSHKey'::text);


--
-- Name: index_metasploit_credential_publics_on_username; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX index_metasploit_credential_publics_on_username ON public.metasploit_credential_publics USING btree (username);


--
-- Name: index_metasploit_credential_realms_on_key_and_value; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX index_metasploit_credential_realms_on_key_and_value ON public.metasploit_credential_realms USING btree (key, value);


--
-- Name: index_module_actions_on_detail_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_actions_on_detail_id ON public.module_actions USING btree (detail_id);


--
-- Name: index_module_archs_on_detail_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_archs_on_detail_id ON public.module_archs USING btree (detail_id);


--
-- Name: index_module_authors_on_detail_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_authors_on_detail_id ON public.module_authors USING btree (detail_id);


--
-- Name: index_module_details_on_description; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_details_on_description ON public.module_details USING btree (description);


--
-- Name: index_module_details_on_mtype; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_details_on_mtype ON public.module_details USING btree (mtype);


--
-- Name: index_module_details_on_name; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_details_on_name ON public.module_details USING btree (name);


--
-- Name: index_module_details_on_refname; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_details_on_refname ON public.module_details USING btree (refname);


--
-- Name: index_module_mixins_on_detail_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_mixins_on_detail_id ON public.module_mixins USING btree (detail_id);


--
-- Name: index_module_platforms_on_detail_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_platforms_on_detail_id ON public.module_platforms USING btree (detail_id);


--
-- Name: index_module_refs_on_detail_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_refs_on_detail_id ON public.module_refs USING btree (detail_id);


--
-- Name: index_module_refs_on_name; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_refs_on_name ON public.module_refs USING btree (name);


--
-- Name: index_module_runs_on_session_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_runs_on_session_id ON public.module_runs USING btree (session_id);


--
-- Name: index_module_runs_on_user_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_runs_on_user_id ON public.module_runs USING btree (user_id);


--
-- Name: index_module_targets_on_detail_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_module_targets_on_detail_id ON public.module_targets USING btree (detail_id);


--
-- Name: index_notes_on_ntype; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_notes_on_ntype ON public.notes USING btree (ntype);


--
-- Name: index_notes_on_vuln_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_notes_on_vuln_id ON public.notes USING btree (vuln_id);


--
-- Name: index_refs_on_name; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_refs_on_name ON public.refs USING btree (name);


--
-- Name: index_services_on_host_id_and_port_and_proto; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX index_services_on_host_id_and_port_and_proto ON public.services USING btree (host_id, port, proto);


--
-- Name: index_services_on_name; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_services_on_name ON public.services USING btree (name);


--
-- Name: index_services_on_port; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_services_on_port ON public.services USING btree (port);


--
-- Name: index_services_on_proto; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_services_on_proto ON public.services USING btree (proto);


--
-- Name: index_services_on_state; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_services_on_state ON public.services USING btree (state);


--
-- Name: index_sessions_on_module_run_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_sessions_on_module_run_id ON public.sessions USING btree (module_run_id);


--
-- Name: index_vulns_on_name; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_vulns_on_name ON public.vulns USING btree (name);


--
-- Name: index_vulns_on_origin_id; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_vulns_on_origin_id ON public.vulns USING btree (origin_id);


--
-- Name: index_web_forms_on_path; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_forms_on_path ON public.web_forms USING btree (path);


--
-- Name: index_web_pages_on_path; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_pages_on_path ON public.web_pages USING btree (path);


--
-- Name: index_web_pages_on_query; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_pages_on_query ON public.web_pages USING btree (query);


--
-- Name: index_web_sites_on_comments; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_sites_on_comments ON public.web_sites USING btree (comments);


--
-- Name: index_web_sites_on_options; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_sites_on_options ON public.web_sites USING btree (options);


--
-- Name: index_web_sites_on_vhost; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_sites_on_vhost ON public.web_sites USING btree (vhost);


--
-- Name: index_web_vulns_on_method; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_vulns_on_method ON public.web_vulns USING btree (method);


--
-- Name: index_web_vulns_on_name; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_vulns_on_name ON public.web_vulns USING btree (name);


--
-- Name: index_web_vulns_on_path; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX index_web_vulns_on_path ON public.web_vulns USING btree (path);


--
-- Name: originating_credential_cores; Type: INDEX; Schema: public; Owner: msf
--

CREATE INDEX originating_credential_cores ON public.metasploit_credential_origin_cracked_passwords USING btree (metasploit_credential_core_id);


--
-- Name: unique_complete_metasploit_credential_cores; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX unique_complete_metasploit_credential_cores ON public.metasploit_credential_cores USING btree (workspace_id, realm_id, public_id, private_id) WHERE ((realm_id IS NOT NULL) AND (public_id IS NOT NULL) AND (private_id IS NOT NULL));


--
-- Name: unique_metasploit_credential_origin_services; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX unique_metasploit_credential_origin_services ON public.metasploit_credential_origin_services USING btree (service_id, module_full_name);


--
-- Name: unique_metasploit_credential_origin_sessions; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX unique_metasploit_credential_origin_sessions ON public.metasploit_credential_origin_sessions USING btree (session_id, post_reference_name);


--
-- Name: unique_private_metasploit_credential_cores; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX unique_private_metasploit_credential_cores ON public.metasploit_credential_cores USING btree (workspace_id, private_id) WHERE ((realm_id IS NULL) AND (public_id IS NULL) AND (private_id IS NOT NULL));


--
-- Name: unique_privateless_metasploit_credential_cores; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX unique_privateless_metasploit_credential_cores ON public.metasploit_credential_cores USING btree (workspace_id, realm_id, public_id) WHERE ((realm_id IS NOT NULL) AND (public_id IS NOT NULL) AND (private_id IS NULL));


--
-- Name: unique_public_metasploit_credential_cores; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX unique_public_metasploit_credential_cores ON public.metasploit_credential_cores USING btree (workspace_id, public_id) WHERE ((realm_id IS NULL) AND (public_id IS NOT NULL) AND (private_id IS NULL));


--
-- Name: unique_publicless_metasploit_credential_cores; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX unique_publicless_metasploit_credential_cores ON public.metasploit_credential_cores USING btree (workspace_id, realm_id, private_id) WHERE ((realm_id IS NOT NULL) AND (public_id IS NULL) AND (private_id IS NOT NULL));


--
-- Name: unique_realmless_metasploit_credential_cores; Type: INDEX; Schema: public; Owner: msf
--

CREATE UNIQUE INDEX unique_realmless_metasploit_credential_cores ON public.metasploit_credential_cores USING btree (workspace_id, public_id, private_id) WHERE ((realm_id IS NULL) AND (public_id IS NOT NULL) AND (private_id IS NOT NULL));


--
-- PostgreSQL database dump complete
--

