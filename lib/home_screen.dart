import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/tabs/ahadeth_tab.dart';
import 'package:islami_application/tabs/quran_tab.dart';
import 'package:islami_application/tabs/radio_tab.dart';
import 'package:islami_application/tabs/sebha_tab.dart';
import 'package:islami_application/tabs/settings_tab.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/background.png",
            fit: BoxFit.fill, width: double.infinity),
        Scaffold(
          drawer: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: MyThemeData.primaryColor, width: 2),
                    shape: BoxShape.circle,
                    color: Colors.white.withAlpha(220),
                  ),
                  width: MediaQuery.of(context).size.width * .6,
                  height: MediaQuery.of(context).size.height * .6,
                  margin: EdgeInsets.all(MediaQuery.of(context).size.width / 5),
                  child: Center(
                    child: Text("""Developed By
                                   Eng.Mostafa Mahmoud""",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: MyThemeData.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                        textAlign: TextAlign.center),
                  )),
            ],
          ),
          appBar: AppBar(
            title:
                //------------- add font manually ___________________________
                //Text("islami", style: TextStyle(color: Colors.black,fontFamily:"ElMessiri",fontSize: 55 )),

                //________________ using a package called google_fonts __________________
                // Text("islami", style:GoogleFonts.elMessiri(fontSize: 30,color: Color(0xFF242424))),

                Text(AppLocalizations.of(context)!.appTitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.black)),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon:
                        const ImageIcon(AssetImage("assets/images/quran.png")),
                    label: "Quran",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon:
                        const ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "Sebah",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon:
                        const ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "Radio",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage("assets/images/ahadeth.png")),
                    label: "Ahadeth",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: "Settings",
                    backgroundColor: MyThemeData.primaryColor),
              ]),
          body: tabs[index],
        ),
      ],
    );
  }

  // here, we are not working on another screen we just change the body
  List<Widget> tabs = [
    QuranTab(),
    SebhaTab(),
    RadioTab(),
    AhadethTab(),
    SettingsTab()
  ];
}
