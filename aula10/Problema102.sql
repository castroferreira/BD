/* PROBLEMA 10.2 */

/*CREATE TABLE mytemp 
(
	rid BIGINT /*IDENTITY (1,1)*/ NOT NULL,
 	at1 INT NULL,
 	at2 INT NULL,
 	at3 INT NULL,
 	lixo varchar(100) NULL
);*/

/*A*/
CREATE CLUSTERED INDEX PK_RID ON mytemp(rid);

/*B*/
--Record the Start Time
/*DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time;

--Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN
	DBCC DROPCLEANBUFFERS;		--need to be sysadmin

	INSERT mytemp (rid, at1, at2, at3, lixo)
	SELECT cast(RAND()*@nelem*40000 as int), cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int), CAST((RAND()*@nelem) as int), 'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...';
	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'

--Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @start_time, @end_time));

-- Qual a percentagem de fragmentação dos índices e de ocupação das páginas dos índices?
USE tempdb;
SELECT * FROM sys.dm_db_index_physical_stats(DB_ID('tempdb'),object_id('Frag'), NULL, NULL, 'DETAILED');*/

/*C*/
/*CREATE TABLE mytemp 
(
	rid BIGINT NOT NULL,
  	at1 INT NULL,
   	at2 INT NULL,
  	at3 INT NULL,
  	lixo varchar(100) NULL
);
-- ALTER INDEX IxRid ON mytemp REBUILD WITH (FILLFACTOR = 65);
-- ALTER INDEX IxRid ON mytemp REBUILD WITH (FILLFACTOR = 80);
ALTER INDEX IxRid ON mytemp REBUILD WITH (FILLFACTOR = 90);

--Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time;

--Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN
	DBCC DROPCLEANBUFFERS;		--need to be sysadmin

	INSERT mytemp (rid, at1, at2, at3, lixo)
	SELECT cast(RAND()*@nelem*40000 as int), cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int), CAST((RAND()*@nelem) as int), 'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...';
	SET @val = @val + 1;

END

PRINT 'Inserted ' + str(@nelem) + ' total records'

-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @start_time, @end_time));*/

/*D*/
-- CREATE TABLE mytemp 
/*(
	rid BIGINT IDENTITY (1,1) NOT NULL,
	at1 INT NULL,
	at2 INT NULL,
	at3 INT NULL,
	lixo varchar(100) NULL
);

--Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time;

--Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN
	DBCC DROPCLEANBUFFERS;		--need to be sysadmin

	INSERT mytemp (rid, at1, at2, at3, lixo)
	SELECT cast(RAND()*@nelem*40000 as int), cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int), CAST((RAND()*@nelem) as int), 'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...';
	SET @val = @val + 1;

END

PRINT 'Inserted ' + str(@nelem) + ' total records'

-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @start_time, @end_time));*/

/*E*/
CREATE TABLE mytemp 
(
	rid BIGINT IDENTITY (1,1) NOT NULL,
	at1 INT NULL,
	at2 INT NULL,
	at3 INT NULL,
	lixo varchar(100) NULL
);

CREATE INDEX IX_AT1 ON mytemp(at1);
CREATE INDEX IX_AT2 ON mytemp(at2);
CREATE INDEX IX_AT3 ON mytemp(at3);
CREATE INDEX IX_LIXO ON mytemp(lixo);

--Record the Start Time
DECLARE @start_time DATETIME, @end_time DATETIME;
SET @start_time = GETDATE();
PRINT @start_time;

--Generate random records
DECLARE @val as int = 1;
DECLARE @nelem as int = 50000;

SET nocount ON

WHILE @val <= @nelem
BEGIN
	DBCC DROPCLEANBUFFERS;		--need to be sysadmin

	INSERT mytemp (at1, at2, at3, lixo)
 	SELECT cast((RAND()*@nelem) as int), cast((RAND()*@nelem) as int), CAST((RAND()*@nelem) as int), 'lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...lixo...';
 	SET @val = @val + 1;
END

PRINT 'Inserted ' + str(@nelem) + ' total records'

-- Duration of Insertion Process
SET @end_time = GETDATE();
PRINT 'Milliseconds used: ' + CONVERT(VARCHAR(20), DATEDIFF(MILLISECOND, @start_time, @end_time));

