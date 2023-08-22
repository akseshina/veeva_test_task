WITH binned AS (
    SELECT
        CASE 
            WHEN citation_count IS NULL THEN 'Null'
            WHEN citation_count < 11 THEN CAST(citation_count AS TEXT)
            WHEN citation_count BETWEEN 11 AND 100 THEN '11-100'
            WHEN citation_count BETWEEN 101 AND 1000 THEN '101-1000'
            ELSE '>1000'
        END AS citation_count_bin
    FROM
        publications
)

SELECT 
    citation_count_bin,
    COUNT(*) AS count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM publications), 1) as percent
FROM 
    binned
GROUP BY 
    citation_count_bin
ORDER BY
	CASE 
        WHEN citation_count_bin = 'Null' THEN 14
        WHEN citation_count_bin = '>1000' THEN 13
        WHEN citation_count_bin = '101-1000' THEN 12
        WHEN citation_count_bin = '11-100' THEN 11
        WHEN citation_count_bin = '10' THEN 10
    	ELSE 9
	END,
	citation_count_bin
;