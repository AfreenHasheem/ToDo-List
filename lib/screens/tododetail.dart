import 'package:flutter/material.dart';
import 'package:to_do_list/util/dbhelper.dart';
import 'package:to_do_list/model/todo.dart';
import 'package:intl/intl.dart';

class TodoDetail extends StatefulWidget{
  final Todo todo;
  TodoDetail(this.todo);

  @override
  State<StatefulWidget> createState() => TodoDetailState(todo);

}

class TodoDetailState extends State {
  Todo todo;
  TodoDetailState(this.todo);
  final _priorities = ["High", "Medium", "Low"];
  String _priority = "Low";
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text = todo.title;
    descriptionController.text = todo.description;
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,//so that we don't see the back button on the AppBar
        title: Text(todo.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            style: textStyle,
            decoration: InputDecoration(
              labelText: "Title",
              labelStyle: textStyle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              )
            ),
          ),
          TextField(
            controller: descriptionController,
            style: textStyle,
            decoration: InputDecoration(
                labelText: "Description",
                labelStyle: textStyle,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                )
            ),
          ),
//          DropdownButton<String>(
//            items: _priorities.map((String val){
//              return DropdownMenuItem<String>(
//                value: val,
//                child: new Text(val),
//              );
//          }).toList(),
//            style: textStyle,
//            value: "Low",
//            onChanged: (String newValue){
//              setState(() {
//
//              });
//            },
//          )

          DropdownButton<String>(
            value: _priority,
            onChanged: (String newValue) {
              setState(() {
                _priority = newValue;
              });
            },
            items: _priorities
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}



