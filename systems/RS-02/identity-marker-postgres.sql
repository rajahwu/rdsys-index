-- ============================================  
-- RADIANT SYSTEMS — BRAND KIT DATABASE POPULATION  
-- ============================================

-- Create or update Radiant Systems as the parent brand  
INSERT OR REPLACE INTO brands (id, name, slug, tagline, tone, keywords, created_at, updated_at)  
VALUES ( 
 
'RS-02',  
'Radiant Systems',  
'radiant-systems',  
'Operational Permanence',  
'Institutional, calm, disciplined, authoritative — the governance layer ensuring continuity and clarity.',  
'Infrastructure · Governance · Clarity · Discipline · Continuity · Oversight',  
NULL,  
NOW(),  
NOW()  
);

-- ============================================  
-- COLORS  
-- ============================================

INSERT INTO brand_colors (brand_id, token_name, hex, rgb, cmyk, pantone, usage_notes, is_primary)  
VALUES  
-- Foundation Colors  

-- Text Colors    

-- Brand Teal System    

-- Semantic Colors    

-- ============================================  
-- TYPOGRAPHY  
-- ============================================

INSERT INTO brand_typography (brand_id, token_name, font_family, font_weight, size_px, size_rem, line_height, letter_spacing, usage_notes)  
VALUES  

-- ============================================  
-- ICONS  
-- ============================================

INSERT INTO brand_icons (brand_id, category, name, file_path, size, stroke_width, description, is_primary_glyph)  
VALUES  
-- Governance Icons  

-- Infrastructure Icons    

-- Status Icons    

-- ============================================  
-- ASSETS  
-- ============================================

INSERT INTO brand_assets (brand_id, asset_type, category, name, file_path, file_format, usage_notes)  
VALUES  
-- Logos  

-- Diagrams    

-- ============================================  
-- GUIDELINES  
-- ============================================

INSERT INTO brand_guidelines (brand_id, section, content, display_order)  
VALUES  
'Radiant Systems uses a muted institutional palette. Avoid saturated colors, gradients, or decorative hues. Teal is reserved for primary actions and system emphasis.',  TRUE),

'Typography follows a strict hierarchy using IBM Plex Sans and IBM Plex Mono. No custom fonts or decorative weights. Maximum weight: 600.', 2),

'Icons follow a strict geometric grid with 2px strokes and no rounded corners. Designed for clarity, not expression.', 3),

'Illustrations are diagrammatic: system maps, flows, and infrastructure diagrams. No characters, metaphors, or decorative artwork.', 4),

'Radiant Systems governs all tokens and operational standards. Subsystems must consume tokens, not override them. Changes require documented justification.', 5);