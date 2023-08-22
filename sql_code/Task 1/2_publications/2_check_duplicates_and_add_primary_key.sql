SELECT 
	publication_id, COUNT(*)
FROM 
	publications
GROUP BY 
	publication_id
HAVING 
	COUNT(*) > 1
;

ALTER TABLE publications ADD PRIMARY KEY (publication_id);