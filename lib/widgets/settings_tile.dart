import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SettingsTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final MaterialPageRoute page;
  const SettingsTile({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.page,
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
          ),
        ),
        const SizedBox(width: 10),
        Text(title,
          style: const TextStyle(
              fontSize: 20,
          ),
        ),
        const SizedBox(width: 10),
        const Spacer(),
        SizedBox(
          width: 50,
          height: 50,
          child:IconButton(
              onPressed:() async {
                await Navigator.pushReplacement(
                  context,
                  page,
                );
              },
            icon:const Icon(Ionicons.chevron_forward_outline),

          ),
        )
      ],
    );
  }
}
