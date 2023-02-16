import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageChanger extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String title;
  const LanguageChanger({
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
            fontFamily: 'Spoof',
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 10,),
        const Spacer(),
        PopupMenuButton(itemBuilder: (context) =>[
          const PopupMenuItem(
              child: Text('English')
          ),
          const PopupMenuItem(
              child: Text('Deutsch')
          ),
          const PopupMenuItem(
              child:Text('Polski')
          ),
          const PopupMenuItem(
              child: Text('Українська')
          ),
        ]
        ),
      ],
    );

  }
}
