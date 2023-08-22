-- Check for duplicate author_id
SELECT author_id, COUNT(*)
FROM authors
GROUP BY author_id
HAVING COUNT(*) > 1;

ALTER TABLE authors ADD PRIMARY KEY (author_id);

-- Check for rows where first_name or last_name are empty or NULL
SELECT *
FROM authors
WHERE 
	first_name = '' OR 
	first_name IS NULL OR 
	last_name = '' OR 
	last_name IS NULL
;