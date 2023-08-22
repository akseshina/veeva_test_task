SELECT 
	COUNT(DISTINCT publication_id) AS unique_publications,
	COUNT(DISTINCT author_id) AS unique_authors 
FROM 
	author_publication
;