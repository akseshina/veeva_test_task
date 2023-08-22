CREATE TABLE publications (
    publication_id BIGINT,
    title TEXT,
    publication_date DATE,
    language VARCHAR(3),
    web_source TEXT,
    issn VARCHAR(9),
    journal_title TEXT,
    journal_medium VARCHAR(30),
    citation_count INT
);