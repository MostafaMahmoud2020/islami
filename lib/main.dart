import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_application/ahadeth_screen.dart';
import 'package:islami_application/home_screen.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/providers/my_provider.dart';
import 'package:islami_application/sura_details_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      locale: Locale(provider.languageCode),
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
      themeMode: provider.modeApp,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
    );
  }
}
