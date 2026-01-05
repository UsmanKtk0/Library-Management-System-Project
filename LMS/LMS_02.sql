-- Add some publishers
INSERT INTO Publisher (name, country) VALUES
('Penguin Books', 'UK'),
('Oxford Press', 'UK'),
('Liberty Books', 'Pakistan'),
('Paramount Books', 'Pakistan');

-- Add some authors
INSERT INTO Author (name, country) VALUES
('Khaled Hosseini', 'Afghanistan'),
('Mohsin Hamid', 'Pakistan'),
('Bapsi Sidhwa', 'Pakistan'),
('J.K. Rowling', 'UK'),
('Kamila Shamsie', 'Pakistan');

-- Add some books
INSERT INTO Book (isbn, title, publisher_id, price, publication_year, total_copies, available_copies) VALUES
('9780143034902', 'The Kite Runner', 1, 450.00, 2003, 5, 4),
('9780735212527', 'Exit West', 2, 550.00, 2017, 3, 3),
('9780143419269', 'Ice Candy Man', 3, 380.00, 1988, 4, 3),
('9780439708180', 'Harry Potter Book 1', 1, 650.00, 1998, 10, 8),
('9780747538493', 'Burnt Shadows', 3, 420.00, 2009, 3, 2);

-- Connect books with authors
INSERT INTO Book_Author (isbn, author_id) VALUES
('9780143034902', 1),
('9780735212527', 2),
('9780143419269', 3),
('9780439708180', 4),
('9780747538493', 5);

-- Add some readers (library members)
INSERT INTO Reader (first_name, middle_name, last_name, email, phone) VALUES
('Ali', 'Ahmed', 'Khan', 'ali.khan@email.pk', '03001234567'),
('Fatima', NULL, 'Malik', 'fatima.malik@email.pk', '03001234568'),
('Hassan', 'Raza', 'Siddiqui', 'hassan@email.pk', '03001234569'),
('Ayesha', 'Noor', 'Butt', 'ayesha.butt@email.pk', '03001234570');

-- Add staff members
INSERT INTO Staff (first_name, last_name, email, phone, position, username, password) VALUES
('Ahmed', 'Hassan', 'ahmed.hassan@library.pk', '03009876543', 'Head Librarian', 'ahmed', 'pass123'),
('Sara', 'Ali', 'sara.ali@library.pk', '03009876544', 'Assistant Librarian', 'sara', 'pass123'),
('Bilal', 'Khan', 'bilal@library.pk', '03009876545', 'Librarian', 'bilal', 'pass123');

-- Add some book loans
INSERT INTO Book_Loan (reader_id, isbn, staff_id, loan_date, due_date, return_date, status) VALUES
(1, '9780143034902', 1, '2026-01-01', '2026-01-15', NULL, 'Active'),
(2, '9780439708180', 1, '2025-12-20', '2026-01-03', NULL, 'Overdue'),
(3, '9780143419269', 2, '2025-12-28', '2026-01-11', NULL, 'Active'),
(4, '9780747538493', 2, '2025-12-15', '2025-12-29', '2025-12-28', 'Returned');

-- Add a fine for overdue book
INSERT INTO Fine (reader_id, loan_id, amount, reason, paid) VALUES
(2, 2, 40.00, 'Book overdue by 2 days (20 PKR per day)', FALSE);

-- Show summary
SELECT 'Sample data added successfully!' AS message;

