import 'package:flutter/material.dart';
import 'package:islami_application/home_screen.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/sura_details_screen.dart';
import 'package:islami_application/ahadeth_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
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
