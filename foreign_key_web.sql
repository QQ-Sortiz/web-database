------
------ Foreign Keys
------

--ALTER TABLE  ADD CONSTRAINT _fk
--FOREIGN KEY () REFERENCES () ON DELETE CASCADE;

-- web.cube_dim_taxon
ALTER TABLE web.cube_dim_taxon ADD CONSTRAINT commercial_group_id_fk
FOREIGN KEY (commercial_group_id) REFERENCES web.commercial_groups(commercial_group_id) ON DELETE CASCADE;

ALTER TABLE web.cube_dim_taxon ADD CONSTRAINT functional_group_id_fk
FOREIGN KEY (functional_group_id) REFERENCES web.functional_groups(functional_group_id) ON DELETE CASCADE;

ALTER TABLE web.cube_dim_taxon ADD CONSTRAINT taxon_group_id_fk
FOREIGN KEY (taxon_group_id) REFERENCES web.taxon_group(taxon_group_id) ON DELETE CASCADE;

ALTER TABLE web.cube_dim_taxon ADD CONSTRAINT taxon_level_id_fk
FOREIGN KEY (taxon_level_id) REFERENCES web.taxon_level(taxon_level_id) ON DELETE CASCADE;

-- web.geo_entity
ALTER TABLE web.geo_entity ADD CONSTRAINT jurisdiction_id_fk
FOREIGN KEY (jurisdiction_id) REFERENCES web.jurisdiction(jurisdiction_id) ON DELETE CASCADE;

ALTER TABLE web.geo_entity ADD CONSTRAINT admin_geo_entity_id_fk
FOREIGN KEY (admin_geo_entity_id) REFERENCES web.geo_entity(geo_entity_id) ON DELETE CASCADE;

-- web.sub_geo_entity 
ALTER TABLE web.sub_geo_entity ADD CONSTRAINT geo_entity_id_fk
FOREIGN KEY (geo_entity_id) REFERENCES web.geo_entity(geo_entity_id) ON DELETE CASCADE;

-- web.mariculture_data
ALTER TABLE web.mariculture_data ADD CONSTRAINT mariculture_sub_entity_id_fk
FOREIGN KEY (mariculture_sub_entity_id) REFERENCES web.mariculture_sub_entity(mariculture_sub_entity_id) ON DELETE CASCADE;

ALTER TABLE web.mariculture_data ADD CONSTRAINT taxon_key_fk
FOREIGN KEY (taxon_key) REFERENCES web.cube_dim_taxon(taxon_key) ON DELETE CASCADE;

-- web.mariculture_entity
ALTER TABLE web.mariculture_entity ADD CONSTRAINT legacy_c_number_fk
FOREIGN KEY (legacy_c_number) REFERENCES web.country(c_number) ON DELETE CASCADE;

-- web.mariculture_sub_entity
ALTER TABLE web.mariculture_sub_entity ADD CONSTRAINT mariculture_entity_id_fk
FOREIGN KEY (mariculture_entity_id) REFERENCES web.mariculture_entity(mariculture_entity_id) ON DELETE CASCADE;

-- web.area
ALTER TABLE web.area ADD CONSTRAINT marine_layer_id_fk
FOREIGN KEY (marine_layer_id) REFERENCES web.marine_layer(marine_layer_id) ON DELETE CASCADE;

-- TODO: reconfirm which table can serve as master source for the main_area_id column in this table
--ALTER TABLE web.area ADD CONSTRAINT main_area_id_fk
--FOREIGN KEY (main_area_id) REFERENCES web.tropics_main_area(main_area_id) ON DELETE CASCADE;

-- TODO: reconfirm which table can serve as master source for the sub_area_id column in this table
--ALTER TABLE web.area ADD CONSTRAINT sub_area_id_fk
--FOREIGN KEY (sub_area_id) REFERENCES web.tropics_sub_area(sub_area_id) ON DELETE CASCADE;

-- web.area_invisible
ALTER TABLE web.area_invisible ADD CONSTRAINT marine_layer_id_fk
FOREIGN KEY (marine_layer_id) REFERENCES web.marine_layer(marine_layer_id) ON DELETE CASCADE;

-- TODO: reconfirm which table can serve as master source for the main_area_id column in this table
--ALTER TABLE web.area_invisible ADD CONSTRAINT main_area_id_fk
--FOREIGN KEY (main_area_id) REFERENCES web.tropics_main_area(main_area_id) ON DELETE CASCADE;

-- TODO: reconfirm which table can serve as master source for the sub_area_id column in this table
--ALTER TABLE web.area_invisible ADD CONSTRAINT sub_area_id_fk
--FOREIGN KEY (sub_area_id) REFERENCES web.tropics_sub_area(sub_area_id) ON DELETE CASCADE;

