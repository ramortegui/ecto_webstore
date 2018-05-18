--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    parent_id integer,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: cc_transactions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE cc_transactions (
    code character varying(255) NOT NULL,
    order_id integer NOT NULL,
    transdate timestamp with time zone,
    processor character varying(255) NOT NULL,
    processor_trans_id character varying(255) NOT NULL,
    amount numeric NOT NULL,
    cc_num character varying(255),
    cc_type character varying(255),
    response text,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: coupons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE coupons (
    id integer NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    active boolean DEFAULT true,
    value numeric,
    multiple boolean DEFAULT false,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: coupons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE coupons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: coupons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE coupons_id_seq OWNED BY coupons.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE order_products (
    product_id character varying(255) NOT NULL,
    order_id integer NOT NULL,
    sku character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    price numeric NOT NULL,
    quantity integer NOT NULL,
    subtotal numeric NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE product_categories (
    category_id integer NOT NULL,
    product_id character varying(255) NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: product_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE product_statuses (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: product_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_statuses_id_seq OWNED BY product_statuses.id;


--
-- Name: product_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE product_tags (
    product_id character varying(255) NOT NULL,
    tag_id integer NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id integer NOT NULL,
    sku character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    product_status_id integer NOT NULL,
    regular_price numeric DEFAULT 0,
    discount_price numeric DEFAULT 0,
    quantity integer DEFAULT 0,
    taxable boolean DEFAULT false,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE roles_id_seq OWNED BY roles.id;


--
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sales_orders (
    id integer NOT NULL,
    order_date date NOT NULL,
    total numeric NOT NULL,
    coupon_id integer,
    session_id character varying(255) NOT NULL,
    user_id integer NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: sales_orders_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sales_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sales_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sales_orders_id_seq OWNED BY sales_orders.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sessions (
    id character varying(255) NOT NULL,
    data text,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    active boolean DEFAULT true,
    inserted_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
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
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: coupons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY coupons ALTER COLUMN id SET DEFAULT nextval('coupons_id_seq'::regclass);


--
-- Name: product_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_statuses ALTER COLUMN id SET DEFAULT nextval('product_statuses_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: sales_orders id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_orders ALTER COLUMN id SET DEFAULT nextval('sales_orders_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: categories pk_categories; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (id);


--
-- Name: cc_transactions pk_cc_transactions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cc_transactions
    ADD CONSTRAINT pk_cc_transactions PRIMARY KEY (code);


--
-- Name: coupons pk_coupons; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY coupons
    ADD CONSTRAINT pk_coupons PRIMARY KEY (id);


--
-- Name: order_products pk_order_products; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT pk_order_products PRIMARY KEY (product_id, order_id);


--
-- Name: product_categories pk_product_categories; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_categories
    ADD CONSTRAINT pk_product_categories PRIMARY KEY (category_id, product_id);


--
-- Name: product_statuses pk_product_statuses; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_statuses
    ADD CONSTRAINT pk_product_statuses PRIMARY KEY (id);


--
-- Name: product_tags pk_product_tags; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_tags
    ADD CONSTRAINT pk_product_tags PRIMARY KEY (product_id, tag_id);


--
-- Name: products pk_products; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT pk_products PRIMARY KEY (id);


--
-- Name: roles pk_roles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (id);


--
-- Name: sales_orders pk_sales_orders; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_orders
    ADD CONSTRAINT pk_sales_orders PRIMARY KEY (id);


--
-- Name: sessions pk_sessions; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT pk_sessions PRIMARY KEY (id);


--
-- Name: tags pk_tags; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT pk_tags PRIMARY KEY (id);


--
-- Name: user_roles pk_user_roles; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT pk_user_roles PRIMARY KEY (user_id, role_id);


--
-- Name: users pk_users; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT pk_users PRIMARY KEY (id);


--
-- Name: categories fk_category_parent_category; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT fk_category_parent_category FOREIGN KEY (parent_id) REFERENCES categories(id);


--
-- Name: product_categories fk_category_products_categories; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_categories
    ADD CONSTRAINT fk_category_products_categories FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- Name: sales_orders fk_coupon_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_orders
    ADD CONSTRAINT fk_coupon_order FOREIGN KEY (coupon_id) REFERENCES coupons(id);


--
-- Name: products fk_product_statuses_product; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_product_statuses_product FOREIGN KEY (product_status_id) REFERENCES product_statuses(id);


--
-- Name: user_roles fk_roles_user_roles; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fk_roles_user_roles FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: cc_transactions fk_sales_order_cc_transaction; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY cc_transactions
    ADD CONSTRAINT fk_sales_order_cc_transaction FOREIGN KEY (order_id) REFERENCES sales_orders(id);


--
-- Name: order_products fk_sales_orders_order_products; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY order_products
    ADD CONSTRAINT fk_sales_orders_order_products FOREIGN KEY (order_id) REFERENCES sales_orders(id);


--
-- Name: sales_orders fk_session_sales_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_orders
    ADD CONSTRAINT fk_session_sales_order FOREIGN KEY (session_id) REFERENCES sessions(id);


--
-- Name: product_tags fk_tags_product_tags; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_tags
    ADD CONSTRAINT fk_tags_product_tags FOREIGN KEY (tag_id) REFERENCES tags(id);


--
-- Name: sales_orders fk_user_sales_order; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sales_orders
    ADD CONSTRAINT fk_user_sales_order FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_roles fk_users_user_roles; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fk_users_user_roles FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

