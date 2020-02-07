import 'package:flutter/material.dart';

   Future<ThemeData> getThemeFromApi(){
     ThemeData themeData=ThemeData(
       primaryColor: Colors.blue
     );
     return Future.value(themeData);
   }

Future<ThemeData> getThemeFromApia(){
  ThemeData themeData=ThemeData(
      primaryColor: Colors.yellow
  );
  return Future.value(themeData);
}
