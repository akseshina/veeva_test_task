WITH multiple_titles_or_medium AS (
    SELECT 
        issn
    FROM 
        publications
    GROUP BY 
        issn
    HAVING 
        COUNT(DISTINCT journal_title) > 1 OR COUNT(DISTINCT journal_medium) > 1
)

SELECT DISTINCT
    p.issn, p.journal_title, p.journal_medium,
	COUNT(*) AS count
FROM 
    publications AS p
RIGHT JOIN 
    multiple_titles_or_medium AS m
ON 
    p.issn = m.issn
GROUP BY
	p.issn, p.journal_title, p.journal_medium
ORDER BY
    p.issn, p.journal_title, count DESC
;