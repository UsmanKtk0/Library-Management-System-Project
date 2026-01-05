SELECT 
    title,
    available_copies AS available,
    price
FROM Book
WHERE available_copies > 0
ORDER BY title;
