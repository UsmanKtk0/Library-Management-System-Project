SELECT 
    r.first_name || ' ' || r.last_name AS reader_name,
    r.email,
    f.amount,
    f.reason,
    f.fine_date
FROM Fine f
JOIN Reader r ON f.reader_id = r.user_id
WHERE f.paid = FALSE
ORDER BY f.fine_date;
