SELECT 
    language, title, journal_title, citation_count
FROM 
    publications
WHERE
	language != 'ENG'
ORDER BY 
	language, journal_title
;