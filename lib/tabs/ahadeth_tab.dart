import 'package:flutter/material.dart';
import 'package:islami_application/ahadeth_model.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/ahadeth_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AhadethTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                            arguments: AhadethModel(index));
                      },
                      child: Text(
                        // "الحديث رقم  ${index+1} "
                        "الحديث رقم  ${index + 1} ",
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
                  itemCount: 50))
        ],
      ),
    );
  }
}
