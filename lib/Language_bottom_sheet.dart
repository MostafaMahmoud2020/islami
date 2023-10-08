import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/home_screen.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/providers/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          border: Border.all(color: Colors.transparent)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  provider.changeLanguage("en");
                  provider.iconFlag = true;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, homeScreen.routeName);
                },
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.english,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: provider.iconFlag
                              ? Theme.of(context).colorScheme.onSecondary
                              : Theme.of(context).colorScheme.onPrimary),
                    ),
                    Spacer(),
                    provider.iconFlag ? Icon(Icons.done) : Container()
                  ],
                ),
              ),
            ),
            Divider(
              color: MyThemeData.primaryColor,
              thickness: 1,
              indent: 100,
              endIndent: 100,
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  provider.changeLanguage("ar");
                  provider.iconFlag = false;
                  Navigator.pop(context);
                  Navigator.pushNamed(context, homeScreen.routeName);
                },
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: provider.iconFlag
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.onSecondary),
                    ),
                    Spacer(),
                    provider.iconFlag ? Container() : Icon(Icons.done)
                    //Icon(Icons.done)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
