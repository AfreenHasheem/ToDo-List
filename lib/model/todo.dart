class Todo {
  int _id;
  String _title;
  String _description;
  int _priority;
  String _date;

  /*[this.description] is optional parameter hence enclosed in []
  this in an unnamed constructor*/
  Todo(this._title, this._priority, this._date, [this._description]);


  /*constructor when ur editing the todoTable which will have an id
  You can have only 1 unnamed constructor in a class
  This is a named constructor
  It works exactly as the unnamed constructor*/
  Todo.withId(this._id, this._title, this._priority, this._date,[this._description]);

  String get date => _date;

  int get priority => _priority;

  String get description => _description;

  String get title => _title;

  int get id => _id;

  /* No setter for Id as the value of Id will never change
 set id(int value) {
    _id = value;
  }*/

  set title(String newTitle) {
    if (newTitle.length < 255) {
      _title = newTitle;
    }
  }

  set description(String newDescription) {
    if (newDescription.length < 255) {
      _description = newDescription;
    }
  }

  set priority(int newPriority) {
    if (newPriority >= 0 && newPriority <= 3) {
      _priority = newPriority;
    }
  }

  set date(String newDate) {
    _date = newDate;
  }

  /*
  Maps are collections of key-value pairs from which you retrieve a value using it associated key.
  Maps and their keys and value can be iterated.
  The below method transforms our todoTable into a map
  This will be handy when we use helper methods for SQLite
  */
  Map <String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["title"] = _title;
    map["description"] = _description;
    map["priority"] = _priority;
    map["date"] = _date;
    if(_id != null){
      map["id"] = _id;
    }
    return map;
  }

  //This method does the opposite of a Map. It takes in any object and transforms it into a todo.
  Todo.fromObject(dynamic o){
    this._id = o["id"];
    this._title = o["title"];
    this._priority = o["priority"];
    this._date = o["date"];
    this._description = o["description"];
  }
}
