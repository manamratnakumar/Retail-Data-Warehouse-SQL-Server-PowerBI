DROP PROCEDURE IF EXISTS rpt.usp_RefreshWarehouse;
GO

CREATE PROCEDURE rpt.usp_RefreshWarehouse
AS
BEGIN

SET NOCOUNT ON;

PRINT 'AdventureWorks Data Warehouse Refresh Started';

PRINT 'Step 1 : Validate Staging Tables';

PRINT 'Step 2 : Refresh Dimension Tables';

PRINT 'Step 3 : Refresh Fact Tables';

PRINT 'Step 4 : Refresh Reporting Views';

PRINT 'AdventureWorks Data Warehouse Refresh Completed';

END;
GO

EXEC rpt.usp_RefreshWarehouse;