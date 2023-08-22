DELETE FROM author_publication
WHERE 
    (
		publication_id = 29682792 AND 
		author_id = '7f2b5da3-3d0d-11ee-b2e5-477eeaab426e' AND 
		position = 'First Author'
	) OR
    (
		publication_id = 31012208 AND 
		author_id = '7f2fdfdc-3d0d-11ee-9c45-477eeaab426e' AND 
		position = 'Last Author'
	) OR
    (
		publication_id = 32910677 AND 
		author_id = '7f2b5da3-3d0d-11ee-b2e5-477eeaab426e' AND 
		position = 'First Author'
	) OR
    (
		publication_id = 37140500 AND 
		author_id = '7f2dcaa6-3d0d-11ee-975c-477eeaab426e' AND 
		position = 'First Author'
	)
;

-- there are 2 completly identical rows and we need to delete one
DELETE FROM 
	author_publication AS a USING (
		SELECT 
			MIN(ctid) as ctid, 
			author_id, publication_id
		FROM 
			author_publication 
		GROUP BY author_id, publication_id HAVING COUNT(*) > 1
	) AS b
WHERE 
	a.author_id = b.author_id AND a.publication_id = b.publication_id AND
    a.ctid <> b.ctid
;

ALTER TABLE author_publication ADD PRIMARY KEY (author_id, publication_id);