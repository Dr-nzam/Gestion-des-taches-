import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inetache/core/colors.dart';
import 'package:inetache/core/form_widget/formprefixe_widget.dart';
import 'package:inetache/data/bd.dart';
import 'package:inetache/data/model.dart';
import 'package:inetache/routes/app_route.dart';
import 'package:intl/intl.dart';
import 'package:flashtoast/flash_toast.dart';

class AjouterTache extends StatefulWidget {
  const AjouterTache({super.key});

  @override
  State<AjouterTache> createState() => _AjouterTacheState();
}

class _AjouterTacheState extends State<AjouterTache> {
  final TextEditingController controlerTitre = TextEditingController();
  final TextEditingController controlerDate = TextEditingController();
  final TextEditingController controlerDescription = TextEditingController();
  int choix = 0;
  late final bool? isDone;
  final keyform = GlobalKey<FormState>();

  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Tache> taches = [];

  @override
  void initState() {
    super.initState();
    _fetchTaches();
  }

  void _fetchTaches() async {
    taches = await _dbHelper.getTaches();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                  onTap: ()  {
                    setState(() async{
                      await selectDate(context);
                    });
                    
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
                ElevatedButton(
                    onPressed: () async {
                      if (keyform.currentState!.validate()) {
                        if (choix != 0) {
                          final tache = Tache(
                            titre: controlerTitre.text,
                            description: controlerDescription.text,
                            priorite: choix,
                            date: controlerDate.text,
                            isDone: 0, // Assurez-vous d'initialiser isDone
                          );

                          try {
                            await _dbHelper.insertTache(tache);
                            _fetchTaches();
                            controlerTitre.text = "";
                            controlerDescription.text = "";
                            controlerDate.text = "";
                            choix = 0;
                            
                            Get.offAllNamed(AppRoute.listeTache);
                            FlashToast.showFlashToast(
                                // ignore: use_build_context_synchronously
                                context: context,
                                title: "Succès ",
                                message: "La tâche a été ajoutée avec succès",
                                flashType: FlashType.success,
                                duration: 3);
                              
                            // var a =await _dbHelper.getTaches();
                            // for(int i=0 ;i<a.length;i++){
                            //   print(a[i].titre);
                            // }
                          } catch (e) {
                            FlashToast.showFlashToast(
                                // ignore: use_build_context_synchronously
                                context: context,
                                title: "Erreur ",
                                message: "Erreur: $e",
                                flashType: FlashType.error,
                                duration: 3);
                          }
                        } else {
                          FlashToast.showFlashToast(
                              context: context,
                              title: "Erreur de saisie",
                              message: "Veillez renseigner la priorité",
                              flashType: FlashType.error);
                        }
                      } else {
                        FlashToast.showFlashToast(
                            context: context,
                            title: "Erreur de saisie",
                            message: "Veillez remplir tous les champs.",
                            flashType: FlashType.error,
                            duration: 3);
                      }
                    },
                    child: const Text("Enregistré"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
