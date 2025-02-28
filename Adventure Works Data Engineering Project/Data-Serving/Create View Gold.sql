------------------------
-- CREATE SCHEMA (if not exists)
------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
    EXEC ('CREATE SCHEMA gold;');
GO

------------------------
-- CREATE VIEW CALENDAR
------------------------
CREATE VIEW gold.calendar AS
SELECT * 
FROM (
    SELECT * 
    FROM OPENROWSET(
        BULK 'https://kbstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Calendar/',
        FORMAT = 'PARQUET'
    ) AS SRC
) AS derived_table;
GO

------------------------
-- CREATE VIEW CUSTOMERS
------------------------
CREATE VIEW gold.customers AS
SELECT * 
FROM (
    SELECT * 
    FROM OPENROWSET(
        BULK 'https://kbstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Customers/',
        FORMAT = 'PARQUET'
    ) AS SRC
) AS derived_table;
GO

------------------------
-- CREATE VIEW PRODUCTS
------------------------
CREATE VIEW gold.products AS
SELECT * 
FROM (
    SELECT * 
    FROM OPENROWSET(
        BULK 'https://kbstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Products/',
        FORMAT = 'PARQUET'
    ) AS SRC
) AS derived_table;
GO

------------------------
-- CREATE VIEW RETURNS
------------------------
CREATE VIEW gold.returns AS
SELECT * 
FROM (
    SELECT * 
    FROM OPENROWSET(
        BULK 'https://kbstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Returns/',
        FORMAT = 'PARQUET'
    ) AS SRC
) AS derived_table;
GO

------------------------
-- CREATE VIEW SALES
------------------------
CREATE VIEW gold.sales AS
SELECT * 
FROM (
    SELECT * 
    FROM OPENROWSET(
        BULK 'https://kbstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Sales/',
        FORMAT = 'PARQUET'
    ) AS SRC
) AS derived_table;
GO

------------------------
-- CREATE VIEW SUBCATEGORIES (Fixed Naming)
------------------------
CREATE VIEW gold.subcat AS
SELECT * 
FROM (
    SELECT * 
    FROM OPENROWSET(
        BULK 'https://kbstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Subcategories/', 
        FORMAT = 'PARQUET'
    ) AS SRC
) AS derived_table;
GO

------------------------
-- CREATE VIEW TERRITORIES
------------------------
CREATE VIEW gold.territories AS
SELECT * 
FROM (
    SELECT * 
    FROM OPENROWSET(
        BULK 'https://kbstoragedatalake.blob.core.windows.net/silver/AdventureWorks_Territories/',
        FORMAT = 'PARQUET'
    ) AS SRC
) AS derived_table;
GO