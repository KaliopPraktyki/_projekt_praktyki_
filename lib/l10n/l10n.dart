import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('de'),
    const Locale('pl'),
    const Locale('uk'),
  ];

  static String getLanguage(String){
     switch(String){
       case 'en':
         return 'English';
       case 'de':
         return 'Deutsch';
       case 'pl':
         return 'Polski';
       case 'uk':
         return 'Українська';
     }
     return String;
  }
}