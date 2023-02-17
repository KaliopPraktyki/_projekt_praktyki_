import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loginscreen/provider/theme_provider.dart';

class ThemeChanger extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String title;
  const ThemeChanger({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.iconColor,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: color,
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 10,),
        Text(title,
        style: const TextStyle(
          fontSize: 20,
        ),
        ),
        const SizedBox(width: 10,),
        const Spacer(),
        Consumer<ThemeNotifier>(
            builder: (context, notifier,child) =>
        Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(
              activeColor: const Color.fromARGB(255, 45,155,240),
              value:notifier.darkTheme,
              onChanged: (val){
                notifier.toggleTheme();
              }
          ),
        )
        ),
      ],
    );

  }
}
