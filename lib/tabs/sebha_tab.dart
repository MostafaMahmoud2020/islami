import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_application/myThemeData.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> sebha = ["سبحان الله", "الحمد لله", "الله اكبر"];

  int counter = 0;
  int completedCycle = 0;
  double newAngle = 0;
  int index = 0;
  bool flag = false;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onTab,
            child: Transform.rotate(
              angle: newAngle,
              child: Image.asset("assets/images/sebha_image.png",
                  color: color, scale: 1.5, alignment: Alignment.topCenter),
            ),
          ),
          const SizedBox(height: 20),
          Text(AppLocalizations.of(context)!.tasbehatCount,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: MyThemeData.blackColor)),
          const SizedBox(height: 40),
          Visibility(
            visible: flag,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: MyThemeData.primaryColor.withOpacity(0.6),
              ),
              child: Text(
                "ما شاء الله",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: MyThemeData.blackColor),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
              decoration: BoxDecoration(
                  color: MyThemeData.primaryColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text("$counter",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.notoKufiArabic(
                      color: MyThemeData.blackColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
          const SizedBox(height: 10),
          Container(
              decoration: BoxDecoration(
                  color: MyThemeData.primaryColor.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Text("${sebha[index]}",
                  style: GoogleFonts.notoKufiArabic(
                      color: MyThemeData.whiteColor,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }

  onTab() {
    counter++;
    if (counter == 33) {
      counter = 0;

      index++;
      if (index == 3) {
        index = 0;
        completedCycle++;
        flag = true;
        color = Colors.black;
      }
      setState(() {});
      return;
    }
    if (completedCycle == 1) {
      flag = false;
      completedCycle = 0;
      color = MyThemeData.primaryColor;
    }
    newAngle += 1;
    setState(() {});
  }
}
