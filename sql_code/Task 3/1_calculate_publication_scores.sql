ALTER TABLE author_publication ADD COLUMN publication_score FLOAT;

UPDATE 
	author_publication
SET 
	publication_score = 
		journal_importance *
		LOG(2, citation_count + 2) * 
		CASE 
			WHEN position = 'First Author' THEN 1
			WHEN position = 'Coauthor' THEN 0.75
			WHEN position = 'Last Author' THEN 0.25
		END
;