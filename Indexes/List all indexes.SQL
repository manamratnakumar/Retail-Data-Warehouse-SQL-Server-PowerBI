/*
List all indexes
*/

SELECT

OBJECT_NAME(object_id) AS TableName,

name AS IndexName,

type_desc

FROM sys.indexes

WHERE OBJECT_NAME(object_id) IS NOT NULL

ORDER BY

TableName,
IndexName;