import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String userTodo;

  List todoList = [];

  @override
  void initState() {
    super.initState();
    
    todoList.addAll (['Buy milk', 'Buy eggs', 'Buy bread']);
  }
  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title : Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext, int index) {
          return Dismissible(
            key: Key(todoList[index]),
             child: Card(
              child: ListTile(
                trailing: IconButton(
                  icon: Icon(Icons.delete_rounded,
                  color: Colors.orange),
                   onPressed: () { 
                     setState(() {
                      todoList.removeAt(index);
                      });
                    },
                ),
                title: Text(todoList[index]),
              ),
             ),
            onDismissed: (direction) {
              setState(() {
                todoList.removeAt(index);
              });
            }
          );
        }
        ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          showDialog (context: context, builder: (context) {
            return AlertDialog(
              title: Text('Добавить дело'),
              content: TextField(
                onChanged: (String value) {
                  setState(() {
                    userTodo = value;
                  });
                },
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      todoList.add(userTodo);
                    });
                    Navigator.of(context).pop();
                  },
                   child: Text('Добавить'),)
              ],
            );
          });
        },
        child: Icon(
          Icons.add_box,
          color: Colors.orange
        ),
    ),
    );
  }
}