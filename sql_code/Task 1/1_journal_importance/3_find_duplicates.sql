SELECT 
	a.*, 
	b."2023_JCR", b."2022_JCR", b."2021_JCR", b."2020_JCR", b."2019_JCR"
FROM 
	journal_importance AS a
LEFT JOIN 
	journals_jcr AS b 
ON 
	a.issn = b.eissn
WHERE 
	a.issn IN (
		SELECT issn
		FROM journal_importance
		GROUP BY issn
		HAVING COUNT(issn) > 1
	)
ORDER BY 
	a.issn
;