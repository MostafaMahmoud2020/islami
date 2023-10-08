import 'package:flutter/material.dart';
import 'package:islami_application/ahadeth_model.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/providers/my_provider.dart';
import 'package:provider/provider.dart';

class AhadethScreen extends StatelessWidget {
  static const String routeName = "AhadethScreen";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;

    return Stack(
      children: [
        Image.asset(provider.changeBackground(),
            fit: BoxFit.cover, width: double.infinity),
        Scaffold(
          appBar: AppBar(
            title: Text(
              args.title,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 50,
              color: Theme.of(context).colorScheme.background,
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: MyThemeData.primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(
                        "${args.content[index]} (${index + 1})",
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontFamily: "DecoType Thuluth"),
                        textAlign: TextAlign.center,
                      );
                    },
                    separatorBuilder: (context, index) => Divider(
                        color: MyThemeData.primaryColor,
                        thickness: 2,
                        endIndent: 30,
                        indent: 30),
                    itemCount: args.content.length),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
