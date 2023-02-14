import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../provider/theme_provider.dart';

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
    final themeProvider = Provider.of<ThemeProvider>(context);
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
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        ),
        const SizedBox(width: 10,),
        const Spacer(),
        CupertinoSwitch(
        activeColor: const Color.fromARGB(255, 45,155,240),
        value: themeProvider.isDarkMode,
        onChanged: (value){
      final provider = Provider.of<ThemeProvider>(context,listen: false);
      provider.toggleTheme(value);
    }
    ),
      ],
    );

  }
}
