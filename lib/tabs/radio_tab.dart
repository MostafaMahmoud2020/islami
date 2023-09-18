import 'package:flutter/material.dart';
import 'package:islami_application/myThemeData.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
          ),
          Image.asset("assets/images/radio_image.png",
              scale: 1.5, alignment: Alignment.center),
          const SizedBox(
            height: 30,
          ),
          Text(
            "اذاعة القران الكريم",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: MyThemeData.blackColor),
          ),
          const SizedBox(
            height: 50,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.skip_previous),
              Icon(Icons.play_arrow),
              Icon(Icons.skip_next),
            ],
          )
        ],
      ),
    );
  }
}
