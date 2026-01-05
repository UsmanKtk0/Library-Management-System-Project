SELECT 
    b.isbn,
    b.title,
    a.name AS author,
    p.name AS publisher,
    b.available_copies || '/' || b.total_copies AS copies,
    b.price
FROM Book b
JOIN Publisher p ON b.publisher_id = p.publisher_id
JOIN Book_Author ba ON b.isbn = ba.isbn
JOIN Author a ON ba.author_id = a.author_id
ORDER BY b.title;
