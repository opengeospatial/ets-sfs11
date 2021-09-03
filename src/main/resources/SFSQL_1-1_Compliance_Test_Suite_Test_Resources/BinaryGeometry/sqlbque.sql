-- FILE: sqlbque.sql 10/01/98
--
--       1         2         3         4         5         6         7         8
--345678901234567890123456789012345678901234567890123456789012345678901234567890
--//////////////////////////////////////////////////////////////////////////////
--
-- Copyright 1998, Open GIS Consortium, Inc.
--
-- The material is licensed under the Apache License, Version 2.0 (the "License"). You may obtain a copy of the License from http://opensource.org/licenses/Apache-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
--
--//////////////////////////////////////////////////////////////////////////////
--
-- OpenGIS Simple Features for SQL (Binary Geometry) Test Suite Software
-- 
-- This file "sqlbque.sql" is part 2 of a two part standardized test
-- suite in SQL script form. The other file that is required for this test
-- suite, "sqlbsch.sql", one additional script is provided ("sqlbcle.sql") that
-- performs cleanup operations between test runs, and other other documents 
-- that describe the OGC Conformance Test Program are available via the WWW at 
-- http://www.opengeospatial.org/testing/index.htm
--
-- NOTE CONCERNING INFORMATION ON CONFORMANCE TESTING AND THIS TEST SUITE
-- ----------------------------------------------------------------------
--
-- Organizations wishing to submit product for conformance testing should
-- access the above WWW site to discover the proper procedure for obtaining
-- a license to use the OpenGIS(R) certification mark associated with this
-- test suite.
--
--
-- NOTE CONCERNING TEST SUITE ADAPTATION
-- -------------------------------------
--
-- OGC recognizes that many products will have to adapt this test suite to
-- make it work properly. OGC has documented the allowable adaptations within
-- this test suite where possible. Other information about adaptations may be
-- discovered in the Test Suite Guidelines document for this test suite.
-- 
-- PLEASE NOTE THE OGC REQUIRES THAT ADAPTATIONS ARE FULLY DOCUMENTED USING
-- LIBERAL COMMENT BLOCKS CONFORMING TO THE FOLLOWING FORMAT:
--
-- -- !#@ ADAPTATION BEGIN 
-- explanatory text goes here
-- ---------------------
-- -- BEGIN ORIGINAL SQL
-- ---------------------
-- original sql goes here
-- ---------------------
-- -- END   ORIGINAL SQL
-- ---------------------
-- -- BEGIN ADAPTED  SQL
-- ---------------------
-- adated sql goes here
-- ---------------------
-- -- END   ADAPTED  SQL
-- ---------------------
-- -- !#@ ADAPTATION END 
--
--//////////////////////////////////////////////////////////////////////////////
--
-- BEGIN TEST SUITE CODE
--
--//////////////////////////////////////////////////////////////////////////////
--
--================================
-- Conformance Item B1	
-- GEOMETRY_COLUMNS table/view is created/updated properly	
-- For this test we will check to see that all of the feature tables are 
-- represented by entries in the GEOMETRY_COLUMNS table/view
--
-- ANSWER: lakes, road_segments, divided_routes, buildings, buildings,
--         forests, bridges, named_places, streams, ponds, map_neatlines	
--
--================================
--
SELECT f_table_name
FROM geometry_columns;
--
--
--================================
-- Conformance Item B2	
-- GEOMETRY_COLUMNS table/view is created/updated properly	
-- For this test we will check to see that all of the geometry tables are 
-- represented by entries in the GEOMETRY_COLUMNS table/view
--
-- ANSWER: lake_geom, road_segment_geom, divided_route_geom, forest_geom, 
--         bridge_geom, stream_geom, building_pt_geom, building_area_geom, 
--         pond_geom, named_place_geom, map_neatline_geom	
--
--================================
--
SELECT g_table_name
FROM geometry_columns;
--
--
--================================
-- Conformance Item B3	
-- GEOMETRY_COLUMNS table/view is created/updated properly	
-- For this test we will check to see that the correct storage type for the 
-- streams table is represented in the GEOMETRY_COLUMNS table/view
--
-- ANSWER: 1	
--
--================================
--
SELECT storage_type
FROM geometry_columns
WHERE f_table_name = 'streams';
--
--
--================================
-- Conformance Item B4	
-- GEOMETRY_COLUMNS table/view is created/updated properly	
-- For this test we will check to see that the correct geometry type for the 
-- streams table is represented in the GEOMETRY_COLUMNS table/view
--
-- ANSWER: 3 (which corresponds to linestring)	
--
--================================
--
SELECT geometry_type
FROM geometry_columns
WHERE f_table_name = 'streams';
--
--
--================================
-- Conformance Item B5	
-- GEOMETRY_COLUMNS table/view is created/updated properly	
-- For this test we will check to see that the correct coordinate dimension 
-- for the streams table is represented in the GEOMETRY_COLUMNS table/view
--
-- ANSWER: 2	
--
--================================
--
SELECT coord_dimension
FROM geometry_columns
WHERE f_table_name = 'streams';
--
--
--================================
-- Conformance Item B6	
-- GEOMETRY_COLUMNS table/view is created/updated properly	
-- For this test we will check to see that the correct value of srid for 
-- the streams table is represented in the GEOMETRY_COLUMNS table/view
--
-- ANSWER: 101	
--
--================================
--
SELECT srid
FROM geometry_columns
WHERE f_table_name = 'streams';
--
--
--================================
-- Conformance Item B7
-- SPATIAL_REF_SYS table/view is created/updated properly
-- For this test we will check to see that the correct value of srtext is 
-- represented in the SPATIAL_REF_SYS table/view
--
-- ANSWER: 'PROJCS["UTM_ZONE_14N", GEOGCS["World Geodetic System 72", 
--           DATUM["WGS_72",  SPHEROID["NWL_10D", 6378135, 298.26]], 
--           PRIMEM["Greenwich", 0], UNIT["Meter", 1.0]], 
--           PROJECTION["Transverse_Mercator"], PARAMETER["False_Easting", 500000.0], 
--           PARAMETER["False_Northing", 0.0], PARAMETER["Central_Meridian", -99.0], 
--           PARAMETER["Scale_Factor", 0.9996], PARAMETER["Latitude_of_origin", 0.0], 
--           UNIT["Meter", 1.0]]'	
--
--================================
--
SELECT srtext
FROM SPATIAL_REF_SYS
WHERE SRID = 101;
--
-- END sqlbque.sql
