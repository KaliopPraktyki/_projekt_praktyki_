import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class to_do extends StatefulWidget {

  @override
  State<to_do> createState() => _to_doState();
}

class _to_doState extends State<to_do> {

  //List todo = List();

  bool? isChecked = false;

  bool? value = false;

  String input = "";
  var todo = ["Uśmiechnij się!"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(AppLocalizations.of(context)!.alltodos,),
      //   elevation: 0,
      // ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: todo.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(todo[index]),
                child: Slidable (
                  startActionPane: ActionPane(
                    motion: const BehindMotion(),
                    children: [
                      SlidableAction(
                        onPressed: ((context) {
                          setState(() {
                            todo.removeAt(index);
                          });
                        }),
                        label: AppLocalizations.of(context)!.delete,
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                      ),
                    ],
                  ),
                  child:
                  Stack(
                    children: [
                      Card(
                        elevation: 2,
                        margin: EdgeInsets.all(8),
                        shape: RoundedRectangleBorder(borderRadius:
                        BorderRadius.circular(8)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child:  ListTile(
                            title: Text(todo[index]),
                          ),
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 7.0),
                        child: CheckboxListTile(
                          value: value,
                          onChanged: (value) => setState(() => this.value = value!),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text(AppLocalizations.of(context)!.addtodo),
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
                        child: Text(AppLocalizations.of(context)!.add))
                  ],
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );

  }
}