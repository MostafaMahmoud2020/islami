import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/ahadeth_model.dart';
import 'package:islami_application/ahadeth_screen.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../providers/my_provider.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var _backgroundColor = provider.changeColor();

    var _colors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.inversePrimary,
    ];

    const _durations = [
      9000,
      9000,
    ];

    const _heightPercentages = [
      0.55,
      0.52,
    ];

    if (allAhadeth.isEmpty) {
      loadFile();
    }

    return Center(
      child: Column(
        children: [
          Image.asset(
            "assets/images/ahadeth_image.png",
            scale: 1.2,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.onSecondary,
                height: 2,
              ),
              Stack(
                children: [
                  WaveWidget(
                    config: CustomConfig(
                      colors: _colors,
                      durations: _durations,
                      heightPercentages: _heightPercentages,
                    ),
                    backgroundColor: _backgroundColor,
                    size: Size(double.infinity,
                        MediaQuery.of(context).size.height * .07),
                    waveAmplitude: 10,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.ahadeth,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                height: 0,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AhadethScreen.routeName,
                            arguments: allAhadeth[index]);
                      },
                      child: Text(
                        allAhadeth[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).colorScheme.onSecondary,
                        thickness: 1,
                        indent: 30,
                        endIndent: 30,
                      ),
                  itemCount: allAhadeth.length))
        ],
      ),
    );
  }

  loadFile() async {
    rootBundle.loadString("assets/files/ahadeth.txt").then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> hadethContent = hadethOneLines;
        //you can pass hadethOneLines directly to AhadethModel instead of making a new list.
        AhadethModel ahadethModel = AhadethModel(title, hadethContent);
        allAhadeth.add(ahadethModel);
      }
      setState(
          () {}); // why we use this ? Because we have a list called allahadeth which we need to add to it a new data.
      //also  when we call this function in widget function ,when compiler saw it a futuer it skip it so we rebuild to pass data to allAhadeth
    }).catchError((e) {
      debugPrint(e.toString());
    });

    //setState(() {});
  }
}
