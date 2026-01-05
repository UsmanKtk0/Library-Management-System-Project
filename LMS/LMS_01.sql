-- ============================================
       -- LIBRARY MANAGEMENT SYSTEM -
-- ============================================

-- Table 1: Publisher
CREATE TABLE Publisher (
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    country VARCHAR(50)
);

-- Table 2: Author
CREATE TABLE Author (
    author_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    country VARCHAR(50)
);

-- Table 3: Book
CREATE TABLE Book (
    isbn VARCHAR(13) PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    publisher_id INTEGER NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0),
    publication_year INTEGER,
    total_copies INTEGER DEFAULT 1 CHECK (total_copies >= 0),
    available_copies INTEGER DEFAULT 1 CHECK (available_copies >= 0),
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id),
    CHECK (available_copies <= total_copies)
);

-- Table 4: Book_Author (connects books with authors - many-to-many)
CREATE TABLE Book_Author (
    isbn VARCHAR(13) NOT NULL,
    author_id INTEGER NOT NULL,
    PRIMARY KEY (isbn, author_id),
    FOREIGN KEY (isbn) REFERENCES Book(isbn) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Table 5: Reader
CREATE TABLE Reader (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    registration_date DATE DEFAULT CURRENT_DATE
);

-- Table 6: Staff
CREATE TABLE Staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    position VARCHAR(100),
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- Table 7: Book_Loan (tracks who borrowed which book)
CREATE TABLE Book_Loan (
    loan_id SERIAL PRIMARY KEY,
    reader_id INTEGER NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    staff_id INTEGER NOT NULL,
    loan_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(20) DEFAULT 'Active' CHECK (status IN ('Active', 'Returned', 'Overdue')),
    FOREIGN KEY (reader_id) REFERENCES Reader(user_id) ON DELETE CASCADE,
    FOREIGN KEY (isbn) REFERENCES Book(isbn),
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    CHECK (due_date > loan_date)
);

-- Table 8: Fine
CREATE TABLE Fine (
    fine_id SERIAL PRIMARY KEY,
    reader_id INTEGER NOT NULL,
    loan_id INTEGER,
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    reason TEXT NOT NULL,
    fine_date DATE DEFAULT CURRENT_DATE,
    paid BOOLEAN DEFAULT FALSE,
    payment_date DATE,
    FOREIGN KEY (reader_id) REFERENCES Reader(user_id) ON DELETE CASCADE,
    FOREIGN KEY (loan_id) REFERENCES Book_Loan(loan_id)
);

-- Create indexes for faster searching
CREATE INDEX idx_book_publisher ON Book(publisher_id);
CREATE INDEX idx_book_title ON Book(LOWER(title));
CREATE INDEX idx_loan_reader ON Book_Loan(reader_id);
CREATE INDEX idx_loan_book ON Book_Loan(isbn);
CREATE INDEX idx_loan_status ON Book_Loan(status);
CREATE INDEX idx_fine_reader ON Fine(reader_id);
CREATE INDEX idx_fine_unpaid ON Fine(paid) WHERE paid = FALSE;

-- Success message
DO $$
BEGIN
    RAISE NOTICE 'Database created successfully! 8 tables and 7 indexes created.';
END $$;
