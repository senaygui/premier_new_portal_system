--
-- PostgreSQL database dump
--

-- Dumped from database version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.18 (Ubuntu 12.18-0ubuntu0.20.04.1)

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

--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: academic_calendars; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.academic_calendars (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    calender_year character varying NOT NULL,
    calender_year_in_gc character varying NOT NULL,
    calender_year_in_ec character varying NOT NULL,
    starting_date timestamp without time zone NOT NULL,
    ending_date timestamp without time zone NOT NULL,
    admission_type character varying NOT NULL,
    study_level character varying NOT NULL,
    from_year integer,
    to_year integer,
    remark character varying,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.academic_calendars OWNER TO newdeploy;

--
-- Name: academic_statuses; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.academic_statuses (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    grade_system_id uuid,
    status character varying,
    min_value numeric,
    max_value numeric,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.academic_statuses OWNER TO newdeploy;

--
-- Name: active_admin_comments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.active_admin_comments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    namespace character varying,
    body text,
    resource_type character varying,
    resource_id uuid,
    author_type character varying,
    author_id uuid,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_admin_comments OWNER TO newdeploy;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.active_storage_attachments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id uuid NOT NULL,
    blob_id uuid NOT NULL,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.active_storage_attachments OWNER TO newdeploy;

--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.active_storage_blobs (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp without time zone NOT NULL,
    service_name character varying NOT NULL
);


ALTER TABLE public.active_storage_blobs OWNER TO newdeploy;

--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id uuid NOT NULL,
    variation_digest character varying NOT NULL
);


ALTER TABLE public.active_storage_variant_records OWNER TO newdeploy;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: newdeploy
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.active_storage_variant_records_id_seq OWNER TO newdeploy;

--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newdeploy
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.activities (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    academic_calendar_id uuid,
    activity character varying NOT NULL,
    semester integer NOT NULL,
    description character varying,
    category character varying NOT NULL,
    starting_date timestamp without time zone NOT NULL,
    ending_date timestamp without time zone NOT NULL,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.activities OWNER TO newdeploy;

--
-- Name: add_and_drop_courses; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.add_and_drop_courses (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    add_and_drop_id uuid,
    course_id uuid,
    add_or_drop character varying NOT NULL,
    advisor_approval character varying DEFAULT 'pending'::character varying,
    advisor_name character varying,
    advisor_date_of_response timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.add_and_drop_courses OWNER TO newdeploy;

--
-- Name: add_and_drops; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.add_and_drops (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    academic_calendar_id uuid,
    semester_registration_id uuid,
    department_id uuid,
    program_id uuid,
    section_id uuid,
    semester integer,
    year integer,
    student_full_name character varying,
    student_id_number character varying,
    registrar_approval character varying DEFAULT 'pending'::character varying,
    registrar_name character varying,
    registrar_date_of_response timestamp without time zone,
    advisor_approval character varying DEFAULT 'pending'::character varying,
    advisor_name character varying,
    advisor_date_of_response timestamp without time zone,
    status character varying DEFAULT 'pending'::character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.add_and_drops OWNER TO newdeploy;

--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.admin_users (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    middle_name character varying,
    role character varying DEFAULT 'admin'::character varying NOT NULL,
    username character varying,
    department_id uuid,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.admin_users OWNER TO newdeploy;

--
-- Name: almunis; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.almunis (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    fullname character varying NOT NULL,
    sex character varying NOT NULL,
    phone_number character varying NOT NULL,
    modality character varying,
    study_level character varying,
    graduation_date timestamp without time zone,
    program_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.almunis OWNER TO newdeploy;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO newdeploy;

--
-- Name: assessment_plans; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.assessment_plans (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    course_id uuid,
    assessment_title character varying NOT NULL,
    assessment_weight numeric NOT NULL,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    final_exam boolean DEFAULT false
);


ALTER TABLE public.assessment_plans OWNER TO newdeploy;

--
-- Name: assessments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.assessments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    course_id uuid,
    student_grade_id uuid,
    assessment_plan_id uuid,
    result numeric,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    final_exam boolean DEFAULT false
);


ALTER TABLE public.assessments OWNER TO newdeploy;

--
-- Name: attendances; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.attendances (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    program_id uuid,
    section_id uuid,
    course_id uuid,
    academic_calendar_id uuid,
    course_title character varying,
    attendance_title character varying,
    year integer,
    semester integer,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.attendances OWNER TO newdeploy;

--
-- Name: college_payments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.college_payments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    study_level character varying NOT NULL,
    admission_type character varying NOT NULL,
    student_nationality character varying,
    total_fee numeric DEFAULT 0.0,
    registration_fee numeric DEFAULT 0.0,
    late_registration_fee numeric DEFAULT 0.0,
    starting_penalty_fee numeric DEFAULT 0.0,
    daily_penalty_fee numeric DEFAULT 0.0,
    makeup_exam_fee numeric DEFAULT 0.0,
    add_drop numeric DEFAULT 0.0,
    tution_per_credit_hr numeric DEFAULT 0.0,
    readmission numeric DEFAULT 0.0,
    reissuance_of_grade_report numeric DEFAULT 0.0,
    student_copy numeric DEFAULT 0.0,
    additional_student_copy numeric DEFAULT 0.0,
    tempo numeric DEFAULT 0.0,
    original_certificate numeric DEFAULT 0.0,
    original_certificate_replacement numeric DEFAULT 0.0,
    tempo_replacement numeric DEFAULT 0.0,
    letter numeric DEFAULT 0.0,
    student_id_card numeric DEFAULT 0.0,
    student_id_card_replacement numeric DEFAULT 0.0,
    name_change numeric DEFAULT 0.0,
    transfer_fee numeric DEFAULT 0.0,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.college_payments OWNER TO newdeploy;

--
-- Name: colleges; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.colleges (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    college_name character varying NOT NULL,
    background text,
    mission text,
    vision text,
    overview text,
    headquarter character varying,
    sub_city character varying,
    state character varying,
    region character varying,
    zone character varying,
    worda character varying,
    city character varying,
    country character varying,
    phone_number character varying,
    alternative_phone_number character varying,
    email character varying,
    facebook_handle character varying,
    twitter_handle character varying,
    instagram_handle character varying,
    map_embed character varying,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.colleges OWNER TO newdeploy;

--
-- Name: course_assessments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.course_assessments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    curriculums_id uuid,
    weight integer,
    assessment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.course_assessments OWNER TO newdeploy;

--
-- Name: course_exemptions; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.course_exemptions (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    course_id uuid,
    letter_grade character varying NOT NULL,
    credit_hour integer NOT NULL,
    course_taken character varying NOT NULL,
    exemption_approval character varying DEFAULT 'pending'::character varying,
    exemption_type character varying,
    exemptible_type character varying,
    exemptible_id uuid,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.course_exemptions OWNER TO newdeploy;

--
-- Name: course_instructors; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.course_instructors (
    id bigint NOT NULL,
    admin_user_id uuid,
    course_id uuid,
    academic_calendar_id uuid,
    section_id uuid,
    semester integer,
    year integer,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.course_instructors OWNER TO newdeploy;

--
-- Name: course_instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: newdeploy
--

CREATE SEQUENCE public.course_instructors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.course_instructors_id_seq OWNER TO newdeploy;

--
-- Name: course_instructors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: newdeploy
--

ALTER SEQUENCE public.course_instructors_id_seq OWNED BY public.course_instructors.id;


--
-- Name: course_modules; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.course_modules (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    module_title character varying NOT NULL,
    department_id uuid,
    module_code character varying NOT NULL,
    overview text,
    description text,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.course_modules OWNER TO newdeploy;

--
-- Name: course_registrations; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.course_registrations (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    program_id uuid,
    semester_registration_id uuid,
    department_id uuid,
    course_id uuid,
    academic_calendar_id uuid,
    section_id uuid,
    semester integer,
    year integer,
    student_full_name character varying,
    enrollment_status character varying DEFAULT 'pending'::character varying,
    course_title character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    academic_year integer
);


ALTER TABLE public.course_registrations OWNER TO newdeploy;

--
-- Name: course_sections; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.course_sections (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    section_short_name character varying NOT NULL,
    section_full_name character varying NOT NULL,
    course_id uuid,
    course_title character varying,
    program_name character varying,
    total_capacity integer,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.course_sections OWNER TO newdeploy;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.courses (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    course_module_id uuid,
    curriculum_id uuid,
    program_id uuid,
    course_title character varying NOT NULL,
    course_code character varying NOT NULL,
    course_description text,
    year integer DEFAULT 1 NOT NULL,
    semester integer DEFAULT 1 NOT NULL,
    course_starting_date timestamp without time zone,
    course_ending_date timestamp without time zone,
    credit_hour integer NOT NULL,
    lecture_hour integer NOT NULL,
    lab_hour integer DEFAULT 0,
    ects integer NOT NULL,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    major boolean DEFAULT false
);


ALTER TABLE public.courses OWNER TO newdeploy;

--
-- Name: curriculums; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.curriculums (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    program_id uuid,
    curriculum_title character varying NOT NULL,
    curriculum_version character varying NOT NULL,
    total_course integer,
    total_ects integer,
    total_credit_hour integer,
    active_status character varying DEFAULT 'active'::character varying,
    curriculum_active_date timestamp without time zone NOT NULL,
    depreciation_date timestamp without time zone,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.curriculums OWNER TO newdeploy;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.departments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    faculty_id uuid,
    department_name character varying,
    overview text,
    background text,
    facility text,
    location character varying,
    phone_number character varying,
    alternative_phone_number character varying,
    email character varying,
    facebook_handle character varying,
    twitter_handle character varying,
    telegram_handle character varying,
    instagram_handle character varying,
    map_embed character varying,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.departments OWNER TO newdeploy;

--
-- Name: emergency_contacts; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.emergency_contacts (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    full_name character varying NOT NULL,
    relationship character varying,
    cell_phone character varying NOT NULL,
    email character varying,
    current_occupation character varying,
    name_of_current_employer character varying,
    pobox character varying,
    email_of_employer character varying,
    office_phone_number character varying,
    created_by character varying DEFAULT 'self'::character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.emergency_contacts OWNER TO newdeploy;

--
-- Name: faculties; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.faculties (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    faculty_name character varying NOT NULL,
    overview text,
    background text,
    location character varying,
    phone_number character varying,
    alternative_phone_number character varying,
    email character varying,
    facebook_handle character varying,
    twitter_handle character varying,
    telegram_handle character varying,
    instagram_handle character varying,
    map_embed character varying,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.faculties OWNER TO newdeploy;

--
-- Name: grade_changes; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.grade_changes (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    academic_calendar_id uuid,
    program_id uuid,
    department_id uuid,
    student_id uuid,
    course_id uuid,
    section_id uuid,
    course_registration_id uuid,
    student_grade_id uuid,
    assessment_id uuid,
    semester integer,
    year integer,
    add_mark numeric,
    previous_result_total numeric,
    previous_letter_grade character varying,
    current_result_total numeric,
    current_letter_grade character varying,
    reason character varying,
    instructor_approval character varying DEFAULT 'pending'::character varying,
    instructor_name character varying,
    instructor_date_of_response timestamp without time zone,
    registrar_approval character varying DEFAULT 'pending'::character varying,
    registrar_name character varying,
    registrar_date_of_response timestamp without time zone,
    dean_approval character varying DEFAULT 'pending'::character varying,
    dean_name character varying,
    dean_date_of_response timestamp without time zone,
    department_approval character varying DEFAULT 'pending'::character varying,
    department_head_name character varying,
    department_head_date_of_response timestamp without time zone,
    academic_affair_approval character varying DEFAULT 'pending'::character varying,
    academic_affair_name character varying,
    academic_affair_date_of_response timestamp without time zone,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.grade_changes OWNER TO newdeploy;

--
-- Name: grade_reports; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.grade_reports (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    semester_registration_id uuid,
    student_id uuid,
    academic_calendar_id uuid,
    program_id uuid,
    department_id uuid,
    section_id uuid,
    admission_type character varying NOT NULL,
    study_level character varying NOT NULL,
    total_course integer NOT NULL,
    total_credit_hour numeric NOT NULL,
    total_grade_point numeric NOT NULL,
    cumulative_total_credit_hour numeric NOT NULL,
    cumulative_total_grade_point numeric NOT NULL,
    cgpa numeric NOT NULL,
    sgpa numeric NOT NULL,
    semester integer NOT NULL,
    year integer NOT NULL,
    academic_status character varying,
    registrar_approval character varying DEFAULT 'pending'::character varying,
    registrar_name character varying,
    dean_approval character varying DEFAULT 'approved'::character varying,
    dean_name character varying,
    department_approval character varying DEFAULT 'pending'::character varying,
    department_head_name character varying,
    updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.grade_reports OWNER TO newdeploy;

--
-- Name: grade_rules; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.grade_rules (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    admission_type character varying,
    study_level character varying,
    min_cgpa_value_to_pass integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.grade_rules OWNER TO newdeploy;

--
-- Name: grade_systems; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.grade_systems (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    program_id uuid,
    curriculum_id uuid,
    min_cgpa_value_to_pass numeric,
    min_cgpa_value_to_graduate numeric,
    remark character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.grade_systems OWNER TO newdeploy;

--
-- Name: grades; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.grades (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    grade_system_id uuid,
    letter_grade character varying NOT NULL,
    grade_point numeric NOT NULL,
    min_row_mark integer NOT NULL,
    max_row_mark integer NOT NULL,
    updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.grades OWNER TO newdeploy;

--
-- Name: invoice_items; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.invoice_items (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    itemable_type character varying,
    itemable_id uuid,
    course_registration_id uuid,
    course_id uuid,
    item_title character varying,
    price numeric DEFAULT 0.0,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoice_items OWNER TO newdeploy;

--
-- Name: invoices; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.invoices (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    semester_registration_id uuid,
    student_id uuid,
    academic_calendar_id uuid,
    department_id uuid,
    program_id uuid,
    semester integer,
    year integer,
    student_full_name character varying,
    student_id_number character varying,
    invoice_number character varying NOT NULL,
    total_price numeric,
    registration_fee numeric DEFAULT 0.0,
    late_registration_fee numeric DEFAULT 0.0,
    invoice_status character varying DEFAULT 'unpaid'::character varying,
    last_updated_by character varying,
    created_by character varying,
    due_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.invoices OWNER TO newdeploy;

--
-- Name: makeup_exams; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.makeup_exams (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    academic_calendar_id uuid,
    program_id uuid,
    department_id uuid,
    student_id uuid,
    course_id uuid,
    section_id uuid,
    course_registration_id uuid,
    student_grade_id uuid,
    assessment_id uuid,
    semester integer,
    year integer,
    add_mark numeric,
    previous_result_total numeric,
    previous_letter_grade character varying,
    current_result_total numeric,
    current_letter_grade character varying,
    reason character varying,
    instructor_approval character varying DEFAULT 'pending'::character varying,
    instructor_name character varying,
    instructor_date_of_response timestamp without time zone,
    registrar_approval character varying DEFAULT 'pending'::character varying,
    registrar_name character varying,
    registrar_date_of_response timestamp without time zone,
    dean_approval character varying DEFAULT 'pending'::character varying,
    dean_name character varying,
    dean_date_of_response timestamp without time zone,
    department_approval character varying DEFAULT 'pending'::character varying,
    department_head_name character varying,
    department_head_date_of_response timestamp without time zone,
    academic_affair_approval character varying DEFAULT 'pending'::character varying,
    academic_affair_name character varying,
    academic_affair_date_of_response timestamp without time zone,
    status character varying DEFAULT 'pending'::character varying,
    updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.makeup_exams OWNER TO newdeploy;

--
-- Name: other_payments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.other_payments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    academic_calendar_id uuid,
    semester_registration_id uuid,
    department_id uuid,
    program_id uuid,
    section_id uuid,
    semester integer,
    year integer,
    student_full_name character varying,
    student_id_number character varying,
    invoice_number character varying NOT NULL,
    total_price numeric,
    invoice_status character varying DEFAULT 'unpaid'::character varying,
    payment_type character varying,
    payable_type character varying,
    payable_id uuid,
    due_date timestamp without time zone,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.other_payments OWNER TO newdeploy;

--
-- Name: payment_methods; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.payment_methods (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    bank_name character varying NOT NULL,
    account_full_name character varying NOT NULL,
    account_number character varying,
    phone_number character varying,
    account_type character varying,
    payment_method_type character varying NOT NULL,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.payment_methods OWNER TO newdeploy;

--
-- Name: payment_transactions; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.payment_transactions (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    invoiceable_type character varying,
    invoiceable_id uuid,
    payment_method_id uuid,
    account_holder_fullname character varying NOT NULL,
    phone_number character varying,
    account_number character varying,
    transaction_reference character varying,
    finance_approval_status character varying DEFAULT 'pending'::character varying,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.payment_transactions OWNER TO newdeploy;

--
-- Name: payments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.payments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    program_id uuid,
    version character varying,
    student_nationality character varying,
    total_fee numeric DEFAULT 0.0,
    registration_fee numeric DEFAULT 0.0,
    late_registration_fee numeric DEFAULT 0.0,
    starting_penalty_fee numeric DEFAULT 0.0,
    daily_penalty_fee numeric DEFAULT 0.0,
    makeup_exam_fee numeric DEFAULT 0.0,
    add_drop numeric DEFAULT 0.0,
    tution_per_credit_hr numeric DEFAULT 0.0,
    readmission numeric DEFAULT 0.0,
    reissuance_of_grade_report numeric DEFAULT 0.0,
    student_copy numeric DEFAULT 0.0,
    additional_student_copy numeric DEFAULT 0.0,
    tempo numeric DEFAULT 0.0,
    original_certificate numeric DEFAULT 0.0,
    original_certificate_replacement numeric DEFAULT 0.0,
    tempo_replacement numeric DEFAULT 0.0,
    letter numeric DEFAULT 0.0,
    student_id_card numeric DEFAULT 0.0,
    student_id_card_replacement numeric DEFAULT 0.0,
    name_change numeric DEFAULT 0.0,
    transfer_fee numeric DEFAULT 0.0,
    other numeric DEFAULT 0.0,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.payments OWNER TO newdeploy;

--
-- Name: prerequisites; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.prerequisites (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    course_id uuid,
    prerequisite_id uuid,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.prerequisites OWNER TO newdeploy;

--
-- Name: programs; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.programs (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    department_id uuid,
    program_name character varying NOT NULL,
    program_code character varying NOT NULL,
    study_level character varying NOT NULL,
    admission_type character varying NOT NULL,
    overview text,
    program_description text,
    total_semester integer NOT NULL,
    program_duration integer NOT NULL,
    program_semester integer NOT NULL,
    total_tuition numeric DEFAULT 0.0,
    entrance_exam_requirement_status boolean DEFAULT false,
    created_by character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.programs OWNER TO newdeploy;

--
-- Name: recurring_payments; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.recurring_payments (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    semester_registration_id uuid,
    student_id uuid,
    academic_calendar_id uuid,
    department_id uuid,
    program_id uuid,
    section_id uuid,
    semester integer,
    year integer,
    student_full_name character varying,
    student_id_number character varying,
    invoice_number character varying NOT NULL,
    total_price numeric,
    penalty numeric DEFAULT 0.0,
    daily_penalty numeric DEFAULT 0.0,
    invoice_status character varying DEFAULT 'unpaid'::character varying,
    mode_of_payment character varying,
    due_date timestamp without time zone,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.recurring_payments OWNER TO newdeploy;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO newdeploy;

--
-- Name: school_or_university_informations; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.school_or_university_informations (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    college_or_university character varying,
    phone_number character varying,
    address character varying,
    field_of_specialization character varying,
    cgpa numeric,
    last_attended_high_school character varying,
    school_address character varying,
    grade_10_result numeric,
    grade_10_exam_taken_year timestamp without time zone,
    grade_12_exam_result numeric,
    grade_12_exam_taken_year timestamp without time zone,
    level character varying,
    coc_attendance_date timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.school_or_university_informations OWNER TO newdeploy;

--
-- Name: sections; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.sections (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    program_id uuid,
    section_short_name character varying NOT NULL,
    section_full_name character varying NOT NULL,
    semester integer NOT NULL,
    year integer NOT NULL,
    total_capacity integer,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sections OWNER TO newdeploy;

--
-- Name: semester_registrations; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.semester_registrations (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    program_id uuid,
    section_id uuid,
    department_id uuid,
    student_full_name character varying,
    student_id_number character varying,
    program_name character varying,
    admission_type character varying,
    study_level character varying,
    academic_calendar_id uuid,
    total_price numeric DEFAULT 0.0,
    registration_fee numeric DEFAULT 0.0,
    late_registration_fee numeric DEFAULT 0.0,
    remaining_amount numeric DEFAULT 0.0,
    penalty numeric DEFAULT 0.0,
    mode_of_payment character varying,
    semester integer NOT NULL,
    year integer NOT NULL,
    total_enrolled_course integer,
    registrar_approval_status character varying DEFAULT 'pending'::character varying,
    finance_approval_status character varying DEFAULT 'pending'::character varying,
    last_updated_by character varying,
    created_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    actual_payment numeric,
    is_back_invoice_created boolean DEFAULT false
);


ALTER TABLE public.semester_registrations OWNER TO newdeploy;

--
-- Name: semesters; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.semesters (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    academic_calendar_id uuid,
    semester integer NOT NULL,
    starting_date timestamp without time zone NOT NULL,
    ending_date timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.semesters OWNER TO newdeploy;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.sessions (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    attendance_id uuid,
    academic_calendar_id uuid,
    course_id uuid,
    semester integer,
    year integer,
    starting_date timestamp without time zone,
    ending_date timestamp without time zone,
    session_title character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO newdeploy;

--
-- Name: student_addresses; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.student_addresses (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    country character varying NOT NULL,
    city character varying,
    region character varying,
    zone character varying,
    sub_city character varying,
    woreda character varying,
    special_location character varying,
    house_number character varying,
    moblie_number character varying NOT NULL,
    telephone_number character varying,
    pobox character varying,
    created_by character varying DEFAULT 'self'::character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.student_addresses OWNER TO newdeploy;

--
-- Name: student_attendances; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.student_attendances (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    session_id uuid,
    student_id uuid,
    course_registration_id uuid,
    student_full_name character varying,
    present boolean,
    absent boolean,
    remark character varying,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.student_attendances OWNER TO newdeploy;

--
-- Name: student_courses; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.student_courses (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    course_id uuid,
    course_title character varying NOT NULL,
    semester integer NOT NULL,
    year integer NOT NULL,
    credit_hour integer NOT NULL,
    ects integer NOT NULL,
    course_code character varying NOT NULL,
    letter_grade character varying,
    grade_point numeric,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.student_courses OWNER TO newdeploy;

--
-- Name: student_grades; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.student_grades (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    course_registration_id uuid,
    student_id uuid,
    course_id uuid,
    department_id uuid,
    program_id uuid,
    letter_grade character varying,
    assesment_total numeric,
    grade_point numeric,
    updated_by character varying,
    created_by character varying,
    department_approval character varying DEFAULT 'pending'::character varying,
    approved_by character varying,
    approval_date timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    approving_person_role character varying
);


ALTER TABLE public.student_grades OWNER TO newdeploy;

--
-- Name: students; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.students (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    middle_name character varying,
    gender character varying NOT NULL,
    date_of_birth timestamp without time zone NOT NULL,
    place_of_birth character varying,
    marital_status character varying,
    nationality character varying NOT NULL,
    current_occupation character varying,
    student_id character varying,
    old_id_number character varying,
    student_password character varying,
    student_id_taken_status boolean DEFAULT false,
    program_id uuid,
    department_id uuid,
    academic_calendar_id uuid,
    admission_type character varying NOT NULL,
    study_level character varying NOT NULL,
    year integer DEFAULT 1,
    semester integer DEFAULT 1,
    account_verification_status character varying DEFAULT 'pending'::character varying,
    document_verification_status character varying DEFAULT 'pending'::character varying,
    tempo_status boolean DEFAULT false,
    curriculum_version character varying,
    entrance_exam_result_status character varying,
    batch character varying,
    account_status character varying DEFAULT 'active'::character varying,
    graduation_status character varying DEFAULT 'pending'::character varying,
    sponsorship_status character varying,
    institution_transfer_status character varying,
    program_transfer_status character varying,
    previous_program character varying,
    previous_department character varying,
    created_by character varying DEFAULT 'self'::character varying,
    last_updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    payment_version character varying,
    admission_date date,
    graduation_year integer,
    allow_editing boolean DEFAULT false
);


ALTER TABLE public.students OWNER TO newdeploy;

--
-- Name: transfers; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.transfers (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    student_id uuid,
    program_id uuid,
    section_id uuid,
    department_id uuid,
    academic_calendar_id uuid,
    student_full_name character varying,
    id_number character varying,
    semester integer NOT NULL,
    year integer NOT NULL,
    new_department character varying,
    modality_transfer character varying,
    reason text,
    date_of_transfer timestamp without time zone,
    formal_department_head character varying,
    formal_department_head_approval character varying DEFAULT 'pending'::character varying,
    formal_department_head_approval_date timestamp without time zone,
    remark character varying,
    new_department_head character varying,
    new_department_head_approval character varying DEFAULT 'pending'::character varying,
    new_department_head_approval_date timestamp without time zone,
    dean_name character varying,
    dean_approval character varying DEFAULT 'pending'::character varying,
    dean_approval_date timestamp without time zone,
    registrar_name character varying,
    registrar_approval character varying DEFAULT 'pending'::character varying,
    registrar_approval_date timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    new_program character varying
);


ALTER TABLE public.transfers OWNER TO newdeploy;

--
-- Name: withdrawals; Type: TABLE; Schema: public; Owner: newdeploy
--

CREATE TABLE public.withdrawals (
    id uuid DEFAULT public.gen_random_uuid() NOT NULL,
    program_id uuid,
    department_id uuid,
    student_id uuid,
    section_id uuid,
    academic_calendar_id uuid,
    student_id_number character varying,
    semester integer NOT NULL,
    year integer NOT NULL,
    fee_status character varying NOT NULL,
    reason_for_withdrawal character varying NOT NULL,
    other_reason character varying,
    last_class_attended timestamp without time zone NOT NULL,
    finance_head_approval character varying DEFAULT 'pending'::character varying,
    finance_head_name character varying,
    finance_head_date_of_response timestamp without time zone,
    registrar_approval character varying DEFAULT 'pending'::character varying,
    registrar_name character varying,
    registrar_date_of_response timestamp without time zone,
    dean_approval character varying DEFAULT 'pending'::character varying,
    dean_name character varying,
    dean_date_of_response timestamp without time zone,
    department_approval character varying DEFAULT 'pending'::character varying,
    department_head_name character varying,
    department_head_date_of_response timestamp without time zone,
    library_head_approval character varying DEFAULT 'pending'::character varying,
    library_head_name character varying,
    library_head_date_of_response timestamp without time zone,
    store_head_approval character varying DEFAULT 'pending'::character varying,
    store_head_name character varying,
    store_head_date_of_response timestamp without time zone,
    created_by character varying,
    updated_by character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.withdrawals OWNER TO newdeploy;

--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: course_instructors id; Type: DEFAULT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.course_instructors ALTER COLUMN id SET DEFAULT nextval('public.course_instructors_id_seq'::regclass);


--
-- Data for Name: academic_calendars; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.academic_calendars (id, calender_year, calender_year_in_gc, calender_year_in_ec, starting_date, ending_date, admission_type, study_level, from_year, to_year, remark, last_updated_by, created_by, created_at, updated_at) FROM stdin;
a9852e43-8136-4f4a-aba5-261c6068c3fb	2023/24	2023/24	2016	2023-09-11 10:52:00	2024-06-07 10:52:00	online	graduate	\N	\N		SystemAdmin IT	admin user	2023-09-29 07:53:00	2024-05-10 07:52:02.900499
cb7580a8-512f-4c01-a001-aa652a64f987	2024	2023/24	2016	2023-09-01 16:07:00	2024-06-08 16:08:00	online	graduate	\N	\N		SystemAdmin IT	SystemAdmin IT	2024-05-08 13:10:00	2024-05-10 07:52:30.627187
\.


--
-- Data for Name: academic_statuses; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.academic_statuses (id, grade_system_id, status, min_value, max_value, created_by, updated_by, created_at, updated_at) FROM stdin;
72c14693-f7fb-4ac7-bc3e-79a8d36f7003	517917c8-746d-458e-b867-fcc3ad9e9fcf	Very Great Distinction 	4.0	4.0	\N	\N	2023-10-03 07:07:22.695356	2023-10-03 07:07:22.695356
0bfb308c-5ad9-487d-b65d-52951faa7f6a	517917c8-746d-458e-b867-fcc3ad9e9fcf	Very Great Distinction	4.0	4.0	\N	\N	2023-10-03 07:07:22.6961	2023-10-03 07:07:22.6961
3ee9ad75-63ef-4999-a738-d8575cd9d626	517917c8-746d-458e-b867-fcc3ad9e9fcf	Great Distinction	3.75	3.99	\N	\N	2023-10-03 07:07:22.696656	2023-10-03 07:07:22.696656
a54c8872-e554-47a5-b6e6-3d4347ed4f02	517917c8-746d-458e-b867-fcc3ad9e9fcf	Distinction	3.5	3.74	\N	\N	2023-10-03 07:10:23.628342	2023-10-03 07:10:23.628342
007b1fe7-0951-4784-aeb5-3ad2e432c12e	517917c8-746d-458e-b867-fcc3ad9e9fcf	Distinction	3.0	3.4	\N	\N	2023-10-03 07:11:36.117085	2023-10-03 07:11:36.117085
3c20bad8-4e5d-4bfc-91c1-ebb27768eb90	517917c8-746d-458e-b867-fcc3ad9e9fcf	Good	2.75	2.99	\N	\N	2023-10-03 07:13:13.226527	2023-10-03 07:13:13.226527
b49ddab0-7cdd-44e4-92b1-a13522187cd1	517917c8-746d-458e-b867-fcc3ad9e9fcf	Good	2.5	2.74	\N	\N	2023-10-03 07:15:33.648769	2023-10-03 07:15:33.648769
1e5e08e9-879b-421b-9f40-3552712a373f	517917c8-746d-458e-b867-fcc3ad9e9fcf	Satisfactory 	2.0	2.4	\N	\N	2023-10-03 07:18:54.423701	2023-10-03 07:18:54.423701
100761d6-00f1-44c2-984a-627ad22f714b	517917c8-746d-458e-b867-fcc3ad9e9fcf	Unsatisfactory 	1.75	1.99	\N	\N	2023-10-03 07:18:54.424366	2023-10-03 07:18:54.424366
961d0ac0-6767-4055-816e-82e9166d5dde	517917c8-746d-458e-b867-fcc3ad9e9fcf	Very Poor	1.0	1.74	\N	\N	2023-10-03 07:21:59.791224	2023-10-03 07:21:59.791224
91453a1c-5b24-4db1-8bcf-059bb6271719	517917c8-746d-458e-b867-fcc3ad9e9fcf	Fail	0.0	0.99	\N	\N	2023-10-03 07:23:44.119374	2023-10-03 07:23:44.119374
a830f6e8-bcbc-4f0c-b8a2-541eee0a12a1	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Very Great Distinction 	4.0	4.0	\N	\N	2023-10-03 07:28:17.765162	2023-10-03 07:28:17.765162
b3dfbb5d-062a-4fc1-a78c-ede2e304c66b	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Very Great Distinction	4.0	4.0	\N	\N	2023-10-03 07:28:17.766378	2023-10-03 07:28:17.766378
8802cee9-f1f7-4530-878f-edaca684e3f3	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Great Distinction	3.75	3.99	\N	\N	2023-10-03 07:29:50.207845	2023-10-03 07:29:50.207845
03840184-2497-49bd-9e7a-7ef85ebd155f	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Distinction	3.5	3.74	\N	\N	2023-10-03 07:29:50.208987	2023-10-03 07:29:50.208987
92d2b696-c163-4bc8-8fbd-db35e130031c	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Distinction	3.0	3.4	\N	\N	2023-10-03 07:33:10.954085	2023-10-03 07:33:10.954085
9d65568e-025e-4a3b-b43a-fbca473abb0b	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Good	2.75	2.99	\N	\N	2023-10-03 07:33:10.954623	2023-10-03 07:33:10.954623
56c43ab5-5fc9-41b3-b089-8bdf2a291fcb	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Good	2.5	2.74	\N	\N	2023-10-03 07:33:10.955323	2023-10-03 07:33:10.955323
e3b1cba8-93be-4128-a36f-30c03b13ca0a	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Satisfactory 	2.0	2.4	\N	\N	2023-10-03 07:33:10.955784	2023-10-03 07:33:10.955784
0e0b0433-36c1-40cf-89a9-44bdb63cef0f	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Unsatisfactory 	1.75	1.99	\N	\N	2023-10-03 07:33:10.956145	2023-10-03 07:33:10.956145
acde60cf-e790-47bf-b6c8-079406352a56	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Very Poor	1.0	1.74	\N	\N	2023-10-03 07:35:25.207439	2023-10-03 07:35:25.207439
e7ec1817-8764-4896-8529-ffa7f328fed7	fa4ab394-8f82-41b8-94be-3fe80cdb9635	Fail	0.0	0.99	\N	\N	2023-10-03 07:35:25.208038	2023-10-03 07:35:25.208038
6d474471-1f83-4b37-9158-0fa88503c25b	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Very Great Distinction 	4.0	4.0	\N	\N	2023-10-03 07:38:07.69639	2023-10-03 07:38:07.69639
7b4ea4a9-a581-44a9-9203-4fbfb6ca3468	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Very Great Distinction	4.0	4.0	\N	\N	2023-10-03 07:38:07.697261	2023-10-03 07:38:07.697261
4752ab93-3670-459d-a70a-7169faffe54c	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Great Distinction	3.75	3.99	\N	\N	2023-10-03 07:38:07.698106	2023-10-03 07:38:07.698106
aa62a9fa-8d30-4e88-a932-5613bf399ee6	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Distinction	3.5	3.74	\N	\N	2023-10-03 07:43:11.89815	2023-10-03 07:43:11.89815
4d250a54-51ab-4d88-84e3-05170912974a	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Distinction	3.0	3.4	\N	\N	2023-10-03 07:43:11.898613	2023-10-03 07:43:11.898613
4f5c8e28-fa3b-4272-a1a8-59e9a6fd82b6	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Good	2.75	2.99	\N	\N	2023-10-03 07:43:11.89912	2023-10-03 07:43:11.89912
ab7e1cd7-76b3-428a-ab64-904b819ec5cc	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Good	2.5	2.74	\N	\N	2023-10-03 07:43:11.899528	2023-10-03 07:43:11.899528
8b973406-6dbf-4349-95e6-40e67a96962f	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Satisfactory 	2.0	2.4	\N	\N	2023-10-03 07:43:11.899915	2023-10-03 07:43:11.899915
961d7d1d-6b39-46a0-af0e-8f8084f6e875	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Unsatisfactory 	1.75	1.99	\N	\N	2023-10-03 07:43:11.900435	2023-10-03 07:43:11.900435
37c9c948-88b2-4af0-84f3-1fcf1939d839	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Very Poor	1.0	1.74	\N	\N	2023-10-03 07:44:08.928352	2023-10-03 07:44:08.928352
745cfc12-ec8e-47ae-92df-9f98c0f5d0d7	e8f203e5-331b-4723-b4fa-8b1b51e474ad	Fail	0.0	0.99	\N	\N	2023-10-03 07:44:54.613581	2023-10-03 07:44:54.613581
\.


--
-- Data for Name: active_admin_comments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.active_admin_comments (id, namespace, body, resource_type, resource_id, author_type, author_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
c9842575-cedf-4b13-83e3-398702cb6b4f	bank_logo	PaymentMethod	259b136e-3d77-4062-8e10-8aa03d4a5361	5936bd6f-6c57-4ef7-9fa3-abf42e8c72f8	2023-10-19 14:13:16.010022
25393291-ae63-4378-86ba-7fc8717a4f9d	photo	AdminUser	c4e558a5-2d99-42c7-9342-1478dbfda03b	56e4a9fd-58c6-4d6b-86a4-f1e6cc0b2fb7	2023-09-29 07:54:23.60686
1ee1f118-3b22-4408-8bf7-bc2753705669	photo	AdminUser	bc078c62-6501-4db7-a38a-277ff41ae9f3	474cdd5f-b825-4e72-a6bb-126691dd1378	2023-09-29 07:57:12.483616
61d46bd3-849e-4439-af34-0b527e942353	photo	AdminUser	61f7f093-2c3e-4362-82ef-5495408940d2	ad60bc2a-2fcf-4186-8f88-c73d3c49f83c	2023-09-29 08:00:15.490789
38299169-5a87-4d28-b8fc-0b266d96516b	photo	AdminUser	08992a91-5327-46e5-a190-f74999cd4fe9	a5262896-b235-46c3-94c0-d1e92f178c7d	2023-09-29 10:56:48.427709
c0acb936-6f01-425b-904c-6e3b8d959f9a	photo	AdminUser	0ae1d18e-983f-4634-8913-38506d774441	2c4ddff7-39a8-4732-9d29-778f94fc4e1f	2023-09-29 10:57:16.920661
4341a626-d71c-4852-80ac-d8125354b838	photo	AdminUser	4354ec13-49a8-4a4f-bfb9-8f4131acfcfa	8eadb37d-774a-4fd1-957b-cd77bb05959a	2023-09-29 10:58:47.892498
52612cae-0652-4b33-a8af-54dee7eeeaf8	receipt_image	PaymentTransaction	42a50399-7bb2-448d-bd35-d2ebc1794e05	2e5e0398-ea11-40d9-8a20-6f49a00c21b3	2024-05-02 07:49:15.906948
25f5b8ee-37a8-4f98-ba03-302b72dbc0be	bank_logo	PaymentMethod	f7915c6b-a801-4146-a37e-10144e6b7ef2	cfe56d93-dbfb-4ff0-9d48-ea1003733d32	2023-10-20 11:30:18.007225
15108454-67f7-426a-8360-ccd03e595740	bank_logo	PaymentMethod	b3b5eb18-5032-401a-b7f6-c3b2fd8fde3c	9651a00a-7ed4-45e7-a6b4-6126a42e46e7	2023-10-20 11:32:14.612933
32a599d5-38b1-4b23-a185-57f312de322e	receipt_image	PaymentTransaction	86641935-5370-48c1-95ab-2a3525a8cd59	3b985361-a41d-4b71-91b9-183af9f2791d	2024-05-09 07:01:24.171335
55e3e0b8-7a7a-41ec-8433-409f43e0e366	receipt_image	PaymentTransaction	ab305f94-e96f-4582-bd00-9185980680de	dadfa50b-0422-4178-bc04-7579f8c5358d	2024-04-25 05:36:26.562399
d0dbe5f4-13ca-4ceb-a8bf-fb15383e9726	degree_certificate	Student	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	23041023-1f96-4a89-ab28-8cd7033b04e6	2024-05-10 07:58:52.991635
f2017b01-bf13-4820-a81a-4ed5c5600228	grade_10_matric	Student	84721e59-377d-4ca2-837f-57783e30d2d3	9c06ce4c-db6a-4b59-8e9c-4b4eb739ec5f	2024-01-28 19:54:53.03515
868ab1e4-f0b1-4941-bbfb-e896598c7333	grade_12_matric	Student	84721e59-377d-4ca2-837f-57783e30d2d3	41a57f8f-000d-48ee-9ff9-817f2f3e727d	2024-01-28 19:54:53.038039
a0ccf008-ba8c-442e-82e6-356ff530456a	highschool_transcript	Student	84721e59-377d-4ca2-837f-57783e30d2d3	5084f490-277d-4a5c-ad4d-5680fe8eee72	2024-01-28 19:54:53.041367
cf812863-eb01-4da3-97db-449c53e3c067	degree_certificate	Student	84721e59-377d-4ca2-837f-57783e30d2d3	a8764d7e-9869-408c-b05f-ee02c2e69cc2	2024-01-28 19:54:53.044528
c30be69d-50ae-4ffe-80f2-7c07cbd9c67d	photo	Student	84721e59-377d-4ca2-837f-57783e30d2d3	99897aab-ff8e-4956-8684-3959df24fd33	2024-01-28 19:54:53.047215
a0501585-baae-4286-9937-5e8c3cf821d0	photo	Student	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	44ef07b3-f1d5-45f6-860d-f2d0b7ecfb80	2024-05-10 07:58:52.99396
b989a19b-89f6-49f8-bfeb-552a8a96bde3	receipt_image	PaymentTransaction	22e2f25c-bea1-4b96-badd-28df5da73904	5ad88e69-0484-4678-8bef-091b42d8d831	2024-05-10 08:01:32.615258
f42e1764-f349-4e7b-b197-97c1043f1fe5	photo	Student	b1bb9c90-ac46-4997-a5dc-81b1711599e1	6401339c-a75f-4351-9305-536da144d0fc	2024-01-29 06:09:42.727075
c2ad4565-608c-40dc-b5b9-b35452656a36	grade_12_matric	Student	b1bb9c90-ac46-4997-a5dc-81b1711599e1	c01bbf0a-e271-44de-bd56-a567ae831b2b	2024-01-29 06:20:58.358105
e59e385e-be9a-4c3e-82bd-d5c83bb3b19d	degree_certificate	Student	b1bb9c90-ac46-4997-a5dc-81b1711599e1	8a0bccca-27ef-48d5-aab7-254b4f875f03	2024-01-30 07:16:39.913569
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, byte_size, checksum, created_at, service_name) FROM stdin;
5c1b9522-ad23-4ea4-9559-323afb821bf5	94wjavrmjlimk31t7r2td2leikhw	Screenshot from 2023-09-26 16-01-11.png	image/png	{"identified":true,"analyzed":true}	36781	Pt/Hg2pNFgn82uaeBJ/KzQ==	2023-09-27 16:16:39.270115	local
8ea66217-3885-4086-83b8-a320e2d2f2c7	kipy62z9r2jnfhapovbea2cs6zwa	Screenshot from 2023-09-13 13-08-27.png	image/png	{"identified":true,"analyzed":true}	100273	sjc+FZ8w+2cCIC2SNVHafg==	2023-09-27 16:16:39.278197	local
b0d50ce6-56c7-492d-923b-5471ec65a25a	ht8pozla8qgqkdo6sj1lc9o343zu	Screenshot from 2023-09-26 16-01-11.png	image/png	{"identified":true,"analyzed":true}	36781	Pt/Hg2pNFgn82uaeBJ/KzQ==	2023-09-27 16:16:39.275788	local
d0c9284e-1a51-4180-9a16-895c4be3e160	lqqa3eyshjj8nhxa7m0uhjvk8v82	Screenshot from 2023-09-20 07-17-52.png	image/png	{"identified":true,"analyzed":true}	201543	VAJVm2lIfH1KONKlhinsfA==	2023-09-27 16:16:39.273361	local
995ac753-a1f9-4da2-9ae5-959891adb54e	f0ibm5cwn7jo4c5gy4c4i1vw79km	cbe-logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	107956	lb8KwECkvG0E3ewqWKvFeg==	2023-10-03 11:52:39.190291	local
b73c80a2-e0d0-4268-ae7c-e9ffd0220401	cm1jrmph2p56ntwfqwdhpsoeefgk	premier.jpg	image/png	{"identified":true,"analyzed":true}	65664	WD/vnGGq0WWDB2BWe9Elig==	2023-09-27 18:59:56.170544	local
092a466d-3da7-45f4-8e4e-f9506ca440eb	x3tl8qhtrm4mrcizdmhmi215bm2y	Screenshot from 2023-09-25 08-21-28.png	image/png	{"identified":true,"analyzed":true}	3688	EAm3NKDbWA5HZHs3H7eo3A==	2023-09-27 18:59:56.164901	local
3ae60355-d703-4abc-b9c2-e2cc6556aebf	q628e9fge8hzdxzhwflvc0j5nhg6	Screenshot from 2023-09-27 19-04-20.png	image/png	{"identified":true,"analyzed":true}	68092	XOnaYZck9QqZwtkPhn+UyQ==	2023-09-27 18:59:56.172983	local
a71f0776-231f-47c7-8cec-851a0eec6a50	gu0kijcmltvge0ocnxafflmgi5ri	Screenshot from 2023-09-27 19-04-20.png	image/png	{"identified":true,"analyzed":true}	68092	XOnaYZck9QqZwtkPhn+UyQ==	2023-09-27 18:59:56.167903	local
474cdd5f-b825-4e72-a6bb-126691dd1378	3rotqoe40o2bf9cso9rn6irusk5i	pfhgh.jpg	image/jpeg	{"identified":true,"analyzed":true}	9592	7O0cjc/iqLVMyvTDAVapJw==	2023-09-29 07:57:12.483038	local
dbf3eb5e-3137-499b-af9e-f5bab6fabeed	4aq82bdc6e10b9y7d464a2s05hce	Screenshot from 2023-09-26 16-01-11.png	image/png	{"identified":true,"analyzed":true}	36781	Pt/Hg2pNFgn82uaeBJ/KzQ==	2023-09-29 04:59:51.707747	local
ab886c86-9961-4916-b2a4-a31a70998146	z33uiny237jgcradhe26u6mlwaxy	Screenshot from 2023-09-13 08-48-04.png	image/png	{"identified":true,"analyzed":true}	9721	y76wpkXsyk8VxNzyztU4Bw==	2023-09-29 04:59:51.710292	local
232fb6f3-27ed-47d6-981b-684b428f721c	9jiom6tufmqklvawkypgvawxw2ry	Screenshot from 2023-09-13 08-48-04.png	image/png	{"identified":true,"analyzed":true}	9721	y76wpkXsyk8VxNzyztU4Bw==	2023-09-29 04:59:51.704776	local
dfe83b9f-427f-4ed5-9127-ea88ac0136b5	7202mqfkqmxb7ztpbwvrb9938cg0	Screenshot from 2023-09-25 08-24-57.png	image/png	{"identified":true,"analyzed":true}	423	jNfwOrMYDTOpz0h83FSoVQ==	2023-09-29 04:59:51.712573	local
4fabc2ef-50a8-431c-b7e2-9ca843445e80	9ciny5fhu8k13eum4vern3t78cu7	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 05:50:35.42056	local
56e4a9fd-58c6-4d6b-86a4-f1e6cc0b2fb7	v4ghvk6cxp6w2vefj29tintguchx	profff.png	image/png	{"identified":true,"analyzed":true}	105708	PMhANanxddOBObcYxcYOcw==	2023-09-29 07:54:23.606331	local
ad60bc2a-2fcf-4186-8f88-c73d3c49f83c	ifmap1klx9cgeh4wge8phmx9rpwc	leprff.png	image/png	{"identified":true,"analyzed":true}	53327	Z306v3XdxhOaxBFGfHku7w==	2023-09-29 08:00:15.490234	local
a5262896-b235-46c3-94c0-d1e92f178c7d	kv56gm0y9yvir62o6qt6lisopdzn	pfhgh.jpg	image/jpeg	{"identified":true,"analyzed":true}	9592	7O0cjc/iqLVMyvTDAVapJw==	2023-09-29 10:56:48.427074	local
2c4ddff7-39a8-4732-9d29-778f94fc4e1f	hderuh8m98lblwqmpqy6ozhzh95w	profff.png	image/png	{"identified":true,"analyzed":true}	105708	PMhANanxddOBObcYxcYOcw==	2023-09-29 10:57:16.919739	local
8eadb37d-774a-4fd1-957b-cd77bb05959a	22bo7r5aa84d7a40tkqs91w3b1uw	leprff.png	image/png	{"identified":true,"analyzed":true}	53327	Z306v3XdxhOaxBFGfHku7w==	2023-09-29 10:58:47.891955	local
2f4ec6e6-0aac-4d07-b12f-4575cf6f905e	3xqit48g5yxjcr96nz0nqauq6b41	cbe-logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	107956	lb8KwECkvG0E3ewqWKvFeg==	2023-10-03 11:52:39.19523	local
f5c275b5-59e5-43f9-945b-784fbe631d1c	s9p786wb88o7j9hszxa3zuc4dhbk	cbe-logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	107956	lb8KwECkvG0E3ewqWKvFeg==	2023-10-03 11:52:39.192911	local
89f7837d-0fe9-43a2-b60b-552d1183f25b	gsrogoqnrhwpescdai73dyxsq9tm	cbe-logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	107956	lb8KwECkvG0E3ewqWKvFeg==	2023-10-03 11:52:39.187286	local
294a0af2-bd92-46e0-9aff-0042121ea7bb	kw50rhv1lh4v5kk7xzrfmoqn6vv7	cbe-logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	107956	lb8KwECkvG0E3ewqWKvFeg==	2023-10-03 11:52:39.197846	local
6accb0ee-c923-4c33-9bae-e74e559bcbab	95hbf5qcowcc0y0g1160txf5979m	cbe-logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	107956	lb8KwECkvG0E3ewqWKvFeg==	2023-10-03 11:52:39.200364	local
a98dc2d1-f5a5-4b50-8591-95c19d0c9646	g6uq0xeqvhf7ec5his1sek1r4m9k	cbe-logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	107956	lb8KwECkvG0E3ewqWKvFeg==	2023-10-03 12:42:58.479125	local
e950da43-7e6e-4aa6-bec4-27f9d2272868	lefaf1yij8h2mdd3swq2ffzq2wx3	download (1).jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-04 07:46:48.650913	local
4272d790-6484-408a-8c6c-e49195c05813	7ujucvvzi685hw2yyyj11ok8zmcl	download (1).jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-04 07:46:48.653729	local
d8327910-5997-4777-9e75-5d4e7ad69966	m9yf1zun1o8fgv0uwwqn9h0pz8x0	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 05:50:35.423608	local
799937b1-1e54-4983-b8b2-f638918d9511	ss7yi68kmx673pzoizivhyler7i2	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-05 06:00:28.478756	local
dadd8bba-cefc-451d-8f3e-5278d94fd6f6	0bc8ibo3x8badehhredge039bd57	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-05 06:00:28.481486	local
b56dec62-1b5c-4e9c-8807-b092a9061c27	pwceqsl2541eez8kbsnntmpam8if	pro.jpeg	image/jpeg	{"identified":true,"analyzed":true}	4087	r5Y+zuPYnghGqMkhq95+Eg==	2023-10-05 06:59:42.626993	local
8d1bab40-f30e-4037-a7b5-7eaf51259a8b	8bohf831o9xewqc9eynn0zq1m5k1	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 07:07:57.151317	local
184db03f-1da7-4f12-be07-332125b79298	ndq81wlv7pf463kr2tllvwbcrt55	degree.jpg	image/jpeg	{"identified":true,"analyzed":true}	10331	oTfJL9klFEs8/AS7uc89FQ==	2023-10-09 09:35:24.650909	local
73351c2d-e9ac-4743-8c61-992ff794dda3	j7tl73htgxipj5d53ix2i98ff4xr	12doccc.jpg	image/jpeg	{"identified":true,"analyzed":true}	34111	07yHhJoS+GmrITgO4Ru9sA==	2023-10-09 09:35:24.646087	local
6abf1f99-2e70-460a-8289-7ae4507ba4c0	jje9pxs95c026203r6ey66p3aepp	12doccc.jpg	image/jpeg	{"identified":true,"analyzed":true}	34111	07yHhJoS+GmrITgO4Ru9sA==	2023-10-09 09:35:24.648525	local
ff96dd7e-4bc2-4333-9a0d-9d325d927ea1	dg1k9haina8dnucu0h8czgvv44d5	malpro.jpg	image/jpeg	{"identified":true,"analyzed":true}	73231	zRG7/6cFjh5TdxTbdW/Skg==	2023-10-09 09:35:24.653297	local
235d234a-31f2-48a5-ba1c-5f167c5c89e4	mdqzcdhxkylext5m9v0q3x0x1to1	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-09 09:35:24.643279	local
9f7dfbc5-48e5-4d62-8df9-95334c2ac2db	6sybj6q3rovjro868zigxpxr7dep	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 11:01:11.609051	local
0834de18-bab1-41c6-8026-3597c21e67fc	rx8vwu5rvc66foi8666b5r5kwy0e	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 11:01:11.611894	local
d5863a8b-fec4-4724-8d4f-d9e8c90349f3	8sus2nbgl87hye7h4obitepty6cf	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 11:31:45.741839	local
7f2bcb6a-08ed-4179-a34a-a16347f875c6	hmx192tlwy0mcyqeshouhhzf6xot	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 11:31:45.744734	local
81f5a19b-cac6-4761-b3b1-bb8edc4a822c	jk5e4ieikqwz1xmkcdrct2ub3yis	pro.jpeg	image/jpeg	{"identified":true,"analyzed":true}	4087	r5Y+zuPYnghGqMkhq95+Eg==	2023-10-09 11:44:09.394946	local
2b28ddb2-9e5e-4b29-886b-ddbccbfb262a	1zgbwtnpyuuseyqe8wefzftfqszy	greddd10.jpg	image/jpeg	{"identified":true,"analyzed":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-09 11:44:09.384511	local
61ac4371-2845-4e83-aaa9-213e5eb92336	x0wgwyidkn2g9tqqf3fg6zeqkbz5	greddd10.jpg	image/jpeg	{"identified":true,"analyzed":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-09 11:44:09.390139	local
27405d71-0622-4a02-a2b8-6c5e6e90cb78	4ymetaglhn4oirjx9yyhiec72mni	greddd10.jpg	image/jpeg	{"identified":true,"analyzed":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-09 11:44:09.392381	local
945085b1-ca6f-4883-897b-f34f6eddc50a	50lxdqiuzc86aqvtsp9i6ztmalk8	greddd10.jpg	image/jpeg	{"identified":true,"analyzed":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-09 11:44:09.387494	local
748cc531-e8d9-4353-9cbb-ac89ff0eb89e	f84w1u5darrbqssen1t1loqav74z	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 12:49:59.961079	local
e1e9601c-3f73-47e7-a5af-e80ff493d502	uz707t364sepfvw7nhja74swsmf2	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 12:49:59.963958	local
8b1541ad-0235-4d43-81ee-3ca4a3640a1e	vp7odfzyq1fqmxj6jws0er3kd5sf	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-09 12:51:53.478679	local
10a8e50b-9e67-4858-a801-36495bb77eb0	azh19r70660epqpbo69zin2nmwm3	logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-09 14:21:45.818788	local
74d8678a-f284-41ea-ae8b-8f9e47652bd6	fqpuh12pnojz70wo1wzz7jwhih0e	download (1).jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-09 14:21:45.815964	local
2ec0994c-0e22-40f5-b19f-2cf117a3b879	s716vw8y5xxv8ubrt6zktc48ydcz	download (1).jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-09 14:26:39.63264	local
7381641d-174f-4975-a675-b8cd5af4c035	28a6g0uowvh0z71vvbib1m7kayhg	12doccc.jpg	image/jpeg	{"identified":true,"analyzed":true}	34111	07yHhJoS+GmrITgO4Ru9sA==	2023-10-10 08:01:54.876063	local
d8d1ad26-62f5-4446-962b-fe5899262ea9	71l6cfq0gf8udqxithxz9g0gidrm	degree.jpg	image/jpeg	{"identified":true,"analyzed":true}	10331	oTfJL9klFEs8/AS7uc89FQ==	2023-10-10 08:01:54.880786	local
cbee8b69-6a70-4597-904b-b91483d6cd02	x93omc3u2iy0kboacyd9uk7lavy0	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-10 08:01:54.873422	local
0291aa7c-d59d-43c5-b645-a2e768445171	0mz6jge6zap0wz2nleujzy9sdjw4	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-10 08:01:54.878465	local
32da235b-c268-4ad8-9531-4eb25ec3a4c4	7rcl82sxd2bpucokrdux9d71d9q5	malpro.jpg	image/jpeg	{"identified":true,"analyzed":true}	73231	zRG7/6cFjh5TdxTbdW/Skg==	2023-10-10 08:01:54.88303	local
d1d2b5b0-6eb7-4f96-bb43-3cf33d111dd4	kgoptvql1n7qhxhh0savgefbqdda	cbe receipt.jpg	image/jpeg	{"identified":true,"analyzed":true}	53956	KiSNSgqT2VxlqY54J72uGg==	2023-10-10 08:14:13.250181	local
74b35256-066c-4a17-863b-205f96bad831	mouvba18f42psymcjpz0mc1ix8bm	10thdocc.jpg	image/jpeg	{"identified":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-10 12:10:55.450338	local
2b5aa0b2-51a7-48cd-ac6e-85eac1b96731	ipeelacilzaozp1gxg1rzpfey9j9	12doccc.jpg	image/jpeg	{"identified":true}	34111	07yHhJoS+GmrITgO4Ru9sA==	2023-10-10 12:10:55.453155	local
60315d61-3d6f-413b-9ef5-dc6ee899916f	43pp2raciyj1j8wkidnjfl20tw99	10thdocc.jpg	image/jpeg	{"identified":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-10 12:10:55.455464	local
51dd9dc9-6050-4ce2-b188-d766a27c53e0	w1ug5e6imvtf2uqyhl4mb6vgs1ht	degree.jpg	image/jpeg	{"identified":true}	10331	oTfJL9klFEs8/AS7uc89FQ==	2023-10-10 12:10:55.457752	local
c135c09c-4f59-46b6-91c9-23ffcf399804	87kud0x6wpksf9lu5dkdyz68d6fn	malpro.jpg	image/jpeg	{"identified":true}	73231	zRG7/6cFjh5TdxTbdW/Skg==	2023-10-10 12:10:55.460013	local
e473c2fd-ea55-40c4-9171-0b2d9b237153	ox6tbvrpusicglinht044n0xcyya	10thdocc.jpg	image/jpeg	{"identified":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-10 12:51:23.497311	local
112c7a89-388d-485d-9a31-343b6d360deb	ls4r8wn4n5l7uapnx3m09l8efnrz	12doccc.jpg	image/jpeg	{"identified":true}	34111	07yHhJoS+GmrITgO4Ru9sA==	2023-10-10 12:51:23.500334	local
87929de4-1fa4-4362-8f68-f0ce937fc5bd	yxk442e66a2xn1nq2evovglfryjm	10thdocc.jpg	image/jpeg	{"identified":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-10 12:51:23.502911	local
b7e9a110-cadf-4037-bd7e-31629bd59dcc	3sbadimwcc1c1k59oqfmrewlgtal	degree.jpg	image/jpeg	{"identified":true}	10331	oTfJL9klFEs8/AS7uc89FQ==	2023-10-10 12:51:23.505312	local
75d0140d-e39f-458d-b407-1c9caf753bb1	upgiruu95zrd3ch7mepld6wj08mf	profff.jpg	image/jpeg	{"identified":true}	13975	cZcAUR4iead3j+OstnCXuQ==	2023-10-10 12:51:23.507628	local
85cea2ef-6f0b-40a3-91d5-713454675422	xx7djvieq779u3v2c50oldeazfdo	cbe receipt.jpg	image/jpeg	{"identified":true}	53956	KiSNSgqT2VxlqY54J72uGg==	2023-10-10 12:54:02.874023	local
2bf53f4a-c536-40c3-b8c3-761d1b5d3262	ymvygzv88zggsis0kwuc91kgm1m4	cbe receipt.jpg	image/jpeg	{"identified":true}	53956	KiSNSgqT2VxlqY54J72uGg==	2023-10-10 12:56:33.898312	local
3624dc34-8a18-41cd-b0cb-4a7b6049e5da	gmg878gzd3sapjyfuixcftqvp2wc	cbe receipt.jpg	image/jpeg	{"identified":true}	53956	KiSNSgqT2VxlqY54J72uGg==	2023-10-10 13:05:31.416302	local
c26ada4b-8f23-4dd6-a312-1224f4d7cc1a	rg2vdguh74s88hyn044ee523yq4z	On website.png	image/png	{"identified":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-10 13:17:01.463445	local
53db667c-fea0-4533-aae3-19bc4b99afbe	g0xxdv92ou02wjtd7qgoo7sfbhpc	On website.png	image/png	{"identified":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-10 13:17:01.465915	local
5407713f-d4f6-42b2-9fce-39526de1dbf0	kbno6qgpof1gf4g4jkodva76hx5n	On website.png	image/png	{"identified":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-11 05:51:13.500849	local
e5a1694b-aebb-4d42-9be5-c3e943864f73	ywmj4mvochdps2n5ggjl388m0v1n	On website.png	image/png	{"identified":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-11 05:51:13.503763	local
f0d78093-9aab-4188-94f4-7f6f8edb6069	7teg4wuzvnlnas47qa3timqn7jo7	greddd10.jpg	image/jpeg	{"identified":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-11 06:00:38.774249	local
a14ea6f3-4b20-4b73-920d-7a34fc16a6bd	xzceepnuntx92z5w26ms2xgsn99z	greddd10.jpg	image/jpeg	{"identified":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-11 06:00:38.777039	local
8846a769-2dcb-4382-ae27-d80810542fa9	ly8g8sec93u42teojdh0gr8924uo	greddd10.jpg	image/jpeg	{"identified":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-11 06:00:38.779704	local
777ae96c-87e6-4176-8e14-1c74859f243b	xm09grxjafvm6o4paktl08lgotfn	greddd10.jpg	image/jpeg	{"identified":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-11 06:00:38.782236	local
bff5f82d-b5dc-411c-b318-eb0f3f9df752	ukg47g6wcnb2ba24hwii7k1nsdge	SEPRO.jpeg	image/jpeg	{"identified":true}	6348	waAPGwrhcbxJX5OvauuznA==	2023-10-11 06:00:38.784678	local
c7591491-db0c-44f4-bf1d-96312a1ea800	2v91g3xz3e55stst2vnb1sj2wlvf	download (1).jpg	image/jpeg	{"identified":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 06:26:59.690067	local
6148e6d5-1642-48e2-994f-6c42beeb08a5	sayivud3vcbzy73x0qp9cevgf16v	download (1).jpg	image/jpeg	{"identified":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 06:26:59.692934	local
87cfb80f-c531-4c1d-ae12-069feb347c63	c5e02txg35i19cqgzj8qwi2ctw9z	download (1).jpg	image/jpeg	{"identified":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 06:26:59.695305	local
d7e8046d-f59a-4771-a1f6-5ab3e70478a5	bl9vscln3qiepkayg8yc82ctzw7o	download (1).jpg	image/jpeg	{"identified":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 06:26:59.697554	local
3c511b0a-00cb-450d-8d48-61793a2a43a9	utmqj8is670afrtv1qhvk9f4mp2k	logo.jpg	image/jpeg	{"identified":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 06:26:59.699731	local
61bb484c-7b6b-4b9d-bb1f-7f8d67ee3b46	xjftrdhgnxev2gbmcy9svwkgb5vq	download (1).jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 12:04:01.255401	local
41f4dde0-d7df-4e23-a739-70bddde9f5fc	05zdh9gw7i7wgrq2grio89jkbnc2	logo.jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 12:04:01.252628	local
25347926-951f-45bc-a9c0-5fc4ff2a7905	jcd594z6b0b0vs4ngptqqbrya04h	12doccc.jpg	image/jpeg	{"identified":true,"analyzed":true}	34111	07yHhJoS+GmrITgO4Ru9sA==	2023-10-11 12:05:48.624573	local
7944477d-3a59-4680-885e-b03b802ae0fc	7nbkxjd9tnmslefnuzsaptmugya0	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-11 12:05:48.621872	local
51af9dab-df1d-4dad-a26d-46277899a34d	2gbxz90ucq2tkzwd0xfd92tvtdxx	profff.jpg	image/jpeg	{"identified":true,"analyzed":true}	13975	cZcAUR4iead3j+OstnCXuQ==	2023-10-11 12:05:48.631854	local
13a9351b-feb8-493a-86e1-460c36dbc806	4uucwq7yaic9x72ih7j0gj09higr	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-11 12:05:48.627172	local
d3200555-c393-4729-9b63-1071e2ee4611	bcddafvk9r0x35thce5noizdlofd	degree.jpg	image/jpeg	{"identified":true,"analyzed":true}	10331	oTfJL9klFEs8/AS7uc89FQ==	2023-10-11 12:05:48.629547	local
43a83690-0792-43f7-b9f6-b19e93174c2d	uq5oba2de8wl67tf6lqgggiroeq9	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-11 13:31:41.393947	local
8a7057b3-59a1-43dd-a6f0-bc23e6386931	j1t7wpudk2wcx2bgv0wrgc7pm3zj	12doccc.jpg	image/jpeg	{"identified":true,"analyzed":true}	34111	07yHhJoS+GmrITgO4Ru9sA==	2023-10-11 13:31:41.396743	local
43db369a-a7cc-4d6d-8637-d4eea4dcd607	u20v2lvgrb907it4lsj8f6jn0in2	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-11 13:31:41.39938	local
0f060500-676c-45e2-b6c2-0042c08b562a	v373ko4dhg0ff0mdu8aodmwot17q	degree.jpg	image/jpeg	{"identified":true,"analyzed":true}	10331	oTfJL9klFEs8/AS7uc89FQ==	2023-10-11 13:31:41.401996	local
bc00d876-2a61-4e9c-8f42-71d230337011	uliajzk6royi7jj7crgizgpa7gs2	malpro.jpg	image/jpeg	{"identified":true,"analyzed":true}	73231	zRG7/6cFjh5TdxTbdW/Skg==	2023-10-11 13:31:41.40455	local
d712a24e-eb3e-4be2-a22e-cc0e02c1c8e5	w2wv6p3uha5wa56x4bqxbjdbyo9h	download (1).jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 14:37:10.04695	local
2292e660-f921-418d-ac0b-1e9da6d10d60	ww6w0r45606n7cmhx2hjn1xdoojg	download (1).jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-11 14:37:10.049847	local
8fb8f1e0-eb85-49a7-94e3-cd703dd3c5a4	ihiwrxzke4xwu4hh1ve01uzcy1x2	pro.jpeg	image/jpeg	{"identified":true,"analyzed":true}	4087	r5Y+zuPYnghGqMkhq95+Eg==	2023-10-12 06:31:43.837634	local
963f6af1-ed7b-48c6-bdbd-934590803c97	0fhhe8mdl6phrtf7014wmthdubl6	Premier Logo 2.png	image/png	{"identified":true,"analyzed":true}	482491	wHoRSSy7OCa13//QeIFQow==	2023-10-12 06:31:43.827517	local
b76b3762-f808-4a13-8c3d-7c3334d0ff25	nqfc2pk61bu2dgcij1gi59ebw9xp	Premier Logo 2.png	image/png	{"identified":true,"analyzed":true}	482491	wHoRSSy7OCa13//QeIFQow==	2023-10-12 06:31:43.835257	local
12151ff4-44ad-4be6-a4a1-94d165a7beb3	4aj5jvunoa88of3mhxu93fr4t5b4	Premier Logo 1.png	image/png	{"identified":true,"analyzed":true}	1771122	+yBh2zeXaJwzkwFcnjdM8Q==	2023-10-12 06:31:43.832915	local
04dc77d7-35ff-4b8f-bff0-273a866f224a	fw4cgvtnyj0xhx26c1qs6m560mx9	Premier Logo 1.png	image/png	{"identified":true,"analyzed":true}	1771122	+yBh2zeXaJwzkwFcnjdM8Q==	2023-10-12 06:31:43.830437	local
f9ac076f-de24-41d6-8b43-50745b62967b	1ewy907upckz4j2cmokwjxrx3mxk	pic pre.png	image/png	{"identified":true,"analyzed":true}	62431	Tqm9U2GJqpArKKi5WZbLDg==	2023-10-12 11:00:21.524718	local
57c440ec-549c-4b91-9999-2e823fe4695a	nat4scslupdc5zjv9y630endvlvf	Premier Logo 2.png	image/png	{"identified":true,"analyzed":true}	482491	wHoRSSy7OCa13//QeIFQow==	2023-10-12 11:00:21.522397	local
a0adec6a-5897-437a-8986-98985903176c	2b3cxyyatx3szi6qp04krq3qq4h9	Premier Logo 2.png	image/png	{"identified":true,"analyzed":true}	482491	wHoRSSy7OCa13//QeIFQow==	2023-10-12 11:00:21.517718	local
3553282f-b9d3-44c1-ae2f-259efe080839	toumvl86yb05k51qm2ep3ob64d9z	Premier Logo 1.png	image/png	{"identified":true,"analyzed":true}	1771122	+yBh2zeXaJwzkwFcnjdM8Q==	2023-10-12 11:00:21.514969	local
f41a509d-3e37-4823-ae94-b43e79a37e8d	86yqinlc5knyilneowomuh0ablo0	Premier Logo 1.png	image/png	{"identified":true,"analyzed":true}	1771122	+yBh2zeXaJwzkwFcnjdM8Q==	2023-10-12 11:00:21.520027	local
43417d7a-ba8f-4789-90f3-1692f0b57a2e	phrdglvpbgcx2u1gj9f19cn1teiy	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-12 11:49:08.161508	local
f1a7fe7a-462f-42a7-ada2-515ecab1d228	hfcxsiy2enq97yza42bdqu9s5d6f	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-12 11:49:08.164103	local
abc3cc99-23a5-48cd-b3af-6502ea20f0f4	p9kntcjqvly5nca9qnurk4jq4deg	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-12 12:55:05.454519	local
5836fd4e-7f79-44f4-81d3-03245c8f5c2e	tvapws1nm3xspmqygvhm6o8stc90	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-12 12:55:05.457242	local
85aece73-414d-4489-bce8-9a49c7a7b2cd	yxxajoo4ow0j5rzcjmms1is8orb0	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-13 06:12:00.970667	local
bfc9ec13-ac9b-4841-af65-f59acaf7390a	r26tnsxb00pc7a4bod1i8x9e6c40	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-13 06:12:00.967744	local
3f6be6e5-b7e2-4a07-8e86-4e5a6756f5bf	uxomwkzrc66111ypv7jhfub93dev	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	5328	HQD9ojCz/d0rSkDP68mLkg==	2023-10-13 06:39:06.344569	local
1146666a-7b82-40f8-afed-ab8780ab8e9a	f0m1crhlaym5mzp976sbzc91qf8s	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	5328	HQD9ojCz/d0rSkDP68mLkg==	2023-10-13 06:39:06.347378	local
83192350-8dee-43f6-9d65-d3b5e0d87696	x91oysjcnb6p1eq01lujhxcbxs4b	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-13 12:43:22.92477	local
3c8c4a0f-a8e8-4bd3-bebf-710fb8e174ed	0hdwiecvqlm1dkyu9wyqud12rvhh	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	5328	HQD9ojCz/d0rSkDP68mLkg==	2023-10-13 07:07:25.414492	local
bbf3cfd2-f4cb-4ea4-a615-8bda179efe20	48ftphwixbggx2adko278pwftbff	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	5328	HQD9ojCz/d0rSkDP68mLkg==	2023-10-13 07:07:25.417156	local
1b255e64-f3ab-4d11-898d-58f56afea0d5	itvjk4yz36n24ncorn8c92boqlue	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-13 12:43:22.927591	local
8ca0a5a3-a135-442f-b6fe-fd8e286234d9	0nc6km8ilus3sbhjw76yu63wbawz	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-13 07:16:40.180287	local
596d4a1b-cae8-4b84-a114-4e6568d59f3d	0s00r3bqokq8u09mug41f1654q0j	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-13 07:16:40.183207	local
a17a436c-ec78-4803-8bb2-6c343bccf38c	wkju7a67etywj2rddlorc4j78hu3	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-13 11:53:23.633448	local
d4c30c63-d197-4248-98b5-3bd1e34e3ffd	sd7377eceg5hbsfvvyz8rv9y3af9	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-13 11:53:23.636421	local
e5306a96-cfaa-4b46-bdd3-c519ebb6e6d2	v2ktofg51yn1yxtitwzsejqwszsn	profff.jpg	image/jpeg	{"identified":true,"analyzed":true}	13975	cZcAUR4iead3j+OstnCXuQ==	2023-10-13 13:48:29.851283	local
4184078f-faf7-4b99-b9f2-1cbd2111ca72	xg2h5v0un20ef6rodmecolj8tp3h	12doccc.jpg	image/jpeg	{"identified":true,"analyzed":true}	34111	07yHhJoS+GmrITgO4Ru9sA==	2023-10-13 13:48:29.843661	local
eb4acc59-d37d-48dd-9112-783124960309	8ehpytpktuf1ehxr9sc59cyw9vws	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-13 13:48:29.846351	local
9d80f4fc-4575-463d-a510-a26c8cfee4e4	p78v3aodkqotj1y9zat86g1yhsyt	10thdocc.jpg	image/jpeg	{"identified":true,"analyzed":true}	236691	D5ALObRAL7AqfgNFgpmG/Q==	2023-10-13 13:48:29.840788	local
df056c6e-7d60-4fc6-97d8-528f9d471d01	t26x5umonqm9x2dvn0wl7nb2mj6x	degree.jpg	image/jpeg	{"identified":true,"analyzed":true}	10331	oTfJL9klFEs8/AS7uc89FQ==	2023-10-13 13:48:29.848852	local
a509f176-91f6-4b21-bbc8-c222595a7ca7	68e6ovkqerpgirjk0d46108qf5lq	DS-174-updated-form-1.pdf	application/pdf	{"identified":true,"analyzed":true}	133083	Bj3AwCWnLM22ItWDWTMjZw==	2023-10-13 14:57:50.618711	local
52a20002-8c26-4596-8195-1a78161282ac	agde2ldoqdibpyjgs5ukh3b4zsud	may 2023 witholding tax report.pdf	application/pdf	{"identified":true,"analyzed":true}	38242	CiSjFR1P/D1nztnbwuS1gA==	2023-10-13 14:57:50.621367	local
ab4c84c6-ad30-44bf-bd0a-fc14316a4d05	eumvqpqdl4da88eu3dmpo9d8ym6a	DS-174-updated-form-1.pdf	application/pdf	{"identified":true,"analyzed":true}	133083	Bj3AwCWnLM22ItWDWTMjZw==	2023-10-13 14:57:50.623706	local
aeaf2478-3975-4a15-9223-cfbac84dba6f	fr05cnk65o50ho9taorcy7vlstwq	may 2023monthly income tax report.pdf	application/pdf	{"identified":true,"analyzed":true}	38204	NNDmZa8crdZXtCeY5ypQug==	2023-10-13 14:57:50.626375	local
a07fc00d-79d6-4453-a96a-618ea3b846c1	njtrnz0ztdit3wktujzmyzpbc16s	DS-174-updated-form-1.pdf	application/pdf	{"identified":true,"analyzed":true}	133083	Bj3AwCWnLM22ItWDWTMjZw==	2023-10-13 14:57:50.628736	local
6ed43832-8d26-41a0-bf4c-542b0fddbd51	wrege6v8q8s957634qaco0x0v26y	DS-174-updated-form-1.pdf	application/pdf	{"identified":true,"analyzed":true}	133083	Bj3AwCWnLM22ItWDWTMjZw==	2023-10-13 14:57:50.63106	local
06ec8447-2f3b-42af-9a3a-1914c693962f	xhk9qrkmzrazrmwn9dpyfj7kofei	may 2023monthly income tax report.pdf	application/pdf	{"identified":true,"analyzed":true}	38204	NNDmZa8crdZXtCeY5ypQug==	2023-10-13 14:57:50.633439	local
ae104322-1abf-4899-845a-831df903c145	kxxht9nkktfdo2c6i8itdfmznu9e	greddd10.jpg	image/jpeg	{"identified":true,"analyzed":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-17 06:49:25.233525	local
a7391091-9543-4d40-8e8d-2a1bdf6ff9b0	zaa4hjss1oxsi6gi7f8ngtkqt4ui	greddd10.jpg	image/jpeg	{"identified":true,"analyzed":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-17 06:49:25.231122	local
704bfddd-5db7-4f3c-a393-8d1cd11240bd	8sjv6joe6c42bnwaem7tuo47aael	greddd10.jpg	image/jpeg	{"identified":true,"analyzed":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-17 06:49:25.235873	local
cc9f40ad-402b-43aa-82c5-284260c4faac	yq9n13h1e5vl406sbhubxwmltiew	greddd10.jpg	image/jpeg	{"identified":true,"analyzed":true}	67425	3A/ebqbQF2Npm+aDCsErdQ==	2023-10-17 06:49:25.228036	local
5e4c3e94-0364-4265-911d-4ebb31ec7207	v657eldwv5pmx1w0oqmcur12bxrv	SEPRO.jpeg	image/jpeg	{"identified":true,"analyzed":true}	6348	waAPGwrhcbxJX5OvauuznA==	2023-10-17 06:49:25.238253	local
0699d962-63d5-4584-b083-d790f786c42d	nbjqvxrtng1m326bbntj9dqmbl3j	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	6429	Wz8DxPtnMsV4r6BdmdN56Q==	2023-10-20 06:51:58.755156	local
7e9c2ce4-ad03-43b6-ba33-ec14580d7be1	8dbt6rxd5anj4dbr183uvyrujtd9	12th doc.jpg	image/jpeg	{"identified":true,"analyzed":true}	10505	GwSSrsho4jkjr9yOrxW1GA==	2023-10-21 07:11:39.018999	local
e987c4e1-c8cd-4248-9f9b-8284021e4399	xq6rzn0ygz91waw2zv04j6765o1a	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	6429	Wz8DxPtnMsV4r6BdmdN56Q==	2023-10-19 11:22:08.422203	local
91165cfa-ab2f-472f-bca7-4f2c955cd732	v90k18f84n0c7u6xtvwg008zaidz	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	6429	Wz8DxPtnMsV4r6BdmdN56Q==	2023-10-19 11:22:08.424938	local
28f9fc33-aa11-45f2-836e-ec9180e34303	w1i48sizf6uouwduvk3vwm0tv01x	12th doc.jpg	image/jpeg	{"identified":true,"analyzed":true}	10505	GwSSrsho4jkjr9yOrxW1GA==	2023-10-19 12:50:03.845524	local
1af84ee3-f44a-46f4-abbc-6cfeafdd2e35	x65hlujukv5kqffmzxo11yx20pta	10th doc	image/jpeg	{"identified":true,"analyzed":true}	12144	MKiNMvZK4Wk2lqLu+Y9s7g==	2023-10-19 12:50:03.842258	local
0ecd4d98-d004-4adc-954e-cb9b9e8493cd	9d2padrfsfayqyei52k56ow5dag8	Propic.jpg	image/jpeg	{"identified":true,"analyzed":true}	39428	hFaTXxBDiA1hiiPKQQaCow==	2023-10-19 12:50:03.852966	local
f02a0273-f06b-438d-beb7-386dda1bf8fb	rari79o9ddz6s027xf8pol6re1h4	degree cert.jpg	image/jpeg	{"identified":true,"analyzed":true}	576838	eizc/1qXyzyFbR2gCHXWvw==	2023-10-19 12:50:03.850603	local
58b3ae7c-ebfc-44ad-8ab2-57b59c785093	wmmc9w8uo56loldq4wl3x6pqkge3	9101112 tran.jpg	image/jpeg	{"identified":true,"analyzed":true}	711117	ucaENJMLH3PC5k9USl55ag==	2023-10-19 12:50:03.848121	local
de2962b9-83bb-4577-ba73-56cfd5d81b63	2c78ktdw6ghh0foblgwfih8a6xt8	10th doc	image/jpeg	{"identified":true,"analyzed":true}	12144	MKiNMvZK4Wk2lqLu+Y9s7g==	2023-10-19 13:19:07.086889	local
f0ba64ec-7aee-40fe-875b-cdb93abc1b41	eah5trphnqfp4jxlhy76hqo67mi8	12th doc.jpg	image/jpeg	{"identified":true,"analyzed":true}	10505	GwSSrsho4jkjr9yOrxW1GA==	2023-10-19 13:19:07.090097	local
bcffe57b-2d87-437a-998e-c9502e5531a1	33ytp2yy5wdur4eur9b6y75lvaxl	Propic.jpg	image/jpeg	{"identified":true,"analyzed":true}	39428	hFaTXxBDiA1hiiPKQQaCow==	2023-10-19 13:19:07.097548	local
6e733f47-436c-4ac8-b092-b79a6111d1f0	yalayhd48kodz26uplzcb2g0tmgq	degree cert.jpg	image/jpeg	{"identified":true,"analyzed":true}	576838	eizc/1qXyzyFbR2gCHXWvw==	2023-10-19 13:19:07.095036	local
8ecfbc32-925f-4206-9f7d-11ac554e79d5	n61hm5zg8qobmpoz8krnzmwtmll3	9101112 tran.jpg	image/jpeg	{"identified":true,"analyzed":true}	711117	ucaENJMLH3PC5k9USl55ag==	2023-10-19 13:19:07.09252	local
5936bd6f-6c57-4ef7-9fa3-abf42e8c72f8	9jbp0jpdo4i66s9ryz5b0f70910b	download (1).jpg	image/jpeg	{"identified":true,"analyzed":true}	7635	r38Ypd38tdiGwg2RFB3vKw==	2023-10-19 14:13:16.008054	local
b883b44f-42e0-4343-82e6-3565a6b53daa	jyyhrtklpa0i3vzypai2zic9vw7p	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	6429	Wz8DxPtnMsV4r6BdmdN56Q==	2023-10-20 06:51:58.751939	local
e5c60165-b330-44d8-97af-e9bb3cf32ff5	c8nmta69gvfki8wa9f28pes6n6sq	download.jpg	image/jpeg	{"identified":true,"analyzed":true}	10571	s7k2hylhvCBgIuFGcz44zA==	2023-10-20 08:44:39.93944	local
42bf1514-90e3-4e1a-b3e8-7f4f7dd72f0a	ffrilrndskiayksmxqabzg3hlw5l	ppp.png	image/png	{"identified":true,"analyzed":true}	1976	UWaIsCO23kGAfDJNO7pE/w==	2023-10-20 08:44:39.941515	local
6d60d146-d1b0-45ff-9560-8a0aaa4b4ed3	tssxluxo127pccsqv5rh1fiqyqjr	trr.webp	image/webp	{"identified":true,"analyzed":true}	27630	6xEU+pFlHo8MmgG7+vxaEw==	2023-10-20 08:52:30.503382	local
cfe56d93-dbfb-4ff0-9d48-ea1003733d32	tidqs9x8pgglm40tm27xtk8e0nq9	cbo.png	image/png	{"identified":true,"analyzed":true}	3617	8/E6txe06DcZoGdtn4h8ew==	2023-10-20 11:30:18.00546	local
9651a00a-7ed4-45e7-a6b4-6126a42e46e7	xncpkkctzk4ngstlifbzy7g8x29m	Absnia.jpg	image/jpeg	{"identified":true,"analyzed":true}	6155	qad4LsnNT17/8yHlqmiJjw==	2023-10-20 11:32:14.610855	local
dcce6cc9-4e27-409f-afb1-8e0b9e6186b2	td4e544t02ozvgo3daheu0wp9kxo	dashen bank.png	image/png	{"identified":true,"analyzed":true}	3798	L0CHRMLbFend7TNUxl6k8A==	2023-10-20 11:33:54.555918	local
b2a6de88-d307-4d10-8a04-323bf2ae16c8	7hygd8okqi2hbaj81kpo0gmc56fh	Abay Bank.png	image/png	{"identified":true,"analyzed":true}	8055	YTn0E/ff/Hoj3zizA17CBg==	2023-10-20 11:35:19.915987	local
9df8a2ba-9652-440f-bab9-acaa0aa182f1	4w6xlo042k1kiyd42eyszz54ckif	G 10.jfif	image/jpeg	{"identified":true,"analyzed":true}	12963	6QRjqXkoYD+tlicFx8aXPA==	2023-10-21 07:11:39.016065	local
49bd05f1-b0ce-477c-9753-4117ef41a6a0	epl5krrvog3lppgtksvznrz37yfq	9101112 tran.jpg	image/jpeg	{"identified":true,"analyzed":true}	711117	ucaENJMLH3PC5k9USl55ag==	2023-10-21 07:11:39.021366	local
8a115c12-1112-44dc-a26c-c35480358bec	a1x72imdbv2a4dctbq2em0bn0agt	degree cert.jpg	image/jpeg	{"identified":true,"analyzed":true}	576838	eizc/1qXyzyFbR2gCHXWvw==	2023-10-21 07:11:39.023	local
63bd763c-8073-4f78-9778-c4ee9cf813c6	fwjptdwxx0gm0dao5gt33k9ti7w0	Papic.jpg	image/jpeg	{"identified":true,"analyzed":true}	39977	4Yhd9ehC1fvyzNDef5In1Q==	2023-10-21 07:11:39.0246	local
9ff62f77-cdad-4d41-a067-02b3e76e1eb1	j9mwalich19la2ltfpuy38izxsul	RECIPT.jpg	image/jpeg	{"identified":true,"analyzed":true}	152138	7ZUknWieIOX5nknMMsQmOg==	2023-10-21 07:35:06.041628	local
444614b0-1f8f-479b-a381-81ffe4dda1d9	x27csu31bb1hxxgheazz8ssp7rqf	Papic.jpg	image/jpeg	{"identified":true,"analyzed":true}	39977	4Yhd9ehC1fvyzNDef5In1Q==	2023-10-25 12:49:06.163495	local
5546f496-3029-4623-9012-b686b064156d	m3syrqcbmbfy7y25l6ljmd0ru4sn	degree cert.jpg	image/jpeg	{"identified":true,"analyzed":true}	576838	eizc/1qXyzyFbR2gCHXWvw==	2023-10-25 12:49:06.161249	local
ff457fc1-dba7-40f1-b6e9-8ebdda98363c	nh4qr68s1rsnpwougykq2obs57zr	RECIPT.jpg	image/jpeg	{"identified":true,"analyzed":true}	152138	7ZUknWieIOX5nknMMsQmOg==	2023-10-25 12:57:48.637445	local
f3c088e3-bebc-4501-aa73-dffdb07fb10e	0whh3ez255psa9kjm32gy7rv76yg	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-26 08:05:17.872917	local
b6df7fd4-d100-478e-8062-c204f7be48c5	v62cbmcphr8yyr5vgom2rxbajn4r	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-26 08:05:17.876079	local
3777fbbf-1f5d-42b1-96de-ef760cbf74f8	rcc4yfbrrkiri0q6uqp6smd04gwf	On website.png	image/png	{"identified":true,"analyzed":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-26 08:07:39.362302	local
dd01abcb-90db-4405-bdf0-7a334125a3f0	2d0r2qa9cv2jsvcn0i6ye86ktzfm	G 10.jfif	image/jpeg	{"identified":true,"analyzed":true}	12963	6QRjqXkoYD+tlicFx8aXPA==	2023-10-26 09:43:24.718114	local
6bce29c2-7364-4953-a0c2-ab4e4540a6be	cie9h9uqwvmks163aqdt5k7ruqgi	Propic.jpg	image/jpeg	{"identified":true,"analyzed":true}	39428	hFaTXxBDiA1hiiPKQQaCow==	2023-10-26 09:43:24.725828	local
2bbd08b2-0083-4f86-bff8-572f09ecb757	8j8v4w0tqti5a0nnf1brpsqsexzx	12th doc.jpg	image/jpeg	{"identified":true,"analyzed":true}	10505	GwSSrsho4jkjr9yOrxW1GA==	2023-10-26 09:43:24.714911	local
31835449-4ba4-4a34-8072-72993169c03f	yii9w45j2n1mev0th84qdttbm821	degree cert.jpg	image/jpeg	{"identified":true,"analyzed":true}	576838	eizc/1qXyzyFbR2gCHXWvw==	2023-10-26 09:43:24.723176	local
5190bfa6-cbd4-4821-892a-570a3e52ced5	cth34iis77rkxw015qxqc956jp6o	9101112 tran.jpg	image/jpeg	{"identified":true,"analyzed":true}	711117	ucaENJMLH3PC5k9USl55ag==	2023-10-26 09:43:24.72068	local
ac728b51-9309-4689-9ecd-211cc1f82409	zndipwhkd8ldb32dkbe3amhax0m8	Papic.jpg	image/jpeg	{"identified":true,"analyzed":true}	39977	4Yhd9ehC1fvyzNDef5In1Q==	2023-10-26 10:49:43.167141	local
02e58d1c-fb3a-4486-9711-59f086631eb4	tpir5ic650lnlgc1raq9kntontqx	degree cert.jpg	image/jpeg	{"identified":true,"analyzed":true}	576838	eizc/1qXyzyFbR2gCHXWvw==	2023-10-26 10:49:43.164216	local
9fdf4a34-2856-4a63-91ac-72a6e3d064f2	9jkr7mnrq5f8qk985ye5kzz6ielp	degree cert.jpg	image/jpeg	{"identified":true,"analyzed":true}	576838	eizc/1qXyzyFbR2gCHXWvw==	2023-10-26 10:50:52.891563	local
1e04b70a-4efb-421b-aba6-3f0adf9b87ac	nfdcg8n6yijb00ateh0gnaxiamc3	On website.png	image/png	{"identified":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-31 06:32:09.558543	local
b619e40b-8ead-4232-9296-bc94020b10fa	rd7egv6sh49lad5h5xgg6pkl9cb7	On website.png	image/png	{"identified":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-10-31 06:32:09.561657	local
b9b50bc4-82e6-49f7-b608-5043b999dee8	glmglrvvcfj75w0ttisy0ce1e74p	Screenshot from 2023-10-31 22-56-08.png	image/png	{"identified":true}	253062	qESdsn2nFCZmt8ah63TV5Q==	2023-10-31 20:22:48.171072	local
fa94af6e-b07e-4fa4-98a7-b36fb00112e4	1trjphhk36fn7vyqf5cxoki5c7uz	Screenshot from 2023-10-31 22-56-08.png	image/png	{"identified":true}	253062	qESdsn2nFCZmt8ah63TV5Q==	2023-10-31 20:22:48.174306	local
172519fe-7171-4f96-b280-3608edfeebb2	9ehl0t9h7vx5optand70gf6xt29x	Screenshot from 2023-10-31 22-56-08.png	image/png	{"identified":true}	253062	qESdsn2nFCZmt8ah63TV5Q==	2023-10-31 20:30:11.008551	local
665d8d94-f458-498f-8a89-bfd8ddf4a76a	m15vbc797txvys8sv23lkp9m2b7v	Screenshot from 2023-10-31 22-56-08.png	image/png	{"identified":true}	253062	qESdsn2nFCZmt8ah63TV5Q==	2023-10-31 20:30:11.011646	local
d0d4ec61-1513-4e6a-a699-64183dbadf79	jvsjf870yxij825meghrfdqc5a9r	Screenshot from 2023-11-01 00-09-00.png	image/png	{"identified":true}	102075	ZyPjeky7en9RLLX1OlihTg==	2023-10-31 21:26:59.588857	local
6b23d8e9-517b-4a35-8b48-997131386899	a51gfwkoh32qmd0sc4wfax8evrzj	Screenshot from 2023-11-01 00-09-00.png	image/png	{"identified":true}	102075	ZyPjeky7en9RLLX1OlihTg==	2023-10-31 21:26:59.592058	local
3470d915-d778-499c-a36b-d86f5a82520a	hzs6cg1q0a42mzvakc7f0ysbopvr	Slide23.JPG	image/jpeg	{"identified":true}	1466740	Jv3CzImN8BCKSIBenbZYIQ==	2023-11-02 11:56:11.260823	local
b563f0aa-ed84-40bd-8e2b-5f86aca8b088	sphka34uvoayns9dpj1w2kejr2zh	On website.png	image/png	{"identified":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-11-06 12:39:10.575015	local
07da2cf0-e5c9-4154-9113-42d94f529182	m7n4m1om8fkt6q05ch5yi7qc5n0v	On website.png	image/png	{"identified":true}	37552	14XE3GPtTcj2Z+iTVQohbA==	2023-11-06 12:39:10.577906	local
3e4f7777-a85f-4742-a4ec-f48a0587a023	lfnkv7tmr1tu4e8qphfwuewpj3rt	images.jfif	image/jpeg	{"identified":true}	6070	ebG3Fxojs3j2fJZ/65T+sQ==	2024-01-03 08:11:52.968811	local
f4547c56-e27a-4621-a4d3-a39fe2abed55	peigqwvwao7j3m01dze2vupc4vip	images.jfif	image/jpeg	{"identified":true}	6070	ebG3Fxojs3j2fJZ/65T+sQ==	2024-01-03 08:11:52.971968	local
4c7bfb6b-892f-445b-91ba-1847630c42ad	mmibivng2ybaafz2yfgw2x2htvub	images.jfif	image/jpeg	{"identified":true}	6070	ebG3Fxojs3j2fJZ/65T+sQ==	2024-01-03 08:28:58.16167	local
c826021b-8bf3-4fe7-9907-fa331bb5ac55	fxzrpdupglahk7uvud4jcxkeg597	images.jfif	image/jpeg	{"identified":true}	6070	ebG3Fxojs3j2fJZ/65T+sQ==	2024-01-03 08:28:58.16442	local
cf0a2564-8661-41d3-a000-08ad54dca22e	cey3tol85fxxs6os5uncdrc426pj	BA degree transcript-1.jpg	image/jpeg	{"identified":true}	1352443	jbkrgCBanCsVkHqnneiyBQ==	2024-01-15 07:19:08.588498	local
c9314d93-f510-4d3c-aed3-61b932c6e298	ov69v5hf0rl19u3rzwsm69so9v8h	1738293070010-2023-08-24.pdf	application/pdf	{"identified":true}	59360	6yA4vWMUeRT3wThtYUXRDQ==	2024-01-15 07:19:08.591058	local
55816cf3-a2fa-4c0c-a18e-40639c475b23	4req2a9i32cgy9vmqmon4d6cwxou	BA degree.jpg	image/jpeg	{"identified":true}	544985	jNWX+S82JPf0geRPUzS8Ig==	2024-01-15 07:19:08.593722	local
8bac3451-6b05-48d0-9e74-2dcbbe61361d	ryiu7joudivhs90m7o1ktyykjr4g	employee contract agreement (2).pdf	application/pdf	{"identified":true,"analyzed":true}	229744	JZUK96i9fKu5Cw0XBVnHeQ==	2024-01-15 07:19:08.577353	local
7a199b53-e981-4acf-b4a9-6fc0abee872c	hhk2vakokqgy38fzwhaob2fepmpv	1738292830010-2023-08-24.pdf	application/pdf	{"identified":true,"analyzed":true}	58640	quvKkIdV5/eTwRYwJ62Brg==	2024-01-15 07:19:08.580541	local
70a87bad-fc0b-4beb-95b2-246e1c7ddcf4	bnr3v8585kq6w2cry1scmgo313hc	CamScanner 09-23-2023 11.01.pdf	application/pdf	{"identified":true,"analyzed":true}	163088	WjRXdlbEpqIFQ4wVUk6BXg==	2024-01-15 07:19:08.583106	local
54dc53a6-a0e1-4f31-8f2c-fd80d360e91d	thkodyx7pfnji25nwkbk05uuozd8	Ahmed CV.pdf	application/pdf	{"identified":true,"analyzed":true}	315557	lQbz7e1rFCRN6H3xnjsbVg==	2024-01-15 07:19:08.585868	local
06e7a04f-ce45-47a4-a494-bfa7237e28a2	pfqgmof4maol5flxjo6dxlqcqm7r	BA degree transcript-1.jpg	image/jpeg	{"identified":true}	1352443	jbkrgCBanCsVkHqnneiyBQ==	2024-01-15 07:41:09.109703	local
23b4fa75-aba4-4f96-a625-d438487024c0	s3x48vapfhye5vt8nr8xty45amyg	1738293070010-2023-08-24.pdf	application/pdf	{"identified":true}	59360	6yA4vWMUeRT3wThtYUXRDQ==	2024-01-15 07:41:09.112124	local
9da389c3-175f-4161-adf4-c102e1480fa9	vwj56lf5dpjlnnqikvlvdr48qihc	Ahmed CV.pdf	application/pdf	{"identified":true}	315557	lQbz7e1rFCRN6H3xnjsbVg==	2024-01-15 07:41:09.114519	local
57eb2407-06cf-4802-90e7-0e590489d8fa	58ypkeja135gmudb43rrqxhgls78	Ahmed CV.pdf	application/pdf	{"identified":true}	315557	lQbz7e1rFCRN6H3xnjsbVg==	2024-01-15 07:41:09.116972	local
a751f36a-394e-4776-bf9f-8e920db223ef	6jxy3ucr8sml9fmhh9juzah6pboe	1738293070010-2023-08-24.pdf	application/pdf	{"identified":true}	59360	6yA4vWMUeRT3wThtYUXRDQ==	2024-01-15 07:41:09.119476	local
5015d71e-2c5d-4696-95b2-d2b17ade4a6f	y09ytzayb5z7kswdf0yhnhob1uy4	1738292830010-2023-08-24.pdf	application/pdf	{"identified":true}	58640	quvKkIdV5/eTwRYwJ62Brg==	2024-01-15 07:41:09.121818	local
1cb4c422-b182-4abc-8c55-c375116082e2	vp76dcsbd823dhy64oxmb30hkki2	Ahmed CV.pdf	application/pdf	{"identified":true,"analyzed":true}	315557	lQbz7e1rFCRN6H3xnjsbVg==	2024-01-15 07:41:09.107033	local
8a460850-c892-4191-a999-092c8793004a	lg5abvlryy1mklucd25lc6uybc3l	BA degree transcript-1.jpg	image/jpeg	{"identified":true}	1352443	jbkrgCBanCsVkHqnneiyBQ==	2024-01-15 07:53:00.565449	local
70ce0338-8930-4b0a-ae01-18a176afb908	xmmyhfk0xhix6uqayj4i3ubgycn1	BA degree transcript-1.jpg	image/jpeg	{"identified":true}	1352443	jbkrgCBanCsVkHqnneiyBQ==	2024-01-15 07:53:00.567909	local
0b23f6dd-b9f8-4bef-a4b7-0c62933e040c	rb7vlofp5ttdkh6lihuch5cdr326	1738293070010-2023-08-24.pdf	application/pdf	{"identified":true,"analyzed":true}	59360	6yA4vWMUeRT3wThtYUXRDQ==	2024-01-15 08:10:35.938004	local
a82df8f4-cf23-430b-832d-0a3cf922223e	knerwju7fvg290sjsfz7ut9ujzd4	Ahmed CV.pdf	application/pdf	{"identified":true,"analyzed":true}	315557	lQbz7e1rFCRN6H3xnjsbVg==	2024-01-15 08:10:35.940611	local
d62a7a8a-f854-48d8-9b44-a14db7f5df76	17ud3zofib3l2wlt9wo5amb2o4mz	images.jpg	image/jpeg	{"identified":true}	6070	ebG3Fxojs3j2fJZ/65T+sQ==	2024-01-15 08:55:11.766798	local
18517668-bf60-49e1-a3e0-322b86ffb246	grubpdtoumbkiem4b2qpfxuk69nb	images.jpg	image/jpeg	{"identified":true}	6070	ebG3Fxojs3j2fJZ/65T+sQ==	2024-01-15 08:55:11.769351	local
81ce4e4a-a3ef-4128-b22b-562201692383	clm6sushoxawtqzertq9aiomnmjz	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-16 13:35:52.545353	local
bd45c69b-4f12-4cbd-933b-48989be5370a	161naxn7rp1ti8ek738s9cux5sei	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-16 13:35:52.548213	local
ea736578-12a1-4c2c-aea8-83a064ea9e67	et3aij0c6tdnys2vy5ngusn65273	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-16 13:35:52.550815	local
4bfb99c9-d375-4e31-ba37-3e48082701a2	j6hky9c3zumxjr4l2k9exowtsd6e	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-16 13:35:52.553399	local
bf68f393-2da0-4cff-906b-06329e4c9fd7	5iuw0mtpe1fcdzg5ldeaivtz0umz	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-16 13:35:52.555817	local
16f9268c-2727-40cb-9385-4bb827b59e96	pi7tscqugj7dapzzbareeoib375n	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-16 13:35:52.558203	local
5648832f-555a-4b2c-b75c-61047b2f5632	g2dfarij0gf9o3mq2rg24k939744	pro pic.jpg	image/jpeg	{"identified":true}	46112	L8bs33mJBAUBA01wBfJnjQ==	2024-01-16 13:35:52.56058	local
1a4fc5dc-a899-4435-89b4-3ea72a4c4792	gi6xc3fb5hlw4c73myp31uddstqk	images.jpg	image/jpeg	{"identified":true}	6070	ebG3Fxojs3j2fJZ/65T+sQ==	2024-01-17 06:20:12.26863	local
880c15da-2b8a-4210-899c-f49520dd5a0a	6tz6fpamrl3azpbhpibshp5py33f	images.jpg	image/jpeg	{"identified":true}	6070	ebG3Fxojs3j2fJZ/65T+sQ==	2024-01-17 06:20:12.271312	local
2955f120-ac80-4562-95a0-e8efffa80d94	u8607agl2px0dam5ito082nwzbj1	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-18 06:22:18.567639	local
ea4cfdab-e924-479b-94dc-cc42ece3f28e	6e0k7c0rc69vuwetqc890flylabs	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-18 06:22:18.570327	local
23de96e8-eef2-4736-a430-fe6449d4d831	fed07croysgnkbjcpmzr3yq1uz5n	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-18 06:22:18.572707	local
bf1bf45f-e225-4507-828a-d57aea0974ad	f9enba7tfyhw2ti5xj5wqg5ui4c4	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-22 12:07:35.63354	local
24d3416d-3089-480d-8684-dda8adce93a3	hxp4b26r8ulaoyg3pzag6mieu92q	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-22 12:07:35.637006	local
63e31ca8-1a91-4484-956b-3cc6ca718d36	tpo6to2114j6gjqqhgmrqaryse82	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-22 12:22:27.666745	local
068ec92d-f9f6-4f24-b8b2-d537914d8a65	o0vbvws2yjmhryjnhq9gnh2n0xgy	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-22 12:22:27.669658	local
bc890100-1c30-4ae4-b263-a1d04ad368ba	g6s4acuakoua4j3hae4awazvg0j7	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-22 13:28:40.970701	local
c6a4df9d-71ed-4c6f-a88d-c3cd18013598	thgg5ij3okci1abwhdajlyonhk4c	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-22 13:28:40.973638	local
f87e08a4-3bf2-46ef-b672-84af8acde872	yfwkmepbgjj0sodtyywy4wn7pcut	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-22 14:04:39.277725	local
2a98c4a9-fc9a-4875-b851-144c90886bc0	fxsgme63t2gy5dk2mqw19vmrwsjc	grade 3-english_fetena_net_eb40.pdf	application/pdf	{"identified":true,"analyzed":true}	31294232	+D+J8ZEwnh4UhPMskX3URg==	2024-01-22 14:04:39.273494	local
54ea0aa4-c3cd-4799-91f0-8535cbdb4a91	1krm74ovjvp20coko8u3k035swct	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-23 06:06:36.434799	local
d7889914-36d5-49af-8041-2b451cea4c71	j2ron6waaqkk5x5n8e0t4vujyx5a	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-23 06:06:36.437632	local
97bcf189-6d01-4b8e-b81f-65ba9be5fb36	hgori2lla7vql35v4ql1xjuytxd1	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-23 06:15:16.794966	local
0db71367-aaae-4e69-a1e3-371756611943	fm3oa5qxn1agbe29zd4vrru1uvlm	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-23 06:15:16.797815	local
7d964a5a-c4c9-4985-88ba-e6e1d6512da3	7usunyilzgatu8b9yb5endop08bb	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-23 06:56:48.721303	local
0b42b96d-6f70-46f3-b742-0e61d2eeb527	hmonok0joa8vtojfjjndk3yblrsj	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-23 06:56:48.724168	local
fa346abc-ef20-481b-9a3b-f528c8d871ec	g2ejgml4g2gvf88rkfh11u82zep4	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-23 06:58:51.310413	local
8256a380-9ecd-4481-8eab-0bb1c463c29b	wq9a5o4ls132ce3pwi4nsdd0p882	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-23 06:58:51.31321	local
aa744219-626e-4b6c-8a75-2fe83b5e3394	yaj631dh83uq7r8nkmvxzjwc5ww4	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-23 13:47:57.916279	local
797e644e-c1c6-40d8-9366-b2d6961aeb00	sxjxhn1bl8blwpn0l46qvynjyumk	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-23 13:47:57.919064	local
76390d29-4b8c-4989-acbb-177515ae6140	ex4stbgwhusx44ava5z1fclo3809	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-23 14:10:55.512321	local
635ffb09-cef0-4226-8187-1231cf754084	l4a1ffijjxyvwrn5q3ae285sqcix	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-23 14:10:55.51512	local
21206e52-026a-4cb3-93a4-c78d78eaace6	ccglswkbdf3oyj3987e57ym7jdw7	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-23 14:19:43.297728	local
9a8a86e3-6fe3-4097-8e14-58ccd7ca1f72	ufbrrkpc8tovy62gw94tqb73ofu5	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-23 14:19:43.300145	local
511179d8-2383-4b5f-af52-3ea3f3dd0abb	2hjzuvrrjhvobgqsmgdb94vfp49k	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-24 05:55:53.016142	local
4cb20700-91e8-4710-bd6e-5d023769b4f1	rrzetuh9wc0qw7hybiq5bbl4sjnu	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-24 05:55:53.019092	local
23d6f7fb-aeb0-496e-9a8b-24978a8d5fc1	s0twtx8jb7jgfhawj1pnhifh5z9z	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-24 05:56:26.057655	local
5fbcacb6-bd47-4f98-baf9-b011b2bb8935	ynlm5egtq74e8rov4h35cm1ob98d	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-24 05:56:26.060549	local
0ebddb31-9e93-49fa-9951-50092fd947ad	qx1uwobd339zejbat13utjwvuk4l	67.jpg	image/jpeg	{"identified":true}	489393	BGqZXSfqABQmXBjmqLXOlg==	2024-01-24 06:26:02.61471	local
9b343f65-2fdd-4176-b17d-faec97e47538	mvj3h8i5cxh6j7mc347zfufkvncg	78.jpg	image/jpeg	{"identified":true}	32454	daS+mfmwCYER2ggjQoF6WA==	2024-01-24 06:26:02.617672	local
982d24fa-2066-4080-82af-e91525f6b56e	ub1csdlwpbfbg0xv4sfmfogo8x6q	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-24 07:18:09.532817	local
662f1cfe-2224-42f4-a782-76eba56961bc	7h0gond4njga21inzra11j68byfp	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-24 07:18:09.580712	local
53316e9a-d4bc-4f53-a715-6a2edf58a203	wl2nki3129cra67tvia1fdiccrb5	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-24 07:18:09.591032	local
867dec15-27ef-4e1f-a47c-6c5892e5e30b	o799013kf8yn0ra234d5jic7tj4q	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-24 07:18:09.597821	local
0f42f91b-6dd1-4768-a87c-8aaf7b8358f5	emmmpzeztv0mpqjm13vh2p35c0s0	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-24 07:18:09.602376	local
8ed1b46e-ee4a-4d4c-9d6c-7ca097f493bc	lxr33l79zxefxt7p4b5ik6v06s9y	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-01-24 07:18:09.605689	local
1dcc3a01-c43c-4237-a83c-5c600492e188	rx0zsvcswa1sjg5qq6x395jrijfc	profile-pic (2).png	image/png	{"identified":true}	223741	Z4f4ZVL8a6elvbF8xI6F5A==	2024-01-24 07:18:09.608566	local
c1b45b70-df49-4a4a-b6e4-df55dd93d281	818riqowjmdu4a3z05qgt9t8co1w	45.jpg	image/jpeg	{"identified":true}	89348	45nlqbidmP4eFeGrFfjqeg==	2024-01-24 11:20:04.121018	local
5b0ce430-2c19-4135-9bbe-cb65e34c80a4	ztx0s5rf7ei0mvbuta9x427ezpen	PowerBI.pdf	application/pdf	{"identified":true,"analyzed":true}	615012	shkFvWK+ESHN4JN88+I0og==	2024-01-24 11:20:04.118133	local
d6ed472d-469d-401f-bb07-9d1d6e1b03d7	8agcmz7nm8k1n8rer1g4wuyr3p7o	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-27 07:53:19.523508	local
02b6394e-714a-41f8-9bcd-a1ae480f2f63	sjbnazobe7hoo76a4ifuy5ous2n0	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-27 07:53:19.526422	local
47890a64-c3b6-4f14-a83a-6c71d3fb7c8b	6ix7jg3zp66uz3feuak8pm3jabba	12032672_883784918379009_1251987 (1).jpg	image/jpeg	{"identified":true}	195910	3rgX6FZGcMIxr2KqonBfuQ==	2024-01-27 09:19:59.530648	local
7e28cdca-dac6-4f57-aaa9-a78c70fa1c93	pzx02k5iu8i4y2k2ncghyprn0u2a	12032672_883784918379009_1251987 (2).jpg	image/jpeg	{"identified":true}	244775	bIOFjDOHf58zJ6cfJI3A1A==	2024-01-27 09:19:59.533262	local
9c1719d6-0263-4f09-8be5-2118d67bf562	z9w9re6sixk3we9chdra7p89izq7	IMG_5584.jpg	image/jpeg	{"identified":true}	157735	0vnd3sB6aOu65WiQyNV+AQ==	2024-01-27 09:19:59.535516	local
1ed24e89-d2ad-47e8-8fc7-40ca3b2bf57b	t0tezgyj2pozdebawpc6y397virg	12032672_883784918379009_1251987 (2).jpg	image/jpeg	{"identified":true}	244775	bIOFjDOHf58zJ6cfJI3A1A==	2024-01-27 09:19:59.537802	local
fa3e19cd-c718-4da7-ad7a-5308719eb42b	wptiytoicmxbpvfznhi0vctiavaw	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 09:19:59.539974	local
3e20f9e7-f864-4193-b942-77f0619aa0c2	7mxbca140m9zmhok03lhyb1s57yj	audit 1.jpg	image/jpeg	{"identified":true}	67242	gvE05Fl5tmZ+oVUBeq5ksA==	2024-01-27 09:19:59.542236	local
d3ba2460-91f8-4bf5-acad-0f530b53d5e6	vtjxvd7zrlkahfo90cbmuat83xqv	12032672_883784918379009_1251987 (1).jpg	image/jpeg	{"identified":true}	195910	3rgX6FZGcMIxr2KqonBfuQ==	2024-01-27 09:45:57.281359	local
b5082089-1471-496d-b14a-a2e98a08e686	8fdslumrtchm09tq06zof66j6tc7	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 09:45:57.284166	local
04a5f625-6c71-47b4-813f-03459119413d	5bhvr8qcwj1pboc11vfwdr3iw3bo	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 09:45:57.287187	local
d15b9abd-d893-4b65-a016-2e31b9376744	h71u2zcvtx1b15xpvlcb5zg44cak	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 09:45:57.290013	local
4ea5d7c8-10e3-4057-9b27-05badd347a76	zeofd1wj3ohlqzymuv6j0abix5zd	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 09:45:57.292853	local
6ec5308c-6283-4a41-9d2b-9432086d89b3	l7iyx0zygvyxtre2dhbikt3i0b80	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 09:45:57.295806	local
e1377785-4d65-4f3f-bf9f-8b6478029c6b	xj73v5uxe4xm67i98s1pkcua4jdq	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-27 13:10:31.536422	local
ae20a3c1-71da-4d64-83ea-7203abc34a04	n47rquzgp8extje17pxad96l9mtt	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-27 13:10:31.58414	local
66a2af5a-c10e-4524-ad21-f0f76f923551	jgm2smqyqloisnyw435zmo2s2f5z	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 15:59:00.293521	local
b18d5ea0-2c3d-459d-919f-4a7dada845b4	tpq1k608u1rliihq5nnqi1ewpuq1	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 15:59:00.296511	local
6edbf6d9-07c3-4511-92b8-80cac8eec285	euxwj3gnfai9oeamrute4rf1yjta	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 15:59:00.299212	local
77dfb9b3-b60c-4b72-adca-9ae61317c3fe	xxid9gcyo8hjn5vkqss1160544e7	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 15:59:00.301951	local
f27acd22-b502-44be-a5c4-7dffa3694963	4khex4utaa5n0jq6coyi4h96a5h3	photo_2023-11-15_11-46-03-overlay.jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-27 15:59:00.304526	local
99897aab-ff8e-4956-8684-3959df24fd33	3cyp9sif9h7hvx746njs5sll082r	inbound5588050594900893466.jpg	image/jpeg	{"identified":true}	2618986	X4Nkw3CiaVN+PG0bSE+2FA==	2024-01-28 19:54:53.046713	local
9c06ce4c-db6a-4b59-8e9c-4b4eb739ec5f	q21dpx6nlbathwp38kj0jrmmonur	inbound8896965541899073606.pdf	application/pdf	{"identified":true,"analyzed":true}	301375	+6VP1ZaUvlvEDXQpxSpQWw==	2024-01-28 19:54:53.034563	local
41a57f8f-000d-48ee-9ff9-817f2f3e727d	4qcbf3mtud1lykozge4wrnkqjfwk	inbound8241489189184908909.pdf	application/pdf	{"identified":true,"analyzed":true}	301375	+6VP1ZaUvlvEDXQpxSpQWw==	2024-01-28 19:54:53.037468	local
5084f490-277d-4a5c-ad4d-5680fe8eee72	5atb83aocpftmmde302izqsw7bu9	inbound5677306738115894794.pdf	application/pdf	{"identified":true,"analyzed":true}	301375	+6VP1ZaUvlvEDXQpxSpQWw==	2024-01-28 19:54:53.040735	local
a8764d7e-9869-408c-b05f-ee02c2e69cc2	wljs6vg45ixefzvh91jc5v0aq89n	inbound1379570298312072254.pdf	application/pdf	{"identified":true,"analyzed":true}	301375	+6VP1ZaUvlvEDXQpxSpQWw==	2024-01-28 19:54:53.043986	local
2bd6f85d-3a47-4a2a-aa15-148db2a6c416	8qe5a7ehh27mfxwyeok6yh4db30u	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-29 05:38:36.480392	local
b439ac7b-b05b-4b91-baa3-08e75062ea38	uz6tdbxiyt760sa6awx3xtndooll	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-29 05:38:36.483383	local
533cfcc5-87b6-4f2c-82b6-16917a00acbd	oti1q3b1hhagddlwnx3k774ldeel	my photo n.jpg	image/jpeg	{"identified":true}	342696	x0/Pwyl7sR3dAqQl9l3Ong==	2024-01-29 06:09:42.723973	local
6401339c-a75f-4351-9305-536da144d0fc	mmahw0sr4wxcimg6789wz3ttkmxx	my photo n.jpg	image/jpeg	{"identified":true}	342696	x0/Pwyl7sR3dAqQl9l3Ong==	2024-01-29 06:09:42.72655	local
c01bbf0a-e271-44de-bd56-a567ae831b2b	mmq01olwm3a4ca9yogp2ypmksmll	student copy 2.PDF	application/pdf	{"identified":true,"analyzed":true}	122972	qd7gEXl2ub1Fh2ASlZKhIA==	2024-01-29 06:20:58.356681	local
bef527b4-7548-4b78-8bf8-aa7fb570c9b8	myn9hmxp73iul8atu8fw8v23dx6j	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-29 09:02:21.37912	local
ca3a8197-2dd9-4d95-a200-6e2faf63b96b	jafmdsqhpa4vg6a0xcxknmmvt68z	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-29 09:02:21.381855	local
df4c51b9-a184-4e76-b924-54b5d4873f80	6a7r85u6gn83p0gb8ekalsicxki7	photo_2023-11-15_11-46-03-overlay (2).jpg	image/png	{"identified":true}	741166	jlkLjxTksrQl1Mwlg6ucsQ==	2024-01-29 16:25:15.96436	local
cde26173-1dd0-416f-b010-ae2e1d27220f	ainjwvesx7en4dbrf8jmvswv9nzc	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-30 05:46:09.676164	local
d2e8077c-fd93-4717-860f-d1801d681b97	x6luagqnj77n3yvvp1ll2geh44en	New Microsoft Word Document.pdf	application/pdf	{"identified":true,"analyzed":true}	327709	VcU6/ogsbFJuntWlZEDc8w==	2024-01-30 05:46:09.673299	local
fdf87cf1-b2e5-4531-9948-416113f4ac57	gvldl8hiivxnqc4forcgnkzwg0qc	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-30 05:47:03.905589	local
a82dffda-ec72-4f31-acc9-03d3696fe354	bxomod0qcne9l8qq76ymuyisvb16	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-30 06:41:40.707744	local
67deb8ef-c3fa-4f96-9920-cf7f20d3f471	klwp7nes70xoudx5nlny4f5satdb	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-30 06:41:40.710685	local
91bf5b77-050f-4aaf-be93-88dfc648fcaf	mlc7apmwu0t4wf9kpal4kg5g67az	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-30 06:42:52.033096	local
8a0bccca-27ef-48d5-aab7-254b4f875f03	qgebk4ug8muznl7dv6rqu696ej7o	degree.PDF	application/pdf	{"identified":true,"analyzed":true}	150285	yf2hmSnLFmzZWLkMlP0TtA==	2024-01-30 07:16:39.912994	local
6408dd0f-e4bc-4088-af1b-4f76b424cfb7	2592w3fgnkgwdd4lhnnm6gtmx8z1	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-30 11:43:09.148092	local
1578f81a-1b2d-4865-aadf-a54480fdcc43	t4mvjc1ryizcklte1hdtbwbafer9	New Microsoft Word Document.pdf	application/pdf	{"identified":true,"analyzed":true}	327709	VcU6/ogsbFJuntWlZEDc8w==	2024-01-30 11:43:09.142473	local
d3bf3a19-1299-4847-bf9a-fd54ce93c714	rgm2eb3vcmur7xfokgqy67ct3nez	error 123.pdf	application/pdf	{"identified":true,"analyzed":true}	579013	KNrN2qEOLuIeqSbrkL0mMA==	2024-01-30 11:43:09.145393	local
6db2c3d5-3881-4cfb-983b-7a5a22b4a245	theha0rhlzsn1ghzsiz1xaifupbo	12.jpg	image/jpeg	{"identified":true}	383559	GbTGFnoyOSchuTXCrO3k1Q==	2024-01-30 11:44:20.38975	local
06703713-c38f-4ed5-8479-36a291df58f6	wivdtmcfbcvvhu90uju3v3shc0mt	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-07 12:01:41.602928	local
ecca6aad-df2c-459a-ab37-a32b58501771	du38h0dv6fo2o8kdupae7m7ryk3n	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-07 12:01:41.60617	local
0f6f57ab-2416-4aff-8299-4d1ab33b5baf	6wxqifpwi2b0lmr8w3yjm58v8k8l	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-07 12:01:41.608823	local
191a24ab-c7a6-4f32-bd6d-ce348ee0a546	6p2ehvipgg9w5fds69f0vgaa27gn	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-07 12:01:41.611296	local
c7ca9946-0eb0-4415-b591-f8b3d335bf85	nvho6zlrqae6of9q2f7oo7hz1v8c	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-07 12:01:41.613912	local
5f2e5be9-2f27-4338-882e-ff2df44877ec	7vw1h4zc89mr11hxkb7uybcavlat	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-07 12:01:41.616394	local
700e3d6d-54b0-4697-9874-5ce96246a3c0	y0scqeatg30giteck6uy9dywy5e3	profile-pic.png	image/png	{"identified":true}	210120	w4M3a8jfiKcerIVKu8Q/Gg==	2024-02-07 12:01:41.618729	local
b6713e41-5754-490c-87cc-2900ce7cd5dc	59zyigxxan0ks25a5tw990n739jd	BANK COMER.jpg	image/jpeg	{"identified":true}	4024	LT0GAAtsVFxda4P+7/DyEg==	2024-02-08 08:35:08.304842	local
7341e2e6-e294-4b74-aeb9-119bafaea5de	cfreleumnpfkqpxs50so11u3njka	wcms_717488.pdf	application/pdf	{"identified":true,"analyzed":true}	2046217	aIGyLJUzlgG1SEEFpaM7bQ==	2024-02-12 09:20:02.391553	local
eab1b907-818a-448d-9132-32d43248a7f6	uafn1y4fpf8yqbn0hweqliafbap7	wcms_717488.pdf	application/pdf	{"identified":true,"analyzed":true}	2046217	aIGyLJUzlgG1SEEFpaM7bQ==	2024-02-12 09:20:02.394958	local
3e3433a7-b618-4e68-8c7c-d3179ede71dd	ub42odtiqb9xlf6ml6wl3lnr7g63	photo_2024-02-05_21-54-00.jpg	image/jpeg	{"identified":true}	218968	+FN37SiwLaYV+2vwmq35QA==	2024-02-12 09:29:32.578567	local
b2c1b1bb-34e8-4f02-b385-ef348a267556	w2tlw2co854ocgdipfjpkp98gqr7	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-12 10:42:38.690223	local
0eb9dc3d-1582-4a43-92a7-6b6126ab6107	qmrml1cwacfath3gpkhpowsfqgcb	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-12 10:42:38.69304	local
2246f861-1f23-400c-9d34-39c5133d54af	6nqt8d0ldufeayh2y5xwy76m79ch	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-12 10:42:38.695772	local
1df7efe3-4f3b-4644-8e95-08def3cf0cfd	vn8ol1bd2l4spk01mgkpy921fb3j	10TH.jpg	image/jpeg	{"identified":true}	10272	J3/Iv4i76NmAnGAs3qcA9A==	2024-02-12 10:42:38.698277	local
a25a14af-a0a9-4f1c-bfc7-4b90eb3dda5f	kuc79mmmr265xi847ewk5g8wi2wg	pro pic.jpg	image/jpeg	{"identified":true}	46112	L8bs33mJBAUBA01wBfJnjQ==	2024-02-12 10:42:38.700786	local
4eddef91-1f88-4d1e-a219-20e67c358579	b7z5q4cu4wq6qa30xvp3uruy1ewm	BANK COMER.jpg	image/jpeg	{"identified":true}	4024	LT0GAAtsVFxda4P+7/DyEg==	2024-02-12 10:44:49.839678	local
8a6ea1df-ba8e-4d28-b56b-4a510f238373	jfjpst5shvjqe0aof5grybn6fzyi	cbe-logo.png	image/png	{"identified":true}	214891	lXxWHg+8ydrg340rlChCZg==	2024-02-12 11:09:28.863537	local
12622714-f355-4be8-9247-51e7b6e55491	16rjvjbixaalagenj0472ye4zsxo	cbe-logo.png	image/png	{"identified":true}	214891	lXxWHg+8ydrg340rlChCZg==	2024-02-12 11:09:28.866132	local
2ffacb74-1982-41d6-aa11-fbdbbe9a808c	jd92bp5j9kbjx38l3y3hx9oubwd5	cbe-logo.png	image/png	{"identified":true}	214891	lXxWHg+8ydrg340rlChCZg==	2024-02-12 11:09:28.868476	local
3c6eaba7-9fbf-4f46-925e-7b0400476828	6k96qpefmqe7yqcc74xqyl6harxy	cbe-logo.png	image/png	{"identified":true}	214891	lXxWHg+8ydrg340rlChCZg==	2024-02-12 11:25:29.169102	local
5cf0d7de-3271-41c0-a99a-fcc6382afed9	05r2ar8bpp1den5b6vzrabk4a1ej	phonepicutres-TA.webp	image/webp	{"identified":true}	151578	LYO026fUkWD7HIn6EoSUxg==	2024-03-09 07:32:26.663708	local
8b8072e8-6a2d-418a-a0c1-dea90f8cf867	lyhqi8i4eyo5lzlplkjchxfpyp66	phonepicutres-TA.webp	image/webp	{"identified":true}	151578	LYO026fUkWD7HIn6EoSUxg==	2024-03-09 07:32:26.689989	local
e3ca5f85-4f1f-492e-a6f1-d8c5b4697ca9	qx2e9xikwkx7ua6t62aj6qpwgmit	phonepicutres-TA.webp	image/webp	{"identified":true}	151578	LYO026fUkWD7HIn6EoSUxg==	2024-03-09 07:33:54.445254	local
6aa7170d-5fd7-4f1a-8d46-83126ee94ccb	zgtm5wkj92bofn8rl87s05f29zyb	sunset-1373171_1280.jpg	image/jpeg	{"identified":true}	93161	qtFXfRLvYjr7qbIA3Yfkhg==	2024-03-09 08:23:34.151245	local
1eb5b76f-1e7b-4d87-a39e-3bc41d2a66d6	z2bx7en75c9xhlmbbta87x2rwzfe	sunset-1373171_1280.jpg	image/jpeg	{"identified":true}	93161	qtFXfRLvYjr7qbIA3Yfkhg==	2024-03-09 08:23:34.154266	local
b786877d-6873-4751-9bd3-2ab8444b8177	0tyr5uxlrqqmj56m3vg9a3d57ktf	free-images.jpg	image/jpeg	{"identified":true}	110438	t42Qse2heu0tslrzhgPTDA==	2024-03-09 08:24:48.943173	local
c21ee21b-96d9-4d60-a258-b6f895c317a8	57hkm1lqqmgdf4hg0j47g7sguav5	p1.jpg	image/jpeg	{"identified":true}	1693766	p+aZsNRUiC7FilHb3hnEYg==	2024-04-03 05:54:27.06519	local
ecd9a331-2b9d-4cfc-b71f-81a8f62b8bad	omq2sdealkvfrztatthuubvi3jc4	R.jpg	image/jpeg	{"identified":true}	696357	F3UDKW+iPBZ32zpIo3vjpw==	2024-04-03 05:54:27.068545	local
4d97c94b-5968-470d-8b69-6670459cd69b	s69e4xxehh32mz1zlmowvh2ctcvw	R.jpg	image/jpeg	{"identified":true}	696357	F3UDKW+iPBZ32zpIo3vjpw==	2024-04-03 05:57:30.149728	local
e320d38b-088a-4b5a-8c36-bde66a3a7d2d	tio2mk7pykmz5cwhgme0htlx5oef	imaj-private-villas-lombok.jpg	image/jpeg	{"identified":true}	177433	ViKkbU/NoigzWl6bxjIsnA==	2024-04-22 13:29:56.655487	local
180d6744-f890-43e3-a29a-25a5061494ef	pgyc8aoh3wk564fdypqql4j2hxo4	imaj-private-villas-lombok.jpg	image/jpeg	{"identified":true}	177433	ViKkbU/NoigzWl6bxjIsnA==	2024-04-22 13:29:56.703398	local
85109821-f56a-4e2a-9bd3-b772b3214332	s3l8p2ri005dubxne103ocm888ls	imaj-private-villas-lombok.jpg	image/jpeg	{"identified":true}	177433	ViKkbU/NoigzWl6bxjIsnA==	2024-04-23 07:43:39.067145	local
25773416-facf-4859-a1c5-72f8af409da8	d3cs0ajm8mpoi8pgg2hedmv1ahos	imaj-private-villas-lombok.jpg	image/jpeg	{"identified":true}	177433	ViKkbU/NoigzWl6bxjIsnA==	2024-04-23 07:43:39.070036	local
daaca3f9-7355-46b1-9080-f8ca21c36f4b	fb85arpvv84zdc8pzw4e3ap6bhjo	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 05:33:53.280298	local
3f94f2ea-ced3-4d57-80f1-6807bf6f862d	4kahiaav5wh4i90qolz3tvyt0vzn	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 05:33:53.283325	local
b3b526a2-e3af-4134-98d3-5ca7745ab8a2	erpyx4tv80ufkxf6wcq641d4bgug	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 05:36:15.474006	local
dadfa50b-0422-4178-bc04-7579f8c5358d	l4gn1zgal00ufl4hzuwgfhzf50am	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 05:36:26.560991	local
b490cdb2-3b7d-4f9f-8ce1-89d7e556432a	6egle0hrxsprtgwco1hoebhu7lba	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 06:59:36.594674	local
809ebb9b-95cc-4d89-aef2-9b31e38a3e0c	0405t121q7d8ozo4izcbp82tyc9d	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 06:59:36.634009	local
6198ced4-e738-4d1a-ae61-64f25b82ee54	gnohmv87wqx91y8s89wms5vzv2w8	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 07:03:55.67996	local
7280662f-09be-4ed6-a187-bb820cf7e6bd	5uyhnxqbz1zm8fiacrahyhhbg5t5	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 07:10:07.732527	local
c69f0ab3-c943-451f-9592-f8e0461c5ae7	ut9xe94fuios4q21ba61j8h1dfn5	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 07:10:07.735117	local
97c24fae-12f7-427f-bca1-eae86b83301b	g5oa9dcrho0keel5l2lvdw7d587h	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 07:12:32.199285	local
e9dc4e1b-d1bf-4b63-b8ca-b4f1570101f9	f9xhaiybv1zuk4skbyth7crtj3zw	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 08:14:07.800642	local
ff6babbe-61f0-452d-9d3e-e812a715c7fc	ymwjwvaqv4wyzxm7eiqlzo7ykstm	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 08:14:07.803627	local
d6ecf05d-40bf-45fc-be74-8bed64917f26	8qxuy62t7ktr7wpbs9vowmtz8npz	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 08:16:01.833709	local
b40884d5-e0ff-4cdf-9bb1-52ace378159b	4y4rvn3zp7b1rcwhyid2gpxd6hr7	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 09:32:14.195378	local
16b2193c-228f-445f-927a-4d49e03033d9	1inwgv9f3ez6awzh0ab3axlt8rta	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 09:32:14.19832	local
e31072a8-4e5e-4425-8fc5-5bb37d13c162	vdv3dstxp4n4gup8y9b44on321am	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-25 09:36:48.778141	local
87a1a8aa-9267-47f4-8379-9208b057a658	26j6han1p4n5pzd08roqf53ysyvp	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-26 10:47:50.633044	local
93b64d52-4d6a-45dd-a93c-b8f88259d300	7266kwm9li7fzw2itk2vitcetcea	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-26 10:47:50.635866	local
fa0d0b77-5b6b-4331-9395-e119b032eaeb	gwhsxizuswybf5fe23d4f4i8i0cf	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-26 10:50:16.535452	local
831211b6-b548-4b1b-966a-57d23d870259	uzyb0o3r79zvaxopv9ad7swos9hp	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 06:36:46.48779	local
b93d881d-cfdf-4554-ab26-d917cc1047d2	2vw9j3xnafbdwmbc6p12drtxdlrm	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 06:36:46.490892	local
6f87e637-69e7-4177-bd35-fac620357480	rmrcoasptete21jfobyc1ab5el90	Logo 3.jpg	image/jpeg	{"identified":true}	1884604	yq8/A0+H2TSmYXabjiQ/Lw==	2024-04-27 06:58:36.189066	local
698daa32-e500-400a-88ef-5624b4874b34	hxsql26snqeqz2v8iajwkhe0b7zu	Logo 1.jpg	image/jpeg	{"identified":true}	2050610	zYpJqAmsFKGmhXEHcTqs+g==	2024-04-27 06:58:36.191854	local
0aff6af2-ebd2-4eb9-a0ae-c4ea20047d35	v40mkh9sud64nhe05txv6rfpx1x6	Logo 1.jpg	image/jpeg	{"identified":true}	2050610	zYpJqAmsFKGmhXEHcTqs+g==	2024-04-27 09:51:31.222272	local
7311e8e2-24a0-472b-ac24-b01294385015	mgoheormk7xwiggvd8qhho6rpv2p	Logo 1.jpg	image/jpeg	{"identified":true}	2050610	zYpJqAmsFKGmhXEHcTqs+g==	2024-04-27 09:51:31.225375	local
b16ae5e4-7050-403f-9124-a972d2dbf16d	hllkld83ons3jz6vsjtixo2lnd0n	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 11:29:33.879736	local
ad5644f5-94e5-4458-a6e6-417708d4243a	1amgsed49x4k69q7q52i82u388mt	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 11:29:33.882915	local
e6eac21e-d7e6-49a6-ba22-f234252a78f3	ezhsqligbriutfodx4entmqxhb34	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 11:34:10.677135	local
0f07b691-1ce1-4d4b-b147-cb32b4a3031c	1hr1dvh2jx4kzwcbtlagrcs0hroa	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 11:45:33.166314	local
140539ad-6f7f-45bf-b6cd-68c01d2b81d1	dlfr8vcynkh126iitj795xt0llld	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 11:55:48.586753	local
e16f3653-9541-4df4-bb1f-b96513fc3be9	git7bjlwxxezav55a82qebxcpzo3	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 11:55:48.589703	local
959ad1ce-3f33-445e-8123-d7d681ecfc7e	7fxjh0ctdxndpo66erra2gyq20yo	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 11:55:48.593524	local
0564aeab-adc2-496f-ade8-2b82ffcc9688	lq64dlk5fpmabtm4jife2mmlng52	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 11:59:25.968058	local
adf8a8bd-99c1-4ed4-b6c6-94305fd9f704	g77lo9j8mtpoeat516c78531z5ds	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 12:25:33.15862	local
06050d77-d340-44d9-b626-888a809f347e	vufear0f67geh47b1m92tags6t2s	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 12:25:33.161283	local
b6272cc8-63c2-46ef-857d-42df31acecd8	t6mro811f00q6v19hj3yk6snp998	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 12:27:10.771669	local
fe3fa35c-bb55-48d4-aca1-a67d6b061c9b	bm9ba0gc3hi00crdbiw8d6p81jgw	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 12:58:27.453962	local
b2497708-26fb-4060-90cf-86dbe3b41c6f	ck0b4z7xrr9muorypslkkhfu3h2z	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-27 12:58:27.456727	local
6e3c091d-01d3-4497-a4c6-2c677868c8e1	kukbq0ktqivfvh1mykmdtpiee9b2	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-29 11:09:44.953524	local
421608e4-0260-4329-8233-bf127ef16548	u6ah9c97x9xjfxm2bf4gwnkznmqh	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-29 11:09:44.956887	local
f8f56099-2565-47e7-a849-f984ec6adf92	k40a0sopnmba2h2yeuplcam8e9ah	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-04-29 11:14:39.661103	local
85945819-383e-4ece-91ea-f581345f74c0	d3hk292a5cg1qdkkpuyfxsfn2a5o	Chapter 1_page-0036.jpg	image/jpeg	{"identified":true}	390583	swQWaFYp6pK+Hp7FhURHcA==	2024-05-02 07:47:33.934998	local
e472aa48-e68b-4074-b7dc-b9fb80e40f3b	qx1ur3pcset9ylmotxouur77z1s2	Chapter 1_page-0036.jpg	image/jpeg	{"identified":true}	390583	swQWaFYp6pK+Hp7FhURHcA==	2024-05-02 07:47:33.938229	local
2e5e0398-ea11-40d9-8a20-6f49a00c21b3	6vghpnzcswssj49p3zce3e43wu7n	Chapter 1_page-0036.jpg	image/jpeg	{"identified":true}	390583	swQWaFYp6pK+Hp7FhURHcA==	2024-05-02 07:49:15.905563	local
9b57c7b8-27fc-4ecb-8089-086a6ca36919	mnz32j8whnpz79urhnlrfgbgxys5	Chapter 1_page-0009.jpg	image/jpeg	{"identified":true}	422673	Qj7Z03bVo+nS155NT61deQ==	2024-05-02 08:13:30.85357	local
298c06e0-c7b2-41c9-b933-8be1e03e5e29	i02lehfev4hbooewvw85tf6d6303	Chapter 1_page-0008.jpg	image/jpeg	{"identified":true}	416755	8E5aCO1oEDjFGrQahLFbRA==	2024-05-02 08:13:30.856279	local
3c92893b-4363-4ed3-b551-eb8bc35302f8	cagzcycbgk0e0ynyo8x7tpcutfyr	Chapter 1_page-0035.jpg	image/jpeg	{"identified":true}	413196	RFVe+M8TiNmtVs32a9RRfg==	2024-05-02 08:15:28.881735	local
cc322d10-543d-4caf-9711-93ab558f602e	n2okwdslesoey53a72zqvqfpmlhd	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-05-04 06:07:48.653023	local
92a7bff7-6291-4e77-9a27-af64b830b01b	4vb9icxvt26h29gk0rmizl3fq5iy	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-05-04 06:07:48.655816	local
5bf77c67-b096-47b7-880e-4f7a65e11708	3my770m2ggaq4qm1xst9d750obaf	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-05-04 06:27:56.988701	local
02036a44-2e25-4c32-8329-70be24345a0d	v9r6xp2rzu7fx3h1xnevxkga8ph3	photo_2024-05-07_15-22-44.jpg	image/jpeg	{"identified":true}	29364	hi6Wv5vnTEVUuXE1pI1kog==	2024-05-08 06:18:31.621823	local
cbf9f036-8dc9-4b0d-b395-b19b0e29893d	m67encgzdbyuaorrunbpd8txmyez	photo_2024-05-07_15-22-44.jpg	image/jpeg	{"identified":true}	29364	hi6Wv5vnTEVUuXE1pI1kog==	2024-05-08 06:18:31.62492	local
fd55123d-f5fa-45dc-acec-b42da40a260d	o7i6vwiuqzeliu6ormv0iz90n5q6	photo_2024-05-07_15-22-44.jpg	image/jpeg	{"identified":true}	29364	hi6Wv5vnTEVUuXE1pI1kog==	2024-05-08 06:20:08.878014	local
52c07e6f-8819-4073-bbac-9e4495e44db0	mgvfadkcanyupxrwi3lqynucjdt7	Quantitative Analysis for Management Decisions Chapter 3_page-0092.jpg	image/jpeg	{"identified":true}	299876	rY6UAG/+G0OvpZ9CrwsReA==	2024-05-09 06:58:20.77288	local
7ef65071-d025-426b-af4c-cd67a84d60a1	cfhp7i6hmai7v9ccb637y574c77t	Slide5.JPG	image/jpeg	{"identified":true}	815584	OvxsCQE1210iuJlult/qJQ==	2024-05-09 06:58:20.820638	local
00703278-c31d-4cca-8d44-f51e7e10e6df	6qvxpl0jzvdc58z6x0iq9fojgygk	Quantitative Analysis for Management Decisions Chapter 3_page-0092.jpg	image/jpeg	{"identified":true}	299876	rY6UAG/+G0OvpZ9CrwsReA==	2024-05-09 06:58:20.838674	local
34fdf238-47b4-4bd9-8915-62c01a0c53d9	6t4nphfyjt8s9ukra2ivgr2ei0et	Slide5.JPG	image/jpeg	{"identified":true}	815584	OvxsCQE1210iuJlult/qJQ==	2024-05-09 07:01:12.444221	local
3b985361-a41d-4b71-91b9-183af9f2791d	esxa1besw3h2rper2fjuygfidr6k	Slide5.JPG	image/jpeg	{"identified":true}	815584	OvxsCQE1210iuJlult/qJQ==	2024-05-09 07:01:24.1704	local
8cfaa504-a5ee-47d4-9ffe-7647f48bac72	woanzkmrh0a9qly82twxkzobuutv	440572510_122143546922167240_5360506795894585040_n.jpg	image/jpeg	{"identified":true}	144128	3DlqTx/s7pIH10x2Ft3wQQ==	2024-05-10 06:08:03.766673	local
506551f5-ad94-49d2-8082-45752ebeefcb	8f1esxhfx7t812m9d84ajzq2h79z	440966154_122143127588167240_4324794789385686052_n.jpg	image/jpeg	{"identified":true}	197388	vrCVXtD3/sJ1lEYHhRu7UQ==	2024-05-10 06:08:03.81777	local
8a6d5119-26c9-4b08-b8d1-de1124595784	97pzrujdhpctxrtzwpfdp059fwp8	2..jpg	image/jpeg	{"identified":true}	63777	3PtYcSjdGEQDCdh2g9ujpQ==	2024-05-10 06:08:03.828323	local
cf14ae38-346d-4ae0-beaa-c7453fd727c4	c4zo9o727yhacn4otzg6t4tbll39	440966154_122143127588167240_4324794789385686052_n.jpg	image/jpeg	{"identified":true}	197388	vrCVXtD3/sJ1lEYHhRu7UQ==	2024-05-10 06:25:56.597697	local
b5e37775-eadb-4023-9bf5-1cdb73f101e9	1sqkt94hw00n5dq98zzqnixpd33p	441550210_122143989938167240_2842861049302989421_n.jpg	image/jpeg	{"identified":true}	275730	q40XVtXAqRA7tBm4mjbJTA==	2024-05-10 06:25:56.600265	local
24e5874d-ab9a-4909-a757-d30613e94e61	3w3fjjef7a9vetravzovgnp41pro	441550210_122143989938167240_2842861049302989421_n.jpg	image/jpeg	{"identified":true}	275730	q40XVtXAqRA7tBm4mjbJTA==	2024-05-10 06:25:56.602583	local
70b35f57-b833-4917-99b2-a3afb2005401	3tvn92g8mu079h5ztfmqsnqeg0ut	440966154_122143127588167240_4324794789385686052_n.jpg	image/jpeg	{"identified":true}	197388	vrCVXtD3/sJ1lEYHhRu7UQ==	2024-05-10 06:28:16.888656	local
a2ceffdb-13d5-48c7-b9ba-f27cc538e671	uf3ksscqj2uozio4bxeiw6x2slou	440572510_122143546922167240_5360506795894585040_n.jpg	image/jpeg	{"identified":true}	144128	3DlqTx/s7pIH10x2Ft3wQQ==	2024-05-10 07:03:04.531805	local
2387974f-802f-4d2d-9e51-a914335e019f	18woy73n6lxvqrzttd4dsbtla9zn	photo_2024-05-09_14-34-22.pdf	application/pdf	{"identified":true,"analyzed":true}	68349	rZcFb3axxiG4sLXUJOq8MQ==	2024-05-10 07:03:04.52892	local
4acad4a5-f05f-45d4-8085-0cec713e2fc2	l9zpr8lnqez7p0lghwtzb8e7kgr8	photo_2024-05-09_14-34-22.pdf	application/pdf	{"identified":true,"analyzed":true}	68349	rZcFb3axxiG4sLXUJOq8MQ==	2024-05-10 07:04:52.751962	local
f6edc4ad-ff3b-48c5-a7f3-c3b00641b783	yfd6pxen5hveaq4z5t15va1295ko	440966154_122143127588167240_4324794789385686052_n.jpg	image/jpeg	{"identified":true}	197388	vrCVXtD3/sJ1lEYHhRu7UQ==	2024-05-10 07:26:39.10708	local
683ef650-5f88-4b98-a8eb-b31910245984	w8xzsetin2e7u3qpp3h66dghs991	photo_2024-05-09_14-34-22.pdf	application/pdf	{"identified":true,"analyzed":true}	68349	rZcFb3axxiG4sLXUJOq8MQ==	2024-05-10 07:26:39.104545	local
f7c6734d-ea93-4ca1-ba8c-90f6a1a118e3	0nj63bqm6gicb8xa27r7lwl2n72y	photo_2024-05-09_14-34-22.pdf	application/pdf	{"identified":true,"analyzed":true}	68349	rZcFb3axxiG4sLXUJOq8MQ==	2024-05-10 07:36:33.526565	local
44ef07b3-f1d5-45f6-860d-f2d0b7ecfb80	mlycqgx26b9b80v8c4j2en0tg5a9	440572510_122143546922167240_5360506795894585040_n.jpg	image/jpeg	{"identified":true}	144128	3DlqTx/s7pIH10x2Ft3wQQ==	2024-05-10 07:58:52.993523	local
23041023-1f96-4a89-ab28-8cd7033b04e6	xfsyree5luiiiee7tgfu489wbq69	photo_2024-05-09_14-34-22.pdf	application/pdf	{"identified":true,"analyzed":true}	68349	rZcFb3axxiG4sLXUJOq8MQ==	2024-05-10 07:58:52.991102	local
5ad88e69-0484-4678-8bef-091b42d8d831	frcu0poj3rw8q1wopha73z7vsbqo	441550210_122143989938167240_2842861049302989421_n.jpg	image/jpeg	{"identified":true}	275730	q40XVtXAqRA7tBm4mjbJTA==	2024-05-10 08:01:32.613797	local
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: activities; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.activities (id, academic_calendar_id, activity, semester, description, category, starting_date, ending_date, last_updated_by, created_by, created_at, updated_at) FROM stdin;
12a1a2a3-5c23-4231-9061-ca92296a6c79	a9852e43-8136-4f4a-aba5-261c6068c3fb	Registration	1		class begining	2024-01-09 09:44:00	2024-02-11 09:45:00	SystemAdmin IT	SystemAdmin IT	2024-05-08 06:45:49.42845	2024-05-08 07:15:51.614175
75e8dc90-81f6-4929-86cc-5feeb6866115	cb7580a8-512f-4c01-a001-aa652a64f987	re	1		registration	2024-05-01 16:10:00	2024-05-01 16:10:00	SystemAdmin IT	SystemAdmin IT	2024-05-08 13:10:52.285372	2024-05-10 07:46:54.589409
a3f689cd-94bf-4957-8e0c-c603825b0ae4	cb7580a8-512f-4c01-a001-aa652a64f987	rg	2		registration	2024-05-10 16:10:00	2024-05-09 16:10:00	SystemAdmin IT	SystemAdmin IT	2024-05-08 13:10:52.286491	2024-05-10 07:46:54.590657
\.


--
-- Data for Name: add_and_drop_courses; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.add_and_drop_courses (id, add_and_drop_id, course_id, add_or_drop, advisor_approval, advisor_name, advisor_date_of_response, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: add_and_drops; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.add_and_drops (id, student_id, academic_calendar_id, semester_registration_id, department_id, program_id, section_id, semester, year, student_full_name, student_id_number, registrar_approval, registrar_name, registrar_date_of_response, advisor_approval, advisor_name, advisor_date_of_response, status, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.admin_users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, first_name, last_name, middle_name, role, username, department_id, created_at, updated_at) FROM stdin;
61f7f093-2c3e-4362-82ef-5495408940d2	kataru@gmail.com	$2a$12$Q/.hFB/mr8QQvipZgirYQef/x2.Qk4lQm8txyUMH1yU6Zm71huKDS	\N	\N	\N	4	2024-03-21 06:39:46.008585	2023-10-13 13:37:11.089169	196.189.17.167	196.189.10.117	Dr Kataru	Kalsa		department head	kataru@gmail.com	674c081a-0f1f-48a4-b83a-8813e262d683	2023-09-29 08:00:15.487954	2024-03-21 06:39:46.008711
08992a91-5327-46e5-a190-f74999cd4fe9	nega@gmail.com	$2a$12$oO5uJKDaYEKq/wQnZfzGKeJW4DvCdyLGw0CX6SW8SFLbLsjlGVdAa	\N	\N	\N	0	\N	\N	\N	\N	Dr Nega	Muhabaw		instructor	admin3@gmail.com	\N	2023-09-29 10:56:48.424469	2023-09-29 10:56:48.428264
0ae1d18e-983f-4634-8913-38506d774441	kasu@gmail.com	$2a$12$m6K.evbbSgDA9XFz3zwKCOnLBUcg.PFYMDVrVA9zRHOkg23aEm4TC	\N	\N	\N	0	\N	\N	\N	\N	Dr Kasu 	Zeleke		instructor	admin3@gmail.com	\N	2023-09-29 10:54:07.536664	2023-09-29 10:57:16.921156
4354ec13-49a8-4a4f-bfb9-8f4131acfcfa	tegenue@gmail.com	$2a$12$TzcKJ/.9P5bk5iBmNZo89.56Wm8ogYOzWZGMrSCdf2qERtrVxp7AK	\N	\N	\N	0	\N	\N	\N	\N	Dr Tegenue	Yae		instructor	admin3@gmail.com	\N	2023-09-29 10:58:47.8895	2023-09-29 10:58:47.892941
bc078c62-6501-4db7-a38a-277ff41ae9f3	bayisa@gmail.com	$2a$12$csLzBcaEU05EFgD0M5wt.OOJDtHO.czTXQNvcfaFjZ1vVHffGXfL6	\N	\N	\N	11	2023-10-13 13:36:49.600099	2023-10-12 12:17:07.107205	196.189.10.117	196.189.10.117	Dr Bayisa 	Tesfaye		department head	admin3@gmail.com	731d56ee-1d17-4d38-ab8a-7ae6b76f7be2	2023-09-29 07:57:12.480074	2023-10-13 13:36:49.60042
c4e558a5-2d99-42c7-9342-1478dbfda03b	musa@gmail.com	$2a$12$AhvfHEx03rkFP6H4WTn9/eG3CNXB6AePOkQY5AW1S72DuCC.t5tOe	\N	\N	\N	6	2023-10-13 13:37:28.084342	2023-10-11 12:50:40.39008	196.189.10.117	197.156.86.199	Dr Musa 	Worku		department head	musa@gmail.com	3fff3bd6-3f75-4427-8ba2-54ca46d85208	2023-09-29 07:54:23.603654	2023-10-13 13:37:28.084467
199bc935-30da-4bca-8978-940bd5f3b144	seada@gmail.com	$2a$12$Fo5YvKrP6R8/jQGv.MYFl.5y52aO6XRpy09JLkfqqbd61f5HK6lXa	\N	\N	\N	105	2024-05-10 07:05:22.31353	2024-05-08 15:08:04.298389	196.189.10.117	196.189.10.117	Seada 	Abdelhedi	Ahmed	finance head	seada	\N	2023-10-04 08:06:22.752835	2024-05-10 07:05:22.313658
2131ff01-0f40-476f-b434-c31b0dce3ef8	admin@gmail.com	$2a$12$Qxmt67LacuPZP2DP4RWkgOQ3LNMq8bosZBdwwwLFEpGiwRahxRa7.	\N	\N	\N	36	2024-05-10 07:37:08.682282	2024-05-10 05:55:44.470513	196.189.10.117	196.189.10.117	SystemAdmin	IT		admin		\N	2024-04-24 18:54:25.239432	2024-05-10 07:37:08.682411
a5093302-395c-4a40-9767-389ce1913c47	1234simachew@gmail.com	$2a$12$adIDOppp49e9nqJvboZto.to7TZuZ2CmpAhfbTP6RKmWlw2d2GS8O	\N	\N	\N	21	2024-05-10 08:13:38.548192	2024-05-10 07:07:05.718293	196.189.10.117	196.189.10.117	Simachew	belay	munie	registrar head	Simachew	\N	2024-04-29 11:29:38.996319	2024-05-10 08:13:38.548323
\.


--
-- Data for Name: almunis; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.almunis (id, fullname, sex, phone_number, modality, study_level, graduation_date, program_name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	production	2023-09-25 04:15:20.95203	2023-09-25 04:15:20.95203
\.


--
-- Data for Name: assessment_plans; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.assessment_plans (id, course_id, assessment_title, assessment_weight, created_by, updated_by, created_at, updated_at, final_exam) FROM stdin;
5aa12344-5c51-4621-bca8-ce67abe30d0e	60ec461f-1dde-4866-b75f-e31b813f01ee	Seminars	20.0	SystemAdmin IT	\N	2024-05-09 05:32:32.919701	2024-05-09 05:32:32.919701	f
a7e76868-aa14-4e59-96c8-e0bc3c4b1694	60ec461f-1dde-4866-b75f-e31b813f01ee	Assignments	10.0	SystemAdmin IT	\N	2024-05-09 05:32:45.048685	2024-05-09 05:32:45.048685	f
e2942495-0614-48c4-839c-082ba2e37bfc	57233289-afdc-4a4f-9d46-a3829d6aafbc	Individual assignment	20.0	SystemAdmin IT	\N	2024-05-08 14:19:10.068899	2024-05-08 14:19:10.068899	f
836c568b-6097-4ce9-a14e-7511be957df6	57233289-afdc-4a4f-9d46-a3829d6aafbc	Article review 	20.0	SystemAdmin IT	\N	2024-05-08 14:19:37.249241	2024-05-08 14:19:37.249241	f
7df48912-04a5-434a-8d9a-9b47d09d7b71	57233289-afdc-4a4f-9d46-a3829d6aafbc	Test	20.0	SystemAdmin IT	\N	2024-05-08 14:19:47.113857	2024-05-08 14:19:47.113857	f
1b230fec-469e-4c04-8f0a-449c9dd39408	57233289-afdc-4a4f-9d46-a3829d6aafbc	Final exam	40.0	SystemAdmin IT	\N	2024-05-08 14:19:57.497194	2024-05-08 14:19:57.497194	t
a6f4b89c-c53c-495e-ac6a-7dea0ca96a06	60ec461f-1dde-4866-b75f-e31b813f01ee	Group Discussions/Case study	20.0	SystemAdmin IT	\N	2024-05-09 05:33:04.848512	2024-05-09 05:33:04.848512	f
ae80ac83-43be-46ec-8d8e-0f8c04502e42	7e950b19-c03d-42df-ba2f-d1a0177d83d5	Article review (group)	20.0	SystemAdmin IT	\N	2024-05-08 14:48:24.517122	2024-05-08 14:48:24.517122	f
99708f9c-d11d-4995-98c4-f23df6ddefbb	7e950b19-c03d-42df-ba2f-d1a0177d83d5	Individual assignment	20.0	SystemAdmin IT	\N	2024-05-08 14:48:52.737988	2024-05-08 14:48:52.737988	f
1370d5e9-957f-4c7b-afbf-9dd9d3bf472f	7e950b19-c03d-42df-ba2f-d1a0177d83d5	Test	20.0	SystemAdmin IT	\N	2024-05-08 14:49:06.237741	2024-05-08 14:49:06.237741	f
4f6455ae-291c-4965-84e5-0f7503ecbff0	7e950b19-c03d-42df-ba2f-d1a0177d83d5	Final exam	40.0	SystemAdmin IT	\N	2024-05-08 14:49:16.556038	2024-05-08 14:49:16.556038	t
2a8ed51d-80cb-408e-82e9-8ed92f57080a	8ba729ab-3b61-4d6b-9e8a-2cb445e3fa5a	 Scenario analysis	20.0	SystemAdmin IT	\N	2024-05-08 14:51:04.2152	2024-05-08 14:51:04.2152	f
a8d6a51a-4108-488d-a5eb-927b62238db8	8ba729ab-3b61-4d6b-9e8a-2cb445e3fa5a	Article review	20.0	SystemAdmin IT	\N	2024-05-08 14:51:30.549673	2024-05-08 14:51:30.549673	f
984c7e2f-b76a-410c-9cbb-6d9bd99b4d44	8ba729ab-3b61-4d6b-9e8a-2cb445e3fa5a	Test	20.0	SystemAdmin IT	\N	2024-05-08 14:51:49.509301	2024-05-08 14:51:49.509301	f
05f20815-154a-4048-b626-7b40c6ed69b3	8ba729ab-3b61-4d6b-9e8a-2cb445e3fa5a	Final exam	40.0	SystemAdmin IT	\N	2024-05-08 14:52:05.86956	2024-05-08 14:52:05.86956	t
557072e8-ad82-4452-bc42-361937a09f30	55b57b7b-147c-42c3-a5ad-08d8b369e666	Assignments (individual and group)	40.0	SystemAdmin IT	\N	2024-05-08 14:53:24.526805	2024-05-08 14:53:24.526805	f
b380c187-d633-4eda-b163-4e77a3c6cd80	55b57b7b-147c-42c3-a5ad-08d8b369e666	Lesson quizzes-	20.0	SystemAdmin IT	\N	2024-05-08 14:53:50.626266	2024-05-08 14:53:50.626266	f
c08149a1-ff98-4bec-80ed-a311a4c70755	55b57b7b-147c-42c3-a5ad-08d8b369e666	Final exam	40.0	SystemAdmin IT	\N	2024-05-08 14:54:08.299272	2024-05-08 14:54:08.299272	t
32489bb6-503e-4ea5-b3cd-7bedca0a9e66	5221644c-1217-4600-ad59-bf912a7b00f7	Assignments	20.0	SystemAdmin IT	\N	2024-05-08 14:57:05.610959	2024-05-08 14:57:05.610959	f
9b92b947-17ea-4d6a-a893-116cce4389c6	5221644c-1217-4600-ad59-bf912a7b00f7	Test	20.0	SystemAdmin IT	\N	2024-05-08 14:57:22.150626	2024-05-08 14:57:22.150626	f
3826488c-b288-47b1-81a7-9a3d1b4d51ca	5221644c-1217-4600-ad59-bf912a7b00f7	Article review 	20.0	SystemAdmin IT	\N	2024-05-08 14:57:41.37633	2024-05-08 14:57:41.37633	f
ac830a30-cd76-4541-8950-94fb0c6b9ec9	5221644c-1217-4600-ad59-bf912a7b00f7	Final exam	40.0	SystemAdmin IT	\N	2024-05-08 14:57:49.583336	2024-05-08 14:57:49.583336	t
6ba267e2-d8e8-4dbb-8573-2156eb0ce742	f03f3c54-4973-42d0-bc9b-0daf05189fff	Case analysis	20.0	SystemAdmin IT	\N	2024-05-08 15:04:30.383524	2024-05-08 15:04:30.383524	f
8eab45af-4d40-45b5-99e9-3b4b3c8f80f4	f03f3c54-4973-42d0-bc9b-0daf05189fff	Individual assignment	20.0	SystemAdmin IT	\N	2024-05-08 15:04:54.238118	2024-05-08 15:04:54.238118	f
eb9f2cbd-0590-4022-91e5-8d987a1fbff7	f03f3c54-4973-42d0-bc9b-0daf05189fff	Test 	20.0	SystemAdmin IT	\N	2024-05-08 15:05:10.208104	2024-05-08 15:05:10.208104	f
14678c32-403e-4e35-b7ab-ed2581a0a0bc	f03f3c54-4973-42d0-bc9b-0daf05189fff	Final Exam	40.0	SystemAdmin IT	\N	2024-05-08 15:05:40.579413	2024-05-08 15:05:40.579413	t
df958828-702d-4262-bd15-b620f77a6b01	929f6dc5-36b5-4cfd-92c4-10c1e57f51b9	Seminar or project Assignments/case Analysis Reports	30.0	SystemAdmin IT	\N	2024-05-09 05:30:28.065868	2024-05-09 05:30:28.065868	f
7855bd87-91a4-42c2-b3e4-7ee88cbed9f7	929f6dc5-36b5-4cfd-92c4-10c1e57f51b9	Quiz	20.0	SystemAdmin IT	\N	2024-05-09 05:30:53.261165	2024-05-09 05:30:53.261165	f
52e1f55a-b3d1-4b6f-adf8-4f6b7f631525	929f6dc5-36b5-4cfd-92c4-10c1e57f51b9	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 05:31:06.070248	2024-05-09 05:31:06.070248	t
7805eaff-810b-49c7-885c-03b8d58e177d	60ec461f-1dde-4866-b75f-e31b813f01ee	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 05:33:18.681064	2024-05-09 05:33:18.681064	t
1ae51de9-e1f2-4948-b820-9891cf74001b	9eafd33c-3776-4b78-84a3-8a9024c1d97d	Project proposal group assignment	20.0	SystemAdmin IT	\N	2024-05-09 05:34:31.425275	2024-05-09 05:34:31.425275	f
d245eef0-40a7-4296-9377-4a0f20cb5d29	9eafd33c-3776-4b78-84a3-8a9024c1d97d	Individual assignment	20.0	SystemAdmin IT	\N	2024-05-09 05:34:41.700616	2024-05-09 05:34:41.700616	f
49e5be06-0553-45d4-a85f-4263c5f5e09c	9eafd33c-3776-4b78-84a3-8a9024c1d97d	Test	20.0	SystemAdmin IT	\N	2024-05-09 05:34:50.502841	2024-05-09 05:34:50.502841	f
64a69e31-7fc6-4104-a2b3-6131b15f21b9	9eafd33c-3776-4b78-84a3-8a9024c1d97d	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 05:34:59.551334	2024-05-09 05:34:59.551334	t
c439381d-9f68-48f3-be0e-88a5d72f9e7a	b003feaa-48be-4ce5-8a56-1ecaf69bc4dd	Assignments/work out questions	20.0	SystemAdmin IT	\N	2024-05-09 05:37:21.657265	2024-05-09 05:37:21.657265	f
17b1b273-5326-4b27-9943-3085a154458a	b003feaa-48be-4ce5-8a56-1ecaf69bc4dd	Article review	20.0	SystemAdmin IT	\N	2024-05-09 05:37:45.977373	2024-05-09 05:37:45.977373	f
925b7d29-99e0-40aa-80d8-36ca97799751	b003feaa-48be-4ce5-8a56-1ecaf69bc4dd	Test/quiz	20.0	SystemAdmin IT	\N	2024-05-09 05:38:10.545836	2024-05-09 05:38:10.545836	f
5c87a71e-8956-484b-9313-969c192f8816	b003feaa-48be-4ce5-8a56-1ecaf69bc4dd	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 05:38:25.160091	2024-05-09 05:38:25.160091	t
cbebc89f-4a2c-43af-999e-0be8893f4a37	b8bd9b88-5442-47e2-8348-30c18472516b	Assignments	40.0	SystemAdmin IT	\N	2024-05-09 05:41:00.390425	2024-05-09 05:41:00.390425	f
5ffa7861-455b-42f1-992e-c83dd3b9e3a9	b8bd9b88-5442-47e2-8348-30c18472516b	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 05:41:11.09858	2024-05-09 05:41:11.09858	t
6341fdc1-e04f-4650-b457-9f0b0c7365ad	b8bd9b88-5442-47e2-8348-30c18472516b	Lesson quizzes	20.0	SystemAdmin IT	SystemAdmin IT	2024-05-09 05:40:21.669741	2024-05-09 05:42:46.938097	f
fbdd2592-0b11-4500-bd19-ffa9e2b26612	491de79c-c81d-4573-8f93-830c7c665278	Lesson quizzes	10.0	SystemAdmin IT	\N	2024-05-09 05:44:18.529251	2024-05-09 05:44:18.529251	f
eaeeb507-a726-495f-8001-73d492492f30	491de79c-c81d-4573-8f93-830c7c665278	Test	10.0	SystemAdmin IT	\N	2024-05-09 05:44:31.757951	2024-05-09 05:44:31.757951	f
f75f2a93-ba56-4eb2-b035-2ca20fb30e36	491de79c-c81d-4573-8f93-830c7c665278	Assignments	40.0	SystemAdmin IT	\N	2024-05-09 05:44:51.750098	2024-05-09 05:44:51.750098	f
100fe381-a7cb-451a-85ec-a2e6cb57cc57	491de79c-c81d-4573-8f93-830c7c665278	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 05:45:06.017246	2024-05-09 05:45:06.017246	t
4bf2717f-9e7e-43c0-ba2e-676d2fe88d8e	f42d4758-31cc-4f7a-9d75-3639762cc617	Case analysis	20.0	SystemAdmin IT	\N	2024-05-09 05:48:21.405383	2024-05-09 05:48:21.405383	f
032949e5-0042-47f3-9f53-d50d7adcaf23	f42d4758-31cc-4f7a-9d75-3639762cc617	Article review 	20.0	SystemAdmin IT	\N	2024-05-09 05:48:41.738816	2024-05-09 05:48:41.738816	f
0d5599d9-7f6f-4676-a6b4-56aa4598ea15	f42d4758-31cc-4f7a-9d75-3639762cc617	Test	20.0	SystemAdmin IT	\N	2024-05-09 05:48:51.508406	2024-05-09 05:48:51.508406	f
153c2390-3b8b-4db3-8d2f-662222e944aa	f42d4758-31cc-4f7a-9d75-3639762cc617	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 05:49:17.589395	2024-05-09 05:49:17.589395	t
c0bbc1c2-f3a4-42ac-8eea-ce679facda0a	066af00a-cf62-41e3-ae93-6f1f2e70928c	Article review	20.0	SystemAdmin IT	\N	2024-05-09 05:59:57.321989	2024-05-09 05:59:57.321989	f
6f76e924-3a41-4e0b-9eb6-2b0ff2e7d61f	066af00a-cf62-41e3-ae93-6f1f2e70928c	Individual assignment	20.0	SystemAdmin IT	\N	2024-05-09 06:00:05.576836	2024-05-09 06:00:05.576836	f
6896efe2-8889-41be-b462-9534c1c2b3b8	066af00a-cf62-41e3-ae93-6f1f2e70928c	Test	20.0	SystemAdmin IT	\N	2024-05-09 06:00:14.418002	2024-05-09 06:00:14.418002	f
75ab7275-aedb-42f5-9177-08760abdd38f	066af00a-cf62-41e3-ae93-6f1f2e70928c	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:00:23.809539	2024-05-09 06:00:23.809539	t
0eff54d5-37f7-4789-97f5-d3fd0deed081	f291cccb-6bfe-4db2-a0d1-65aa2c4855f0	Scenario analysis	20.0	SystemAdmin IT	\N	2024-05-09 06:01:50.197466	2024-05-09 06:01:50.197466	f
e6a23bda-d1bd-4921-8228-d893cccd0cdc	f291cccb-6bfe-4db2-a0d1-65aa2c4855f0	Article review 	20.0	SystemAdmin IT	\N	2024-05-09 06:02:06.112152	2024-05-09 06:02:06.112152	f
f9a319ab-9db4-48be-804a-aa09773fd999	f291cccb-6bfe-4db2-a0d1-65aa2c4855f0	Test	20.0	SystemAdmin IT	\N	2024-05-09 06:02:17.174983	2024-05-09 06:02:17.174983	f
109d3433-bdc0-4e73-be85-2030dc5e7c1f	f291cccb-6bfe-4db2-a0d1-65aa2c4855f0	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:02:28.147275	2024-05-09 06:02:28.147275	t
72923263-a5bb-46c3-b21c-77e9812ed452	012e9577-aa09-48e7-8a9f-1b88b9ee3dfb	Assignments	10.0	SystemAdmin IT	\N	2024-05-09 06:04:21.242603	2024-05-09 06:04:21.242603	f
bf6c45bc-0054-4d3e-b802-fba458a5f65b	012e9577-aa09-48e7-8a9f-1b88b9ee3dfb	Group Discussions/Case study	20.0	SystemAdmin IT	\N	2024-05-09 06:04:44.692678	2024-05-09 06:04:44.692678	f
464d4c0a-6bd4-478a-af22-602b92b7ea4a	012e9577-aa09-48e7-8a9f-1b88b9ee3dfb	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:04:55.817773	2024-05-09 06:04:55.817773	t
734ffee1-53d6-4530-978d-6f38ee8d4164	012e9577-aa09-48e7-8a9f-1b88b9ee3dfb	 Seminars	20.0	SystemAdmin IT	SystemAdmin IT	2024-05-09 06:04:02.319655	2024-05-09 06:07:02.33525	f
060afac0-3671-4546-ab19-1995baee0d14	ee80c01e-21ed-4ce0-8546-0617a9ad071e	Group Project	35.0	SystemAdmin IT	\N	2024-05-09 06:08:29.845158	2024-05-09 06:08:29.845158	f
b31ad774-2bac-4d95-b08e-6eafcf29fea1	ee80c01e-21ed-4ce0-8546-0617a9ad071e	Assignments	15.0	SystemAdmin IT	\N	2024-05-09 06:08:39.734321	2024-05-09 06:08:39.734321	f
fde9a49b-c711-408b-a784-7afba47d04f0	ee80c01e-21ed-4ce0-8546-0617a9ad071e	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:08:51.830078	2024-05-09 06:08:51.830078	t
ca70367e-e389-412e-8c40-e8bed8f902a2	0db9b2eb-5edf-408c-bf28-a445d23f89ad	Developing business plan	20.0	SystemAdmin IT	\N	2024-05-09 06:10:44.714288	2024-05-09 06:10:44.714288	f
d278d41d-5038-4684-9984-2dd1ee6b12a8	0db9b2eb-5edf-408c-bf28-a445d23f89ad	Individual assignment	20.0	SystemAdmin IT	\N	2024-05-09 06:10:53.945237	2024-05-09 06:10:53.945237	f
74fb213e-e1ed-4377-9df9-a5295c1054f6	0db9b2eb-5edf-408c-bf28-a445d23f89ad	 Group assignment 	20.0	SystemAdmin IT	\N	2024-05-09 06:11:23.282143	2024-05-09 06:11:23.282143	f
33a69f1f-b601-49c5-b9e3-a5677260c073	0db9b2eb-5edf-408c-bf28-a445d23f89ad	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:11:32.874112	2024-05-09 06:11:32.874112	t
81b4629f-3e3f-4e37-8337-97edb9994804	b89041d9-89bf-4161-b506-069078869b28	Group Discussions	20.0	SystemAdmin IT	\N	2024-05-09 06:13:39.480315	2024-05-09 06:13:39.480315	f
f93117b0-f676-4b87-a49e-26226e3b2841	b89041d9-89bf-4161-b506-069078869b28	Assignments	10.0	SystemAdmin IT	\N	2024-05-09 06:13:49.055214	2024-05-09 06:13:49.055214	f
e9dfa506-40ac-4f51-b0cb-35178584380c	b89041d9-89bf-4161-b506-069078869b28	Seminars	20.0	SystemAdmin IT	\N	2024-05-09 06:13:58.869434	2024-05-09 06:13:58.869434	f
918d27c8-6a3c-4f92-9d59-2f59cbcb9ab0	b89041d9-89bf-4161-b506-069078869b28	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:14:12.040649	2024-05-09 06:14:12.040649	t
869135c9-6baf-47d1-9db9-6a4d1aae0933	eb8dba45-4bc6-4ac4-8c82-1bc39f9becfd	Case analysis	20.0	SystemAdmin IT	\N	2024-05-09 06:15:03.312685	2024-05-09 06:15:03.312685	f
230bbd98-f60e-45ed-b683-ed320e06b8f4	eb8dba45-4bc6-4ac4-8c82-1bc39f9becfd	Individual assignment	20.0	SystemAdmin IT	\N	2024-05-09 06:15:11.424508	2024-05-09 06:15:11.424508	f
711cfb5b-ca21-4572-8f77-c95ce7819bcb	eb8dba45-4bc6-4ac4-8c82-1bc39f9becfd	Test	20.0	SystemAdmin IT	\N	2024-05-09 06:15:18.511981	2024-05-09 06:15:18.511981	f
c15ec505-65b1-4d26-98ef-10f1afb1cb88	eb8dba45-4bc6-4ac4-8c82-1bc39f9becfd	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:15:29.160461	2024-05-09 06:15:29.160461	t
02f37207-553d-48f0-8b62-0c92df6ea56a	e97ce222-f612-46da-b781-47d7ffaf9d83	Seminar or project Assignments	30.0	SystemAdmin IT	\N	2024-05-09 06:17:04.972179	2024-05-09 06:17:04.972179	f
bcc08237-0791-44b4-aa07-555a75efd840	e97ce222-f612-46da-b781-47d7ffaf9d83	Quiz	20.0	SystemAdmin IT	\N	2024-05-09 06:17:16.752521	2024-05-09 06:17:16.752521	f
5b545be2-fe4f-4d3b-8b65-8af941b5c6cf	e97ce222-f612-46da-b781-47d7ffaf9d83	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:17:25.526634	2024-05-09 06:17:25.526634	t
154cd43a-ffdc-47e0-a595-d84627bbbcfd	ee0d5867-0b43-42f1-8787-c98ee3b75059	Case analysis	20.0	SystemAdmin IT	\N	2024-05-09 06:18:27.748265	2024-05-09 06:18:27.748265	f
e44941c5-394c-47f4-bae8-5b1493dc0a4b	ee0d5867-0b43-42f1-8787-c98ee3b75059	Article review 	20.0	SystemAdmin IT	\N	2024-05-09 06:18:39.094852	2024-05-09 06:18:39.094852	f
6f6613f2-e183-4bd6-9c75-4f9ca6fb8a3b	ee0d5867-0b43-42f1-8787-c98ee3b75059	Test	20.0	SystemAdmin IT	\N	2024-05-09 06:18:48.128249	2024-05-09 06:18:48.128249	f
632f4f68-138a-4a94-a5cf-2d06f19d5f7c	ee0d5867-0b43-42f1-8787-c98ee3b75059	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:18:57.626035	2024-05-09 06:18:57.626035	t
f41d66fc-1bde-403c-b87e-b386a14dec39	3f883ada-2020-4f3d-bac1-17aa7bde7553	term paper	20.0	SystemAdmin IT	\N	2024-05-09 06:21:12.669032	2024-05-09 06:21:12.669032	f
bcd5e6d7-3879-4d3b-ac1b-3c0c53bec5a6	3f883ada-2020-4f3d-bac1-17aa7bde7553	project work	30.0	SystemAdmin IT	\N	2024-05-09 06:21:49.897809	2024-05-09 06:21:49.897809	f
5e12baac-7bdf-468f-8299-0f61c0f7b493	3f883ada-2020-4f3d-bac1-17aa7bde7553	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:22:01.011654	2024-05-09 06:22:01.011654	t
158e74e2-135f-4578-a408-20cd4a9187ec	6d0d2d09-19da-4339-a7f3-e2c31f8fc115	Case analysis	10.0	SystemAdmin IT	\N	2024-05-09 06:23:27.096351	2024-05-09 06:23:27.096351	f
31ff5ab0-c63d-48d9-9aee-516e081c1a87	6d0d2d09-19da-4339-a7f3-e2c31f8fc115	Group assignment with presentation 	30.0	SystemAdmin IT	\N	2024-05-09 06:23:40.900128	2024-05-09 06:23:40.900128	f
7dde6532-ef0a-41e4-8c30-244f349768d9	6d0d2d09-19da-4339-a7f3-e2c31f8fc115	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:23:49.211551	2024-05-09 06:23:49.211551	t
ae1df5c1-2413-4ba3-98ac-edcdd6ecbd49	6d0d2d09-19da-4339-a7f3-e2c31f8fc115	Article review	10.0	SystemAdmin IT	SystemAdmin IT	2024-05-09 06:23:01.808857	2024-05-09 06:24:23.749213	f
dfae02c1-73e9-4959-ae9f-e8674c194f38	e1bad14f-fbd3-43f3-b5cc-f84943a13b61	individual written assignment 	20.0	SystemAdmin IT	\N	2024-05-09 06:25:57.009057	2024-05-09 06:25:57.009057	f
10478275-0636-42ab-b06d-c0daa98f6973	e1bad14f-fbd3-43f3-b5cc-f84943a13b61	Group written assignment with presentation 	30.0	SystemAdmin IT	\N	2024-05-09 06:27:09.290257	2024-05-09 06:27:09.290257	f
f6b960f7-340a-456b-b381-b95402e0fcdc	e1bad14f-fbd3-43f3-b5cc-f84943a13b61	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:27:18.663328	2024-05-09 06:27:18.663328	t
ee01dcd2-5485-4be9-9d5c-fcf96d20b9bc	67a5dba0-7fff-479e-9ca0-945553aa89e5	Case analysis	20.0	SystemAdmin IT	\N	2024-05-09 06:28:31.195781	2024-05-09 06:28:31.195781	f
ce58bdda-f8a7-480a-b712-d810d408d6c6	67a5dba0-7fff-479e-9ca0-945553aa89e5	Article review 	20.0	SystemAdmin IT	\N	2024-05-09 06:28:42.912625	2024-05-09 06:28:42.912625	f
b3aacf01-5f58-48ce-8020-5182150a70a4	67a5dba0-7fff-479e-9ca0-945553aa89e5	Test	20.0	SystemAdmin IT	\N	2024-05-09 06:28:53.337974	2024-05-09 06:28:53.337974	f
83f07278-4e0d-4e40-9d8e-25f2809a8a12	67a5dba0-7fff-479e-9ca0-945553aa89e5	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:29:02.17606	2024-05-09 06:29:02.17606	t
35c587fb-fab6-4bd0-9055-a8ee6fa1ab64	68f01a66-2b97-4379-9c87-3d62eee34f77	 Term paper writing	20.0	SystemAdmin IT	\N	2024-05-09 06:32:38.154511	2024-05-09 06:32:38.154511	f
4b050c98-e98b-428c-80e1-946ce91a2145	68f01a66-2b97-4379-9c87-3d62eee34f77	Individual assignment	20.0	SystemAdmin IT	\N	2024-05-09 06:32:46.633842	2024-05-09 06:32:46.633842	f
8df98c6e-6e3f-458f-a911-dc0d0b2a87b8	68f01a66-2b97-4379-9c87-3d62eee34f77	mid exam	20.0	SystemAdmin IT	\N	2024-05-09 06:33:03.465117	2024-05-09 06:33:03.465117	f
bbaa97a3-9247-4651-9ebf-da9088823bbf	68f01a66-2b97-4379-9c87-3d62eee34f77	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:33:11.969928	2024-05-09 06:33:11.969928	t
c47a20d6-50e5-4e9a-890d-e6839b8c0ca6	4d344ee6-699c-4890-bfd4-1a5245967b5f	Proposal Writing and presentation	30.0	SystemAdmin IT	\N	2024-05-09 06:34:09.052497	2024-05-09 06:34:09.052497	f
6ad1d640-2711-4552-82a0-159553bd0c73	4d344ee6-699c-4890-bfd4-1a5245967b5f	Group assignment	10.0	SystemAdmin IT	\N	2024-05-09 06:34:30.526019	2024-05-09 06:34:30.526019	f
ea9601da-caf6-4339-b492-e2fcce3da81f	4d344ee6-699c-4890-bfd4-1a5245967b5f	article/book review	20.0	SystemAdmin IT	\N	2024-05-09 06:35:01.339806	2024-05-09 06:35:01.339806	f
4c5e4b3b-cab5-4427-8b65-ac940107dc3d	4d344ee6-699c-4890-bfd4-1a5245967b5f	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:35:09.67794	2024-05-09 06:35:09.67794	t
750fad7f-497d-489e-a666-f98917c9cf11	22daa408-10e6-47b3-a3b1-f82a893ea536	Project proposal writing and presentation	30.0	SystemAdmin IT	\N	2024-05-09 06:36:05.22472	2024-05-09 06:36:05.22472	f
3a32be07-43d1-46b4-940b-dc4355a50a4d	22daa408-10e6-47b3-a3b1-f82a893ea536	Project visit and report writing	20.0	SystemAdmin IT	\N	2024-05-09 06:36:22.592569	2024-05-09 06:36:22.592569	f
13a98394-92d5-4fe6-93d8-4fdc041ec5fb	22daa408-10e6-47b3-a3b1-f82a893ea536	Case analysis	10.0	SystemAdmin IT	\N	2024-05-09 06:36:30.378088	2024-05-09 06:36:30.378088	f
37e2d6b3-aea6-4e7b-b6ed-137d31693237	22daa408-10e6-47b3-a3b1-f82a893ea536	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:36:38.747424	2024-05-09 06:36:38.747424	t
79150a95-3e7b-4163-b706-7fcd22050dcc	765aa33f-f6a7-4f78-ad20-24f8c1dd4ba1	Case study and reporting (group)	20.0	SystemAdmin IT	\N	2024-05-09 06:37:27.453993	2024-05-09 06:37:27.453993	f
e2aa2408-21e4-4b9a-aa3c-f9108ca329bc	765aa33f-f6a7-4f78-ad20-24f8c1dd4ba1	Articles/book review (individual)	30.0	SystemAdmin IT	\N	2024-05-09 06:37:45.850186	2024-05-09 06:37:45.850186	f
c731d08d-f7ac-4391-8329-b82b24f0e2ac	765aa33f-f6a7-4f78-ad20-24f8c1dd4ba1	 Term paper (group)	10.0	SystemAdmin IT	\N	2024-05-09 06:38:11.819111	2024-05-09 06:38:11.819111	f
fc50e2a1-50f0-4120-aa6f-02baadfcea4a	765aa33f-f6a7-4f78-ad20-24f8c1dd4ba1	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:38:23.92011	2024-05-09 06:38:23.92011	t
e6ca20b9-e8f5-41f9-ac3a-709ca01c723b	17e3ecc7-111d-4968-80a0-d96c1693c5fb	Case analysis	10.0	SystemAdmin IT	\N	2024-05-09 06:39:42.625717	2024-05-09 06:39:42.625717	f
85c5f4ee-9ad0-4c5b-afb3-803e4afe0fbc	17e3ecc7-111d-4968-80a0-d96c1693c5fb	Group Term paper	20.0	SystemAdmin IT	\N	2024-05-09 06:40:08.575259	2024-05-09 06:40:08.575259	f
8d7a9605-4e7f-4984-a2de-048ff14ccfd4	17e3ecc7-111d-4968-80a0-d96c1693c5fb	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:40:17.683385	2024-05-09 06:40:17.683385	t
468472bd-dc67-46b9-a0a4-738486ce424d	17e3ecc7-111d-4968-80a0-d96c1693c5fb	 Article/book review	30.0	SystemAdmin IT	SystemAdmin IT	2024-05-09 06:39:33.45549	2024-05-09 06:40:46.00418	f
8023fb05-087e-4c48-9a53-efc9af566d7a	9a42151a-4ad8-4e5a-9ddb-7021ab1da3fb	Field visit report writing and presentation	30.0	SystemAdmin IT	\N	2024-05-09 06:41:48.865186	2024-05-09 06:41:48.865186	f
635e5e27-4031-44ed-bb83-74a939a6afdc	9a42151a-4ad8-4e5a-9ddb-7021ab1da3fb	 Term paper writing (group)	20.0	SystemAdmin IT	\N	2024-05-09 06:42:03.999929	2024-05-09 06:42:03.999929	f
3b0c1866-5f37-451e-88a8-4a825575b9c8	9a42151a-4ad8-4e5a-9ddb-7021ab1da3fb	Case Analysis (individual)	10.0	SystemAdmin IT	\N	2024-05-09 06:42:23.537962	2024-05-09 06:42:23.537962	f
165e04a2-ba20-4127-b5e2-6602e22263da	9a42151a-4ad8-4e5a-9ddb-7021ab1da3fb	Final exam	40.0	SystemAdmin IT	\N	2024-05-09 06:42:31.403467	2024-05-09 06:42:31.403467	t
e068dc8a-3aa4-4385-aca7-9b7b148b2d91	eb4936d9-8e53-477b-ac83-a664466d7f08	Continuous Assessment 	50.0	SystemAdmin IT	\N	2024-05-09 06:43:17.967496	2024-05-09 06:43:17.967496	f
368948c9-27a4-45fa-a057-5159a2966d10	eb4936d9-8e53-477b-ac83-a664466d7f08	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:43:26.040501	2024-05-09 06:43:26.040501	t
8ce20c31-27fd-422f-bcf1-54552bd0d9c2	25b5bf9e-727a-41da-86ed-d258097e5ee3	Proposal Writing and presentation	30.0	SystemAdmin IT	\N	2024-05-09 06:44:27.528937	2024-05-09 06:44:27.528937	f
c90c3de3-1e79-43b8-a6ce-fc1a59281693	25b5bf9e-727a-41da-86ed-d258097e5ee3	Article/book review	20.0	SystemAdmin IT	\N	2024-05-09 06:44:52.213078	2024-05-09 06:44:52.213078	f
22996e81-707e-43c1-9469-7d6374ecd553	25b5bf9e-727a-41da-86ed-d258097e5ee3	Group assignment	10.0	SystemAdmin IT	\N	2024-05-09 06:45:05.240105	2024-05-09 06:45:05.240105	f
d31d46ad-b57a-4de3-bec0-e2331cfe4e80	25b5bf9e-727a-41da-86ed-d258097e5ee3	Final exam	40.0	SystemAdmin IT	SystemAdmin IT	2024-05-09 06:45:13.383314	2024-05-09 06:45:44.467102	t
1d3c5e93-50c5-412e-b0c0-7f7e51a99922	a948bbde-df15-474a-bb57-e986bfc7ed27	Continuous Assessment 	50.0	SystemAdmin IT	\N	2024-05-09 06:46:36.696389	2024-05-09 06:46:36.696389	f
02425794-87c6-4d13-a3b2-52e1211ac184	a948bbde-df15-474a-bb57-e986bfc7ed27	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:46:45.839771	2024-05-09 06:46:45.839771	t
2dcae7a3-6ac2-4e1b-8427-6eae5db5fc4b	8c17a51d-6acd-40d5-9af2-518c3a4569ce	Continuous Assessment 	50.0	SystemAdmin IT	\N	2024-05-09 06:48:35.81117	2024-05-09 06:48:35.81117	f
8d95e756-57a6-4c8e-b30f-cb5554c0abdc	8c17a51d-6acd-40d5-9af2-518c3a4569ce	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:48:46.399087	2024-05-09 06:48:46.399087	t
ce6ec87c-fa6d-4dc5-b57b-6aed359d5808	77001280-ba97-4509-b5d6-95a9fd099c64	Continuous Assessment 	50.0	SystemAdmin IT	\N	2024-05-09 06:49:59.651966	2024-05-09 06:49:59.651966	f
dccfe3ea-a814-452a-b262-7fb85d3c3295	77001280-ba97-4509-b5d6-95a9fd099c64	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:50:10.728417	2024-05-09 06:50:10.728417	t
221db3c1-bc85-469f-856e-2c4a89da688c	5a7995b5-288a-41c6-8017-3e58fc91e275	Continuous Assessment 	50.0	SystemAdmin IT	\N	2024-05-09 06:51:16.086734	2024-05-09 06:51:16.086734	f
42c19cf8-f6f5-4e90-a3b9-9cc62e7d50b0	5a7995b5-288a-41c6-8017-3e58fc91e275	Final exam	50.0	SystemAdmin IT	\N	2024-05-09 06:51:26.527055	2024-05-09 06:51:26.527055	t
\.


--
-- Data for Name: assessments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.assessments (id, student_id, course_id, student_grade_id, assessment_plan_id, result, created_by, updated_by, created_at, updated_at, final_exam) FROM stdin;
\.


--
-- Data for Name: attendances; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.attendances (id, program_id, section_id, course_id, academic_calendar_id, course_title, attendance_title, year, semester, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: college_payments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.college_payments (id, study_level, admission_type, student_nationality, total_fee, registration_fee, late_registration_fee, starting_penalty_fee, daily_penalty_fee, makeup_exam_fee, add_drop, tution_per_credit_hr, readmission, reissuance_of_grade_report, student_copy, additional_student_copy, tempo, original_certificate, original_certificate_replacement, tempo_replacement, letter, student_id_card, student_id_card_replacement, name_change, transfer_fee, last_updated_by, created_by, created_at, updated_at) FROM stdin;
0adf4094-2713-415c-b30c-3d1ea9ea5201	graduate	online	local	0.0	0.0	0.0	0.0	0.0	0.0	0.0	500.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	admin user	admin user	2023-09-27 16:25:19.432513	2024-02-12 09:25:11.776268
\.


--
-- Data for Name: colleges; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.colleges (id, college_name, background, mission, vision, overview, headquarter, sub_city, state, region, zone, worda, city, country, phone_number, alternative_phone_number, email, facebook_handle, twitter_handle, instagram_handle, map_embed, created_by, last_updated_by, created_at, updated_at) FROM stdin;
87ec19e2-c209-4c85-9c4e-7709322a3c37	Premier College												ET								admin user	\N	2023-09-29 07:50:53.528878	2023-09-29 07:50:53.528878
\.


--
-- Data for Name: course_assessments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.course_assessments (id, curriculums_id, weight, assessment, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: course_exemptions; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.course_exemptions (id, course_id, letter_grade, credit_hour, course_taken, exemption_approval, exemption_type, exemptible_type, exemptible_id, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: course_instructors; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.course_instructors (id, admin_user_id, course_id, academic_calendar_id, section_id, semester, year, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: course_modules; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.course_modules (id, module_title, department_id, module_code, overview, description, created_by, last_updated_by, created_at, updated_at) FROM stdin;
2bec9941-8fec-4796-875a-8e3e7af99248	Master of Project Management Major Courses	731d56ee-1d17-4d38-ab8a-7ae6b76f7be2	MPM Major			admin user	\N	2023-09-29 07:45:11.677612	2023-09-29 07:45:11.677612
183b630f-9147-483d-b0dd-61528a6eb7f0	Master of Project Management Minor Courses	731d56ee-1d17-4d38-ab8a-7ae6b76f7be2	MPM Minor			admin user	\N	2023-09-29 07:45:38.956813	2023-09-29 07:45:38.956813
a0045ae9-543c-4623-b483-a295e61a2828	Master of Leadership Major Courses	674c081a-0f1f-48a4-b83a-8813e262d683	MOL Major			admin user	\N	2023-09-29 07:48:03.873648	2023-09-29 07:48:03.873648
e05d8953-c1f7-4b90-9207-25f6d51cd6b6	Master of Leadership Minor Courses	674c081a-0f1f-48a4-b83a-8813e262d683	MOL Minor			admin user	\N	2023-09-29 07:48:38.502484	2023-09-29 07:48:38.502484
48faf452-6200-4e8f-a9e9-e8cb184a4c7e	Master of Business Administration Major Courses	3fff3bd6-3f75-4427-8ba2-54ca46d85208	MBA Major			admin user	\N	2023-09-29 07:49:34.548815	2023-09-29 07:49:34.548815
e870a901-ef0b-4c07-a1b3-e04b8383120d	Master of Business Administration Minor Courses	3fff3bd6-3f75-4427-8ba2-54ca46d85208	MBA Minor			admin user	\N	2023-09-29 07:50:13.472595	2023-09-29 07:50:13.472595
752d9bb0-bbb4-42a4-92fd-f3e2408d5242	Graduate Admission Test (GAT) Preparation Course	c405e5fc-090d-433d-a0ac-3ccaf12558e5	GAT 101			SystemAdmin IT	SystemAdmin IT	2024-04-24 19:54:16.278489	2024-04-25 07:08:56.112763
\.


--
-- Data for Name: course_registrations; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.course_registrations (id, student_id, program_id, semester_registration_id, department_id, course_id, academic_calendar_id, section_id, semester, year, student_full_name, enrollment_status, course_title, created_by, updated_by, created_at, updated_at, academic_year) FROM stdin;
eb1c329f-3fb7-4753-9bb2-ef847345374e	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	ecf5e58a-4025-46c9-bb93-88d59f373026	27c5bea1-4c6e-4271-8d59-6dd67a0b314b	c405e5fc-090d-433d-a0ac-3ccaf12558e5	6d259c59-34b8-41aa-ad35-3859e398f976	cb7580a8-512f-4c01-a001-aa652a64f987	\N	1	1	AAA AAA AA	enrolled	Graduate Admission Test (GAT) Preparation Course	\N	\N	2024-05-10 07:59:24.847365	2024-05-10 08:10:30.541869	2024
7e5cdabc-173a-48c7-90ce-1606f94468cf	b1bb9c90-ac46-4997-a5dc-81b1711599e1	6a06ef33-0886-4c00-b746-c28264904f9a	bdb68061-0151-4736-9381-5ceadd4d7b8b	674c081a-0f1f-48a4-b83a-8813e262d683	4d344ee6-699c-4890-bfd4-1a5245967b5f	a9852e43-8136-4f4a-aba5-261c6068c3fb	\N	1	1	WONDIMU BIRATU  KENEA	pending	Advanced Research Methodology	regi reg	\N	2024-01-30 07:24:06.996327	2024-01-30 07:24:06.996327	2024
adf02439-9829-4b51-9d79-341d33a1ab72	b1bb9c90-ac46-4997-a5dc-81b1711599e1	6a06ef33-0886-4c00-b746-c28264904f9a	bdb68061-0151-4736-9381-5ceadd4d7b8b	674c081a-0f1f-48a4-b83a-8813e262d683	68f01a66-2b97-4379-9c87-3d62eee34f77	a9852e43-8136-4f4a-aba5-261c6068c3fb	\N	1	1	WONDIMU BIRATU  KENEA	pending	Fundamentals of Leadership: Theories and Practices	regi reg	\N	2024-01-30 07:24:06.996327	2024-01-30 07:24:06.996327	2024
fd03d108-cb9c-48c8-9ecb-7f35dd73a2f8	b1bb9c90-ac46-4997-a5dc-81b1711599e1	6a06ef33-0886-4c00-b746-c28264904f9a	bdb68061-0151-4736-9381-5ceadd4d7b8b	674c081a-0f1f-48a4-b83a-8813e262d683	765aa33f-f6a7-4f78-ad20-24f8c1dd4ba1	a9852e43-8136-4f4a-aba5-261c6068c3fb	\N	1	1	WONDIMU BIRATU  KENEA	pending	Human Resource Management	regi reg	\N	2024-01-30 07:24:06.996327	2024-01-30 07:24:06.996327	2024
224c5a3c-44b7-4dff-8693-60938e6ac17c	b1bb9c90-ac46-4997-a5dc-81b1711599e1	6a06ef33-0886-4c00-b746-c28264904f9a	bdb68061-0151-4736-9381-5ceadd4d7b8b	674c081a-0f1f-48a4-b83a-8813e262d683	22daa408-10e6-47b3-a3b1-f82a893ea536	a9852e43-8136-4f4a-aba5-261c6068c3fb	\N	1	1	WONDIMU BIRATU  KENEA	pending	Fundamentals of Project Management	regi reg	\N	2024-01-30 07:24:06.996327	2024-01-30 07:24:06.996327	2024
b9818e5f-df13-42e8-aa1c-4d38ae25cd24	b1bb9c90-ac46-4997-a5dc-81b1711599e1	6a06ef33-0886-4c00-b746-c28264904f9a	bdb68061-0151-4736-9381-5ceadd4d7b8b	674c081a-0f1f-48a4-b83a-8813e262d683	17e3ecc7-111d-4968-80a0-d96c1693c5fb	a9852e43-8136-4f4a-aba5-261c6068c3fb	\N	1	1	WONDIMU BIRATU  KENEA	pending	Organizational Behavior and Development	regi reg	\N	2024-01-30 07:24:06.996327	2024-01-30 07:24:06.996327	2024
\.


--
-- Data for Name: course_sections; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.course_sections (id, section_short_name, section_full_name, course_id, course_title, program_name, total_capacity, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.courses (id, course_module_id, curriculum_id, program_id, course_title, course_code, course_description, year, semester, course_starting_date, course_ending_date, credit_hour, lecture_hour, lab_hour, ects, created_by, last_updated_by, created_at, updated_at, major) FROM stdin;
3f883ada-2020-4f3d-bac1-17aa7bde7553	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	 Project Procurement and Logistics Management	MPM-652		1	2	2023-09-29 11:42:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:42:29.407897	2023-10-10 06:51:42.73637	t
eb8dba45-4bc6-4ac4-8c82-1bc39f9becfd	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	 Organizational Behavior 	MPM-632		1	2	2023-09-29 11:40:00	\N	3	3	0	1	admin user	\N	2023-09-29 08:41:04.688157	2023-10-10 06:52:26.976109	t
f291cccb-6bfe-4db2-a0d1-65aa2c4855f0	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Advanced Research Methodology	MPM-621		1	1	2023-09-29 11:36:00	\N	3	3	0	1	admin user	\N	2023-09-29 08:21:52.165817	2023-10-02 12:34:22.608207	t
9b6949c4-5432-4b8d-a8f8-60df6c11b888	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Thesis in Project Management	MPM-752		2	2	2023-09-29 14:09:00	\N	6	2	0	1	admin user	\N	2023-09-29 11:10:06.18349	2023-10-10 06:54:26.897216	t
e97ce222-f612-46da-b781-47d7ffaf9d83	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Financial and Managerial Accounting 	MPM-642		1	2	2023-09-29 11:39:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:39:09.796806	2023-10-10 06:53:12.015357	t
6d0d2d09-19da-4339-a7f3-e2c31f8fc115	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	 Project Monitoring and Evaluation	MPM-721		2	1	2023-09-29 11:46:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:46:50.107055	2023-10-10 06:55:03.173476	t
066af00a-cf62-41e3-ae93-6f1f2e70928c	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Management Theories and Practices	MPM-611		1	1	2023-09-29 11:35:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:10:38.387072	2023-10-02 12:33:42.567012	f
012e9577-aa09-48e7-8a9f-1b88b9ee3dfb	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Human Resources Management	MPM-631		1	1	2023-09-29 11:34:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:25:41.947545	2023-10-02 12:35:00.304123	t
4d344ee6-699c-4890-bfd4-1a5245967b5f	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Advanced Research Methodology	MOL-621		1	1	2023-10-17 15:38:00	\N	3	2	0	2	admin user	\N	2023-10-13 06:51:28.09126	2023-10-17 12:38:31.523204	t
68f01a66-2b97-4379-9c87-3d62eee34f77	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Fundamentals of Leadership: Theories and Practices	MOL-611 		1	1	2023-10-17 15:39:00	\N	2	2	0	2	admin user	\N	2023-10-13 06:50:16.506666	2023-10-17 12:39:21.725184	t
eb4936d9-8e53-477b-ac83-a664466d7f08	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Finance for Leadership	MOL-622 		1	2	2023-10-17 10:36:00	\N	2	2	0	2	admin user	\N	2023-10-13 06:58:24.378244	2023-10-17 07:36:25.93935	t
a948bbde-df15-474a-bb57-e986bfc7ed27	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Information Systems for Leadership	MOL-642 		1	2	2023-10-17 10:37:00	\N	2	2	0	2	admin user	\N	2023-10-13 07:00:51.005275	2023-10-17 07:37:46.760503	t
9a42151a-4ad8-4e5a-9ddb-7021ab1da3fb	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Operations Management	MOL-612		1	2	2023-10-17 10:38:00	\N	3	2	0	2	admin user	\N	2023-10-13 06:56:49.806291	2023-10-17 07:38:39.751512	t
765aa33f-f6a7-4f78-ad20-24f8c1dd4ba1	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Human Resource Management	MOL-641		1	1	2023-10-17 10:40:00	\N	3	2	0	2	admin user	\N	2023-10-13 06:53:45.546024	2023-10-17 07:40:26.918673	t
22daa408-10e6-47b3-a3b1-f82a893ea536	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Fundamentals of Project Management	MOL-631 		1	1	2023-10-17 10:41:00	\N	2	2	0	2	admin user	\N	2023-10-13 06:52:39.81242	2023-10-17 07:41:12.119514	t
17e3ecc7-111d-4968-80a0-d96c1693c5fb	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Organizational Behavior and Development	MOL-651		1	1	2023-10-17 10:41:00	\N	2	2	0	2	admin user	\N	2023-10-13 06:55:03.097349	2023-10-17 07:41:36.89248	t
7e92c6fa-677c-4935-860d-af7c35da12c6	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	MOL Thesis	MOL-712		2	2	2023-10-17 15:36:00	\N	6	2	0	2	admin user	\N	2023-10-13 07:07:35.413492	2023-10-17 12:36:23.623364	t
25b5bf9e-727a-41da-86ed-d258097e5ee3	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Global Leadership	MOL-632 		1	2	2023-10-17 15:37:00	\N	2	2	0	2	admin user	\N	2023-10-13 06:59:45.359223	2023-10-17 12:37:55.647625	t
6d259c59-34b8-41aa-ad35-3859e398f976	752d9bb0-bbb4-42a4-92fd-f3e2408d5242	bf7e5894-3d37-497a-91ca-6aa346aa6d82	ecf5e58a-4025-46c9-bb93-88d59f373026	Graduate Admission Test (GAT) Preparation Course	GAT 101		1	1	\N	\N	1	3	0	2	SystemAdmin IT	\N	2024-04-25 06:46:47.791388	2024-04-25 06:46:47.791388	f
ee80c01e-21ed-4ce0-8546-0617a9ad071e	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	 Fundamentals of Project Management	MPM-641		1	1	2023-09-29 11:36:00	\N	3	3	0	1	admin user	\N	2023-09-29 08:26:55.277909	2023-10-02 12:35:38.29179	t
e1bad14f-fbd3-43f3-b5cc-f84943a13b61	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Project Management Tools and Techniques	MPM-731		2	1	2023-09-29 11:48:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:48:11.548307	2023-10-10 06:53:50.889774	t
0db9b2eb-5edf-408c-bf28-a445d23f89ad	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Project Planning and Scheduling	MPM-612		1	2	2023-09-29 11:35:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:30:25.148593	2023-10-10 06:48:39.035657	t
fb43606d-6db8-4fad-a742-b459dd90eb71	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Thesis Proposal in Project Management	MPM-751		2	1	2023-09-29 14:07:00	\N	1	1	0	1	admin user	\N	2023-09-29 11:08:08.692695	2023-10-10 06:49:17.314868	t
ee0d5867-0b43-42f1-8787-c98ee3b75059	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	 Project Quality and Risk Management	MPM-622		1	2	2023-09-29 11:35:00	\N	3	3	0	1	admin user	\N	2023-09-29 08:32:43.327968	2023-10-10 06:50:30.617552	t
67a5dba0-7fff-479e-9ca0-945553aa89e5	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	 Strategic Management	MPM-741		2	1	2023-09-29 11:49:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:49:23.8665	2023-10-10 06:56:01.862807	t
b89041d9-89bf-4161-b506-069078869b28	2bec9941-8fec-4796-875a-8e3e7af99248	75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	Project Cost Management	MPM-711		2	1	2023-09-29 11:43:00	\N	2	2	0	1	admin user	\N	2023-09-29 08:43:48.637676	2023-10-10 06:57:25.545806	t
ab585849-3ed6-42b1-bd55-7b13d8bc800a	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	MOL Thesis Proposal	MOL-741 		2	1	2023-10-17 10:37:00	\N	1	2	0	2	admin user	\N	2023-10-13 07:06:11.593556	2023-10-17 07:37:06.158189	t
8c17a51d-6acd-40d5-9af2-518c3a4569ce	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Leading Change and Innovation	MOL-711		2	1	2023-10-17 10:39:00	\N	3	2	0	2	admin user	\N	2023-10-13 07:02:21.717305	2023-10-17 07:39:23.34354	t
5a7995b5-288a-41c6-8017-3e58fc91e275	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Strategic Leadership	MOL-731		2	1	2023-10-17 15:36:00	\N	2	2	0	2	admin user	\N	2023-10-13 07:04:46.290612	2023-10-17 12:36:56.512422	t
77001280-ba97-4509-b5d6-95a9fd099c64	a0045ae9-543c-4623-b483-a295e61a2828	5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	Leadership Ethics and Governance	MOL-721		2	1	2023-10-17 15:37:00	\N	3	2	0	2	admin user	\N	2023-10-13 07:03:43.655315	2023-10-17 12:37:26.059833	t
f03f3c54-4973-42d0-bc9b-0daf05189fff	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Organizational Behavior 	MBA-612		1	2	2023-09-30 10:04:00	\N	3	2	0	1	admin user	\N	2023-09-30 07:04:22.225794	2023-10-10 06:25:49.047624	t
7e950b19-c03d-42df-ba2f-d1a0177d83d5	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Management Theories and Practices	MBA-611		1	1	2023-09-30 09:54:00	\N	2	2	0	1	admin user	\N	2023-09-30 06:54:19.292466	2023-10-09 06:24:21.313014	t
8ba729ab-3b61-4d6b-9e8a-2cb445e3fa5a	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Advanced Research Methodology	MBA-621		1	1	2023-09-30 09:56:00	\N	3	3	0	1	admin user	\N	2023-09-30 06:56:59.244127	2023-10-09 06:26:40.926384	t
55b57b7b-147c-42c3-a5ad-08d8b369e666	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	Quantitative Analysis for Management Decisions	MBA-631		1	1	2023-09-30 09:59:00	\N	3	3	0	1	admin user	\N	2023-09-30 06:59:41.773204	2023-10-09 06:27:20.851912	t
57233289-afdc-4a4f-9d46-a3829d6aafbc	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Marketing Management	MBA-641		1	1	2023-09-30 10:00:00	\N	2	2	0	1	admin user	\N	2023-09-30 07:01:06.370695	2023-10-09 06:28:08.223354	t
5221644c-1217-4600-ad59-bf912a7b00f7	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Management Information Systems 	MBA-651		1	1	2023-09-30 10:02:00	\N	2	2	0	1	admin user	\N	2023-09-30 07:02:20.052346	2023-10-09 06:28:51.175036	t
929f6dc5-36b5-4cfd-92c4-10c1e57f51b9	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Financial and Managerial Accounting	MBA-622		1	2	2023-09-30 10:07:00	\N	2	2	0	1	admin user	\N	2023-09-30 07:07:26.619771	2023-10-10 06:26:37.930221	t
60ec461f-1dde-4866-b75f-e31b813f01ee	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Human Resource Management	MBA-632		1	2	2023-09-30 10:10:00	\N	2	2	0	1	admin user	\N	2023-09-30 07:11:01.754764	2023-10-10 06:27:31.831625	t
9eafd33c-3776-4b78-84a3-8a9024c1d97d	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Project Management 	MBA-642		1	2	2023-09-30 10:12:00	\N	2	2	0	1	admin user	\N	2023-09-30 07:12:09.55559	2023-10-10 06:29:30.862365	t
b003feaa-48be-4ce5-8a56-1ecaf69bc4dd	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Operations Management	MBA-652		1	2	2023-09-30 10:13:00	\N	3	3	0	1	admin user	\N	2023-09-30 07:13:22.698654	2023-10-10 06:30:12.085407	t
b8bd9b88-5442-47e2-8348-30c18472516b	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Financial Management	MBA-711		2	1	2023-09-30 10:14:00	\N	2	2	0	1	admin user	\N	2023-09-30 07:14:48.192021	2023-10-10 06:30:51.614535	t
491de79c-c81d-4573-8f93-830c7c665278	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Managerial Economics	MBA-721		2	1	2023-09-30 10:15:00	\N	2	2	0	1	admin user	\N	2023-09-30 07:15:53.827757	2023-10-10 06:31:38.857271	t
f42d4758-31cc-4f7a-9d75-3639762cc617	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 Strategic Management	MBA-731		2	1	2023-09-30 10:16:00	\N	2	2	0	1	admin user	\N	2023-09-30 07:16:55.953	2023-10-10 06:32:17.921528	t
cf814b4a-a86d-41d8-8fda-814e34bbaf76	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	 MBA Thesis Proposal	MBA-741		2	1	2023-09-30 10:17:00	\N	1	1	0	1	admin user	\N	2023-09-30 07:18:08.112117	2023-10-10 06:33:03.702014	t
8f44ec36-cc29-45b6-9e1e-e49165598a94	48faf452-6200-4e8f-a9e9-e8cb184a4c7e	a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	MBA Thesis	MBA-742		2	2	2023-09-30 10:19:00	\N	6	3	0	1	admin user	\N	2023-09-30 07:19:15.500749	2023-10-10 06:33:58.161448	t
\.


--
-- Data for Name: curriculums; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.curriculums (id, program_id, curriculum_title, curriculum_version, total_course, total_ects, total_credit_hour, active_status, curriculum_active_date, depreciation_date, created_by, last_updated_by, created_at, updated_at) FROM stdin;
a428e2ef-afb1-4a57-993b-33298520094d	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	MBA 2023/24	2023/24	13	\N	36	active	2023-09-29 11:30:00	\N	admin user	admin user	2023-09-29 08:31:19.231772	2023-09-29 12:58:52.453573
75e08e18-e7b8-4f75-a705-d057675fd41b	887b43d1-e1e2-4741-b63d-6150fa29e022	MPM 2023/24	2023	14	\N	36	active	2023-09-29 11:07:00	\N	admin user	admin user	2023-09-29 08:07:35.790958	2023-09-30 06:15:56.923858
5fe02279-a10e-4467-a585-77c5c7d2bd81	6a06ef33-0886-4c00-b746-c28264904f9a	MOL 2024	2024	14	\N	36	active	2023-09-01 11:45:00	\N	admin user	admin user	2023-09-29 08:45:21.429448	2023-10-17 06:42:34.13637
bf7e5894-3d37-497a-91ca-6aa346aa6d82	ecf5e58a-4025-46c9-bb93-88d59f373026	Graduate Admission Test (GAT) Preparation Course	2024/25	\N	\N	\N	active	2024-04-25 09:33:00	\N	SystemAdmin IT	SystemAdmin IT	2024-04-25 06:33:25.286574	2024-04-25 09:28:14.042582
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.departments (id, faculty_id, department_name, overview, background, facility, location, phone_number, alternative_phone_number, email, facebook_handle, twitter_handle, telegram_handle, instagram_handle, map_embed, created_by, last_updated_by, created_at, updated_at) FROM stdin;
731d56ee-1d17-4d38-ab8a-7ae6b76f7be2	10af429c-4799-4109-8975-e5cd6af54327	Project Management			\N									\N	admin user	admin user	2023-09-29 07:44:28.55465	2023-09-29 13:06:53.5087
674c081a-0f1f-48a4-b83a-8813e262d683	10af429c-4799-4109-8975-e5cd6af54327	Leadership			\N									\N	admin user	admin user	2023-09-29 07:44:03.31772	2023-09-29 13:07:12.48826
3fff3bd6-3f75-4427-8ba2-54ca46d85208	10af429c-4799-4109-8975-e5cd6af54327	Business Administration			\N									\N	admin user	admin user	2023-09-29 07:43:34.956629	2023-09-29 13:07:26.678443
c405e5fc-090d-433d-a0ac-3ccaf12558e5	10af429c-4799-4109-8975-e5cd6af54327	Graduate Admission Test 			\N									\N	SystemAdmin IT	SystemAdmin IT	2024-04-24 19:49:27.915297	2024-04-25 07:12:29.997144
\.


--
-- Data for Name: emergency_contacts; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.emergency_contacts (id, student_id, full_name, relationship, cell_phone, email, current_occupation, name_of_current_employer, pobox, email_of_employer, office_phone_number, created_by, last_updated_by, created_at, updated_at) FROM stdin;
430c94c9-a0da-4f00-a74b-cbf1829d50a7	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	ss	Sister	0922454415							self	\N	2024-05-10 07:58:52.987951	2024-05-10 07:59:24.771465
3ae7c249-740f-4bd5-9dd0-97aed21146e6	84721e59-377d-4ca2-837f-57783e30d2d3	Tigist Busheto Buleto	Wife	0903813633	\N	\N	\N	\N	\N	\N	self	\N	2024-01-28 19:54:53.030232	2024-01-28 19:54:53.030232
4a26a90f-5956-4195-8e78-1e48f5c87de2	b1bb9c90-ac46-4997-a5dc-81b1711599e1	Asegedech Mengistu Awoke	Wife	+251911102444							self	\N	2024-01-29 06:09:42.720583	2024-01-30 07:16:39.907693
\.


--
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.faculties (id, faculty_name, overview, background, location, phone_number, alternative_phone_number, email, facebook_handle, twitter_handle, telegram_handle, instagram_handle, map_embed, created_by, last_updated_by, created_at, updated_at) FROM stdin;
10af429c-4799-4109-8975-e5cd6af54327	Faculty of Business and Economics											\N	admin user	\N	2023-09-29 07:42:55.064278	2023-09-29 07:42:55.064278
\.


--
-- Data for Name: grade_changes; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.grade_changes (id, academic_calendar_id, program_id, department_id, student_id, course_id, section_id, course_registration_id, student_grade_id, assessment_id, semester, year, add_mark, previous_result_total, previous_letter_grade, current_result_total, current_letter_grade, reason, instructor_approval, instructor_name, instructor_date_of_response, registrar_approval, registrar_name, registrar_date_of_response, dean_approval, dean_name, dean_date_of_response, department_approval, department_head_name, department_head_date_of_response, academic_affair_approval, academic_affair_name, academic_affair_date_of_response, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: grade_reports; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.grade_reports (id, semester_registration_id, student_id, academic_calendar_id, program_id, department_id, section_id, admission_type, study_level, total_course, total_credit_hour, total_grade_point, cumulative_total_credit_hour, cumulative_total_grade_point, cgpa, sgpa, semester, year, academic_status, registrar_approval, registrar_name, dean_approval, dean_name, department_approval, department_head_name, updated_by, created_by, created_at, updated_at) FROM stdin;
7bbbbaba-6a7d-4a83-becc-8b87b333d026	bdb68061-0151-4736-9381-5ceadd4d7b8b	b1bb9c90-ac46-4997-a5dc-81b1711599e1	a9852e43-8136-4f4a-aba5-261c6068c3fb	6a06ef33-0886-4c00-b746-c28264904f9a	674c081a-0f1f-48a4-b83a-8813e262d683	\N	online	graduate	5	0.0	0.0	0.0	0.0	0.0	0.0	1	1	Academic Dismissal	pending	\N	approved	\N	pending	\N	\N	regi reg	2024-05-09 06:52:23.473241	2024-05-09 06:52:23.473241
012bf5cf-e863-4722-a832-d36310a05c2d	27c5bea1-4c6e-4271-8d59-6dd67a0b314b	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	cb7580a8-512f-4c01-a001-aa652a64f987	ecf5e58a-4025-46c9-bb93-88d59f373026	c405e5fc-090d-433d-a0ac-3ccaf12558e5	\N	online	graduate	1	0.0	0.0	0.0	0.0	0.0	0.0	1	1	Academic Dismissal	pending	\N	approved	\N	pending	\N	\N	\N	2024-05-10 08:00:05.353865	2024-05-10 08:00:05.353865
\.


--
-- Data for Name: grade_rules; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.grade_rules (id, admission_type, study_level, min_cgpa_value_to_pass, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: grade_systems; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.grade_systems (id, program_id, curriculum_id, min_cgpa_value_to_pass, min_cgpa_value_to_graduate, remark, created_by, updated_by, created_at, updated_at) FROM stdin;
517917c8-746d-458e-b867-fcc3ad9e9fcf	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	a428e2ef-afb1-4a57-993b-33298520094d	2.75	3.0		\N	\N	2023-10-03 07:07:22.692245	2023-10-03 07:07:22.692245
fa4ab394-8f82-41b8-94be-3fe80cdb9635	887b43d1-e1e2-4741-b63d-6150fa29e022	75e08e18-e7b8-4f75-a705-d057675fd41b	2.75	3.0		\N	\N	2023-10-03 07:28:17.760914	2023-10-03 07:28:17.760914
e8f203e5-331b-4723-b4fa-8b1b51e474ad	6a06ef33-0886-4c00-b746-c28264904f9a	5fe02279-a10e-4467-a585-77c5c7d2bd81	2.75	3.0		\N	\N	2023-10-03 07:38:07.69226	2023-10-03 07:38:07.69226
\.


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.grades (id, grade_system_id, letter_grade, grade_point, min_row_mark, max_row_mark, updated_by, created_by, created_at, updated_at) FROM stdin;
3337b334-49b2-4de7-a6c9-68c06dd746bb	517917c8-746d-458e-b867-fcc3ad9e9fcf	A+	4.0	90	100	\N	\N	2023-10-03 07:07:22.693632	2023-10-03 07:07:22.693632
581351c6-0ad2-45d8-8084-8575784d7f8f	517917c8-746d-458e-b867-fcc3ad9e9fcf	A-	3.75	80	84	\N	\N	2023-10-03 07:07:22.694889	2023-10-03 07:07:22.694889
d457c94f-a32c-4b7a-bf41-3844c66ff797	517917c8-746d-458e-b867-fcc3ad9e9fcf	A	4.0	85	89	\N	\N	2023-10-03 07:07:22.694392	2023-10-03 07:08:31.912195
1d4ae361-5c36-49ec-936f-fce20d4de0d5	517917c8-746d-458e-b867-fcc3ad9e9fcf	B+	3.5	75	79	\N	\N	2023-10-03 07:10:23.627094	2023-10-03 07:10:23.627094
0184524c-54d5-4cc6-bdd2-5598063cde48	517917c8-746d-458e-b867-fcc3ad9e9fcf	B	3.0	70	74	\N	\N	2023-10-03 07:11:36.115815	2023-10-03 07:11:36.115815
9940e3f4-df98-4f01-8431-c0d37237ba01	517917c8-746d-458e-b867-fcc3ad9e9fcf	B-	2.75	65	69	\N	\N	2023-10-03 07:13:13.225345	2023-10-03 07:13:13.225345
1651accf-042e-4def-968a-f24a13d2a45b	517917c8-746d-458e-b867-fcc3ad9e9fcf	C+	2.5	60	64	\N	\N	2023-10-03 07:15:33.647626	2023-10-03 07:15:33.647626
50c65fef-a20d-448b-81db-c01301e39350	517917c8-746d-458e-b867-fcc3ad9e9fcf	C	2.0	50	59	\N	\N	2023-10-03 07:18:54.422069	2023-10-03 07:18:54.422069
8fc150e6-ce55-4b54-9356-2daa48e5cf94	517917c8-746d-458e-b867-fcc3ad9e9fcf	C-	1.75	45	49	\N	\N	2023-10-03 07:18:54.422892	2023-10-03 07:18:54.422892
6b70c0c1-5a74-44db-897e-7b724113dc4b	517917c8-746d-458e-b867-fcc3ad9e9fcf	D	1.0	40	44	\N	\N	2023-10-03 07:20:58.748269	2023-10-03 07:20:58.748269
5a8eccde-adf5-4497-a3a8-a040720b564e	517917c8-746d-458e-b867-fcc3ad9e9fcf	F	0.0	0	39	\N	\N	2023-10-03 07:23:44.118404	2023-10-03 07:23:44.118404
7c1fb4ce-0ea3-4bd4-97e9-3fe2f97eb4b4	fa4ab394-8f82-41b8-94be-3fe80cdb9635	A+	4.0	90	100	\N	\N	2023-10-03 07:28:17.762301	2023-10-03 07:28:17.762301
90a80800-6569-44e9-84d0-ed3920a49cbf	fa4ab394-8f82-41b8-94be-3fe80cdb9635	A	4.0	85	89	\N	\N	2023-10-03 07:28:17.763801	2023-10-03 07:28:17.763801
c885a773-f0b6-4a90-a648-f4249ea76e69	fa4ab394-8f82-41b8-94be-3fe80cdb9635	A-	3.75	80	84	\N	\N	2023-10-03 07:29:50.205206	2023-10-03 07:29:50.205206
fb70650b-de5c-4b36-918b-7f1163fcabf7	fa4ab394-8f82-41b8-94be-3fe80cdb9635	B+	3.5	75	79	\N	\N	2023-10-03 07:29:50.206525	2023-10-03 07:29:50.206525
8bd4d4c0-7008-4950-8090-3d045ff994b5	fa4ab394-8f82-41b8-94be-3fe80cdb9635	B	3.0	70	74	\N	\N	2023-10-03 07:33:10.950523	2023-10-03 07:33:10.950523
ff217fd0-b19e-45b8-b55a-7fbdb305bd8d	fa4ab394-8f82-41b8-94be-3fe80cdb9635	B-	2.75	65	69	\N	\N	2023-10-03 07:33:10.951358	2023-10-03 07:33:10.951358
bd7e7c7c-8545-491d-87df-d2844d2f86f5	fa4ab394-8f82-41b8-94be-3fe80cdb9635	C+	2.5	60	64	\N	\N	2023-10-03 07:33:10.952125	2023-10-03 07:33:10.952125
e3a454df-a4f6-46d7-94d4-45d2e0ceeeb6	fa4ab394-8f82-41b8-94be-3fe80cdb9635	C	2.0	50	59	\N	\N	2023-10-03 07:33:10.952854	2023-10-03 07:33:10.952854
3f3641b1-9507-4983-a9b6-06960b86e567	fa4ab394-8f82-41b8-94be-3fe80cdb9635	C-	1.75	45	49	\N	\N	2023-10-03 07:33:10.953393	2023-10-03 07:33:10.953393
e8a8b56c-3a03-4fd4-b579-9f6e4329c290	fa4ab394-8f82-41b8-94be-3fe80cdb9635	D	1.0	40	44	\N	\N	2023-10-03 07:35:25.205788	2023-10-03 07:35:25.205788
aef8eeb9-77d8-4acc-929e-ba2f736cfb47	fa4ab394-8f82-41b8-94be-3fe80cdb9635	F	0.0	0	39	\N	\N	2023-10-03 07:35:25.206557	2023-10-03 07:35:25.206557
81d85559-3d18-47ae-aedf-b9f3de167e0d	e8f203e5-331b-4723-b4fa-8b1b51e474ad	A+	4.0	90	100	\N	\N	2023-10-03 07:38:07.693605	2023-10-03 07:38:07.693605
aa8327f8-a679-4a84-b9a0-e95934783924	e8f203e5-331b-4723-b4fa-8b1b51e474ad	A	4.0	89	85	\N	\N	2023-10-03 07:38:07.694602	2023-10-03 07:38:07.694602
677b3e51-bd01-4076-b9e8-b989f2fdd7f1	e8f203e5-331b-4723-b4fa-8b1b51e474ad	A-	3.75	80	84	\N	\N	2023-10-03 07:38:07.695468	2023-10-03 07:38:07.695468
19b412d4-7a6b-437d-a924-b1b0d7abbe76	e8f203e5-331b-4723-b4fa-8b1b51e474ad	B+	3.5	75	79	\N	\N	2023-10-03 07:43:11.89431	2023-10-03 07:43:11.89431
eae7510f-e720-4a68-a104-3ecd6c04bb2b	e8f203e5-331b-4723-b4fa-8b1b51e474ad	B	3.0	70	74	\N	\N	2023-10-03 07:43:11.895119	2023-10-03 07:43:11.895119
b64ae21c-0f8b-4716-95f2-40ed2a6fbde2	e8f203e5-331b-4723-b4fa-8b1b51e474ad	B-	2.75	65	69	\N	\N	2023-10-03 07:43:11.895804	2023-10-03 07:43:11.895804
a1ab0281-de68-4b45-8cbb-cf74289a7a4b	e8f203e5-331b-4723-b4fa-8b1b51e474ad	C+	2.5	60	64	\N	\N	2023-10-03 07:43:11.896495	2023-10-03 07:43:11.896495
cd7b8bd7-7c38-49a2-994f-63990d7c70b8	e8f203e5-331b-4723-b4fa-8b1b51e474ad	C	2.0	50	59	\N	\N	2023-10-03 07:43:11.8971	2023-10-03 07:43:11.8971
3c0c3f56-e8d8-499b-adda-ea4172f861b0	e8f203e5-331b-4723-b4fa-8b1b51e474ad	C-	1.75	45	49	\N	\N	2023-10-03 07:43:11.897615	2023-10-03 07:43:11.897615
07464dfa-2b90-48a8-83d9-b68b25cc5c1b	e8f203e5-331b-4723-b4fa-8b1b51e474ad	D	1.0	40	44	\N	\N	2023-10-03 07:44:08.927419	2023-10-03 07:44:08.927419
482e0209-b7ad-43e5-a301-78c891fc1026	e8f203e5-331b-4723-b4fa-8b1b51e474ad	F	0.0	0	39	\N	\N	2023-10-03 07:44:54.612609	2023-10-03 07:44:54.612609
\.


--
-- Data for Name: invoice_items; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.invoice_items (id, itemable_type, itemable_id, course_registration_id, course_id, item_title, price, last_updated_by, created_by, created_at, updated_at) FROM stdin;
dfd98505-399c-49be-98aa-a6edde19780a	Invoice	9eb87263-a35f-4446-9d9b-fffbd81689f0	eb1c329f-3fb7-4753-9bb2-ef847345374e	6d259c59-34b8-41aa-ad35-3859e398f976	\N	500.0	\N	\N	2024-05-10 08:01:16.571752	2024-05-10 08:01:16.571752
\.


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.invoices (id, semester_registration_id, student_id, academic_calendar_id, department_id, program_id, semester, year, student_full_name, student_id_number, invoice_number, total_price, registration_fee, late_registration_fee, invoice_status, last_updated_by, created_by, due_date, created_at, updated_at) FROM stdin;
9eb87263-a35f-4446-9d9b-fffbd81689f0	27c5bea1-4c6e-4271-8d59-6dd67a0b314b	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	cb7580a8-512f-4c01-a001-aa652a64f987	c405e5fc-090d-433d-a0ac-3ccaf12558e5	ecf5e58a-4025-46c9-bb93-88d59f373026	1	1	AAA AAA AA	GAT 101/3796/24	6111063	500.0	0.0	0.0	approved	SystemAdmin IT	\N	2024-05-20 07:59:24.77597	2024-05-10 08:01:16.566796	2024-05-10 08:02:15.498073
\.


--
-- Data for Name: makeup_exams; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.makeup_exams (id, academic_calendar_id, program_id, department_id, student_id, course_id, section_id, course_registration_id, student_grade_id, assessment_id, semester, year, add_mark, previous_result_total, previous_letter_grade, current_result_total, current_letter_grade, reason, instructor_approval, instructor_name, instructor_date_of_response, registrar_approval, registrar_name, registrar_date_of_response, dean_approval, dean_name, dean_date_of_response, department_approval, department_head_name, department_head_date_of_response, academic_affair_approval, academic_affair_name, academic_affair_date_of_response, status, updated_by, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: other_payments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.other_payments (id, student_id, academic_calendar_id, semester_registration_id, department_id, program_id, section_id, semester, year, student_full_name, student_id_number, invoice_number, total_price, invoice_status, payment_type, payable_type, payable_id, due_date, last_updated_by, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: payment_methods; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.payment_methods (id, bank_name, account_full_name, account_number, phone_number, account_type, payment_method_type, last_updated_by, created_by, created_at, updated_at) FROM stdin;
f7915c6b-a801-4146-a37e-10144e6b7ef2	Cooperative Bank of Oromia	Premier College	1007000103967	0911803339	saving	bank	admin user	admin user	2023-10-20 11:30:18.001018	2024-01-26 14:28:39.284645
b3b5eb18-5032-401a-b7f6-c3b2fd8fde3c	Bank of Abyssinia	Premier College	107426892	0911803339	saving	bank	admin user	admin user	2023-10-20 11:32:14.604917	2024-01-26 14:29:40.922505
259b136e-3d77-4062-8e10-8aa03d4a5361	CBE	Premier College	1000492455966	0911803339	current	bank	admin user	admin user	2023-09-27 16:31:45.758226	2024-01-26 14:31:38.224944
\.


--
-- Data for Name: payment_transactions; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.payment_transactions (id, invoiceable_type, invoiceable_id, payment_method_id, account_holder_fullname, phone_number, account_number, transaction_reference, finance_approval_status, last_updated_by, created_by, created_at, updated_at) FROM stdin;
86641935-5370-48c1-95ab-2a3525a8cd59	Invoice	a9e235c2-a644-455d-bc25-9fee30ba69ec	259b136e-3d77-4062-8e10-8aa03d4a5361	Abebe Mulat Tadesse	0943129901	1000	3232	approved	SystemAdmin IT	\N	2024-05-09 07:01:24.166725	2024-05-09 07:02:55.595101
22e2f25c-bea1-4b96-badd-28df5da73904	Invoice	9eb87263-a35f-4446-9d9b-fffbd81689f0	259b136e-3d77-4062-8e10-8aa03d4a5361	abebeche belay	0909090909	5666767	1234	approved	SystemAdmin IT	\N	2024-05-10 08:01:32.606395	2024-05-10 08:02:15.499829
ab305f94-e96f-4582-bd00-9185980680de	Invoice	7ee3a9ca-42ef-434b-92da-682cce4cf412	259b136e-3d77-4062-8e10-8aa03d4a5361	Abebe Mulat Tadesse	0943129901	1000	3232	approved	Seada  Abdelhedi	\N	2024-04-25 05:36:26.552141	2024-04-25 05:45:21.235932
42a50399-7bb2-448d-bd35-d2ebc1794e05	Invoice	556b3d81-0abc-47d9-86de-14d7c46fecf0	259b136e-3d77-4062-8e10-8aa03d4a5361	Abebe Mulat Tadesse	0943129901	1000	3232	pending	\N	\N	2024-05-02 07:49:15.89792	2024-05-02 07:49:15.908063
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.payments (id, program_id, version, student_nationality, total_fee, registration_fee, late_registration_fee, starting_penalty_fee, daily_penalty_fee, makeup_exam_fee, add_drop, tution_per_credit_hr, readmission, reissuance_of_grade_report, student_copy, additional_student_copy, tempo, original_certificate, original_certificate_replacement, tempo_replacement, letter, student_id_card, student_id_card_replacement, name_change, transfer_fee, other, last_updated_by, created_by, created_at, updated_at) FROM stdin;
50063fa4-f3f3-4be0-afb6-9f79295a0766	752bfa73-23d6-4d9b-9339-c9b988dfe8d7	67021/24	local	36000.0	500.0	0.0	0.0	0.0	0.0	0.0	1000.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	SystemAdmin IT	SystemAdmin IT	2024-04-24 19:37:19.024703	2024-04-25 07:58:39.334899
3a004c71-e287-422d-a564-94e4c807fecc	6a06ef33-0886-4c00-b746-c28264904f9a	47012/24	local	36000.0	500.0	0.0	0.0	0.0	0.0	0.0	1000.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	SystemAdmin IT	admin user	2024-01-22 15:31:53.145886	2024-04-25 07:59:11.462408
306d3a7f-910a-4aa5-867a-23eee764f33d	ecf5e58a-4025-46c9-bb93-88d59f373026	93467/24	local	1500.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	SystemAdmin IT	SystemAdmin IT	2024-04-25 06:58:19.541729	2024-04-25 08:00:17.714242
64165edd-fa07-4e94-b2db-1d127444cf2c	887b43d1-e1e2-4741-b63d-6150fa29e022	95592/24	local	36000.0	500.0	0.0	0.0	0.0	0.0	0.0	1000.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	0.0	SystemAdmin IT	SystemAdmin IT	2024-04-24 19:39:14.002217	2024-04-25 08:25:00.496134
\.


--
-- Data for Name: prerequisites; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.prerequisites (id, course_id, prerequisite_id, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.programs (id, department_id, program_name, program_code, study_level, admission_type, overview, program_description, total_semester, program_duration, program_semester, total_tuition, entrance_exam_requirement_status, created_by, last_updated_by, created_at, updated_at) FROM stdin;
752bfa73-23d6-4d9b-9339-c9b988dfe8d7	3fff3bd6-3f75-4427-8ba2-54ca46d85208	Master of Business Administration	MBA	graduate	online			4	2	2	0.0	f	admin user	admin user	2023-09-29 08:31:19.231043	2023-10-11 09:17:51.863172
6a06ef33-0886-4c00-b746-c28264904f9a	674c081a-0f1f-48a4-b83a-8813e262d683	Master of Leadership	MOL	graduate	online			4	2	2	0.0	f	admin user	admin user	2023-09-29 08:45:21.428795	2023-10-11 13:20:15.557016
887b43d1-e1e2-4741-b63d-6150fa29e022	731d56ee-1d17-4d38-ab8a-7ae6b76f7be2	Master of Project Management 	MPM	graduate	online			4	2	2	0.0	f	admin user	admin user	2023-09-29 08:07:35.788067	2023-10-11 13:20:45.680953
ecf5e58a-4025-46c9-bb93-88d59f373026	c405e5fc-090d-433d-a0ac-3ccaf12558e5	Graduate Admission Test (GAT) Preparation Course	GAT 101	graduate	online			1	1	1	0.0	f	SystemAdmin IT	SystemAdmin IT	2024-04-25 06:33:25.285061	2024-05-09 09:19:58.958357
\.


--
-- Data for Name: recurring_payments; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.recurring_payments (id, semester_registration_id, student_id, academic_calendar_id, department_id, program_id, section_id, semester, year, student_full_name, student_id_number, invoice_number, total_price, penalty, daily_penalty, invoice_status, mode_of_payment, due_date, last_updated_by, created_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.schema_migrations (version) FROM stdin;
20210619065935
20210619065943
20210619065945
20210621093322
20210703083709
20210705082253
20210705082254
20210705110021
20210705113429
20210706060027
20210713184101
20210713200356
20210714060838
20210714085800
20210823171504
20210823174754
20210823180321
20210823192720
20210823203149
20210823215242
20210824022521
20210824023314
20210824023417
20211126003036
20211126003319
20211126003825
20211126004032
20211126004555
20211126004620
20211210023830
20211210060219
20220325124058
20220329120614
20220401001719
20220401050610
20220401050858
20220401051159
20220407065442
20220407065736
20220407070814
20220508174158
20220515102040
20220516143513
20220525151029
20220531013443
20220605154136
20220605162333
20220607070646
20220612204126
20220614112942
20220630074608
20220704090006
20220706155410
20220706164346
20220718104423
20220729014407
20220729021637
20230612095453
20230612095454
20230612095455
20230627115307
20230808113913
20230809134022
20230809194957
20230809201329
20230811213557
20230814205105
20230909104149
20230916094345
20230916155107
20230919181514
\.


--
-- Data for Name: school_or_university_informations; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.school_or_university_informations (id, student_id, college_or_university, phone_number, address, field_of_specialization, cgpa, last_attended_high_school, school_address, grade_10_result, grade_10_exam_taken_year, grade_12_exam_result, grade_12_exam_taken_year, level, coc_attendance_date, created_by, updated_by, created_at, updated_at) FROM stdin;
43d7c540-7182-4354-a2ff-39e47bcb0e2a	84721e59-377d-4ca2-837f-57783e30d2d3	Arba minchi	0912499135	Bonga	Hydrology and meteorology	3.22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2024-01-28 19:54:53.030859	2024-01-28 19:54:53.030859
374ce5ec-1d41-49f0-8449-ed64a1738f81	b1bb9c90-ac46-4997-a5dc-81b1711599e1	Ethiopian Civil Service University	0116463015	Addis Ababa	accounting	3.45			\N	\N	\N	\N		\N	\N	\N	2024-01-29 06:09:42.721104	2024-01-30 07:16:39.908602
cb322e45-f43d-4529-a65c-c0f4afc97ff8	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	ss	0919326838		computer	3.0			\N	\N	\N	\N		\N	\N	\N	2024-05-10 07:58:52.98852	2024-05-10 07:59:24.772173
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.sections (id, program_id, section_short_name, section_full_name, semester, year, total_capacity, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: semester_registrations; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.semester_registrations (id, student_id, program_id, section_id, department_id, student_full_name, student_id_number, program_name, admission_type, study_level, academic_calendar_id, total_price, registration_fee, late_registration_fee, remaining_amount, penalty, mode_of_payment, semester, year, total_enrolled_course, registrar_approval_status, finance_approval_status, last_updated_by, created_by, created_at, updated_at, actual_payment, is_back_invoice_created) FROM stdin;
bdb68061-0151-4736-9381-5ceadd4d7b8b	b1bb9c90-ac46-4997-a5dc-81b1711599e1	6a06ef33-0886-4c00-b746-c28264904f9a	\N	674c081a-0f1f-48a4-b83a-8813e262d683	WONDIMU BIRATU  KENEA	MOL/6995/24	Master of Leadership	online	graduate	a9852e43-8136-4f4a-aba5-261c6068c3fb	0.0	0.0	0.0	0.0	0.0	\N	1	1	\N	pending	pending	\N	regi reg	2024-01-30 07:24:06.926363	2024-01-30 07:24:06.926363	\N	f
27c5bea1-4c6e-4271-8d59-6dd67a0b314b	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	ecf5e58a-4025-46c9-bb93-88d59f373026	\N	c405e5fc-090d-433d-a0ac-3ccaf12558e5	AAA AAA AA	GAT 101/3796/24	Graduate Admission Test (GAT) Preparation Course	online	graduate	cb7580a8-512f-4c01-a001-aa652a64f987	500.0	0.0	0.0	0.0	0.0	Full Semester Payment	1	1	1	approved	approved	\N	\N	2024-05-10 07:59:24.77597	2024-05-10 08:01:16.549411	500.0	f
\.


--
-- Data for Name: semesters; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.semesters (id, academic_calendar_id, semester, starting_date, ending_date, created_at, updated_at) FROM stdin;
186e2c39-01ce-4291-b23f-9bc6719e8c13	a9852e43-8136-4f4a-aba5-261c6068c3fb	2	2024-02-11 09:42:00	2024-06-11 09:43:00	2024-05-08 06:45:49.431883	2024-05-08 06:45:49.431883
eb1cf893-cd9d-44dc-8562-7a0c5a901983	a9852e43-8136-4f4a-aba5-261c6068c3fb	1	2023-09-11 09:39:00	2024-01-11 09:40:00	2024-05-08 06:45:49.430575	2024-05-08 07:18:34.906369
84402476-223b-45a4-bd25-c6621fdf62cc	cb7580a8-512f-4c01-a001-aa652a64f987	1	2023-09-01 16:05:00	2024-01-04 16:05:00	2024-05-08 13:10:52.287511	2024-05-08 13:10:52.287511
6de841cc-450d-479d-86e1-2ad2ae591fef	cb7580a8-512f-4c01-a001-aa652a64f987	2	2024-05-01 16:05:00	2024-03-01 16:05:00	2024-05-08 13:10:52.288437	2024-05-08 13:10:52.288437
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.sessions (id, attendance_id, academic_calendar_id, course_id, semester, year, starting_date, ending_date, session_title, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: student_addresses; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.student_addresses (id, student_id, country, city, region, zone, sub_city, woreda, special_location, house_number, moblie_number, telephone_number, pobox, created_by, last_updated_by, created_at, updated_at) FROM stdin;
bdb99eb5-456c-482e-90e2-9f06a2285c13	84721e59-377d-4ca2-837f-57783e30d2d3	ET	Bonga	Southern West Nation	Kaffa	Bonga	Bonga	Bonga		0912499135	0967674741	\N	self	\N	2024-01-28 19:54:53.029614	2024-01-28 19:54:53.029614
f5c56fb0-69ab-4482-8617-1e942c4a7326	b1bb9c90-ac46-4997-a5dc-81b1711599e1	ET	Sheger	Oromia	sheger	Lege Tafo	Tafo	Ropack Real state compound	367	+251911235396	+251911235804		self	\N	2024-01-29 06:09:42.720026	2024-01-30 07:16:39.906973
75df83e6-7ddb-4336-aac3-f98a5121d2c3	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	ET	aa		aa	aa	aa			0909090909			self	\N	2024-05-10 07:58:52.987371	2024-05-10 07:59:24.770873
\.


--
-- Data for Name: student_attendances; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.student_attendances (id, session_id, student_id, course_registration_id, student_full_name, present, absent, remark, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: student_courses; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.student_courses (id, student_id, course_id, course_title, semester, year, credit_hour, ects, course_code, letter_grade, grade_point, created_by, updated_by, created_at, updated_at) FROM stdin;
51478f13-db96-48c2-ac0d-208b8c53e3cb	b1bb9c90-ac46-4997-a5dc-81b1711599e1	4d344ee6-699c-4890-bfd4-1a5245967b5f	Advanced Research Methodology	1	1	3	2	MOL-621	\N	\N	self	\N	2024-01-30 07:24:06.931973	2024-01-30 07:24:06.931973
5cdc19af-97dd-44b0-84a8-a1c5d2fccb58	b1bb9c90-ac46-4997-a5dc-81b1711599e1	68f01a66-2b97-4379-9c87-3d62eee34f77	Fundamentals of Leadership: Theories and Practices	1	1	2	2	MOL-611 	\N	\N	self	\N	2024-01-30 07:24:06.933272	2024-01-30 07:24:06.933272
04023d01-aed0-4fe8-9415-08b57241e183	b1bb9c90-ac46-4997-a5dc-81b1711599e1	eb4936d9-8e53-477b-ac83-a664466d7f08	Finance for Leadership	2	1	2	2	MOL-622 	\N	\N	self	\N	2024-01-30 07:24:06.934614	2024-01-30 07:24:06.934614
3b1db849-c142-4c6f-8b94-2c8e19ad48f3	b1bb9c90-ac46-4997-a5dc-81b1711599e1	a948bbde-df15-474a-bb57-e986bfc7ed27	Information Systems for Leadership	2	1	2	2	MOL-642 	\N	\N	self	\N	2024-01-30 07:24:06.935977	2024-01-30 07:24:06.935977
300c781a-9ccb-4f18-b733-abf68321a9ab	b1bb9c90-ac46-4997-a5dc-81b1711599e1	9a42151a-4ad8-4e5a-9ddb-7021ab1da3fb	Operations Management	2	1	3	2	MOL-612	\N	\N	self	\N	2024-01-30 07:24:06.937381	2024-01-30 07:24:06.937381
4d87059f-9c88-47a6-b822-14f32d3294ca	b1bb9c90-ac46-4997-a5dc-81b1711599e1	765aa33f-f6a7-4f78-ad20-24f8c1dd4ba1	Human Resource Management	1	1	3	2	MOL-641	\N	\N	self	\N	2024-01-30 07:24:06.938694	2024-01-30 07:24:06.938694
d4bf8836-9996-4587-bda6-d05a11f1d71b	b1bb9c90-ac46-4997-a5dc-81b1711599e1	22daa408-10e6-47b3-a3b1-f82a893ea536	Fundamentals of Project Management	1	1	2	2	MOL-631 	\N	\N	self	\N	2024-01-30 07:24:06.940084	2024-01-30 07:24:06.940084
ca89a234-602f-4c73-be23-894e6eb365c2	b1bb9c90-ac46-4997-a5dc-81b1711599e1	17e3ecc7-111d-4968-80a0-d96c1693c5fb	Organizational Behavior and Development	1	1	2	2	MOL-651	\N	\N	self	\N	2024-01-30 07:24:06.941563	2024-01-30 07:24:06.941563
f15592a1-a72f-4504-865c-0f6d8477e4b2	b1bb9c90-ac46-4997-a5dc-81b1711599e1	7e92c6fa-677c-4935-860d-af7c35da12c6	MOL Thesis	2	2	6	2	MOL-712	\N	\N	self	\N	2024-01-30 07:24:06.942819	2024-01-30 07:24:06.942819
0240e745-b1d5-4755-acc7-47187b8bad25	b1bb9c90-ac46-4997-a5dc-81b1711599e1	25b5bf9e-727a-41da-86ed-d258097e5ee3	Global Leadership	2	1	2	2	MOL-632 	\N	\N	self	\N	2024-01-30 07:24:06.944055	2024-01-30 07:24:06.944055
20bac2e0-3482-46cb-9a93-9b910d6f7ceb	b1bb9c90-ac46-4997-a5dc-81b1711599e1	ab585849-3ed6-42b1-bd55-7b13d8bc800a	MOL Thesis Proposal	1	2	1	2	MOL-741 	\N	\N	self	\N	2024-01-30 07:24:06.945282	2024-01-30 07:24:06.945282
ab7b4834-0b15-432b-856a-2845ef91c790	b1bb9c90-ac46-4997-a5dc-81b1711599e1	8c17a51d-6acd-40d5-9af2-518c3a4569ce	Leading Change and Innovation	1	2	3	2	MOL-711	\N	\N	self	\N	2024-01-30 07:24:06.946558	2024-01-30 07:24:06.946558
78676c24-224a-4918-863a-455a7a91a04e	b1bb9c90-ac46-4997-a5dc-81b1711599e1	5a7995b5-288a-41c6-8017-3e58fc91e275	Strategic Leadership	1	2	2	2	MOL-731	\N	\N	self	\N	2024-01-30 07:24:06.947734	2024-01-30 07:24:06.947734
465f740b-61a3-4b15-b970-84d843d54b56	b1bb9c90-ac46-4997-a5dc-81b1711599e1	77001280-ba97-4509-b5d6-95a9fd099c64	Leadership Ethics and Governance	1	2	3	2	MOL-721	\N	\N	self	\N	2024-01-30 07:24:06.949022	2024-01-30 07:24:06.949022
4a6380b5-d059-4b8b-8f36-b731a2c7eb89	f725c26f-a14b-45e3-b4d3-1fd3f57aed53	6d259c59-34b8-41aa-ad35-3859e398f976	Graduate Admission Test (GAT) Preparation Course	1	1	1	2	GAT 101	\N	\N	self	\N	2024-05-10 07:59:24.780794	2024-05-10 07:59:24.780794
\.


--
-- Data for Name: student_grades; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.student_grades (id, course_registration_id, student_id, course_id, department_id, program_id, letter_grade, assesment_total, grade_point, updated_by, created_by, department_approval, approved_by, approval_date, created_at, updated_at, approving_person_role) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.students (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, first_name, last_name, middle_name, gender, date_of_birth, place_of_birth, marital_status, nationality, current_occupation, student_id, old_id_number, student_password, student_id_taken_status, program_id, department_id, academic_calendar_id, admission_type, study_level, year, semester, account_verification_status, document_verification_status, tempo_status, curriculum_version, entrance_exam_result_status, batch, account_status, graduation_status, sponsorship_status, institution_transfer_status, program_transfer_status, previous_program, previous_department, created_by, last_updated_by, created_at, updated_at, payment_version, admission_date, graduation_year, allow_editing) FROM stdin;
f725c26f-a14b-45e3-b4d3-1fd3f57aed53	aaa@gmail.com	$2a$12$7Yl3OrYtOmmwOHav0VFyN.NLBHmAnPkC6wcFxw/tPDV63.musr4Oi	\N	\N	\N	1	2024-05-10 08:01:03.967426	2024-05-10 08:01:03.967426	196.189.10.117	196.189.10.117	aaa	aa	aaa	Male	2007-02-26 00:00:00	motta	Single	ET		GAT 101/3796/24	\N	Aaa_1234	f	ecf5e58a-4025-46c9-bb93-88d59f373026	c405e5fc-090d-433d-a0ac-3ccaf12558e5	cb7580a8-512f-4c01-a001-aa652a64f987	online	graduate	1	1	approved	approved	f	2024/25	\N	2023/24	active	pending	\N	\N	\N	\N	\N	self	\N	2024-05-10 07:58:52.986429	2024-05-10 08:01:03.968347	93467/24	2024-05-10	\N	f
b1bb9c90-ac46-4997-a5dc-81b1711599e1	wajks22@gmail.com	$2a$12$cKqPORhKFjAoHOYAn./lietA44ofGtnhTpmOVww6dvyvmTKDsTpo.	\N	\N	\N	4	2024-01-30 07:14:18.328111	2024-01-30 06:35:10.212742	196.189.16.55	196.189.16.55	Wondimu	kenea	Biratu 	Male	1977-09-09 00:00:00	Oromia	Married	ET	Government 	MOL/6995/24		Ww315740	f	6a06ef33-0886-4c00-b746-c28264904f9a	674c081a-0f1f-48a4-b83a-8813e262d683	a9852e43-8136-4f4a-aba5-261c6068c3fb	online	graduate	1	2	approved	approved	f	2024		2023	active	pending	\N	\N	\N	\N	\N	self	regi reg	2024-01-29 06:09:42.719059	2024-01-30 07:24:06.928187	47012/24	2024-01-30	\N	f
84721e59-377d-4ca2-837f-57783e30d2d3	tadelebirhanu12@gmail.com	$2a$12$ovHLw/bn2slLF1h1jNxbMOO3I3VrFRhb.NyW0SxGISYn8n9HPom1G	\N	\N	\N	1	2024-01-28 19:54:53.175668	2024-01-28 19:54:53.175668	196.191.156.135	196.191.156.135	Tadele	Faris	Birhanu	Male	1994-01-12 00:00:00	Southwest Ethiopia	Married	ET	Civil servant	\N	\N	@21Ethiopia	f	887b43d1-e1e2-4741-b63d-6150fa29e022	\N	\N	online	graduate	1	1	pending	pending	f	\N	\N	\N	active	pending	\N	\N	\N	\N	\N	self	\N	2024-01-28 19:54:53.028473	2024-01-28 19:54:53.176009	\N	\N	\N	f
\.


--
-- Data for Name: transfers; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.transfers (id, student_id, program_id, section_id, department_id, academic_calendar_id, student_full_name, id_number, semester, year, new_department, modality_transfer, reason, date_of_transfer, formal_department_head, formal_department_head_approval, formal_department_head_approval_date, remark, new_department_head, new_department_head_approval, new_department_head_approval_date, dean_name, dean_approval, dean_approval_date, registrar_name, registrar_approval, registrar_approval_date, created_by, updated_by, created_at, updated_at, new_program) FROM stdin;
\.


--
-- Data for Name: withdrawals; Type: TABLE DATA; Schema: public; Owner: newdeploy
--

COPY public.withdrawals (id, program_id, department_id, student_id, section_id, academic_calendar_id, student_id_number, semester, year, fee_status, reason_for_withdrawal, other_reason, last_class_attended, finance_head_approval, finance_head_name, finance_head_date_of_response, registrar_approval, registrar_name, registrar_date_of_response, dean_approval, dean_name, dean_date_of_response, department_approval, department_head_name, department_head_date_of_response, library_head_approval, library_head_name, library_head_date_of_response, store_head_approval, store_head_name, store_head_date_of_response, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newdeploy
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: course_instructors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: newdeploy
--

SELECT pg_catalog.setval('public.course_instructors_id_seq', 1, false);


--
-- Name: academic_calendars academic_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.academic_calendars
    ADD CONSTRAINT academic_calendars_pkey PRIMARY KEY (id);


--
-- Name: academic_statuses academic_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.academic_statuses
    ADD CONSTRAINT academic_statuses_pkey PRIMARY KEY (id);


--
-- Name: active_admin_comments active_admin_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.active_admin_comments
    ADD CONSTRAINT active_admin_comments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: activities activities_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: add_and_drop_courses add_and_drop_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.add_and_drop_courses
    ADD CONSTRAINT add_and_drop_courses_pkey PRIMARY KEY (id);


--
-- Name: add_and_drops add_and_drops_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.add_and_drops
    ADD CONSTRAINT add_and_drops_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: almunis almunis_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.almunis
    ADD CONSTRAINT almunis_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: assessment_plans assessment_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.assessment_plans
    ADD CONSTRAINT assessment_plans_pkey PRIMARY KEY (id);


--
-- Name: assessments assessments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.assessments
    ADD CONSTRAINT assessments_pkey PRIMARY KEY (id);


--
-- Name: attendances attendances_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.attendances
    ADD CONSTRAINT attendances_pkey PRIMARY KEY (id);


--
-- Name: college_payments college_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.college_payments
    ADD CONSTRAINT college_payments_pkey PRIMARY KEY (id);


--
-- Name: colleges colleges_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.colleges
    ADD CONSTRAINT colleges_pkey PRIMARY KEY (id);


--
-- Name: course_assessments course_assessments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.course_assessments
    ADD CONSTRAINT course_assessments_pkey PRIMARY KEY (id);


--
-- Name: course_exemptions course_exemptions_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.course_exemptions
    ADD CONSTRAINT course_exemptions_pkey PRIMARY KEY (id);


--
-- Name: course_instructors course_instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.course_instructors
    ADD CONSTRAINT course_instructors_pkey PRIMARY KEY (id);


--
-- Name: course_modules course_modules_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.course_modules
    ADD CONSTRAINT course_modules_pkey PRIMARY KEY (id);


--
-- Name: course_registrations course_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.course_registrations
    ADD CONSTRAINT course_registrations_pkey PRIMARY KEY (id);


--
-- Name: course_sections course_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.course_sections
    ADD CONSTRAINT course_sections_pkey PRIMARY KEY (id);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: curriculums curriculums_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.curriculums
    ADD CONSTRAINT curriculums_pkey PRIMARY KEY (id);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: emergency_contacts emergency_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.emergency_contacts
    ADD CONSTRAINT emergency_contacts_pkey PRIMARY KEY (id);


--
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id);


--
-- Name: grade_changes grade_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.grade_changes
    ADD CONSTRAINT grade_changes_pkey PRIMARY KEY (id);


--
-- Name: grade_reports grade_reports_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.grade_reports
    ADD CONSTRAINT grade_reports_pkey PRIMARY KEY (id);


--
-- Name: grade_rules grade_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.grade_rules
    ADD CONSTRAINT grade_rules_pkey PRIMARY KEY (id);


--
-- Name: grade_systems grade_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.grade_systems
    ADD CONSTRAINT grade_systems_pkey PRIMARY KEY (id);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: invoice_items invoice_items_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.invoice_items
    ADD CONSTRAINT invoice_items_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: makeup_exams makeup_exams_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.makeup_exams
    ADD CONSTRAINT makeup_exams_pkey PRIMARY KEY (id);


--
-- Name: other_payments other_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.other_payments
    ADD CONSTRAINT other_payments_pkey PRIMARY KEY (id);


--
-- Name: payment_methods payment_methods_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.payment_methods
    ADD CONSTRAINT payment_methods_pkey PRIMARY KEY (id);


--
-- Name: payment_transactions payment_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.payment_transactions
    ADD CONSTRAINT payment_transactions_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: prerequisites prerequisites_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.prerequisites
    ADD CONSTRAINT prerequisites_pkey PRIMARY KEY (id);


--
-- Name: programs programs_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: recurring_payments recurring_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.recurring_payments
    ADD CONSTRAINT recurring_payments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: school_or_university_informations school_or_university_informations_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.school_or_university_informations
    ADD CONSTRAINT school_or_university_informations_pkey PRIMARY KEY (id);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- Name: semester_registrations semester_registrations_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.semester_registrations
    ADD CONSTRAINT semester_registrations_pkey PRIMARY KEY (id);


--
-- Name: semesters semesters_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.semesters
    ADD CONSTRAINT semesters_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: student_addresses student_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.student_addresses
    ADD CONSTRAINT student_addresses_pkey PRIMARY KEY (id);


--
-- Name: student_attendances student_attendances_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.student_attendances
    ADD CONSTRAINT student_attendances_pkey PRIMARY KEY (id);


--
-- Name: student_courses student_courses_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.student_courses
    ADD CONSTRAINT student_courses_pkey PRIMARY KEY (id);


--
-- Name: student_grades student_grades_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.student_grades
    ADD CONSTRAINT student_grades_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: transfers transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_pkey PRIMARY KEY (id);


--
-- Name: withdrawals withdrawals_pkey; Type: CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.withdrawals
    ADD CONSTRAINT withdrawals_pkey PRIMARY KEY (id);


--
-- Name: index_academic_statuses_on_grade_system_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_academic_statuses_on_grade_system_id ON public.academic_statuses USING btree (grade_system_id);


--
-- Name: index_active_admin_comments_on_author_type_and_author_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_active_admin_comments_on_author_type_and_author_id ON public.active_admin_comments USING btree (author_type, author_id);


--
-- Name: index_active_admin_comments_on_namespace; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_active_admin_comments_on_namespace ON public.active_admin_comments USING btree (namespace);


--
-- Name: index_active_admin_comments_on_resource_type_and_resource_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_active_admin_comments_on_resource_type_and_resource_id ON public.active_admin_comments USING btree (resource_type, resource_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_activities_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_activities_on_academic_calendar_id ON public.activities USING btree (academic_calendar_id);


--
-- Name: index_add_and_drop_courses_on_add_and_drop_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_add_and_drop_courses_on_add_and_drop_id ON public.add_and_drop_courses USING btree (add_and_drop_id);


--
-- Name: index_add_and_drop_courses_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_add_and_drop_courses_on_course_id ON public.add_and_drop_courses USING btree (course_id);


--
-- Name: index_add_and_drops_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_add_and_drops_on_academic_calendar_id ON public.add_and_drops USING btree (academic_calendar_id);


--
-- Name: index_add_and_drops_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_add_and_drops_on_department_id ON public.add_and_drops USING btree (department_id);


--
-- Name: index_add_and_drops_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_add_and_drops_on_program_id ON public.add_and_drops USING btree (program_id);


--
-- Name: index_add_and_drops_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_add_and_drops_on_section_id ON public.add_and_drops USING btree (section_id);


--
-- Name: index_add_and_drops_on_semester_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_add_and_drops_on_semester_registration_id ON public.add_and_drops USING btree (semester_registration_id);


--
-- Name: index_add_and_drops_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_add_and_drops_on_student_id ON public.add_and_drops USING btree (student_id);


--
-- Name: index_admin_users_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_admin_users_on_department_id ON public.admin_users USING btree (department_id);


--
-- Name: index_admin_users_on_email; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE UNIQUE INDEX index_admin_users_on_email ON public.admin_users USING btree (email);


--
-- Name: index_admin_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE UNIQUE INDEX index_admin_users_on_reset_password_token ON public.admin_users USING btree (reset_password_token);


--
-- Name: index_admin_users_on_role; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_admin_users_on_role ON public.admin_users USING btree (role);


--
-- Name: index_assessment_plans_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_assessment_plans_on_course_id ON public.assessment_plans USING btree (course_id);


--
-- Name: index_assessments_on_assessment_plan_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_assessments_on_assessment_plan_id ON public.assessments USING btree (assessment_plan_id);


--
-- Name: index_assessments_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_assessments_on_course_id ON public.assessments USING btree (course_id);


--
-- Name: index_assessments_on_student_grade_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_assessments_on_student_grade_id ON public.assessments USING btree (student_grade_id);


--
-- Name: index_assessments_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_assessments_on_student_id ON public.assessments USING btree (student_id);


--
-- Name: index_attendances_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_attendances_on_academic_calendar_id ON public.attendances USING btree (academic_calendar_id);


--
-- Name: index_attendances_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_attendances_on_course_id ON public.attendances USING btree (course_id);


--
-- Name: index_attendances_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_attendances_on_program_id ON public.attendances USING btree (program_id);


--
-- Name: index_attendances_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_attendances_on_section_id ON public.attendances USING btree (section_id);


--
-- Name: index_course_assessments_on_curriculums_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_assessments_on_curriculums_id ON public.course_assessments USING btree (curriculums_id);


--
-- Name: index_course_exemptions_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_exemptions_on_course_id ON public.course_exemptions USING btree (course_id);


--
-- Name: index_course_exemptions_on_exemptible_type_and_exemptible_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_exemptions_on_exemptible_type_and_exemptible_id ON public.course_exemptions USING btree (exemptible_type, exemptible_id);


--
-- Name: index_course_instructors_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_instructors_on_academic_calendar_id ON public.course_instructors USING btree (academic_calendar_id);


--
-- Name: index_course_instructors_on_admin_user_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_instructors_on_admin_user_id ON public.course_instructors USING btree (admin_user_id);


--
-- Name: index_course_instructors_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_instructors_on_course_id ON public.course_instructors USING btree (course_id);


--
-- Name: index_course_instructors_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_instructors_on_section_id ON public.course_instructors USING btree (section_id);


--
-- Name: index_course_modules_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_modules_on_department_id ON public.course_modules USING btree (department_id);


--
-- Name: index_course_registrations_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_registrations_on_academic_calendar_id ON public.course_registrations USING btree (academic_calendar_id);


--
-- Name: index_course_registrations_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_registrations_on_course_id ON public.course_registrations USING btree (course_id);


--
-- Name: index_course_registrations_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_registrations_on_department_id ON public.course_registrations USING btree (department_id);


--
-- Name: index_course_registrations_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_registrations_on_program_id ON public.course_registrations USING btree (program_id);


--
-- Name: index_course_registrations_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_registrations_on_section_id ON public.course_registrations USING btree (section_id);


--
-- Name: index_course_registrations_on_semester_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_registrations_on_semester_registration_id ON public.course_registrations USING btree (semester_registration_id);


--
-- Name: index_course_registrations_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_registrations_on_student_id ON public.course_registrations USING btree (student_id);


--
-- Name: index_course_sections_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_course_sections_on_course_id ON public.course_sections USING btree (course_id);


--
-- Name: index_courses_on_course_module_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_courses_on_course_module_id ON public.courses USING btree (course_module_id);


--
-- Name: index_courses_on_curriculum_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_courses_on_curriculum_id ON public.courses USING btree (curriculum_id);


--
-- Name: index_courses_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_courses_on_program_id ON public.courses USING btree (program_id);


--
-- Name: index_curriculums_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_curriculums_on_program_id ON public.curriculums USING btree (program_id);


--
-- Name: index_departments_on_faculty_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_departments_on_faculty_id ON public.departments USING btree (faculty_id);


--
-- Name: index_emergency_contacts_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_emergency_contacts_on_student_id ON public.emergency_contacts USING btree (student_id);


--
-- Name: index_grade_changes_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_academic_calendar_id ON public.grade_changes USING btree (academic_calendar_id);


--
-- Name: index_grade_changes_on_assessment_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_assessment_id ON public.grade_changes USING btree (assessment_id);


--
-- Name: index_grade_changes_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_course_id ON public.grade_changes USING btree (course_id);


--
-- Name: index_grade_changes_on_course_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_course_registration_id ON public.grade_changes USING btree (course_registration_id);


--
-- Name: index_grade_changes_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_department_id ON public.grade_changes USING btree (department_id);


--
-- Name: index_grade_changes_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_program_id ON public.grade_changes USING btree (program_id);


--
-- Name: index_grade_changes_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_section_id ON public.grade_changes USING btree (section_id);


--
-- Name: index_grade_changes_on_student_grade_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_student_grade_id ON public.grade_changes USING btree (student_grade_id);


--
-- Name: index_grade_changes_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_changes_on_student_id ON public.grade_changes USING btree (student_id);


--
-- Name: index_grade_reports_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_reports_on_academic_calendar_id ON public.grade_reports USING btree (academic_calendar_id);


--
-- Name: index_grade_reports_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_reports_on_department_id ON public.grade_reports USING btree (department_id);


--
-- Name: index_grade_reports_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_reports_on_program_id ON public.grade_reports USING btree (program_id);


--
-- Name: index_grade_reports_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_reports_on_section_id ON public.grade_reports USING btree (section_id);


--
-- Name: index_grade_reports_on_semester_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_reports_on_semester_registration_id ON public.grade_reports USING btree (semester_registration_id);


--
-- Name: index_grade_reports_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_reports_on_student_id ON public.grade_reports USING btree (student_id);


--
-- Name: index_grade_systems_on_curriculum_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_systems_on_curriculum_id ON public.grade_systems USING btree (curriculum_id);


--
-- Name: index_grade_systems_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grade_systems_on_program_id ON public.grade_systems USING btree (program_id);


--
-- Name: index_grades_on_grade_system_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_grades_on_grade_system_id ON public.grades USING btree (grade_system_id);


--
-- Name: index_invoice_items_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_invoice_items_on_course_id ON public.invoice_items USING btree (course_id);


--
-- Name: index_invoice_items_on_course_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_invoice_items_on_course_registration_id ON public.invoice_items USING btree (course_registration_id);


--
-- Name: index_invoice_items_on_itemable_type_and_itemable_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_invoice_items_on_itemable_type_and_itemable_id ON public.invoice_items USING btree (itemable_type, itemable_id);


--
-- Name: index_invoices_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_invoices_on_academic_calendar_id ON public.invoices USING btree (academic_calendar_id);


--
-- Name: index_invoices_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_invoices_on_department_id ON public.invoices USING btree (department_id);


--
-- Name: index_invoices_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_invoices_on_program_id ON public.invoices USING btree (program_id);


--
-- Name: index_invoices_on_semester_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_invoices_on_semester_registration_id ON public.invoices USING btree (semester_registration_id);


--
-- Name: index_invoices_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_invoices_on_student_id ON public.invoices USING btree (student_id);


--
-- Name: index_makeup_exams_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_academic_calendar_id ON public.makeup_exams USING btree (academic_calendar_id);


--
-- Name: index_makeup_exams_on_assessment_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_assessment_id ON public.makeup_exams USING btree (assessment_id);


--
-- Name: index_makeup_exams_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_course_id ON public.makeup_exams USING btree (course_id);


--
-- Name: index_makeup_exams_on_course_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_course_registration_id ON public.makeup_exams USING btree (course_registration_id);


--
-- Name: index_makeup_exams_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_department_id ON public.makeup_exams USING btree (department_id);


--
-- Name: index_makeup_exams_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_program_id ON public.makeup_exams USING btree (program_id);


--
-- Name: index_makeup_exams_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_section_id ON public.makeup_exams USING btree (section_id);


--
-- Name: index_makeup_exams_on_student_grade_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_student_grade_id ON public.makeup_exams USING btree (student_grade_id);


--
-- Name: index_makeup_exams_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_makeup_exams_on_student_id ON public.makeup_exams USING btree (student_id);


--
-- Name: index_other_payments_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_other_payments_on_academic_calendar_id ON public.other_payments USING btree (academic_calendar_id);


--
-- Name: index_other_payments_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_other_payments_on_department_id ON public.other_payments USING btree (department_id);


--
-- Name: index_other_payments_on_payable_type_and_payable_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_other_payments_on_payable_type_and_payable_id ON public.other_payments USING btree (payable_type, payable_id);


--
-- Name: index_other_payments_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_other_payments_on_program_id ON public.other_payments USING btree (program_id);


--
-- Name: index_other_payments_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_other_payments_on_section_id ON public.other_payments USING btree (section_id);


--
-- Name: index_other_payments_on_semester_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_other_payments_on_semester_registration_id ON public.other_payments USING btree (semester_registration_id);


--
-- Name: index_other_payments_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_other_payments_on_student_id ON public.other_payments USING btree (student_id);


--
-- Name: index_payment_transactions_on_payment_method_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_payment_transactions_on_payment_method_id ON public.payment_transactions USING btree (payment_method_id);


--
-- Name: index_payments_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_payments_on_program_id ON public.payments USING btree (program_id);


--
-- Name: index_prerequisites_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_prerequisites_on_course_id ON public.prerequisites USING btree (course_id);


--
-- Name: index_prerequisites_on_prerequisite_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_prerequisites_on_prerequisite_id ON public.prerequisites USING btree (prerequisite_id);


--
-- Name: index_programs_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_programs_on_department_id ON public.programs USING btree (department_id);


--
-- Name: index_recurring_payments_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_recurring_payments_on_academic_calendar_id ON public.recurring_payments USING btree (academic_calendar_id);


--
-- Name: index_recurring_payments_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_recurring_payments_on_department_id ON public.recurring_payments USING btree (department_id);


--
-- Name: index_recurring_payments_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_recurring_payments_on_program_id ON public.recurring_payments USING btree (program_id);


--
-- Name: index_recurring_payments_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_recurring_payments_on_section_id ON public.recurring_payments USING btree (section_id);


--
-- Name: index_recurring_payments_on_semester_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_recurring_payments_on_semester_registration_id ON public.recurring_payments USING btree (semester_registration_id);


--
-- Name: index_recurring_payments_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_recurring_payments_on_student_id ON public.recurring_payments USING btree (student_id);


--
-- Name: index_school_or_university_informations_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_school_or_university_informations_on_student_id ON public.school_or_university_informations USING btree (student_id);


--
-- Name: index_sections_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_sections_on_program_id ON public.sections USING btree (program_id);


--
-- Name: index_semester_registrations_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_semester_registrations_on_academic_calendar_id ON public.semester_registrations USING btree (academic_calendar_id);


--
-- Name: index_semester_registrations_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_semester_registrations_on_department_id ON public.semester_registrations USING btree (department_id);


--
-- Name: index_semester_registrations_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_semester_registrations_on_program_id ON public.semester_registrations USING btree (program_id);


--
-- Name: index_semester_registrations_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_semester_registrations_on_section_id ON public.semester_registrations USING btree (section_id);


--
-- Name: index_semester_registrations_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_semester_registrations_on_student_id ON public.semester_registrations USING btree (student_id);


--
-- Name: index_semesters_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_semesters_on_academic_calendar_id ON public.semesters USING btree (academic_calendar_id);


--
-- Name: index_sessions_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_sessions_on_academic_calendar_id ON public.sessions USING btree (academic_calendar_id);


--
-- Name: index_sessions_on_attendance_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_sessions_on_attendance_id ON public.sessions USING btree (attendance_id);


--
-- Name: index_sessions_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_sessions_on_course_id ON public.sessions USING btree (course_id);


--
-- Name: index_student_addresses_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_addresses_on_student_id ON public.student_addresses USING btree (student_id);


--
-- Name: index_student_attendances_on_course_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_attendances_on_course_registration_id ON public.student_attendances USING btree (course_registration_id);


--
-- Name: index_student_attendances_on_session_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_attendances_on_session_id ON public.student_attendances USING btree (session_id);


--
-- Name: index_student_attendances_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_attendances_on_student_id ON public.student_attendances USING btree (student_id);


--
-- Name: index_student_courses_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_courses_on_course_id ON public.student_courses USING btree (course_id);


--
-- Name: index_student_courses_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_courses_on_student_id ON public.student_courses USING btree (student_id);


--
-- Name: index_student_grades_on_course_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_grades_on_course_id ON public.student_grades USING btree (course_id);


--
-- Name: index_student_grades_on_course_registration_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_grades_on_course_registration_id ON public.student_grades USING btree (course_registration_id);


--
-- Name: index_student_grades_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_grades_on_department_id ON public.student_grades USING btree (department_id);


--
-- Name: index_student_grades_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_grades_on_program_id ON public.student_grades USING btree (program_id);


--
-- Name: index_student_grades_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_student_grades_on_student_id ON public.student_grades USING btree (student_id);


--
-- Name: index_students_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_students_on_academic_calendar_id ON public.students USING btree (academic_calendar_id);


--
-- Name: index_students_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_students_on_department_id ON public.students USING btree (department_id);


--
-- Name: index_students_on_email; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE UNIQUE INDEX index_students_on_email ON public.students USING btree (email);


--
-- Name: index_students_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_students_on_program_id ON public.students USING btree (program_id);


--
-- Name: index_students_on_reset_password_token; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE UNIQUE INDEX index_students_on_reset_password_token ON public.students USING btree (reset_password_token);


--
-- Name: index_transfers_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_transfers_on_academic_calendar_id ON public.transfers USING btree (academic_calendar_id);


--
-- Name: index_transfers_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_transfers_on_department_id ON public.transfers USING btree (department_id);


--
-- Name: index_transfers_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_transfers_on_program_id ON public.transfers USING btree (program_id);


--
-- Name: index_transfers_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_transfers_on_section_id ON public.transfers USING btree (section_id);


--
-- Name: index_transfers_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_transfers_on_student_id ON public.transfers USING btree (student_id);


--
-- Name: index_withdrawals_on_academic_calendar_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_withdrawals_on_academic_calendar_id ON public.withdrawals USING btree (academic_calendar_id);


--
-- Name: index_withdrawals_on_department_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_withdrawals_on_department_id ON public.withdrawals USING btree (department_id);


--
-- Name: index_withdrawals_on_program_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_withdrawals_on_program_id ON public.withdrawals USING btree (program_id);


--
-- Name: index_withdrawals_on_section_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_withdrawals_on_section_id ON public.withdrawals USING btree (section_id);


--
-- Name: index_withdrawals_on_student_id; Type: INDEX; Schema: public; Owner: newdeploy
--

CREATE INDEX index_withdrawals_on_student_id ON public.withdrawals USING btree (student_id);


--
-- Name: departments fk_rails_925f039a87; Type: FK CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_rails_925f039a87 FOREIGN KEY (faculty_id) REFERENCES public.faculties(id);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: newdeploy
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

