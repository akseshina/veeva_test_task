WITH publications_of_author AS (
    SELECT 
        author_id,
        COUNT(*) AS num_publications
    FROM
        author_publication
    GROUP BY
        author_id
)

SELECT 
    COUNT(author_id) AS num_authors,
    ROUND(AVG(num_publications), 1) AS average_publications,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY num_publications) AS median_publications,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY num_publications) AS q1_publications,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY num_publications) AS q3_publications,
	MIN(num_publications) AS min_publications,
	MAX(num_publications) AS max_publications
FROM
    publications_of_author
;