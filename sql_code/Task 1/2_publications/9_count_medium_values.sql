SELECT 
    journal_medium, 
    COUNT(*) AS count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM publications), 1) as percent
FROM 
	publications
GROUP BY 
    journal_medium 
ORDER BY 
    count DESC;