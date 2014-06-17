SQL Queries for Miva Merchant Templating Language
-------------------

This utility component allows you to execute SQL queries from Miva Script Templates.

To use this you must enable it in your store and create an item for it under pages.
You will also need to assign it to any page you wish to use its functionality on.

When you call the component, the param passed to the item must be a literal string to
a global or local array containing the following members:

- array:query - String - This holds the actual query to be executed. You can use ? for placeholders
- array:bind_paramters - Array - This should be an array for placeholders set in your query with ?

After you execute the query, the same array passed as a parameter gets the following members:

- array:results - Int|Array - This will be populated with rows from SELECT or EXPLAIN, or INT from UPDATE, INSERT, DELETE, etc
- array:fields - Array|null - This will be populated with an array of fields from SELECT or EXPLAIN, or NULL from UPDATE, INSERT, DELETE, etc
- array:query_type - String - This will be populated with the type of query being executed (SELECT, EXPLAIN, or NULL from UPDATE, INSERT, DELETE, etc)

For Example:

```
<mvt:assign name="l.settings:query:query" value="'SELCT * FROM table WHERE field = ?'" />
<mvt:assign name="l.settings:query:bind_parametetrs[0]" value="'bar'" />
<mvt:item name="sql" param="l.settings:query" />

<mvt:foreach iterator="row" array="query:results">
</mvt:foreach>
```
