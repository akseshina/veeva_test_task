DELETE FROM author_publication
WHERE publication_id NOT IN (SELECT publication_id FROM publications);