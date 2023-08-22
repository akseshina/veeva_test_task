UPDATE author_publication SET citation_count = 0 WHERE citation_count IS NULL;
UPDATE author_publication SET journal_importance = 1 WHERE journal_importance IS NULL;