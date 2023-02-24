import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ProjektPraktyki/l10n/l10n.dart';
import 'package:ProjektPraktyki/provider/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageChanger extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  const LanguageChanger({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

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
        const SizedBox(width: 10,),
        Text(title,
          style: const TextStyle(
            fontFamily: 'Spoof',
            fontSize: 20,
          ),
        ),
        const SizedBox(width: 10,),
        const Spacer(),
        DropdownButtonHideUnderline(
            child: DropdownButton(
              items: L10n.all.map(
                  (locale){
                    final language = L10n.getLanguage(locale.languageCode);
                    return DropdownMenuItem(
                     value: locale,
                     child: Text(
                       language
                     ),
                      onTap: (){
                        final provider = Provider.of<LocaleProvider>(context,listen:false);
                        provider.setLocale(locale);
                      },
                    );
                  },
              ).toList(),
              value: locale,

              onChanged: (_){},
            ),
        ),
        // PopupMenuButton(itemBuilder: (context) =>[
        //   const PopupMenuItem(
        //       child: Text('English')
        //   ),
        //   const PopupMenuItem(
        //       child: Text('Deutsch')
        //   ),
        //   const PopupMenuItem(
        //       child:Text('Polski')
        //   ),
        //   const PopupMenuItem(
        //       child: Text('Українська')
        //   ),
        // ]
        // ),
      ],
    );

  }
}
