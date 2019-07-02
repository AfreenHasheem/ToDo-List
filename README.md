

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
3. ```Future<Database> initializeDb() ``` : Creates or initializes the DB
returns a Future object of type database that will be availabe sometime in the future.
   ``` getApplicationDocumentsDirectory() ```: This is from the io package. Returns directory for the documents of our app. 
   ``` String path``` : contains the path of the directory and name of the table.
   ``` _createDb() ```: launches an SQL query to create the database.
    ```static Database _db ```: variable that contains the database throught the class.
    ```get db async () ```: Checks if DB is null. If null initializes and creates a DB, then returns the DB. 
    
4. ```Future<List> getTodos() async{}```: Create a method that will return all the Todos in a list.
5. ```Future<int> getCount() async{}``` : Get number of records in ur table
6. ```Future<int> updateTodo(Todo todo) async{}```:to update the table

In screens folder added -
todolist.dart :
```ListView todoListItems() ``` - Shows the avatar circles in red, orange or green depending on the priority.
```void getData() ``` - Initializes the DB or creates it if it doesn't exist, adds objects to the TODO List, and prints the selected item.
```Color getColor(int priority)``` - Switch cases and selects color depending on the priority.
tododetail.dart :
Has a column that contains 2 text fields (Title & description) and 1 Dropdown Menu(Low, Medium and High)

``` void select()```: Has a switch statement with methods for Saving a menu, deleting a menu and Editiong a menu.
```void updatePriority()```: Updates the list if the priority has been edited and saved.
```void updateTitle() ```: Updates the title when edited and updated.
```void updateDescription()```: Updates the description when edited and updated.
  
 
 
 
