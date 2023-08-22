SELECT 
    language,
    COUNT(*) as count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM publications), 2) as percent
FROM 
    publications
GROUP BY 
    language
ORDER BY 
    count DESC
;