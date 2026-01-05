# Library-Management-System-Project
A fully normalized PostgreSQL database designed for a Library Management System, implemented using pgAdmin 4. This project follows all five normal forms (1NF through 5NF) and supports core library operations such as book cataloging, member registration, borrowing, returns, and fine management.

# Features
Complete normalization (1NF, 2NF, 3NF, BCNF, 4NF, 5NF)
Referential integrity with foreign key constraints
Data validation using CHECK constraints
Indexed columns for optimized query performance
Full CRUD operations demonstrated
Ready-to-run SQL scripts

# Database Schema
Core Tables (8 Entities) Publisher – Publishing company details
Author – Book authors
Book – Main catalog with ISBN, title, price, and available copies
Book_Author – Many-to-many relationship between books and authors
Reader – Library members (first, middle, last name, contact info)
Staff – Library employees with login credentials
Book_Loan – Tracks borrowing transactions and due dates
Fine – Manages overdue penalties

# Normalization Highlights
1NF Atomic values only
No composite or repeating attributes
2NF Single-column primary keys (SERIAL)
No partial dependencies
3NF Extracted Author entity to remove transitive dependency
Junction table for many-to-many relationships
BCNF, 4NF, 5NF Single determinant per table
Lossless decomposition maintained
No multi-valued dependencies

# Installation & Usage
Install PostgreSQL and pgAdmin 4
Create a new database
Run the provided SQL script to create all tables and constraints
Execute sample transactions (see below)

# Sample Transactions
Borrow a book:
Ali Khan borrowed "The Kite Runner" (ISBN: 9780143034902)
Available copies decreased from 5 → 4
Loan record created with 14-day due date
Overdue fine issued:
Sara Ahmed borrowed "Harry Potter" (overdue)
Fine: PKR 120 for 6 days late
Available copies decreased from 10 → 9
Return a book:
Ali returned his book
Loan status updated to Returned
Available copies increased back to 5

# Project Objectives Achieved
Fully normalized database (1NF–5NF)
Enforced referential integrity
Data validation through constraints
Optimized performance with indexing
Clear documentation and ER diagrams
Production-ready design

# Conclusion
This Library Management System database is a practical implementation of advanced relational database design principles. It balances academic rigor (normalization proofs) with real-world usability, supporting all essential library operations with integrity, efficiency, and scalability.
