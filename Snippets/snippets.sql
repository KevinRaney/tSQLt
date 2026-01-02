--tab
--tSQLt: about [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
/*
    -----------------
    -- About tSQLt --
    -----------------

tSQLt is an open source unit testing framework for SQL Server. 
tSQLt is coauthored by:
- Dennis Lloyd Jr. ( @dennislloydjr | http://curiouslycorrect.com/ )
- Sebastian Meine ( @sqlity | http://sqlity.net )

You can download tSQLt at http://tSQLt.org/downloads
A more complete set of SQL Prompt snippets is available there too.

tSQLt provides an array of procedures that help you to write robust test cases
by isolating dependencies (e.g. tSQLt.FakeTable or tSQLt.SpyProcedure) and 
asserting correct behavior (e.g. tSQLt.AssertEqualsTable or tSQLt.ExpectException).

To create a test, you first need to create a schema using the tSQLt.NewTextClass
procedure. Any procedure that lives in such a schema and that has a name that 
begins with the four letters "test" is considdered a test case. To execute a test
just run tSQLt.Run passing in either the schema name or the fully qualified
test case name. To execute all test cases in the database run tSQLt.RunAll

You can find the tSQLt manual and examples at http://tsqlt.org/user-guide/

To check the version of tSQLt that is currently installed execute this query:
SELECT * FROM tSQLt.Info();
The Version and the ClrVersion should always match.

For an easier way to manage and execute your tests check out Red Gate SQL Test.

Below is a test case template that also explains the three parts that every 
test should contain.
*/
go
--  Comments here are associated with the test.
--  For test case examples, see: http://tsqlt.org/user-guide/tsqlt-tutorial/
create procedure [<Test_Class,sysname,>].[<Test_Name,sysname,test >]
as
begin
  --Assemble
  --  This section is for code that sets up the environment. It often
  --  contains calls to methods such as tSQLt.FakeTable and tSQLt.SpyProcedure
  --  along with INSERTs of relevant data.
  --  For more information, see http://tsqlt.org/user-guide/isolating-dependencies/

  --Act
  --  Execute the code under test like a stored procedure, function or view
  --  and capture the results in variables or tables.

  --Assert
  --  Compare the expected and actual values, or call tSQLt.Fail in an IF statement.  
  --  Typical Asserts: tSQLt.AssertEquals, tSQLt.AssertEqualsString, tSQLt.AssertEqualsTable
  --  For a complete list, see: http://tsqlt.org/user-guide/assertions/
  exec tSQLt.Fail 'TODO:Implement this test.'

end;
go

---------------------------------------------------------------------------------------------------------
--tac
--tSQLt.ApplyConstraint [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.ApplyConstraint @TableName = '$CURSOR$', @ConstraintName = '';
---------------------------------------------------------------------------------------------------------
--tmt
--tSQLt.AssertEmptyTable [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.AssertEmptyTable @TableName = '$CURSOR$';
---------------------------------------------------------------------------------------------------------
--te
--tSQLt.AssertEquals [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.AssertEquals @Expected = '$CURSOR$', @Actual;
---------------------------------------------------------------------------------------------------------
--tes
--tSQLt.AssertEqualsString [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.AssertEqualsString @Expected = '$CURSOR$', @Actual;
---------------------------------------------------------------------------------------------------------
--tet
--tSQLt.AssertEqualsTable [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.AssertEqualsTable '#Expected','#Actual';
---------------------------------------------------------------------------------------------------------
--tal
--tSQLt.AssertLike [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.AssertLike @ExpectedPattern = '$CURSOR$', @Actual;
---------------------------------------------------------------------------------------------------------
--tne
--tSQLt.AssertNotEquals [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.AssertNotEquals @Expected = '$CURSOR$', @Actual;
---------------------------------------------------------------------------------------------------------
--toe
--tSQLt.AssertObjectExists [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.AssertObjectExists @ObjectName = '$CURSOR$';
---------------------------------------------------------------------------------------------------------
--tco
--tSQLt.CaptureOutput [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.CaptureOutput '$CURSOR$';

select
  *
into #Actual
from
  tSQLt.CaptureOutputLog;

---------------------------------------------------------------------------------------------------------
--txe  
--tSQLt.ExpectException [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.ExpectException @ExpectedMessage = '$CURSOR$', @ExpectedSeverity = null, @ExpectedState = null;
---------------------------------------------------------------------------------------------------------
--txp  
--tSQLt.ExpectException:Pattern [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.ExpectException @ExpectedMessagePattern = '$CURSOR$', @ExpectedSeverity = null, @ExpectedState = null;
---------------------------------------------------------------------------------------------------------
--tf
--tSQLt.Fail [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.Fail '$CURSOR$';
---------------------------------------------------------------------------------------------------------
--tft
--tSQLt.FakeTable [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.FakeTable @TableName = '$CURSOR$', @Identity = 0, @ComputedColumns = 0, @Defaults = 0;
---------------------------------------------------------------------------------------------------------
--tnc
--tSQLt.NewConnection [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.NewConnection @command='$CURSOR$';
---------------------------------------------------------------------------------------------------------
--tnt
--tSQLt.NewTestClass [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.NewTestClass '$CURSOR$';
go
create procedure .[test ]
as
begin

  end;
go

---------------------------------------------------------------------------------------------------------
--tro
--tSQLt.RemoveObject [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.RemoveObject @ObjectName = '$CURSOR$';
---------------------------------------------------------------------------------------------------------
--trf
--tSQLt.ResultSetFilter [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.ResultSetFilter @ResultsetNo = 1, @Command = '$CURSOR$';
---------------------------------------------------------------------------------------------------------
--tsp
--tSQLt.SpyProcedure [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.SpyProcedure @ProcedureName = '$CURSOR$', @CommandToExecute = null;
---------------------------------------------------------------------------------------------------------
--tso
--tSQLt.SuppressOutput [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
exec tSQLt.SuppressOutput @command = '$CURSOR$';
---------------------------------------------------------------------------------------------------------
--tea
--tSQLt: create #Expected from #Actual [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
select top (0)
       *
  into #Expected
  from #Actual;
---------------------------------------------------------------------------------------------------------
--tie
--tSQLt: INSERT INTO #Expected [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
insert into #Expected
values($CURSOR$);
---------------------------------------------------------------------------------------------------------
--tca
--tSQLt: SELECT INTO #Actual; [tSQLt - Database Unit Testing for SQL Server. Get it at http://tsqlt.org]
select
  *
into #Actual
from
  $CURSOR$;

---------------------------------------------------------------------------------------------------------
