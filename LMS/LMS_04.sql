SELECT 
    bl.loan_id,
    r.first_name || ' ' || r.last_name AS reader_name,
    b.title AS book_title,
    bl.loan_date,
    bl.due_date,
    CASE 
        WHEN bl.due_date < CURRENT_DATE THEN 'OVERDUE'
        ELSE 'ACTIVE'
    END AS loan_status
FROM Book_Loan bl
JOIN Reader r ON bl.reader_id = r.user_id
JOIN Book b ON bl.isbn = b.isbn
WHERE bl.status != 'Returned'
ORDER BY bl.due_date;
