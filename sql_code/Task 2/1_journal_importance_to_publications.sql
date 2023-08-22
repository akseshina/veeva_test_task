ALTER TABLE publications ADD COLUMN journal_importance INT;

UPDATE 
	publications AS p
SET 
	journal_importance = ji.importance
FROM 
	journal_importance AS ji
WHERE 
	p.issn = ji.issn
;

SELECT 
	journal_importance,
	COUNT(*) as count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM publications), 2) as percent
FROM 
	publications
GROUP BY 
    journal_importance
ORDER BY
	journal_importance
;