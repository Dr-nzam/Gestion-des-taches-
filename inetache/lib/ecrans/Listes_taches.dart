// ignore: file_names
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
              placeholder: "search Task",
              suffixIcon: const IconButton(
                onPressed: null,
                icon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Wrap(
              spacing: 10,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FilterWidget(
                  nomFiltre: "Terminé",
                ),
                FilterWidget(
                  nomFiltre: "En cour",
                ),
                FilterWidget(
                  nomFiltre: "Date",
                ),
                FilterWidget(
                  nomFiltre: "Priorité",
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: FutureBuilder<List<Tache>>(
                future: _dbHelper.getTaches(), // Récupère la liste des tâches
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Erreur: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('Aucune tâche trouvée.'));
                  } else {
                    final List<Tache> taches = snapshot.data!;

                    return ListView.builder(
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
                            statut: tache.isDone == 1 ? "Terminé" : "En cours",
                            moyenne: isMoyenne,
                            grande: isHaute,
                            petite: isPetite,
                            modificationFunction: ()  {
                              Get.toNamed(AppRoute.modifierTache, arguments: {'tache': tache});
                            },
                            terminerFunction: () async {
                              Tache element = Tache(isDone: 1, id: tache.id);
                              await _dbHelper.terminerTache(element);

                              setState(() {
                                tache.isDone = 1;
                              });

                              print('Tâche ${tache.id} terminée');
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
