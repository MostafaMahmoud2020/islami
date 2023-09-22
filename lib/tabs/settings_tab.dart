import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/myThemeData.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context)
                ?.textTheme
                .bodyMedium
                ?.copyWith(color: MyThemeData.blackColor),
          ),
          InkWell(
            onTap: showBottomSheet,
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
                      "English",
                      style: Theme.of(context)
                          ?.textTheme
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
          SizedBox(
            height: 25,
          ),
          Text(
            AppLocalizations.of(context)!.appearance,
            style: Theme.of(context)
                ?.textTheme
                .bodyMedium
                ?.copyWith(color: MyThemeData.blackColor),
          ),
          InkWell(
            onTap: showBottomSheet,
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
                      "Light",
                      style: Theme.of(context)
                          ?.textTheme
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
        ],
      ),
    );
  }

  showBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * .3,
        );
      },
    );
  }
}
