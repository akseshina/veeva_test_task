SELECT 
    ROUND(AVG(citation_count), 2) AS average,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY citation_count) AS median,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY citation_count) AS q1,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY citation_count) AS q3,
	MIN(citation_count) AS min,
	MAX(citation_count) AS max
FROM 
    publications
;