
CRUD

CREATE
```sql
CREATE TABLE table_name
(
column_name1 data_type,
column_name2 data_type,
column_name2 data_type,
...
)

```

READ
```sql
-- Create index so that searches on name return quicker
create index person_name_idx on people (name);
```

```sql
-- 'Group By' & 'Having' functions
SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name
HAVING aggregate_function(column_name) operator value
```

```sql
-- JOIN
SELECT column_name(s)
FROM table_name1
INNER JOIN table_name2
ON table_name1.column_name=table_name2.column_name
```

```sql
-- Sorting (Order By)
SELECT column_name(s)
FROM table_name
ORDER BY column_name [ASC|DESC]

SELECT column_name, aggregate_function(column_name)
FROM table_name
WHERE column_name operator value
GROUP BY column_name

-- Unique values
SELECT DISTINCT column_name(s
FROM table_name

SELECT TOP number|percent column_name(s)
FROM table_name

SELECT LAST(column_name) FROM table_name

-- Statistics
SELECT MAX(column_name) FROM table_name
SELECT MID(column_name,start[,length]) FROM table_name
SELECT MIN(column_name) FROM table_name

```

```sql
-- Create views. These allow us to save the
-- definition of an SQL query. Example:
CREATE VIEW roads_count as
  select count(people.name), streets.name
  from people, streets where people.street_id=streets.id
  group by people.street_id, streets.name;

-- We can then select data from the
-- view as if it were a table. Example:
SELECT * FROM view(roads_count);

```
UPDATE
```sql
UPDATE table_name

SET column1=value, column2=value,...
WHERE some_column=some_value

UPDATE streets set name = 'New Main Road'
WHERE name = 'Main Road';

-- Create logging rule

```

DELETE
```sql
DROP TABLE table_name;

DELETE FROM people WHERE name = 'Joe Smith';

```