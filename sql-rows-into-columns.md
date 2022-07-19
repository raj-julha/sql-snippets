# Convert Rows in SQL Table into Columns

## Sample Entries in Table
|Id|RecId|FieldName|FieldValue|
|-|-----|---------|---------|
|1|10|AccountNo|AC12345|
|2|10|InvoiceNo|IN87543|
|3|11|AccountNo|AC85225|
|4|11|InvoiceNo|IN98745|
|5|12|AccountNo|AC852366|
|6|12|InvoiceNo|IN852|



## Expected Outcome

|RecId|AccountNo|InvoiceNo|
|-----|---------|---------|
|10|AC12345|IN87543|
|11|AC85225|IN98745|
|12|AC852366|IN852|

### Create Demo Table
```sql
CREATE SCHEMA Raj
GO

CREATE TABLE Raj.PivotDemoTable (
Id int identity not null,
DateCreated DateTime null default getdate(),
RecId int null,
FieldName varchar(25) null,
FieldValue varchar(25) null,
EditDistance int null,
 CONSTRAINT [PK_PivotDemoTable] PRIMARY KEY CLUSTERED 
    (
	    [Id] ASC
    )
)

GO

grant select, insert, update, delete on [Raj].PivotDemoTable to public

go

```

### Populate Demo Table

```sql
insert into Raj.PivotDemoTable(RecId, FieldName, FieldValue, EditDistance) SELECT 10, 'AccountNo', 'AC12345', 10
insert into Raj.PivotDemoTable(RecId, FieldName, FieldValue, EditDistance) SELECT 10, 'InvoiceNo', 'IN87543', 20
insert into Raj.PivotDemoTable(RecId, FieldName, FieldValue, EditDistance) SELECT 11, 'AccountNo', 'AC85225', 20
insert into Raj.PivotDemoTable(RecId, FieldName, FieldValue, EditDistance) SELECT 11, 'InvoiceNo', 'IN98745', 5
insert into Raj.PivotDemoTable(RecId, FieldName, FieldValue, EditDistance) SELECT 12, 'AccountNo', 'AC852366', 20
insert into Raj.PivotDemoTable(RecId, FieldName, FieldValue, EditDistance) SELECT 12, 'InvoiceNo', 'IN852', 7

SELECT * FROM Raj.PivotDemoTable
```
### Query To Expose Rows as Columns

```sql

SELECT t1.RecId,
  t1.FieldValue AccountNo,
  t2.FieldValue InvoiceNo
FROM Raj.PivotDemoTable t1
LEFT JOIN Raj.PivotDemoTable t2
  on t1.RecId = t2.RecId
  and t2.FieldName = 'InvoiceNo'
WHERE t1.FieldName = 'AccountNo'
```
