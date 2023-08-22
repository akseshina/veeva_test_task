SELECT 
    EXTRACT(YEAR FROM publication_date) AS publication_year,
    COUNT(*) as number_of_articles
FROM 
    publications
GROUP BY 
    publication_year
ORDER BY 
    publication_year ASC
;