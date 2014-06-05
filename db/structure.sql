--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_videos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admin_videos (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    video_url character varying(255),
    name character varying(255),
    user_id integer
);


--
-- Name: admin_videos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admin_videos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_videos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admin_videos_id_seq OWNED BY admin_videos.id;


--
-- Name: organization_managements; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organization_managements (
    id integer NOT NULL,
    organization_admin_id integer,
    organization_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    contact hstore,
    invoice hstore,
    orders hstore,
    commission hstore,
    user_rep hstore
);


--
-- Name: organization_managements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organization_managements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_managements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organization_managements_id_seq OWNED BY organization_managements.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    email character varying(255),
    website character varying(255),
    status boolean DEFAULT false,
    mailing_address text,
    billing_address text,
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    country character varying(255),
    phone character varying(255),
    fax character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: stores; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stores (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    manufacturer character varying(255),
    contact character varying(255),
    address text,
    city character varying(255),
    state character varying(255),
    zip character varying(255),
    country character varying(255),
    phone character varying(255),
    fax character varying(255),
    website character varying(255),
    status boolean DEFAULT false
);


--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: user_store_managements; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE user_store_managements (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    contact hstore,
    invoice hstore,
    orders hstore,
    commission hstore,
    user_rep hstore,
    store_id integer,
    user_id integer
);


--
-- Name: user_store_managements_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_store_managements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_store_managements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_store_managements_id_seq OWNED BY user_store_managements.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    role character varying(255) DEFAULT 'user'::character varying,
    name character varying(255),
    last_name character varying(255),
    initial character varying(255),
    address character varying(255),
    city character varying(255),
    state character varying(255),
    zip integer,
    country character varying(255),
    cell_phone integer,
    home_phone integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY admin_videos ALTER COLUMN id SET DEFAULT nextval('admin_videos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organization_managements ALTER COLUMN id SET DEFAULT nextval('organization_managements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_store_managements ALTER COLUMN id SET DEFAULT nextval('user_store_managements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: admin_videos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admin_videos
    ADD CONSTRAINT admin_videos_pkey PRIMARY KEY (id);


--
-- Name: organization_managements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organization_managements
    ADD CONSTRAINT organization_managements_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: stores_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: user_store_managements_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY user_store_managements
    ADD CONSTRAINT user_store_managements_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: organization_managements_commission; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX organization_managements_commission ON organization_managements USING gin (commission);


--
-- Name: organization_managements_contact; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX organization_managements_contact ON organization_managements USING gin (contact);


--
-- Name: organization_managements_invoice; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX organization_managements_invoice ON organization_managements USING gin (invoice);


--
-- Name: organization_managements_orders; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX organization_managements_orders ON organization_managements USING gin (orders);


--
-- Name: organization_managements_user_rep; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX organization_managements_user_rep ON organization_managements USING gin (user_rep);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: user_store_managements_commission; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX user_store_managements_commission ON user_store_managements USING gin (commission);


--
-- Name: user_store_managements_contact; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX user_store_managements_contact ON user_store_managements USING gin (contact);


--
-- Name: user_store_managements_invoice; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX user_store_managements_invoice ON user_store_managements USING gin (invoice);


--
-- Name: user_store_managements_orders; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX user_store_managements_orders ON user_store_managements USING gin (orders);


--
-- Name: user_store_managements_user_rep; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX user_store_managements_user_rep ON user_store_managements USING gin (user_rep);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20140528134931');

INSERT INTO schema_migrations (version) VALUES ('20140530074736');

INSERT INTO schema_migrations (version) VALUES ('20140530075151');

INSERT INTO schema_migrations (version) VALUES ('20140530092544');

INSERT INTO schema_migrations (version) VALUES ('20140531115140');

INSERT INTO schema_migrations (version) VALUES ('20140602130427');

INSERT INTO schema_migrations (version) VALUES ('20140603073624');

INSERT INTO schema_migrations (version) VALUES ('20140603151728');

INSERT INTO schema_migrations (version) VALUES ('20140604062322');

INSERT INTO schema_migrations (version) VALUES ('20140604063230');

INSERT INTO schema_migrations (version) VALUES ('20140604063337');

INSERT INTO schema_migrations (version) VALUES ('20140604063528');

INSERT INTO schema_migrations (version) VALUES ('20140604072944');

INSERT INTO schema_migrations (version) VALUES ('20140605062227');

INSERT INTO schema_migrations (version) VALUES ('20140605062432');

INSERT INTO schema_migrations (version) VALUES ('20140605062643');

INSERT INTO schema_migrations (version) VALUES ('20140605063109');
