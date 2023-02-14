import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingsTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final Color iconColor;
  final String title;
  const SettingsTile({
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
            color: iconColor,),
        ),
        const SizedBox(width: 10),
        Text(title,
          style: const TextStyle(
              fontFamily: 'Spoof',
              fontSize: 18,
          ),
        ),
        const SizedBox(width: 10),
        const Spacer(),
        const SizedBox(
          width: 50,
          height: 50,
          child: Icon(Ionicons.chevron_forward_outline),
        )
      ],
    );
  }
}
