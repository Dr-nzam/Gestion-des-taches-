import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inetache/core/colors.dart';
import 'package:inetache/core/form_widget/formprefixe_widget.dart';
import 'package:inetache/routes/app_route.dart';
import 'package:intl/intl.dart';

class ModifierTache extends StatefulWidget {
  const ModifierTache({super.key});

  @override
  State<ModifierTache> createState() => _ModifierTacheState();
}

class _ModifierTacheState extends State<ModifierTache> {
  final TextEditingController controlerTitre = TextEditingController(text: 'jeux');
  final TextEditingController controlerDate = TextEditingController(text: '12/12/2022');	
  final TextEditingController controlerDescription = TextEditingController(text: 'int-consulting recrute fhiufhigfihfhhiuawhhuihgeasghsaihgzgiha'); 
  int choix = 0;
  @override
  Widget build(BuildContext context) {
    choix = 1;
    DateTime yearnow = DateTime.now();
    int currentYear = yearnow.year;
    int finalYear = currentYear + 1;
    Future selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(finalYear),
      );

      if (picked != null) {
        setState(() {
          controlerDate.text = DateFormat('dd/M/yyyy').format(picked);
        });
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ajouter une Taches",
          style: TextStyle(
              color: CouleurApp.textprincipalColor,
              fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: CouleurApp.textprincipalColor,
            )),
        actions: [
          IconButton(
            onPressed: () {Get.toNamed(AppRoute.parametre);},
            icon: const Icon(
              Icons.settings,
              color: CouleurApp.textprincipalColor,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Titre:",
                style: TextStyle(
                    // fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: CouleurApp.titreColor),
              ),
              FormPreFixeWidget(
                placeholder: "Titre de la tache",
                controller: controlerTitre,
                prefixIcon: const Icon(Icons.mode_edit_outline_outlined),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Date:",
                style: TextStyle(
                    // fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: CouleurApp.titreColor),
              ),
              FormPreFixeWidget(
                controller: controlerDate,
                placeholder: "jj/mm/aaaa",
                keyboardType: TextInputType.none,
                prefixIcon: const Icon(Icons.calendar_today_outlined),
                onTap: () async {
                  await selectDate(context);
                },
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Description:",
                style: TextStyle(
                    // fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: CouleurApp.titreColor),
              ),
              FormPreFixeWidget(
                controller: controlerDescription,
                sizeForm: 5,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Priorité:",
                style: TextStyle(
                    // fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: CouleurApp.titreColor),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 25),
                  ),
                  const Text(
                    "Basse:",
                    style: TextStyle(
                        // fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: CouleurApp.titreColor),
                  ),
                  Radio(
                      value: 1,
                      groupValue: choix,
                      activeColor: CouleurApp.prioritePetiteColor,
                      onChanged: (int? value) {
                        setState(() {
                          choix = value!;
                        });
                      }),
                  const Text(
                    "Moyenne:",
                    style: TextStyle(
                        // fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: CouleurApp.titreColor),
                  ),
                  Radio(
                      value: 2,
                      groupValue: choix,
                      activeColor: CouleurApp.prioriteMoyenneColor,
                      onChanged: (int? value) {
                        setState(() {
                          choix = value!;
                        });
                      }),
                  const Text(
                    "Haute:",
                    style: TextStyle(
                        // fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: CouleurApp.titreColor),
                  ),
                  Radio(
                    value: 3,
                    groupValue: choix,
                    activeColor: CouleurApp.prioriteHauteColor,
                    onChanged: (int? value) {
                      setState(() {
                        choix = value!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Modifier"))
            ],
          ),
        ],
      ),
    );
  }
}