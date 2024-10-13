import 'package:flutter/material.dart';
import 'package:inetache/core/colors.dart';

class Priorite extends StatelessWidget {
  final bool petite;
  final bool moyenne; 
  final bool grande ;
  const Priorite({super.key,  this.petite=false, this.moyenne=false, this.grande = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         const Text("B"),
        Container(
          height: 10,
          width: 15,
          decoration:  BoxDecoration(
            border:Border.all(color: CouleurApp.prioritePetiteColor),
            shape: BoxShape.circle,
            color: petite? CouleurApp.prioritePetiteColor:CouleurApp.textprincipalColor,
          ),
        ),
         const Text("M"),
        Container(
          height: 10,
          width: 15,
          decoration: BoxDecoration(
            border: Border.all(
              color:Colors.orange
            ) ,
            shape: BoxShape.circle,
            color:moyenne? CouleurApp.prioriteMoyenneColor: CouleurApp.textprincipalColor,
          ),
        ),
       
         const Text("H"),
        Container(
          height: 10,
          width: 15,
          decoration: BoxDecoration(
            border: Border.all(
              color: CouleurApp.prioriteHauteColor
            ),
            shape: BoxShape.circle,
            color: grande? CouleurApp.prioriteHauteColor:CouleurApp.textprincipalColor,
          ),
        )
      ],
    );
  }
}
