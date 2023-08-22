SELECT 
	issn 
FROM 
	journal_importance
WHERE 
	issn !~ '^[0-9]{4}-[0-9]{3}[0-9Xx]$'
;