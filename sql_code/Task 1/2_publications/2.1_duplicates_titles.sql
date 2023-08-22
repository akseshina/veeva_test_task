SELECT 
	title,
	publication_date,
	issn,
	journal_title,
	citation_count
FROM 
	publications
WHERE 
	title IN (
		SELECT title
		FROM publications
		GROUP BY title
		HAVING COUNT(*) > 1
	)
ORDER BY 
	title, publication_date
;