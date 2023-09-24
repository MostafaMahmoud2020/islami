import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/sura_model.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = "SuraDetailsScreen";

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(args.suraName, style: Theme.of(context).textTheme.bodyLarge),
        ),
        body: Card(
          elevation: 50,
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: MyThemeData.primaryColor),
              borderRadius: const BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(9),
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                    color: MyThemeData.primaryColor,
                    thickness: 1,
                    endIndent: 30,
                    indent: 30),
                itemBuilder: (context, index) {
                  return Text(
                    "${verses[index]} (${index + 1})",
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  );
                },
                itemCount: verses.length),
          ),
        ),
      ),
    );
  }

  loadFile(int index) async {
    String file = await rootBundle
        .loadString("assets/files/sura_details/${index + 1}.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    setState(() {});
  }
}
