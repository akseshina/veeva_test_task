SELECT 
    ap.author_id,
    a.first_name,
    a.last_name,
    ROUND(SUM(ap.publication_score) * 10) / 10 AS author_score,
    COUNT(ap.publication_id) AS number_of_publications,
    MAX(ap.citation_count) AS max_citation_count
FROM 
    author_publication AS ap
JOIN 
    authors AS a ON ap.author_id = a.author_id
GROUP BY 
    ap.author_id, a.first_name, a.last_name
ORDER BY 
    author_score DESC
;