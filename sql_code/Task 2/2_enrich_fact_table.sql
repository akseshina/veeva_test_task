ALTER TABLE author_publication ADD citation_count INT;
ALTER TABLE author_publication ADD journal_importance INT;

UPDATE 
	author_publication AS ap
SET 
    citation_count = p.citation_count,
    journal_importance = p.journal_importance
FROM 
	publications p
WHERE 
	ap.publication_id = p.publication_id
;