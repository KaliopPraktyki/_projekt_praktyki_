import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ionicons/ionicons.dart';
import 'package:loginscreen/screens/home_page.dart';
import 'package:loginscreen/screens/settings_screen.dart';


class NotificationView extends StatelessWidget {
  const NotificationView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notification",
          style: const TextStyle(fontSize: 25),
        ),
        leading: GestureDetector(
          onTap: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SettingsScreen()));
          },
          child: Icon(Ionicons.arrow_back),
        ),
      ),
      body: listView(),
    );
  }
  Widget listView(){
  return ListView.separated(itemBuilder: (context, index){
    return listViewItem(index);
  },
    separatorBuilder: (contex, index){
    return Divider(height: 0);
  }, itemCount: 10);
  }

  Widget listViewItem(int index){
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        prefixIcon(),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                message(index),
                timeAndDate(index),
              ],
            ),
          ),
        ),
      ],
    ),
  );
  }
  Widget prefixIcon(){
    return Container(
      height: 50,
      width: 50,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(200, 95, 99, 251),
      ),
      child: Icon(Ionicons.notifications, size: 25,),
    );
  }

  Widget message(int index){
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Message ",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
            children: [
              TextSpan(
                text: "Message Description",
                style: TextStyle(fontWeight: FontWeight.w400)
              )
            ]
        ),
      ),
    );
  }
  Widget timeAndDate(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '23-02-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '09:37',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
