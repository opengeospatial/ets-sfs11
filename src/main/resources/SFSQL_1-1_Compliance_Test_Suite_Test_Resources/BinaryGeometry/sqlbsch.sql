-- FILE: sqlbsch.sql 1/01/98
--
--       1         2         3         4         5         6         7         8
--345678901234567890123456789012345678901234567890123456789012345678901234567890
--//////////////////////////////////////////////////////////////////////////////
--
-- Copyright 1998, Open GIS Consortium, Inc.
--
-- The material is licensed under the Apache License, Version 2.0 (the "License"). 
-- You may obtain a copy of the License from http://opensource.org/licenses/Apache-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software distributed 
-- under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR 
-- CONDITIONS OF ANY KIND, either express or implied. See the License for the specific 
-- language governing permissions and limitations under the License.
--
--//////////////////////////////////////////////////////////////////////////////
--
-- OpenGIS Simple Features for SQL (Binary Geometry) Test Suite Software
-- 
-- This file "sqlbsch.sql" is part 1 of a two part standardized test
-- suite in SQL script form. The other file that is required for this test
-- suite, "sqlbque.sql", and other documents that describe the OGC
-- Conformance Test Program are available via the WWW at 
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
-- Create the neccessary feature and geometry tables(views) and metadata tables
-- (views) to load and query the "Blue Lake" test data for OpenGIS Simple 
-- Features for SQL (Normalized Geometry) test.
-- 
-- Required feature tables (views) are:
--                        Lakes 
--                        Road Segments
--                        Divided Routes
--                        Buildings
--                        Forests
--                        Bridges
--                        Named Places 
--                        Streams 
--                        Ponds
--                        Map Neatlines
--
-- Please refer to the Test Suite Guidelines for this test suite for further
-- information concerning this test data.
--
--//////////////////////////////////////////////////////////////////////////////
--
--
--
--//////////////////////////////////////////////////////////////////////////////
--
-- CREATE SPATIAL_REF_SYS METADATA TABLE
--
--//////////////////////////////////////////////////////////////////////////////
--
--
-- *** ADAPTATION ALERT ****
-- Implementations do not need to execute this statement if they already
-- create the spatial_ref_sys table or view via another mechanism.
--
CREATE TABLE spatial_ref_sys (
       srid       INTEGER NOT NULL PRIMARY KEY,
       auth_name  VARCHAR(256),
       auth_srid  INTEGER,
--
-- *** ADAPTATION ALERT ***
-- The size of this VARCHAR exceeds that allowed on some systems.
--
--       srtext     VARCHAR(2048)
       srtext     VARCHAR(2000)
);
--
INSERT INTO spatial_ref_sys VALUES(101, 'POSC', 32214, 
'PROJCS["UTM_ZONE_14N", GEOGCS["World Geodetic System 72",
DATUM["WGS_72",  SPHEROID["NWL_10D", 6378135, 298.26]],
PRIMEM["Greenwich", 0], UNIT["Meter", 1.0]],
PROJECTION["Transverse_Mercator"],
PARAMETER["False_Easting", 500000.0],
PARAMETER["False_Northing", 0.0],
PARAMETER["Central_Meridian", -99.0],
PARAMETER["Scale_Factor", 0.9996],
PARAMETER["Latitude_of_origin", 0.0],
UNIT["Meter", 1.0]]'
);
--
--
--
--
--//////////////////////////////////////////////////////////////////////////////
--
-- CREATE GEOMETRY_COLUMNS METADATA TABLE
--
--//////////////////////////////////////////////////////////////////////////////
--
-- *** ADAPTATION ALERT ****
-- Implementations do not need to execute this statement if they already
-- create the geometry_columns table or view via another mechanism.
--
--
CREATE TABLE geometry_columns (
-- *** ADAPTATION ALERT ****
-- Implementations that use the third level of name resolution, "catalogs", 
-- should uncomment the following line.
--     f_catalog_name    VARCHAR(256),
--
-- *** ADAPTATION ALERT ****
-- Implementations that use the second level of name resolution, "schema", 
-- should uncomment the following line.
--     f_table_schema    VARCHAR(256),
--
       f_table_name      VARCHAR(256),
       f_geometry_column VARCHAR(256),
--
-- *** ADAPTATION ALERT ****
-- Implementations that use the third level of name resolution, "catalogs", 
-- should uncomment the following line.
--     g_catalog_name    VARCHAR(256),
--
-- *** ADAPTATION ALERT ****
-- Implementations that use the second level of name resolution, "schema", 
-- should uncomment the following line.
--     g_table_schema    VARCHAR(256),
       g_table_name      VARCHAR(256),
       storage_type      INTEGER,
       geometry_type     INTEGER,
       coord_dimension   INTEGER,
       max_ppr           INTEGER,
       srid              INTEGER REFERENCES spatial_ref_sys,
--
-- *** ADAPTATION ALERT ****
-- Implementations that use the third level of name resolution, "catalogs", 
-- should uncomment the following line and comment out the other two.
--     CONSTRAINT gc_pk PRIMARY KEY (f_catalog_name, f_table_schema, f_table_name, f_geometry_column)
--
-- *** ADAPTATION ALERT ****
-- Implementations that use the second level of name resolution, "schema", 
-- should uncomment the following line and comment out the next line.
--     CONSTRAINT gc_pk PRIMARY KEY (f_table_schema, f_table_name, f_geometry_column)
       CONSTRAINT gc_pk PRIMARY KEY (f_table_name, f_geometry_column)
);
--
--//////////////////////////////////////////////////////////////////////////////
--
-- CREATE GEOMETRY SCHEMA
--
--//////////////////////////////////////////////////////////////////////////////
--
--------------------------------------------------------------------------------
--
-- Create geometry tables
--
-- *** ADAPTATION ALERT ****
-- Implementations may need to replace VARBINARY with their Blob type
--------------------------------------------------------------------------------
--
-- Lake Geometry
--
--
--
--
CREATE TABLE lake_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Road Segment Geometry
--
--
--
--
CREATE TABLE road_segment_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Divided Route Geometry
--
--
--
--
CREATE TABLE divided_route_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Forest Geometry
--
--
--
--
CREATE TABLE forest_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Bridge Geometry
--
--
--
--
CREATE TABLE bridge_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Stream Geometry
--
--
--
--
CREATE TABLE stream_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Bulding Point Geometry
--
--
--
--
CREATE TABLE building_pt_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Bulding Area Geometry
--
--
--
--
CREATE TABLE building_area_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Pond Geometry
--
--
--
--
CREATE TABLE pond_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Named Place Geometry
--
--
--
--
CREATE TABLE named_place_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
-- Map Neatline Geometry
--
--
--
--
CREATE TABLE map_neatline_geom (
       gid          INTEGER NOT NULL PRIMARY KEY,
       xmin         INTEGER,
       ymin         INTEGER,
       xmax         INTEGER,
       ymax         INTEGER,
       wkbgeometry  VARBINARY
);
--
--
--
--//////////////////////////////////////////////////////////////////////////////
--
--                        CREATE FEATURE SCHEMA
--
--//////////////////////////////////////////////////////////////////////////////
--
--------------------------------------------------------------------------------
--
-- Create feature tables
-- NOTE: The first column of each of the following feature tables is
-- the "fid" as defined in the specification. The columns ending in _gid
-- are geometric attributes.
--
--------------------------------------------------------------------------------
--
-- Lakes
--
--
--
--
CREATE TABLE lakes (
       fid               INTEGER NOT NULL PRIMARY KEY,
       name              VARCHAR(64),
       shore_gid         INTEGER
);
--
-- Road Segments
--
--
--
--
CREATE TABLE road_segments (
       fid               INTEGER NOT NULL PRIMARY KEY,
       name              VARCHAR(64),
       aliases           VARCHAR(64),
       num_lanes         INTEGER,
       centerline_gid    INTEGER
);
--
-- Divided Routes
--
--
--
--
CREATE TABLE divided_routes (
       fid               INTEGER NOT NULL PRIMARY KEY,
       name              VARCHAR(64),
       num_lanes         INTEGER,
       centerlines_gid   INTEGER
);
--
-- Forests
--
--
--
--
CREATE TABLE forests (
       fid            INTEGER NOT NULL PRIMARY KEY,
       name           VARCHAR(64),
       boundary_gid   INTEGER
);
--
-- Bridges
--
--
--
--
CREATE TABLE bridges (
       fid           INTEGER NOT NULL PRIMARY KEY,
       name          VARCHAR(64),
       position_gid  INTEGER
);
--
-- Streams
--
--
--
--
CREATE TABLE streams (
       fid             INTEGER NOT NULL PRIMARY KEY,
       name            VARCHAR(64),
       centerline_gid  INTEGER
);
--
-- Buildings
--
--
--
--
CREATE TABLE buildings (
       fid             INTEGER NOT NULL PRIMARY KEY,
       address         VARCHAR(64),
       position_gid    INTEGER,
       footprint_gid   INTEGER
);
--
-- Ponds
--
--
--
--
CREATE TABLE ponds (
       fid             INTEGER NOT NULL PRIMARY KEY,
       name            VARCHAR(64),
       type            VARCHAR(64),
       shores_gid      INTEGER
);
--
-- Named Places
--
--
--
--
CREATE TABLE named_places (
       fid             INTEGER NOT NULL PRIMARY KEY,
       name            VARCHAR(64),
       boundary_gid    INTEGER
);
--
-- Map Neatline
--
--
--
--
CREATE TABLE map_neatlines (
       fid             INTEGER NOT NULL PRIMARY KEY,
       neatline_gid    INTEGER
);
--
--
--
--//////////////////////////////////////////////////////////////////////////////
--
-- POPULATE GEOMETRY AND FEATURE TABLES
--
-- *** ADAPTATION ALERT ****
-- Implementations should replace HEXTOVARBINARY with their implementation
-- of a hexidecimal to Blob conversion. NOTE: The hexidecimal strings in this
-- test are as follows:
--    Each character is 4 bits of the WKB representation. For example, for the
--    building point gid 102, the hex representation is:
--        010100000000000000000050400000000000804040
--    The first two character make up the byteorder byte. Which is 01 - NDR
--    The second eight characters make up the wkb type bytes. These are
--        01000000 which (when reordered to big endian) is 00000001 - WKBPOINT
--    And so on...
--    We have provided some utilities for generating hex representation from
--    WKT format at the Conformance Testing Web Site. Simply modify the code
--    to generate the appropriate hex encoding for your products. You may
--    also contact Kurt Buehler (kurt@opengeospatial.org) for help with this.
--//////////////////////////////////////////////////////////////////////////////
--
--==============================================================================
-- Lakes
--
-- We have one lake, Blue Lake. It is a polygon with a hole. Its geometry is
-- described in WKT format as:
--   'POLYGON( (52 18, 66 23, 73  9, 48  6, 52 18), 
--             (59 18, 67 18, 67 13, 59 13, 59 18) )'
--==============================================================================
--
INSERT INTO lake_geom VALUES(101, 48.0, 6.0, 73.0, 23.0, 
     HEXTOVARBINARY('010300000002000000050000000000000000004a4000000000000032400000000000805040000000000000374000000000004052400000000000002240000000000000484000000000000018400000000000004a400000000000003240050000000000000000804d4000000000000032400000000000c0504000000000000032400000000000c050400000000000002a400000000000804d400000000000002a400000000000804d400000000000003240');
--
INSERT INTO lakes VALUES (101, 'BLUE LAKE', 101);
--
--==================
-- Road segments
--
-- We have five road segments. Their geometries are all linestrings.
-- The geometries are described in WKT format as:
--  name 'Route 5', fid 102
--   'LINESTRING( 0 18, 10 21, 16 23, 28 26, 44 31 )'
--  name 'Route 5', fid 103
--   'LINESTRING( 44 31, 56 34, 70 38 )' 
--  name 'Route 5', fid 104
--   'LINESTRING( 70 38, 72 48 )' 
--  name 'Main Street', fid 105
--   'LINESTRING( 70 38, 84 42 )' 
--  name 'Dirt Road by Green Forest', fid 106
--   'LINESTRING( 28 26, 28 0 )'
--
--==================
--
INSERT INTO road_segment_geom VALUES (101, 0.0, 18.0, 44.0, 31.0, 
     HEXTOVARBINARY('0102000000050000000000000000000000000000000000324000000000000024400000000000003540000000000000304000000000000037400000000000003c400000000000003a4000000000000046400000000000003f40');
INSERT INTO road_segment_geom VALUES (102, 44.0, 31.0, 70.0, 38.0,
     HEXTOVARBINARY('01020000000300000000000000000046400000000000003f400000000000004c40000000000000414000000000008051400000000000004340');
INSERT INTO road_segment_geom VALUES (103, 70.0, 38.0, 72.0, 48.0,
     HEXTOVARBINARY('0102000000020000000000000000805140000000000000434000000000000052400000000000004840');
INSERT INTO road_segment_geom VALUES (104, 70.0, 38.0, 84.0, 42.0,
     HEXTOVARBINARY('0102000000020000000000000000805140000000000000434000000000000055400000000000004540');
INSERT INTO road_segment_geom VALUES (105, 28.0, 0.0, 28.0, 26.0,
     HEXTOVARBINARY('0102000000020000000000000000805140000000000000434000000000000055400000000000004540');
--
INSERT INTO road_segments VALUES(102, 'Route 5', NULL, 2, 101);
INSERT INTO road_segments VALUES(103, 'Route 5', 'Main Street', 4, 102);
INSERT INTO road_segments VALUES(104, 'Route 5', NULL, 2, 103);
INSERT INTO road_segments VALUES(105, 'Main Street', NULL, 4, 104);
INSERT INTO road_segments VALUES(106, 'Dirt Road by Green Forest', NULL, 1, 105);                                    
--
--==================
-- DividedRoutes
--
-- We have one divided route. Its geometry is a multilinestring.
-- The geometry is described in WKT format as:
--   'MULTILINESTRING( (10 48, 10 21, 10 0), (16 0, 10 23, 16 48) )'
--
--==================
--
INSERT INTO divided_route_geom VALUES(101, 10.0, 0.0, 16.0, 48.0,
     HEXTOVARBINARY('010500000002000000010200000003000000000000000000244000000000000048400000000000002440000000000000354000000000000024400000000000000000010200000003000000000000000000304000000000000000000000000000002440000000000000374000000000000030400000000000004840');
--
INSERT INTO divided_routes VALUES(119, 'Route 75', 4, 101);
--
--==================
-- Forests
--
-- We have one forest. Its geometry is a multipolygon.
-- The geometry is described in WKT format as:
--   'MULTIPOLYGON( ( (28 26, 28 0, 84 0, 84 42, 28 26), 
--                    (52 18, 66 23, 73 9, 48 6, 52 18) ), 
--                  ( (59 18, 67 18, 67 13, 59 13, 59 18) ) )'
--
--==================
--
INSERT INTO forest_geom VALUES(101, 28.0, 0.0, 84.0, 42.0,
     HEXTOVARBINARY('010600000002000000010300000002000000050000000000000000003c400000000000003a400000000000003c40000000000000000000000000000055400000000000000000000000000000554000000000000045400000000000003c400000000000003a40050000000000000000004a4000000000000032400000000000805040000000000000374000000000004052400000000000002240000000000000484000000000000018400000000000004a400000000000003240010300000001000000050000000000000000804d4000000000000032400000000000c0504000000000000032400000000000c050400000000000002a400000000000804d400000000000002a400000000000804d400000000000003240');
--
INSERT INTO forests VALUES(109, 'Green Forest', 101);
--
--==================
-- Bridges
--
-- We have one bridge. Its geometry is a point.
-- The geometry is described in WKT format as:
--   'POINT( 44 31 )'
--
--==================
--
INSERT INTO bridge_geom VALUES(101, 44.0, 31.0, 44.0, 31.0, 
     HEXTOVARBINARY('010100000000000000000046400000000000003f40');
--
INSERT INTO bridges VALUES(110, 'Cam Bridge', 101);
--
--==================
-- Streams
--
-- We have two streams. Their geometries are linestrings.
-- The geometries are described in WKT format as:
--   'LINESTRING( 38 48, 44 41, 41 36, 44 31, 52 18 )'
--   'LINESTRING( 76 0, 78 4, 73 9 )'
--
--==================
--
INSERT INTO stream_geom VALUES(101, 38.0, 18.0, 52.0, 48.0,
     HEXTOVARBINARY('01020000000500000000000000000043400000000000004840000000000000464000000000008044400000000000804440000000000000424000000000000046400000000000003f400000000000004a400000000000003240');
INSERT INTO stream_geom VALUES(102, 73.0, 0.0, 78.0, 9.0,
     HEXTOVARBINARY('010200000003000000000000000000534000000000000000000000000000805340000000000000104000000000004052400000000000002240');
--
INSERT INTO streams VALUES(111, 'Cam Stream', 101);
INSERT INTO streams VALUES(112, 'Cam Stream', 102);
--
--==================
-- Buildings
--
-- We have two buildings. Their geometries are points and polygons.
-- The geometries are described in WKT format as:
--  address '123 Main Street' fid 113
--   'POINT( 52 30 )' and
--   'POLYGON( ( 50 31, 54 31, 54 29, 50 29, 50 31) )'
--  address '215 Main Street' fid 114
--   'POINT( 64 33 )' and
--   'POLYGON( ( 66 34, 62 34, 62 32, 66 32, 66 34) )'
--
--==================
--
INSERT INTO building_pt_geom VALUES(101, 52.0, 30.0, 52.0, 30.0,
     HEXTOVARBINARY('01010000000000000000004a400000000000003e40');
INSERT INTO building_pt_geom VALUES(102, 64.0, 33.0, 64.0, 33.0, 
     HEXTOVARBINARY('010100000000000000000050400000000000804040');
INSERT INTO building_area_geom VALUES(101, 50.0, 29.0, 54.0, 31.0,
     HEXTOVARBINARY('0103000000010000000500000000000000000049400000000000003f400000000000004b400000000000003f400000000000004b400000000000003d4000000000000049400000000000003d4000000000000049400000000000003f40');
INSERT INTO building_area_geom VALUES(102, 62.0, 32.0, 66.0, 34.0,
     HEXTOVARBINARY('01030000000100000005000000000000000080504000000000000041400000000000004f4000000000000041400000000000004f4000000000000040400000000000805040000000000000404000000000008050400000000000004140');
--
INSERT INTO buildings VALUES(113, '123 Main Street', 101, 101);
INSERT INTO buildings VALUES(114, '215 Main Street', 102, 102);
--
--==================
-- Ponds
--
-- We have one ponds. Its geometry is a multipolygon.
-- The geometry is described in WKT format as:
--   'MULTIPOLYGON( ( ( 24 44, 22 42, 24 40, 24 44) ), 
--                  ( ( 26 44, 26 40, 28 42, 26 44) ) )'
--
--==================
--
INSERT INTO pond_geom VALUES(101, 22.0, 40.0, 28.0, 44.0,
     HEXTOVARBINARY('0106000000020000000103000000010000000400000000000000000038400000000000004640000000000000364000000000000045400000000000003840000000000000444000000000000038400000000000004640010300000001000000040000000000000000003a4000000000000046400000000000003a4000000000000044400000000000003c4000000000000045400000000000003a400000000000004640');
--
INSERT INTO ponds VALUES(120, NULL, 'Stock Pond', 101);
--
--==================
-- Named Places
--
-- We have two named places. Their geometries are polygons.
-- The geometries are described in WKT format as:
--  name 'Ashton' fid 117
--   'POLYGON( ( 62 48, 84 48, 84 30, 56 30, 56 34, 62 48) )'
--  address 'Goose Island' fid 118
--   'POLYGON( ( 67 13, 67 18, 59 18, 59 13, 67 13) )'
--
--==================
--
INSERT INTO named_place_geom VALUES(101, 56.0, 30.0, 84.0, 48.0,
     HEXTOVARBINARY('010300000001000000060000000000000000004f4000000000000048400000000000005540000000000000484000000000000055400000000000003e400000000000004c400000000000003e400000000000004c4000000000000041400000000000004f400000000000004840');
INSERT INTO named_place_geom VALUES(102, 59.0, 13.0, 67.0, 18.0,
     HEXTOVARBINARY('010300000001000000050000000000000000c050400000000000002a400000000000c0504000000000000032400000000000804d4000000000000032400000000000804d400000000000002a400000000000c050400000000000002a40');
--
INSERT INTO named_places VALUES(117, 'Ashton', 101);
INSERT INTO named_places VALUES(118, 'Goose Island', 102);
--
--==================
-- Map Neatlines
--
-- We have one map neatline. Its geometry is a polygon.
-- The geometry is described in WKT format as:
--   'POLYGON( ( 0 0, 0 48, 84 48, 84 0, 0 0 ) )'
--
--==================
--
INSERT INTO map_neatline_geom VALUES(101, 0.0, 0.0, 84.0, 48.0,
     HEXTOVARBINARY('010300000001000000050000000000000000000000000000000000000000000000000000000000000000004840000000000000554000000000000048400000000000005540000000000000000000000000000000000000000000000000');
--
INSERT INTO map_neatlines VALUES(115, 101);
--
--
--
--//////////////////////////////////////////////////////////////////////////////
--
-- POPULATE GEOMETRY_COLUMNS TABLE
--
--//////////////////////////////////////////////////////////////////////////////
--
-- *** ADAPTATION ALERT **
-- Implementations do not need to execute the following statements if
-- they update the geometry_columns table/view using some other mechanism.
--
INSERT INTO geometry_columns VALUES ('lakes', 'shore_gid', 'lake_geom',
1, 5, 2, 0);
--
INSERT INTO geometry_columns VALUES ('road_segments', 'centerline_gid', 'road_segment_geom',
1, 3, 2, 0);
--
INSERT INTO geometry_columns VALUES ('divided_routes', 'centerlines_gid', 'divided_route_geom',
1, 9, 2, 0);
--
INSERT INTO geometry_columns VALUES ('forests', 'boundary_gid', 'forest_geom',
1, 11, 2, 0);
--
INSERT INTO geometry_columns VALUES ('bridges', 'position_gid', 'bridge_geom',
1, 1, 2, 0);
--
INSERT INTO geometry_columns VALUES ('streams', 'centerline_gid', 'stream_geom',
1, 3, 2, 0);
--
INSERT INTO geometry_columns VALUES ('buildings', 'position_gid', 'building_pt_geom',
1, 1, 2, 0);
--
INSERT INTO geometry_columns VALUES ('buildings', 'footprint_gid', 'building_area_geom',
1, 5, 2, 0);
--
INSERT INTO geometry_columns VALUES ('ponds', 'shores_gid', 'pond_geom',
1, 11, 2, 0);
--
INSERT INTO geometry_columns VALUES ('named_places', 'boundary_gid', 'named_place_geom',
1, 5, 2, 0);
--
INSERT INTO geometry_columns VALUES ('map_neatlines', 'neatline_gid', 'map_neatline_geom',
1, 5, 2, 0);
--
-- END sqlbsch.sql
