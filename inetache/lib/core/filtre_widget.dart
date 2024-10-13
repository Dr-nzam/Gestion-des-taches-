import 'package:flutter/material.dart';
import 'package:inetache/core/colors.dart';

class FilterWidget extends StatelessWidget {
  final String nomFiltre;
  final Color backgroundColors;
  final Color textColors;
  const FilterWidget(
      {super.key,
      required this.nomFiltre,
      this.backgroundColors = CouleurApp.filterColor,
      this.textColors = CouleurApp.textprincipalColor});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          // height: ,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColors,
          ),

          child: Center(
              child: Text(
            nomFiltre,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: textColors),
          )),
        )
      ],
    );
  }
}
