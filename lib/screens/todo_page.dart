import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class to_do extends StatefulWidget {

  @override
  State<to_do> createState() => _to_doState();

}

class _to_doState extends State<to_do> {
  //List todo = List();

  String input = "";

  var todo = ["Uśmiechnij się!"];

  // createTodo() {
  //   DocumentReference documentReference =
  //     Firestore.instance.collection("All ToDos").document(input);
  //
  // }

  // deletetodo() {
  //
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   todo.add("item1");
  //   todo.add("item2");
  //   todo.add("item3");
  //   todo.add("item4");
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All ToDos",
          style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text("Add ToDo"),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          setState(() {
                            todo.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text("Add"))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
                key: Key(todo[index]),


              child: Card(
                elevation: 2,
                margin: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(borderRadius:
                BorderRadius.circular(8)),
                child: ListTile(
                  title: Text(todo[index]),
                  trailing: IconButton(
                      icon: Icon(
                          Icons.delete,
                          color: Colors.red
                      ),
                      onPressed: (){
                        setState(() {
                          todo.removeAt(index);
                        });
                      }),
                ),
              ),
            );
          }),
    );
  }
}


