/*
Check Index Usage
*/

SELECT

OBJECT_NAME(s.object_id) AS TableName,

i.name AS IndexName,

user_seeks,

user_scans,

user_lookups,

user_updates

FROM sys.dm_db_index_usage_stats s

JOIN sys.indexes i

ON s.object_id=i.object_id
AND s.index_id=i.index_id

WHERE database_id=DB_ID()

ORDER BY user_seeks DESC;