import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_application/ahadeth_model.dart';
import 'package:islami_application/myThemeData.dart';

class AhadethScreen extends StatefulWidget {
  static const String routeName = "AhadethScreen";

  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    if (verses.isEmpty) {
      loadFile(args.index);
    }

    return Stack(
      children: [
        Image.asset("assets/images/background.png",
            fit: BoxFit.cover, width: double.infinity),
        Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 50,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: MyThemeData.primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(
                        verses[index],
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                        color: MyThemeData.primaryColor,
                        thickness: 2,
                        endIndent: 30,
                        indent: 30),
                    itemCount: verses.length),
              ),
            ),
          ),
        ),
      ],
    );
  }

  loadFile(int index) async {
    String file = await rootBundle
        .loadString("assets/files/ahadeth_details/h${index + 1}.txt");
    List<String> lines = file.split("\n");
    verses = lines;
    setState(() {});
  }
}
