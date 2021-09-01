The Essential SQL Commands Cheat Sheet
Command	Action

Query Commands
SELECT	                Basic query building block to retrieve data.
SELECT *	            Using * with SELECT returns all columns.
SELECT column	        Specify exact columns with their name.
SELECT table.column	    Reference a column from a specific table.
FROM	                Specify where to find data.
AS	                    Temporarily alias a table name or column to a new name.
WHERE	                Filter results with a condition.
AND	                    Use multiple conditions with a WHERE clause. Results must match all conditions.
OR	                    Use multiple conditions with a WHERE clause. Results only need to match one condition.
ORDER BY	            Order the results by a column. The database chooses how to order.
ORDER BY column ASC	    Order the results by a column in ascending order.
ORDER BY column DESC	Order the results by a column in descending order.
LIMIT	                Restrict the number of results returned.
OFFSET	                Skip the first OFFSET number of rows. Often used with LIMIT.
SUBQUERY	            Run a query to retrieve data for another query.

Aggregate Functions¹
COUNT	                Count the number of rows that match the query.
MAX	                    Return the highest value in a numeric column.
MIN	                    Return the lowest value in a numeric column.
SUM	                    Sum the values of a numeric column.
AVG	                    Calculate the average value for a numeric column.
HAVING	                Used with aggregate functions instead of the WHERE clause.
GROUP BY	            Used to refine an aggregate result.

Operators
LIKE	                Case-sensitive search for a pattern with a wildcard operator (%).
ILIKE	                Case-insensitive search for a pattern with a wildcard operator (%).
BETWEEN	                Search for a value between two values. Works with dates or numbers.
>	                    Search for values greater than a condition.
>=	                    Search for values greater or equal to a condition.
<	                    Search for values less than a condition.
<=	                    Search for values less than or equal to a condition.
=	                    Search for values matching a condition exactly.
<>	                    Search for values not equal to a condition.
UNION	                Combine two unique queries (with the same columns) into one result.
UNION ALL	            Combine two queries (with the same columns) into one result. Duplicates allowed.
IN	                    Shorthand for WHERE. Specifies multiple OR conditions.
NOT IN	                Shorthand for WHERE. Specifies multiple OR conditions (inverted) or not equal to.
IS NULL	                Check for empty values.
IS NOT NULL	            Check for no empty values.
INTERSECT	            Return results which match two queries.
MINUS	                Return results in one query which are not in another query.¹

Joins
ON	                    Used to specify the column to compare and match results.
USING	                Shorthand for ON, used when the column name is the same in both tables.
LEFT OUTER JOIN	        All the results from the left table, with only the matching results from the right table.
LEFT OUTER JOIN (WITH NULL)	(With null) All the results from the left table but not in the right table.
INNER JOIN	            All the results that match in both the left and right tables.
FULL OUTER JOIN	        All the results from both the left and right tables.
FULL OUTER JOIN (WITH NULL)	(With null) all the results from both the left and right tables excluding results in both tables.
RIGHT OUTER JOIN	    All the results from the right table, with only the matching results from the left table.
RIGHT OUTER JOIN (WITH NULL)	(With null) All the results from the right table but not in the left table.

Creating and Editing Tables
CREATE TABLE	            Create a new table.
NULL	                    Allow empty values for this field.
NOT NULL	                Dont allow empty values for this field.
DEFAULT                 	A value to populate the field with if one is not supplied.
AS	                        Create a new table based on the structure of an existing table. The new table will contain the data from the old table.
ALTER TABLE (ADD COLUMN)	Add a new column to an existing table.
ALTER TABLE (DROP COLUMN)	Remove a column from an existing table.
ALTER TABLE (ALTER COLUMN)	Change the datatype of an existing column.
ALTER TABLE (RENAME COLUMN)	Rename an existing column.
ALTER TABLE (RENAME TABLE)	Rename an existing table.
ALTER TABLE (MODIFY NULL)	Allow null values for a column.
ALTER TABLE (MODIFY NOT NULL)	Prevent null values for a column.
DROP TABLE	                Delete a table and all its data.
TRUNCATE TABLE	            Delete all the data in a table, but not the table itself.

Constraints
PRIMARY KEY	                A value that uniquely identifies a record in a table. A combination of NOT NULL and UNIQUE.
FOREIGN KEY	                References a unique value in another table. Often a primary key in the other table.
UNIQUE	                    Enforce unique values for this column per table.
CHECK	                    Ensure values meet a specific condition.
INDEX (CREATE)	            Optimise tables and greatly speed up queries by adding an index to a column.
INDEX (CREATE UNIQUE)	    Create an index that does not allow duplicate values.
INDEX (DROP)	            Remove an index.

Creating and Editing Data
INSERT (SINGLE VALUE)	    Add a new record to a table.
INSERT (MULTIPLE VALUES)	Add several new records to a table.
INSERT (SELECT)	            Add records to a table, but get the values from an existing table.
UPDATE (ALL)	            Modify all existing records in a table.
UPDATE (WHERE)	            Modify existing records in a table which match a condition.
DELETE (ALL)	            Remove all records from a table.
DELETE (WHERE)	            Remove records from a table which match a condition.

Creating and Editing Triggers¹
CREATE TRIGGER	            Create a trigger.
CREATE TRIGGER (OR MODIFY)	Create a trigger, or update an existing trigger if one is found with the same name.
WHEN (BEFORE)	            Run the trigger before the event happens.
WHEN (AFTER)	            Run the trigger after the event happens.
EVENT (INSERT)	            Run the trigger before or after an insert happens.
EVENT (UPDATE)	            Run the trigger before or after an update happens.
EVENT (DELETE)	            Run the trigger before or after a delete happens.
ON	                        Which table to target with this trigger.
TRIGGER_TYPE (FOR EACH ROW)	Execute the trigger for every row changed.
TRIGGER_TYPE (FOR EACH STATEMENT)	Execute the trigger once per SQL statement, regardless of how many rows are altered.
EXECUTE	                    Keyword to indicate the end of the main trigger definition.
DROP TRIGGER	            Delete a trigger.

Creating and Editing Views
CREATE VIEW	                Create a new view.
AS	                        Define where to retrieve the data for a view.
WITH CASCADED CHECK OPTION	Ensure any data modified through a view meets the rules defined by the rule. Apply this to any other views.
WITH LOCAL CHECK OPTION	    Ensure any data modified through a view meets the rules defined by the rule. Ignore this for any other views.
CREATE RECURSIVE VIEW	    Create a recursive view (one that refers to a recursive common table expression).
CREATE TEMPORARY VIEW	    Create a view that exists for the current session only.
DROP VIEW	                Delete a view.

Common Table Expressions (CTEs)¹
WITH	                    Create a new common table expression.
AS	                        Specify the data to use in the CTE.
, (COMMA)	                Chain multiple CTEs.
