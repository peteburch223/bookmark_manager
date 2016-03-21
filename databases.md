Flat filing systems
===================




NoSQL
=====
- different types
  - key-value stores
  - document databases
  - wide-columned stores
  - graph
- highly horizontally scalable
- readily distributed
- adapted to Agile development
- data-agnostic, flexible
- lack of standardised access language - dbs provide API

SQL
===
- table-based
- Highly structured, predefined schema
- sophisticated standard query language
- good for complex queries
- limits to vertical scalability and distributivity
- ACID operation guarantees aspects of operation
- structure facilitates joining data


SQL
===
Structured Query Language - special purpose language for managing data held in an RDBMS
- data definition Language: defines data structures
  - CREATE, DROP, ALTER, RENAME
- data manipulation Language
  - INSERT, SELECT, UPDATE, DELETE
- data control language: controls access
  - GRANT, REVOKE



CRUD
====
Acronym for the four basic functions of persistent storage.

C: Create
---------
INSERT INTO <table> (<columns>) VALUES (<values>)

R: Read / Retrieve
------------------
SELECT <columns> FROM <table> WHERE <field> = <test_value>

U: Update
---------
UPDATE <table> SET <column> = <value> [,<column> = <value>...]

D: Delete
---------
DELETE FROM <table> WHERE <column> = <value>
