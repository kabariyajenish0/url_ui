import 'package:flutter/material.dart';
//import 'package:url_ui/screen/DetailsScreen.dart';
import 'package:url_ui/screen/HomeScreen.dart';
//import 'package:url_ui/screen/news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
