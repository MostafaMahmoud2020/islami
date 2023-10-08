import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_application/sura_model.dart';
import 'package:provider/provider.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import '../providers/my_provider.dart';
import '../sura_details_screen.dart';

class QuranTab extends StatelessWidget {
  List<String> suraName = [
    "الفاتحه",
    "البقرة",
    "آل عمران",
    "النساء",
    "المائدة",
    "الأنعام",
    "الأعراف",
    "الأنفال",
    "التوبة",
    "يونس",
    "هود",
    "يوسف",
    "الرعد",
    "إبراهيم",
    "الحجر",
    "النحل",
    "الإسراء",
    "الكهف",
    "مريم",
    "طه",
    "الأنبياء",
    "الحج",
    "المؤمنون",
    "النّور",
    "الفرقان",
    "الشعراء",
    "النّمل",
    "القصص",
    "العنكبوت",
    "الرّوم",
    "لقمان",
    "السجدة",
    "الأحزاب",
    "سبأ",
    "فاطر",
    "يس",
    "الصافات",
    "ص",
    "الزمر",
    "غافر",
    "فصّلت",
    "الشورى",
    "الزخرف",
    "الدّخان",
    "الجاثية",
    "الأحقاف",
    "محمد",
    "الفتح",
    "الحجرات",
    "ق",
    "الذاريات",
    "الطور",
    "النجم",
    "القمر",
    "الرحمن",
    "الواقعة",
    "الحديد",
    "المجادلة",
    "الحشر",
    "الممتحنة",
    "الصف",
    "الجمعة",
    "المنافقون",
    "التغابن",
    "الطلاق",
    "التحريم",
    "الملك",
    "القلم",
    "الحاقة",
    "المعارج",
    "نوح",
    "الجن",
    "المزّمّل",
    "المدّثر",
    "القيامة",
    "الإنسان",
    "المرسلات",
    "النبأ",
    "النازعات",
    "عبس",
    "التكوير",
    "الإنفطار",
    "المطفّفين",
    "الإنشقاق",
    "البروج",
    "الطارق",
    "الأعلى",
    "الغاشية",
    "الفجر",
    "البلد",
    "الشمس",
    "الليل",
    "الضحى",
    "الشرح",
    "التين",
    "العلق",
    "القدر",
    "البينة",
    "الزلزلة",
    "العاديات",
    "القارعة",
    "التكاثر",
    "العصر",
    "الهمزة",
    "الفيل",
    "قريش",
    "الماعون",
    "الكوثر",
    "الكافرون",
    "النصر",
    "المسد",
    "الإخلاص",
    "الفلق",
    "الناس"
  ];

  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    var _backgroundColor = provider.changeColor();

    var _colors = [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.inversePrimary,
    ];

    const _durations = [
      9000,
      9000,
    ];

    const _heightPercentages = [
      0.55,
      0.52,
    ];

    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quran_image.png",
            alignment: Alignment.topCenter,
            scale: 1.4,
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Divider(
                thickness: 2,
                color: Theme.of(context).colorScheme.onSecondary,
                height: 2,
              ),
              Stack(
                children: [
                  WaveWidget(
                    config: CustomConfig(
                      colors: _colors,
                      durations: _durations,
                      heightPercentages: _heightPercentages,
                    ),
                    backgroundColor: _backgroundColor,
                    size: Size(double.infinity,
                        MediaQuery.of(context).size.height * .07),
                    waveAmplitude: 10,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.suraNames,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 2,
                height: 0,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ],
          ),
          Expanded(
            // here we used expanded to define height for list view
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  color: Theme.of(context).colorScheme.onSecondary,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                );
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SuraDetailsScreen.routeName,
                          arguments: SuraModel(suraName[index], index));
                    },
                    child: Text(
                      "(${index + 1})  -   ${suraName[index]}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary),
                      textAlign: TextAlign.center,
                      //textDirection: TextDirection.rtl,
                    ),
                  ),
                );
              },
              itemCount: suraName.length,
            ),
          )
        ],
      ),
    );
  }
}
