import 'package:flashtoast/flash_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inetache/core/colors.dart';
import 'package:inetache/core/form_widget/formprefixe_widget.dart';
import 'package:inetache/data/bd.dart';
import 'package:inetache/data/model.dart';
import 'package:inetache/routes/app_route.dart';
import 'package:intl/intl.dart';

class ModifierTache extends StatefulWidget {
  const ModifierTache({super.key});

  @override
  State<ModifierTache> createState() => _ModifierTacheState();
}

class _ModifierTacheState extends State<ModifierTache> {
  int? choix;
  int? id;
  final keyform = GlobalKey<FormState>();
  late final TextEditingController controlerTitre;
  late final TextEditingController controlerDate;
  late final TextEditingController controlerDescription;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();

    final args = Get.arguments;
    Tache tache = args['tache'];

    controlerTitre = TextEditingController(text: tache.titre);
    controlerDate = TextEditingController(text: tache.date);
    controlerDescription = TextEditingController(text: tache.description);
    choix = tache.priorite;
    id = tache.id;
  }

  @override
  void dispose() {
    controlerTitre.dispose();
    controlerDate.dispose();
    controlerDescription.dispose();
    super.dispose();
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (picked != null) {
      setState(() {
        controlerDate.text = DateFormat('dd/M/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Modifier une Tâche",
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
            onPressed: () {
              Get.toNamed(AppRoute.parametre);
            },
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
          Form(
            key: keyform,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Titre:",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: CouleurApp.titreColor),
                ),
                FormPreFixeWidget(
                  placeholder: "Titre de la tâche",
                  controller: controlerTitre,
                  prefixIcon: const Icon(Icons.mode_edit_outline_outlined),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Date:",
                  style: TextStyle(
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
                const SizedBox(height: 15),
                const Text(
                  "Description:",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: CouleurApp.titreColor),
                ),
                FormPreFixeWidget(
                  controller: controlerDescription,
                  sizeForm: 5,
                ),
                const SizedBox(height: 15),
                const Text(
                  "Priorité:",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: CouleurApp.titreColor),
                ),
                Row(
                  children: [
                    const Text("Basse:"),
                    Radio(
                      value: 1,
                      groupValue: choix,
                      activeColor: CouleurApp.prioritePetiteColor,
                      onChanged: (int? value) {
                        setState(() {
                          choix = value;
                        });
                      },
                    ),
                    const Text("Moyenne:"),
                    Radio(
                      value: 2,
                      groupValue: choix,
                      activeColor: CouleurApp.prioriteMoyenneColor,
                      onChanged: (int? value) {
                        setState(() {
                          choix = value;
                        });
                      },
                    ),
                    const Text("Haute:"),
                    Radio(
                      value: 3,
                      groupValue: choix,
                      activeColor: CouleurApp.prioriteHauteColor,
                      onChanged: (int? value) {
                        setState(() {
                          choix = value;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (keyform.currentState!.validate()) {
                      Tache element = Tache(
                        id: id,
                        titre: controlerTitre.text,
                        description: controlerDescription.text,
                        priorite: choix!,
                        date: controlerDate.text,
                      );
                      try {
                        await _dbHelper.updateTache(element);
                        FlashToast.showFlashToast(
                            context: context,
                            title: "Succès",
                            message: "Tâche modifiée avec succès",
                            flashType: FlashType.success,
                            duration: 3);
                        Get.offAllNamed(AppRoute.listeTache);
                      } catch (e) {
                        FlashToast.showFlashToast(
                            context: context,
                            title: "Erreur",
                            message:
                                "Erreur $e lors de la modification de la tâche",
                            flashType: FlashType.error,
                            duration: 4);
                      }
                    } else {
                      FlashToast.showFlashToast(
                        context: context,
                        title: "Erreur de saisie",
                        message: "Veuillez remplir tous les champs.",
                        flashType: FlashType.error,
                        duration: 3,
                      );
                    }
                  },
                  child: const Text("Modifier"),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
