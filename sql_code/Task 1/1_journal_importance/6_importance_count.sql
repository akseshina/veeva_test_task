SELECT 
    importance,                 
    COUNT(*) AS count_values    
FROM 
    journal_importance         
GROUP BY 
    importance                   
ORDER BY 
    importance DESC
;  