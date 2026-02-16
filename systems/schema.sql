-- WARNING: This schema is for context only and is not meant to be run.
-- Table order and constraints may not be valid for execution.

CREATE TABLE public.agent_profiles (
  agent_id character varying NOT NULL,
  name character varying NOT NULL,
  designation character varying,
  status character varying NOT NULL DEFAULT 'IDLE'::character varying CHECK (status::text = ANY (ARRAY['ACTIVE'::character varying, 'IDLE'::character varying, 'STALE'::character varying, 'OFFLINE'::character varying]::text[])),
  lattice_role character varying,
  specialization jsonb,
  capabilities jsonb,
  sessions_active integer DEFAULT 0,
  artifacts_generated integer DEFAULT 0,
  uptime_hours numeric DEFAULT 0.0,
  last_active timestamp with time zone,
  profile_image text,
  profile_color character varying,
  auth_signature character varying UNIQUE,
  linked_corelink_id character varying,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  CONSTRAINT agent_profiles_pkey PRIMARY KEY (agent_id)
);
CREATE TABLE public.brand_assets (
  id integer NOT NULL DEFAULT nextval('brand_assets_id_seq'::regclass),
  brand_id text,
  asset_type text,
  category text,
  name text,
  file_path text,
  file_format text,
  usage_notes text,
  CONSTRAINT brand_assets_pkey PRIMARY KEY (id),
  CONSTRAINT brand_assets_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id)
);
CREATE TABLE public.brand_colors (
  id integer NOT NULL DEFAULT nextval('brand_colors_id_seq'::regclass),
  brand_id text,
  token_name text,
  hex text,
  rgb text,
  cmyk text,
  pantone text,
  usage_notes text,
  is_primary boolean DEFAULT false,
  CONSTRAINT brand_colors_pkey PRIMARY KEY (id),
  CONSTRAINT brand_colors_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id)
);
CREATE TABLE public.brand_guidelines (
  id integer NOT NULL DEFAULT nextval('brand_guidelines_id_seq'::regclass),
  brand_id text,
  section text,
  content text,
  display_order integer,
  CONSTRAINT brand_guidelines_pkey PRIMARY KEY (id),
  CONSTRAINT brand_guidelines_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id)
);
CREATE TABLE public.brand_icons (
  id integer NOT NULL DEFAULT nextval('brand_icons_id_seq'::regclass),
  brand_id text,
  category text,
  name text,
  file_path text,
  size text,
  stroke_width text,
  description text,
  is_primary_glyph boolean DEFAULT false,
  CONSTRAINT brand_icons_pkey PRIMARY KEY (id),
  CONSTRAINT brand_icons_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id)
);
CREATE TABLE public.brand_shadows (
  id integer NOT NULL DEFAULT nextval('brand_shadows_id_seq'::regclass),
  brand_id text,
  token_name text,
  css_value text,
  usage_notes text,
  CONSTRAINT brand_shadows_pkey PRIMARY KEY (id),
  CONSTRAINT brand_shadows_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id)
);
CREATE TABLE public.brand_spacing (
  id integer NOT NULL DEFAULT nextval('brand_spacing_id_seq'::regclass),
  brand_id text,
  token_name text,
  value text,
  usage_notes text,
  CONSTRAINT brand_spacing_pkey PRIMARY KEY (id),
  CONSTRAINT brand_spacing_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id)
);
CREATE TABLE public.brand_typography (
  id integer NOT NULL DEFAULT nextval('brand_typography_id_seq'::regclass),
  brand_id text,
  token_name text,
  font_family text,
  font_weight text,
  size_px real,
  size_rem real,
  line_height real,
  letter_spacing text,
  usage_notes text,
  CONSTRAINT brand_typography_pkey PRIMARY KEY (id),
  CONSTRAINT brand_typography_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id)
);
CREATE TABLE public.brands (
  id text NOT NULL,
  name text NOT NULL,
  slug text NOT NULL UNIQUE,
  tagline text,
  tone text,
  keywords text,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  CONSTRAINT brands_pkey PRIMARY KEY (id)
);
CREATE TABLE public.color_palettes (
  id integer NOT NULL DEFAULT nextval('color_palettes_id_seq'::regclass),
  brand_slug text NOT NULL,
  color_key text,
  hex text,
  description text,
  CONSTRAINT color_palettes_pkey PRIMARY KEY (id),
  CONSTRAINT color_palettes_brand_slug_fkey FOREIGN KEY (brand_slug) REFERENCES public.brands(slug)
);
CREATE TABLE public.core_links (
  link_id character varying NOT NULL,
  name character varying NOT NULL,
  description text,
  status character varying DEFAULT 'idle'::character varying CHECK (status::text = ANY (ARRAY['active'::character varying, 'idle'::character varying, 'stale'::character varying, 'deprecated'::character varying]::text[])),
  health character varying DEFAULT 'unknown'::character varying CHECK (health::text = ANY (ARRAY['healthy'::character varying, 'degraded'::character varying, 'offline'::character varying, 'unknown'::character varying]::text[])),
  coordinates jsonb,
  infrastructure jsonb,
  artifacts jsonb,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  CONSTRAINT core_links_pkey PRIMARY KEY (link_id)
);
CREATE TABLE public.identity_markers (
  marker_id integer NOT NULL DEFAULT nextval('identity_markers_marker_id_seq'::regclass),
  corelink_id character varying,
  agent_id character varying,
  category character varying NOT NULL,
  name character varying NOT NULL,
  metadata jsonb,
  assets jsonb,
  created_at timestamp with time zone DEFAULT now(),
  updated_at timestamp with time zone DEFAULT now(),
  CONSTRAINT identity_markers_pkey PRIMARY KEY (marker_id),
  CONSTRAINT fk_corelink FOREIGN KEY (corelink_id) REFERENCES public.core_links(link_id),
  CONSTRAINT fk_agent FOREIGN KEY (agent_id) REFERENCES public.agent_profiles(agent_id)
);
CREATE TABLE public.subsystems (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  link_id text NOT NULL UNIQUE,
  name text NOT NULL,
  mission_statement text,
  status_state text DEFAULT 'Null'::text,
  system_health text DEFAULT 'Unknown'::text,
  coordinates jsonb,
  infrastructure jsonb,
  config jsonb,
  last_updated timestamp with time zone DEFAULT now(),
  version text DEFAULT 'rsyszer0'::text,
  CONSTRAINT subsystems_pkey PRIMARY KEY (id)
);
CREATE TABLE public.typography_scales (
  id integer NOT NULL DEFAULT nextval('typography_scales_id_seq'::regclass),
  brand_slug text NOT NULL,
  type_key text,
  font text,
  size real,
  description text,
  CONSTRAINT typography_scales_pkey PRIMARY KEY (id),
  CONSTRAINT typography_scales_brand_slug_fkey FOREIGN KEY (brand_slug) REFERENCES public.brands(slug)
);

