class Todo {
  int _id;
  String _title;
  String _description;
  int _priority;
  String _date;

  Todo(this._title, this._priority, this._date, [this._description]);
  //[this.description] is optional parameter hence enclosed in []

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

  Todo.fromObject(dynamic o){
    this._id = o["id"];
    this._title = o["title"];
    this._priority = o["priority"];
    this._date = o["date"];
    this._description = o["description"];
  }
}
