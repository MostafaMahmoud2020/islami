import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/Language_bottom_sheet.dart';
import 'package:islami_application/Theme_bottom_sheet.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          InkWell(
            onTap: showBottomSheetLanguage,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      provider.iconFlag
                          ? AppLocalizations.of(context)!.english
                          : AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 25),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_downward,
                      size: 23,
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.appearance,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
          InkWell(
            onTap: showBottomSheetAppearance,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: MyThemeData.primaryColor)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      provider.modeApp == ThemeMode.light
                          ? AppLocalizations.of(context)!.light
                          : AppLocalizations.of(context)!.dark,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 25),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_downward,
                      size: 23,
                    )
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Text(
              "Thanks for using us ",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  wordSpacing: 2),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  showBottomSheetLanguage() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  showBottomSheetAppearance() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      shape: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }
}
