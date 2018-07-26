SQL Queries for Miva Merchant Templating Language
-------------------

This utility component allows you to execute SQL queries from Miva Script Templates.

To use this you must enable it in your store and create an item for it under pages.
You will also need to assign it to any page you wish to use its functionality on.

When you call the component, the param passed to the item must be a literal string to
a global or local array containing the following members:

- array:query - String - This holds the actual query to be executed. You can use ? for placeholders
- array:bind_parameters - Array - This should be an array for placeholders set in your query with ?

After you execute the query, the same array passed as a parameter gets the following members:

- array:results - Int|Array - This will be populated with rows from SELECT or EXPLAIN, or INT from UPDATE, INSERT, DELETE, etc
- array:fields - Array|null - This will be populated with an array of fields from SELECT or EXPLAIN, or NULL from UPDATE, INSERT, DELETE, etc
- array:query_type - String - This will be populated with the type of query being executed (SELECT, EXPLAIN, etc)

For Example:

```
<mvt:assign name="l.settings:query:query" value="'SELECT * FROM s01_Products WHERE code = ?'" />
<mvt:assign name="l.settings:query:bind_parameters[1]" value="'bar'" />
<mvt:item name="sql" param="l.settings:query" />

<mvt:foreach iterator="row" array="query:results">
  &mvte:row:name;
</mvt:foreach>
```

Download
-------------------
Visit the releases page [ https://github.com/ghassani/miva-sql-component/releases ]

SQL Query Console
-------------------

The SQL Query Console has been moved to its own module. You can download it from the Releases.

When installed into a store, you can now execute any SQL query from the Miva Merchant Admin and display the results. The utility is under the Utilities menu in the admin.



Change Log
-------------------
v0.5000 - Initial Version

v0.5001 - Bug Fixes

v0.5002 - Bug Fixes

v0.5003 - Bug Fixes

v0.6000 - 	Improved error handling
			Removed UI features, slimmed it down
			Moved Query Console to its own module
			Other minor bug fixes
