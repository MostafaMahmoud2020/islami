import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/home_screen.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          border: Border.all(color: Colors.transparent)),
      height: MediaQuery.of(context).size.height * .3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                  provider.changeTheme(ThemeMode.light);
                  Navigator.pushNamed(context, homeScreen.routeName);
                },
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: provider.modeApp == ThemeMode.light
                              ? MyThemeData.primaryColor
                              : MyThemeData.whiteColor),
                    ),
                    Spacer(),
                    provider.modeApp == ThemeMode.light
                        ? Icon(Icons.done)
                        : Container()
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
                  provider.changeTheme(ThemeMode.dark);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, homeScreen.routeName);
                },
                child: Row(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: provider.modeApp == ThemeMode.dark
                              ? MyThemeData.yellowColor
                              : MyThemeData.blackColor),
                    ),
                    Spacer(),
                    provider.modeApp == ThemeMode.dark
                        ? Icon(Icons.done)
                        : Container()
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
