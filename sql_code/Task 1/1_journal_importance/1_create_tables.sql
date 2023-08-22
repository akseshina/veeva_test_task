CREATE TABLE journal_importance (
    issn VARCHAR(9),
    importance INT
);

CREATE TABLE journals_JCR (
    journal_name TEXT,
    "2019_JCR" TEXT,
    "2020_JCR" TEXT,
    "2021_JCR" TEXT,
    "2022_JCR" TEXT,
    "2023_JCR" TEXT,
    category TEXT,
    issn VARCHAR(9),
    eissn VARCHAR(9)
);