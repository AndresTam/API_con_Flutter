import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recetas/views/screens/recetas_screen.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // status bar color
    statusBarIconBrightness: Brightness.light,
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recetas de Comida",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: RecetasScreen(),
    );
  }
}