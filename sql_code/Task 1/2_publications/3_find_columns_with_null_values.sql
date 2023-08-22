SELECT 
	key AS COLUMN,
    COUNT(*) AS null_values_count,
	ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM publications), 2) as nulls_values_percent
FROM 
	publications AS t
CROSS JOIN 
	jsonb_each_text(to_jsonb(t))
WHERE 
	value IS NULL
GROUP BY 
	key
;