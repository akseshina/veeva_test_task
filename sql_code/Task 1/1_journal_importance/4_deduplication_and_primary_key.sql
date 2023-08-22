-- Create a temporary table to store unique entries
CREATE TEMP TABLE temp_journals AS
SELECT 
	issn, 
	MAX(importance) as importance
FROM 
	journal_importance
GROUP BY 
	issn;

-- Delete all rows from the main table
TRUNCATE TABLE journal_importance;

-- Insert rows from the temporary table into the main table
INSERT INTO 
	journal_importance (issn, importance)
SELECT 
	issn, importance 
FROM 
	temp_journals;

-- Drop the temporary table
DROP TABLE temp_journals;

-- Add a PRIMARY KEY constraint to the issn column
ALTER TABLE journal_importance ADD PRIMARY KEY (issn);