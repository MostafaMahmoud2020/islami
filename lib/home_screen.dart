import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
          appBar: AppBar(
            title:
                //------------- add font manually ___________________________
                //Text("islami", style: TextStyle(color: Colors.black,fontFamily:"ElMessiri",fontSize: 55 )),

                //________________ using a package called google_fonts __________________
                // Text("islami", style:GoogleFonts.elMessiri(fontSize: 30,color: Color(0xFF242424))),

                Text("islami",
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
                    icon: ImageIcon(AssetImage("assets/images/quran.png")),
                    label: "Quran",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: "Sebah",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "Radio",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/images/ahadeth.png")),
                    label: "Ahadeth",
                    backgroundColor: MyThemeData.primaryColor),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
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
