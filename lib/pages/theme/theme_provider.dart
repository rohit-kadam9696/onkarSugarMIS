//switch between themes

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dark_theme.dart';
import 'light_theme.dart';


class ThemeProvider extends ChangeNotifier{


  ThemeData _themeData = lightMode;


  ThemeData get themeData => _themeData;

  //is current theme dark mode
  bool get isDarkMode => _themeData==darkMode;

  // set theme
  set themeData(ThemeData themeData){
    _themeData=themeData;
    notifyListeners();
  }

  //toggle themes
  void toggleTheme(){
    if(_themeData==lightMode){
      themeData=darkMode;
    }
    else{
      themeData=lightMode;
    }
  }
}