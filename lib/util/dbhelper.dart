import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_list/model/todo.dart';

class DbHelper{

  static final DbHelper _dbHelper = DbHelper._internal();//named constructor
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

  Future<Database> get db async{
    if(_db == null){
      _db = await initializeDb();
    }

    return _db;
  }

  Future<Database> initializeDb() async{
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "todo.db";
    var dbTodos = await openDatabase(path, version: 1, onCreate: _createDb);
    return dbTodos;

  }

  void _createDb(Database db, int newversion) async {
    await db.execute(
      "CREATE TABLE $tableTodo("
          "$colId INTEGER PRIMARY KEY, "
          "$colTitle TEXT, "+" "
          "$colDescription TEXT, "
          "$colPriority INTEGER, "
          "$colDate TEXT)"
    );
  }
}