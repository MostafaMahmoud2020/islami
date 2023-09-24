import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/ahadeth_model.dart';
import 'package:islami_application/ahadeth_screen.dart';
import 'package:islami_application/myThemeData.dart';

class AhadethTab extends StatefulWidget {
  const AhadethTab({super.key});

  @override
  State<AhadethTab> createState() => _AhadethTabState();
}

class _AhadethTabState extends State<AhadethTab> {
  List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
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
          Divider(
            thickness: 2,
            color: MyThemeData.primaryColor,
          ),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: MyThemeData.blackColor),
          ),
          Divider(
            thickness: 2,
            color: MyThemeData.primaryColor,
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: MyThemeData.blackColor),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        color: MyThemeData.primaryColor,
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
