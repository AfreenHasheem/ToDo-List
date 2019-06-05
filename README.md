

A Flutter app built with SQFLite(SQL plugin for flutter)

Model Class:

1. The model class consists of the below private variables along with their Getters and Setters:
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
 
 
