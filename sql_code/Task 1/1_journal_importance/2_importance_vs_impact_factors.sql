WITH 

journal_importance_without_dublicates AS (
	SELECT 
		issn, importance
	FROM 
		journal_importance
	WHERE issn NOT IN (
		SELECT issn
		FROM journal_importance
		GROUP BY issn
		HAVING COUNT(issn) > 1
	)
),
	
joined_data AS (
    SELECT 
        a.importance,
        CAST(b."2023_JCR" AS FLOAT) AS jcr_2023_float,
        CAST(b."2022_JCR" AS FLOAT) AS jcr_2022_float
    FROM 
        journal_importance_without_dublicates AS a
    LEFT JOIN
        journals_jcr AS b
    ON
        a.issn = b.eissn
    WHERE
        (b."2023_JCR" IS NOT NULL AND b."2023_JCR" != 'N/A') AND
        (b."2022_JCR" IS NOT NULL AND b."2022_JCR" != 'N/A')
),
	
medians_for_importances AS (
    SELECT
        importance,
		COUNT(*) AS cnt_journals,
        (PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY jcr_2022_float)::numeric(10,2)) AS median_2022_impact_factors,
        (PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY jcr_2023_float)::numeric(10,2)) AS median_2023_impact_factors
    FROM
        joined_data
    GROUP BY
        importance
)
	
SELECT * FROM medians_for_importances ORDER BY importance DESC;
