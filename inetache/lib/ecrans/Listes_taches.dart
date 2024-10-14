// ignore: file_names
import 'package:flashtoast/flash_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inetache/core/colors.dart';
import 'package:inetache/core/filtre_widget.dart';
import 'package:inetache/core/form_widget/form_widget.dart';
import 'package:inetache/core/page_component/scrolling_menu.dart';
import 'package:inetache/data/bd.dart';
import 'package:inetache/data/model.dart';
import 'package:inetache/routes/app_route.dart';

class ListeTache extends StatefulWidget {
  const ListeTache({super.key});

  @override
  State<ListeTache> createState() => _ListeTacheState();
}

class _ListeTacheState extends State<ListeTache> {
  final TextEditingController controllerSearch = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();
  int isDone = -1;
  int priorite = -1;
  int numDate = -1;
  String searchValeur = "";
  bool verification = false;
  String statut = "En cours";
  bool isPetite = false;
  bool isMoyenne = false;
  bool isHaute = false;
  List<Tache> taches = [];
  int id = 0;
  @override
  void initState() {
    super.initState();
    _fetchTaches();
  }

  void _fetchTaches() async {
    taches = await _dbHelper.getTaches();

    setState(() {});
  }

  void showDeleteConfirmationDialog(int id) {
    Get.defaultDialog(
      title: "Suppression",
      middleText: "Voulez-vous vraiment supprimer cette tache ?",
      textConfirm: "Oui",
      textCancel: "Non",
      confirmTextColor: Colors.white,
      onConfirm: () async {
        await _dbHelper.deleteTache(id);
        _fetchTaches();
        Get.back();
      },
      onCancel: () {
        Get.back(); // Close the dialog
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mes Taches",
          style: TextStyle(
              color: CouleurApp.textprincipalColor,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.parametre);
              },
              icon: const Icon(
                Icons.settings,
                color: CouleurApp.textprincipalColor,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          // padding: const EdgeInsets.all(15),
          children: [
            FormWidget(
              controller: controllerSearch,
              placeholder: "Chercher une tache",
              callback: (search) async{
                setState(() {
                  searchValeur = search;
                 
                  print(searchValeur);
                  // controller.listUser(user.token['token'], search: search);
                  // RechercheEvent(seach);
                });
              },
              suffixIcon: const IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      verification = false;
                      if (isDone == 1) {
                        isDone = -1;
                      } else {
                        isDone = 1;
                        priorite = -1;
                        numDate = -1;
                        verification = true;
                      }
                    });
                  },
                  child: FilterWidget(
                    nomFiltre: "Terminé",
                    backgroundColors: isDone == 1
                        ? CouleurApp.primaryColor
                        : CouleurApp.filterColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (isDone == 0) {
                        isDone = -1;
                        verification = false;
                      } else {
                        verification = true;
                        isDone = 0;
                        priorite = -1;
                        numDate = -1;
                      }
                    });
                  },
                  child: FilterWidget(
                    nomFiltre: "En cour",
                    backgroundColors: isDone == 0
                        ? CouleurApp.primaryColor
                        : CouleurApp.filterColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (numDate == 1) {
                        verification = false;
                        numDate = -1;
                      } else {
                        numDate = 1;
                        isDone = -1;
                        priorite = -1;
                        verification = true;
                      }
                    });
                  },
                  child: FilterWidget(
                    nomFiltre: "Date \u{2B06}",
                    backgroundColors: numDate == 1
                        ? CouleurApp.primaryColor
                        : CouleurApp.filterColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (numDate == 2) {
                        verification = false;
                        numDate = -1;
                      } else {
                        numDate = 2;
                        isDone = -1;
                        priorite = -1;
                        verification = true;
                      }
                    });
                  },
                  child: FilterWidget(
                    nomFiltre: "Date \u{2B07}",
                    backgroundColors: numDate == 2
                        ? CouleurApp.primaryColor
                        : CouleurApp.filterColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (priorite == 1) {
                        priorite = -1;
                        verification = false;
                      } else {
                        verification = true;
                        priorite = 1;
                        isDone = -1;
                        numDate = -1;
                      }
                    });
                  },
                  child: FilterWidget(
                    nomFiltre: "basse",
                    backgroundColors: priorite == 1
                        ? CouleurApp.primaryColor
                        : CouleurApp.filterColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (priorite == 2) {
                        priorite = -1;
                        verification = false;
                      } else {
                        verification = true;
                        priorite = 2;
                        isDone = -1;
                        numDate = -1;
                      }
                    });
                  },
                  child: FilterWidget(
                    nomFiltre: "moyenne",
                    backgroundColors: priorite == 2
                        ? CouleurApp.primaryColor
                        : CouleurApp.filterColor,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (priorite == 3) {
                        priorite = -1;
                        verification = false;
                      } else {
                        verification = true;
                        priorite = 3;
                        isDone = -1;
                        numDate = -1;
                      }
                    });
                  },
                  child: FilterWidget(
                    nomFiltre: "haute",
                    backgroundColors: priorite == 3
                        ? CouleurApp.primaryColor
                        : CouleurApp.filterColor,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<Tache>>(
                future: _dbHelper.getTaches(
                    isDone: isDone,
                    priorite: priorite,
                    verification: verification,
                    numDate: numDate,
                    ), // Récupère la liste des tâches
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erreur: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Aucune tâche trouvée.'));
                  } else {
                    final List<Tache> taches = snapshot.data!.obs;

                    return Obx(
                      () => ListView.builder(
                        itemCount: taches.length,
                        itemBuilder: (context, index) {
                          final tache = taches[index];
                          // print(tache.id)
                          if (tache.priorite == 1) {
                            isPetite = true;
                            isMoyenne = false;
                            isHaute = false;
                          } else if (tache.priorite == 2) {
                            isMoyenne = true;
                            isPetite = false;
                            isHaute = false;
                          } else {
                            isHaute = true;
                            isPetite = false;
                            isMoyenne = false;
                          }
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: ScrollingMenu(
                              title: tache.titre,
                              date: tache.date,
                              description: tache.description,
                              statut:
                                  tache.isDone == 1 ? "Terminé" : "En cours",
                              moyenne: isMoyenne,
                              grande: isHaute,
                              petite: isPetite,
                              modificationFunction: () {
                                Get.toNamed(AppRoute.modifierTache,
                                    arguments: {'tache': tache});
                              },
                              terminerFunction: () async {
                                try {
                                  Tache element =
                                      Tache(isDone: 1, id: tache.id);
                                  await _dbHelper.terminerTache(element);

                                  setState(() {
                                    tache.isDone = 1;
                                  });

                                  FlashToast.showFlashToast(
                                      context: context,
                                      title: "Félicitations	",
                                      message:
                                          "Vous avez terminé la tâche ${tache.titre}",
                                      flashType: FlashType.success,
                                      duration: 4);
                                } catch (e) {
                                  FlashToast.showFlashToast(
                                      context: context,
                                      title: "Erreur",
                                      message: "L'erreur $e est survenue",
                                      flashType: FlashType.error,
                                      duration: 4);
                                }
                              },
                              onTap: () async {
                                setState(() {
                                  id = tache.id!;
                                  showDeleteConfirmationDialog(id);
                                });
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // mini: true,
        onPressed: () => Get.toNamed(AppRoute.ajouterTache),
        child: const Icon(Icons.add),
      ),
    );
  }
}
