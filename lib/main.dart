import 'package:flutter/material.dart';
import 'package:to_do_list/util/dbhelper.dart';
import 'package:to_do_list/model/todo.dart';
import 'package:to_do_list/screens/todolist.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    List<Todo> todos = List<Todo>();
//    DbHelper helper = DbHelper();
//    helper.initializeDb().then(
//        (result) => helper.getTodos().then((result) => todos = result));
//    DateTime today = DateTime.now();
//    Todo todo = Todo("Buy Oranges", 2, today.toString(), "And make sure they are good");
//    var result = helper.insertTodo(todo);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'TODO List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: TodoList(),
    );
  }
}
