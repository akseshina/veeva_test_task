SELECT 
    position,
    COUNT(*) as count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM publications), 1) as percent
FROM 
    author_publication
GROUP BY 
    position
ORDER BY 
    count DESC
;