
SQL NOTES :

CREATE TABLE 'keyword to create a new table with columns, including the id column'
.help 'command to get a complete list of SQL commands'
.tables 'command to list all the tables in a database'
.schema 'command to look at the structure of a database'
ALTER TABLE 'keyword to add columns to a table'
DROP TABLE 'keyword to delete a table'

- 'Creating a Table'
   CREATE TABLE <table_name> (column_name, column_name);

- 'Insert table values' 
    *   INSERT INTO <table_name> (id, column_name, column_name)
            VALUES (1, value_2, value_3); 

- ORDER BY()
    *   SELECT column_name, column_name 
        FROM <table_name> 
        ORDER BY column_name DESC, column_name ASC|DESC; 

    *   SELECT * FROM cats ORDER BY(net_worth) DESC LIMIT 1;

    *   SELECT column_name, column_name
        FROM <table_name> 
        ORDER BY column_name DESC, column_name ASC|DESC;

    *   

- GROUP BY() 
    *  SELECT column_name, aggregate_function(column_name)
        FROM table_name
        WHERE column_name operator value
        GROUP BY column_name;

    *  'calculate the sum of the net worth of all of the cats, grouped by owner name:'
    *   SELECT owners.name, SUM(cats.net_worth)
        FROM owners
        INNER JOIN cats_owners
        ON owners.id = cats_owners.owner_id
        JOIN cats ON cats_owners.cat_id = cats.id
        GROUP BY owners.name;

- 'Aggregate Functions' 
    - AVG
            - SELECT AVG(column_name) FROM table_name; 
    - SUM
            - SELECT SUM(column_name) FROM table_name; 
    - COUNT 'calculate the total number of rows in column_name in a table that are not NULL or COUNT(*) for total rows in TABLE'
            - SELECT COUNT(column_name) FROM table_name;
            - SELECT COUNT(*) FROM cats WHERE net_worth > 1000000;
    - MIN
            - SELECT MIN(column_name) FROM table_name;
    - MAX
            - SELECT MAX(column_name) FROM table_name; 

- HAVING vs WHERE clause
    - 'WHERE is used to filter records from a result before any groupings take place.'
    - 'HAVING is used to filter values after they have been groups.  Only columns or expressions in the group can be included in the HAVING clause’s conditions…'

    *   SELECT   SalesOrderID,
                 SUM(UnitPrice * OrderQty) AS TotalPrice
        FROM     Sales.SalesOrderDetail
        GROUP BY SalesOrderID
        HAVING   SUM(UnitPrice * OrderQty) > 10000 
                 AND SalesOrderID > 50000

    *   SELECT   SalesOrderID,
                 SUM(UnitPrice * OrderQty) AS TotalPrice
        FROM     Sales.SalesOrderDetail
        WHERE    LineTotal > 100
        GROUP BY SalesOrderID
        HAVING   SUM(UnitPrice * OrderQty) > 10000

    * 'To calculate the total bonus that each employee received, we would write a SQL statement like this:'
    *   SELECT employee, SUM(bonus)
        FROM employee_bonus 
        GROUP BY employee;


- DATE/TIME
    - 'SQLite supports 5 date and time Functions'
        1. date(timestring, modifier, modifier, ...)
        2. time(timestring, modifier, modifier, ...)
        3. datetime(timestring, modifier, modifier, ...)
        4. julianday(timestring, modifier, modifier, ...)
        5. strftime(format, timestring, modifier, modifier, ...)
    - 'complete list of valid strftime() substitutions'
        %d		day of month: 00
        %f		fractional seconds: SS.SSS
        %H		hour: 00-24
        %j		day of year: 001-366
        %J		Julian day number
        %m		month: 01-12
        %M		minute: 00-59
        %s		seconds since 1970-01-01
        %S		seconds: 00-59
        %w		day of week 0-6 with Sunday==0
        %W		week of year: 00-53
        %Y		year: 0000-9999
        %%		%

- TIME STRINGS - 'A time string can be in any of the following formats:'
        YYYY-MM-DD
        YYYY-MM-DD HH:MM
        YYYY-MM-DD HH:MM:SS
        YYYY-MM-DD HH:MM:SS.SSS
        YYYY-MM-DDTHH:MM
        YYYY-MM-DDTHH:MM:SS
        YYYY-MM-DDTHH:MM:SS.SSS
        HH:MM
        HH:MM:SS
        HH:MM:SS.SSS
        now
        DDDDDDDDDD


COUNT()
    - SELECT COUNT(*) FROM tracks WHERE albumid = 10;

    'To get all the albums and the number of tracks in each album, you combine the COUNT(*) function with the GROUP BY clause:'
    SELECT albumid, COUNT(*) FROM tracks GROUP BY albumid;