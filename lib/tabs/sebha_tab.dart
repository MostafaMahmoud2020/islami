import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_application/myThemeData.dart';
import 'package:islami_application/providers/my_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> sebha = ["سبحان الله", "الحمد لله", "الله اكبر"];

  int step = 0;
  int activeStep = 0;
  int counter = 0;
  int easyStepCounter = 0;
  int completedCycle = 0;
  double newAngle = 0;
  int index = 0;
  bool flag = false;
  Color? color;
  var pro;

  @override
  Widget build(BuildContext context) {
    pro = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTab,
            child: Transform.rotate(
              angle: newAngle,
              child: Image.asset(pro.changeSebhaBackground(),
                  color: color, scale: 1.5, alignment: Alignment.topCenter),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(AppLocalizations.of(context)!.tasbehatCount,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary)),
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("$counter",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoKufiArabic(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 25,
                          fontWeight: FontWeight.bold))),
            ],
          ),
          const SizedBox(height: 40),
          Visibility(
            visible: flag,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              child: Text(
                "ما شاء الله",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
          const SizedBox(height: 10),

          const SizedBox(height: 10),
          // Container(
          //     decoration: BoxDecoration(
          //         color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.6),
          //         borderRadius: BorderRadius.circular(20)),
          //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          //     child: Text("${sebha[index]}",
          //         style: GoogleFonts.notoKufiArabic(
          //             color: MyThemeData.whiteColor,
          //             fontSize: 25,
          //             fontWeight: FontWeight.bold))),
          EasyStepper(
            activeStep: step,
            //finishedStepBackgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
            lineStyle: LineStyle(
                lineLength: 50,
                lineType: LineType.dashed,
                activeLineColor: Theme.of(context).colorScheme.onSecondary,
                unreachedLineColor: Colors.grey,
                finishedLineColor:
                    Theme.of(context).colorScheme.onPrimaryContainer,
                lineSpace: 2,
                lineWidth: 2,
                progress: 1),
            internalPadding: 2,

            unreachedStepBackgroundColor: Colors.grey,
            activeStepBackgroundColor: Theme.of(context).colorScheme.onSurface,
            finishedStepBackgroundColor:
                Theme.of(context).colorScheme.onSecondary,
            activeStepTextColor: Theme.of(context).colorScheme.onSurface,
            finishedStepTextColor:
                Theme.of(context).colorScheme.onPrimaryContainer,
            unreachedStepTextColor: Colors.grey,
            showScrollbar: true,
            showLoadingAnimation: false,
            showStepBorder: false,
            enableStepTapping: true,
            //disableScroll: true,
            showTitle: true,

            steppingEnabled: false,
            steps: [
              EasyStep(
                customStep: CircleAvatar(
                  radius: 10,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                ),
                title: sebha[0],
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 10,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                ),
                title: sebha[1],
              ),
              EasyStep(
                customStep: CircleAvatar(
                  radius: 10,
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer,
                ),
                title: sebha[2],
              ),
            ],
          )
        ],
      ),
    );
  }

  onTab() {
    counter++;
    activeStep++;
    easyStepCounter++;

    if (easyStepCounter == 33) {
      step = 1;
      setState(() {});
    }

    if (easyStepCounter == 66) {
      step = 2;
      setState(() {});
    }

    if (easyStepCounter == 99) {
      step = 3;
      setState(() {});
    }

    if (counter == 33) {
      counter = 0;

      index++;
      if (index == 3) {
        index = 0;
        completedCycle++;
        easyStepCounter = 0;
        step = 0;
        flag = true;
        color = pro.modeApp == ThemeMode.light
            ? MyThemeData.blackColor
            : MyThemeData.whiteColor;
      }
      setState(() {});
      return;
    }
    if (completedCycle == 1) {
      flag = false;
      completedCycle = 0;
      color = pro.modeApp == ThemeMode.light
          ? MyThemeData.primaryColor
          : MyThemeData.yellowColor;
    }
    newAngle += 0.4;
    setState(() {});
  }
}
