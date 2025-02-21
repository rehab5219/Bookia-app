import 'package:flutter/material.dart';

extension NavigatorExt on BuildContext{
  void pushTo(Widget newScreen){
    Navigator.push(this, MaterialPageRoute(builder: (context) => newScreen,));
  }

  void pushReplacement(Widget newScreen){
    Navigator.pushReplacement(
        this, MaterialPageRoute(builder: (context) => newScreen,));
  }

  void pushAndRemove(Widget newScreen){
    Navigator.pushAndRemoveUntil(
        this, MaterialPageRoute(builder: (context) => newScreen,), (
        route) => false);
  }
}