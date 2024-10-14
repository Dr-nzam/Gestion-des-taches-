import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:inetache/core/colors.dart';
import 'package:inetache/core/page_component/priorite.dart';

// import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ScrollingMenu extends StatefulWidget {
  final bool petite;
  final bool moyenne;
  final bool grande;
  final String statut;
  final String description;
  final String date;
  String title;
  VoidCallback? onTap;
  Function? terminerFunction;
  Function? modificationFunction;
  

  ScrollingMenu({
    super.key,
    required this.title,
    this.petite = false,
    this.moyenne = false,
    this.grande = false,
    required this.statut,
    required this.description,
    required this.date,
    this.onTap,
    this.terminerFunction,
    this.modificationFunction
  });

  @override
  State<ScrollingMenu> createState() => _ScrollingMenuState();
}

class _ScrollingMenuState extends State<ScrollingMenu> {
  bool showSubtitles = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: const Color(0xFFEBEBEB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.62,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: widget.title,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: CouleurApp.titreColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    Priorite(
                      petite: widget.petite,
                      moyenne: widget.moyenne,
                      grande: widget.grande,
                    ),
                    Text(
                      widget.statut,
                      style: const TextStyle(
                          color: CouleurApp.titreColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: ()=>widget.onTap!(),
                icon: const Icon(
                  Icons.delete_forever_sharp,
                  color: CouleurApp.deleteColor,
                ),
              ),
              showSubtitles
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          showSubtitles = !showSubtitles;
                        });
                      },
                      child: const Icon(Icons.arrow_drop_up))
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          showSubtitles = !showSubtitles;
                        });
                      },
                      child: const Icon(Icons.arrow_drop_down),
                    ),
            ],
          ),
          if (showSubtitles)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.description),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          "Date : ${widget.date}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: CouleurApp.titreColor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.statut == "En cours"
                            ? ElevatedButton(
                                onPressed: () {widget.terminerFunction!();},
                                child: const Text("Terminé?"),
                              )
                            : const SizedBox(),
                        TextButton(
                          onPressed: () => widget.modificationFunction!(), 
                          child: const Text("Modifier?"),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
        ],
      ),
    );
  }
}
