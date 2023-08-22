SELECT 
    t.*, a.first_name, a.last_name, p.web_source, p.title
FROM 
    author_publication AS t
	
INNER JOIN (
    SELECT 
        publication_id, author_id
    FROM 
        author_publication
    GROUP BY 
        publication_id, author_id
    HAVING 
        COUNT(*) > 1
	) AS duplicates
ON 
    t.publication_id = duplicates.publication_id AND t.author_id = duplicates.author_id
	
LEFT JOIN
	authors AS a
ON 
	t.author_id = a.author_id

LEFT JOIN
	publications AS p
ON 
	t.publication_id = p.publication_id
	
ORDER BY 
    t.publication_id, t.author_id;