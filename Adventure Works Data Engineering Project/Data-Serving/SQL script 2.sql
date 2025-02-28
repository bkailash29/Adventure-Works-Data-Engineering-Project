-------------------------------
-- 1. CREATE DATABASE SCOPED CREDENTIAL (Managed Identity)
-------------------------------
CREATE DATABASE SCOPED CREDENTIAL kail_creds
WITH
    IDENTITY = 'Managed Identity';
GO

-------------------------------
-- 2. CREATE EXTERNAL DATA SOURCE (for ADLS Gen2, not Blob Storage)
-------------------------------
-- If using Azure Data Lake Storage Gen2 (ADLS Gen2)
CREATE EXTERNAL DATA SOURCE source_silver
WITH (
    LOCATION = 'https://kbstoragedatalake.dfs.core.windows.net/silver', -- Using `dfs.core.windows.net` for ADLS Gen2
    CREDENTIAL = kail_creds
);
GO

CREATE EXTERNAL DATA SOURCE source_gold
WITH (
    LOCATION = 'https://kbstoragedatalake.dfs.core.windows.net/gold', -- Using `dfs.core.windows.net` for ADLS Gen2
    CREDENTIAL = kail_creds
);
GO

-------------------------------
-- 3. CREATE EXTERNAL FILE FORMAT (for Parquet)
-------------------------------
CREATE EXTERNAL FILE FORMAT format_parquet
WITH (
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
);
GO
---------------------------------------

--CREATE EXTERNAL TABLE EXTSALES--

----------------------------------------

CREATE EXTERNAL TABLE gold.extsales
WITH
(
    LOCATION = 'extsales',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet

)
AS
SELECT * FROM gold.sales


SELECT * FROM gold.extsales


