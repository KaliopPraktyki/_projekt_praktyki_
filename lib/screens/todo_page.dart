import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
    ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List todo = List();

  //final List<String> items = List<String>.generate(10000, (i) => '$i');
  String input = "";

  var todo = ["Uśmiechnij się!"];

  // @override
  // void initState() {
  //   super.initState();
  //   todo.add("item1");
  //   todo.add("item2");
  //   todo.add("item3");
  //   todo.add("item4");
  // }

  // icon: Icon(
  // Icons.delete,
  // color: Colors.red
  // ),

  //Text("ToDos")

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
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
                ));
          }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 10),

        child: GNav(
          tabBackgroundColor: Colors.grey[300]!,
          gap: 8,
          padding: EdgeInsets.all(16),
          tabs: const [
            GButton(icon:
            Ionicons.home_outline,
              text: 'Home',
            ),
            GButton(icon:
            Ionicons.calendar_outline,
              text: 'Sheadule',
            ),
            GButton(icon:
            Ionicons.list_outline,
              text: 'Todos',
            ),
            GButton(icon:
            Ionicons.person_outline,
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}


