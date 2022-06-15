import 'package:flutter/material.dart';
import 'package:flutter_mvvm/presentation/resourcese/routs_manager.dart';
import 'package:flutter_mvvm/presentation/resourcese/theme_manager.dart';

class MyApp extends StatefulWidget {

  int appState = 0;
  //named constructor
  MyApp._internal();

  static final MyApp _instance = MyApp._internal(); //singleton or single instance

  factory MyApp() => _instance;


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}

// class test extends StatelessWidget {
//   const test({Key? key}) : super(key: key);
// void updateAppState (){
//  MyApp().appState=11;
// }
// void getAppState(){
//   print( MyApp().appState);//11
// }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
// class test2 extends StatelessWidget {
//   const test2({Key? key}) : super(key: key);
//
// void getAppState(){
//   print( MyApp().appState);//11
// }
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
