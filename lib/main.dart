import 'package:flutter/material.dart';
import 'package:islami_application/home_screen.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/sura_details_screen.dart';
import 'package:islami_application/tabs/ahadeth_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homeScreen.routeName: (context) => homeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        AhadethScreen.routeName: (context) => AhadethScreen(),
      },
      initialRoute: homeScreen.routeName,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
