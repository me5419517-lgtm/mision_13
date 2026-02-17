import 'package:flutter/material.dart';
import 'screen_1.dart';
void main(){
  runApp(Task_13());
}
class Task_13 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen1(),
    );
  }
}