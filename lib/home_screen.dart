import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/providers/my_provider.dart';
import 'package:islami_application/tabs/ahadeth_tab.dart';
import 'package:islami_application/tabs/quran_tab.dart';
import 'package:islami_application/tabs/sebha_tab.dart';
import 'package:islami_application/tabs/settings_tab.dart';
import 'package:provider/provider.dart';

class homeScreen extends StatefulWidget {
  static const String routeName = "homeScreen";

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Stack(
      children: [
        Image.asset(provider.changeBackground(),
            fit: BoxFit.fill, width: double.infinity),
        Scaffold(
          drawer: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: MyThemeData.primaryColor, width: 2),
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.primary.withAlpha(220),
                  ),
                  width: MediaQuery.of(context).size.width * .6,
                  height: MediaQuery.of(context).size.height * .6,
                  margin: EdgeInsets.all(MediaQuery.of(context).size.width / 5),
                  child: Center(
                    child: Text(
                        """اقْرَءُوا الْقُرْآنَ فَإِنَّهُ يَأْتِي يَوْمَ الْقِيَامَةِ شَفِيعًا لأَصْحَابهِ""",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0,
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
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary)),
          ),
          bottomNavigationBar: BottomNavigationBar(
              enableFeedback: true,
              currentIndex: index,
              onTap: (value) {
                index = value;
                setState(() {});
              },
              items: [
                BottomNavigationBarItem(
                    icon:
                        const ImageIcon(AssetImage("assets/images/quran.png")),
                    label: AppLocalizations.of(context)!.quran,
                    backgroundColor: Theme.of(context).colorScheme.primary),
                BottomNavigationBarItem(
                    icon:
                        const ImageIcon(AssetImage("assets/images/sebha.png")),
                    label: AppLocalizations.of(context)!.sebha,
                    backgroundColor: Theme.of(context).colorScheme.primary),
                /* BottomNavigationBarItem(
                    icon:
                        const ImageIcon(AssetImage("assets/images/radio.png")),
                    label: "Radio",
                    backgroundColor: Theme.of(context).colorScheme.primary),*/
                BottomNavigationBarItem(
                    icon: const ImageIcon(
                        AssetImage("assets/images/ahadeth.png")),
                    label: AppLocalizations.of(context)!.ahadeth,
                    backgroundColor: Theme.of(context).colorScheme.primary),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
                    label: AppLocalizations.of(context)!.settings,
                    backgroundColor: Theme.of(context).colorScheme.primary),
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
    //RadioTab(),
    AhadethTab(),
    SettingsTab()
  ];
}
