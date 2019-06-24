import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/model/todo.dart';

class DbHelper {

  static final DbHelper _dbHelper = DbHelper._internal(); //named constructor
  String tableTodo = "todo";
  String colId = "id";
  String colTitle = "title";
  String colDescription = "description";
  String colPriority = "priority";
  String colDate = "date";

  //creating named constructor
  DbHelper._internal();


  //un-named constructor
  factory DbHelper(){
    return _dbHelper;
  }

  static Database _db;

  //getter method
  Future<Database> get db async {
    if (_db == null) {
      _db = await initializeDb();
    }

    return _db;
  }

  Future<Database> initializeDb() async {
    /*create a directory(from io package)
    getApplicationDocumentsDirectory() is from the path provider package.
    It returns the directory for the documents of our app*/
    Directory directory = await getApplicationDocumentsDirectory();
    //path contains directory + name of the database
    String path = directory.path + "todo.db";

    //create dbTodos variable
    //onCreate: what to do when the database does not exist.
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);

    //return the future database
    return dbTodos;
  }

  void _createDb(Database db, int newversion) async {
    await db.execute(
        "CREATE TABLE $tableTodo("
            "$colId INTEGER PRIMARY KEY, "
            "$colTitle TEXT, " + " "
            "$colDescription TEXT, "
            "$colPriority INTEGER, "
            "$colDate TEXT)"
    );
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;

    /*requires the name of the table and a map of the record we want to insert
    In the map, the keys of the values must be the name of the fields*/
    var result = await db.insert(tableTodo, todo.toMap());
    return result;//the result should contain the id of the item that was inserted

  }

  //Create a method that will return all the Todos

  Future<List> getTodos() async{
    //get the database
    Database db = await this.db;
    var result = await db.rawQuery("SELECT * FROM $tableTodo order by $colPriority ASC");
    return result;
  }

  //Get number of records in ur table
  Future<int> getCount() async{
    Database db = await this.db;
    var result = Sqflite.firstIntValue(
      await db.rawQuery("select count (*) from $tableTodo")
    );
    return result;
  }

  //to update the table
  Future<int> updateTodo(Todo todo) async{
    var db = await this.db;
    var result = await db.update(tableTodo, todo.toMap(), where: "$colId = ?", whereArgs: [todo.id]);
    return result;

  }

  //to delete a recored in the database
  Future<int> deleteTodo(int id) async{
    var db = await this.db;
    int result = await db.rawDelete('DELETE FROM $tableTodo WHERE $colId = $id');
    return result;
  }

}