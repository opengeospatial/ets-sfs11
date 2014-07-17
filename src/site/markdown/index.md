# SFS 1.1 Conformance Test Suite

## Scope

Verifies conformance to _OpenGIS Simple Features Specification For SQL,
Revision 1.1_ (OGC 99-049, 1999-05-09)[1]. Three conformance classes are
described in the testing guidance document (see OGC 98-046r2):

  1. SQL 92 Implementation of Feature Tables, Normalized Geometry Schema - SFS (NG)
  2. SQL 92 Implementation of Feature Tables, Binary Geometry Schema - SFS (BG)
  3. SQL 92 with Geometry Types and Functions Implementation of Feature Tables - SFS (TF)

Test suite software [is available (ZIP
archive)](http://portal.opengeospatial.org/files/?artifact_id=16317) for each
of the above alternatives as a set of SQL scripts and as C source code.
Implementers may select either form of test suite for adaptation and testing.

## Test requirements

The documents listed below stipulate requirements that must be satisfied by a
conforming implementation.

  * [OGC-99-049] [OpenGIS Simple Features Specification For SQL, Revision 1.1](http://portal.opengeospatial.org/files/?artifact_id=829)
  * [OGC-98-046r2] [Conformance Test Guidelines for OpenGIS Simple Features Specification for SQL, Revision 1.1](http://portal.opengeospatial.org/files/?artifact_id=7587)

## Release notes

### r3 (2013-11-06)

  * Changed local name of suite to 'sfs-1.1-suite'.

### r2 (2013-09-12)

  * Updated submission information.

### r1 (2013-07-09)

  * Initial release in TEAM Engine.

* * *

[1] Superseded by _OpenGIS Implementation Standard for Geographic information
- Simple feature access - Part 2: SQL option_ ([OGC
06-104r4](http://portal.opengeospatial.org/files/?artifact_id=25354), also
published as ISO 19125-2).

