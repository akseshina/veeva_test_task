SELECT 
	journal_title, title, web_source
FROM 
	publications 
WHERE 
	issn = ''
ORDER BY
	journal_title
;