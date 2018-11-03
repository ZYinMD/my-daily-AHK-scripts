/*
Purpose:
  After typing the hotstring SqlOn, Sql keywords will auto capitalize. Type SqlOff to stop.
Syntax:
  To refer to an existing global variable inside a function (or create a new one), declare the variable as global prior to using it.
*/

SqlOn()
{
  global Sql ; This global variable was either previously given a value somewhere outside this function, or newly created here
  Sql := true
}

SqlOff()
{
  global Sql
  Sql := false
}

::SqlOn:: ;if you want a hotstring to call a function, you must put the function call onto a separate line.
  SqlOn()
  Return
::SqlOff::
  SqlOff()
  Return

#Hotstring *0 ?0

#If Sql = true
::show::SHOW
::use::USE
::database::DATABASE
::databases::DATABASES
::table::TABLE
::select::SELECT
::from::FROM
::where::WHERE
::order::ORDER
::group::GROUP
::by::BY
::join::JOIN
::insert::INSERT
::into::INTO
::update::UPDATE
::set::SET
::delete::DELETE
::having::HAVING
::in::IN
::like::LIKE
::and::AND
::or::OR
::is::IS
::not::NOT
::null::NULL
::as::AS
::limit::LIMIT
::offset::OFFSET
::desc::DESC
::drop::DROP
::schema::SCHEMA
::if::IF
::exists::EXISTS
::create::CREATE
::default::DEFAULT
::primary::PRIMARY
::key::KEY
::values::VALUES
::unique::UNIQUE
::column::COLUMN
::columns::COLUMNS
::unsigned::UNSIGNED
:*:integer::INTEGER
:*:int(::INT(
:*:varchar::VARCHAR
:*:char::CHAR
:*:text::TEXT
:*:count::COUNT
#If
