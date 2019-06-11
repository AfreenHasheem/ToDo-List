

A Flutter app built with SQFLite(SQL plugin for flutter)

Model Package: class Todo {}

1. It consists of the below private variables along with their Getters and Setters:
```
  int _id;
  String _title;
  String _description;
  int _priority;
  String _date;
  
  ```
  No setter for _id as the value of Id will never change.
  
  2. It contains 2 constructors:
  ```
  Todo(this._title, this._priority, this._date, [this._description]);

  Todo.withId(this._id, this._title, this._priority, this._date,[this._description]);
  ```
3. The class also contains a Map method to transform the Todo into a Map:
```
 Map <String, dynamic> toMap();
 ```
 4. The below method takes in an object and transforms it into Todo (exactly opposite to the funcatioanlity of Map() 
 ```
 Todo.fromObject(dynamic o)
 ```
 5. The pubspec.yaml has the following dependencies added for SQFLite:
 ```
 sqflite: any
  path_provider: any
  intl: ^0.15.7
  ```
 Util Package: class DbHelper {}
1. Named constructor
```DbHelper._internal();
```
2. Un-named constructor
```
factory DbHelper(){
    return _dbHelper;
  }
  ```
3. ```Future<Database> initializeDb() ``` :returns a Future object of type database that will be availabe sometime in the future.
   ``` getApplicationDocumentsDirectory() ```: This is from the io package. Returns directory for the documents of our app. 
   ``` String path``` : contains the path of the directory and name of the table.
   ``` _createDb() ```: launches an SQL query to create the database.
    ```static Database _db ```: variable that contains the database throught the class.
    ```get db async () ```: Checks if DB is null. If null initializes and creates a DB, then returns the DB. 
  
 
 
 