-- web.eez_reconstruction_mapping 
--(0 is allowed in the sub_area_id column. maybe this should be looked at closer to see if it should just be null instead)
--ALTER TABLE web.eez_reconstruction_mapping ADD CONSTRAINT sub_area_id_fk
--FOREIGN KEY (sub_area_id) REFERENCES web.tropics_sub_area(sub_area_id) ON DELETE CASCADE;

-- web.eez 
ALTER TABLE web.eez ADD CONSTRAINT geo_entity_id_fk
FOREIGN KEY (geo_entity_id) REFERENCES web.geo_entity(geo_entity_id) ON DELETE CASCADE;

ALTER TABLE web.eez ADD CONSTRAINT legacy_c_number_fk
FOREIGN KEY (legacy_c_number) REFERENCES web.country(c_number) ON DELETE CASCADE;

-- web.fishing_entity 
ALTER TABLE web.fishing_entity ADD CONSTRAINT geo_entity_id_fk
FOREIGN KEY (geo_entity_id) REFERENCES web.geo_entity(geo_entity_id) ON DELETE CASCADE;

ALTER TABLE web.fishing_entity ADD CONSTRAINT legacy_c_number_fk
FOREIGN KEY (legacy_c_number) REFERENCES web.country(c_number) ON DELETE CASCADE;

-- web.geo_entity_mariculture_entity_mapping 
ALTER TABLE web.geo_entity_mariculture_entity_mapping ADD CONSTRAINT geo_entity_id_fk
FOREIGN KEY (geo_entity_id) REFERENCES web.geo_entity(geo_entity_id) ON DELETE CASCADE;

-- web.country
ALTER TABLE web.country ADD CONSTRAINT admin_c_number_fk
FOREIGN KEY (admin_c_number) REFERENCES web.country(c_number) ON DELETE CASCADE;

-- web.estuary
ALTER TABLE web.estuary ADD CONSTRAINT c_number_fk
FOREIGN KEY (c_number) REFERENCES web.country(c_number) ON DELETE CASCADE;

-- web.area_bucket_type
ALTER TABLE web.area_bucket_type ADD CONSTRAINT marine_layer_id_fk
FOREIGN KEY (marine_layer_id) REFERENCES web.marine_layer(marine_layer_id) ON DELETE CASCADE;

-- web.area_bucket
ALTER TABLE web.area_bucket ADD CONSTRAINT area_bucket_type_id_fk
FOREIGN KEY (area_bucket_type_id) REFERENCES web.area_bucket_type(area_bucket_type_id) ON DELETE CASCADE;

-- web.v_fact_data
ALTER TABLE web.v_fact_data ADD CONSTRAINT taxon_key_fk
FOREIGN KEY (taxon_key) REFERENCES web.cube_dim_taxon(taxon_key) ON DELETE CASCADE;

ALTER TABLE web.v_fact_data ADD CONSTRAINT fishing_entity_id_fk
FOREIGN KEY (fishing_entity_id) REFERENCES web.fishing_entity(fishing_entity_id) ON DELETE CASCADE;

--ALTER TABLE web.v_fact_data ADD CONSTRAINT gear_id_fk
--FOREIGN KEY (gear_id) REFERENCES web.gear(gear_id) ON DELETE CASCADE;

ALTER TABLE web.v_fact_data ADD CONSTRAINT time_key_fk
FOREIGN KEY (time_key) REFERENCES web.time(time_key) ON DELETE CASCADE;

ALTER TABLE web.v_fact_data ADD CONSTRAINT area_key_fk
FOREIGN KEY (area_key) REFERENCES web.area(area_key) ON DELETE CASCADE;

ALTER TABLE web.v_fact_data ADD CONSTRAINT marine_layer_id_fk
FOREIGN KEY (marine_layer_id) REFERENCES web.marine_layer(marine_layer_id) ON DELETE CASCADE;

ALTER TABLE web.v_fact_data ADD CONSTRAINT catch_type_id_fk
FOREIGN KEY (catch_type_id) REFERENCES web.catch_type(catch_type_id) ON DELETE CASCADE;

ALTER TABLE web.v_fact_data ADD CONSTRAINT sector_type_id_fk
FOREIGN KEY (sector_type_id) REFERENCES web.sector_type(sector_type_id) ON DELETE CASCADE;

-- web.access_agreement
ALTER TABLE web.access_agreement ADD CONSTRAINT access_type_id_fk
FOREIGN KEY (access_type_id) REFERENCES web.access_type(id) ON DELETE CASCADE;

ALTER TABLE web.access_agreement ADD CONSTRAINT agreement_type_id_fk
FOREIGN KEY (agreement_type_id) REFERENCES web.agreement_type(id) ON DELETE CASCADE;