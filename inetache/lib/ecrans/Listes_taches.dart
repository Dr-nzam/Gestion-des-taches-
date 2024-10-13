// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inetache/core/colors.dart';
import 'package:inetache/core/filtre_widget.dart';
import 'package:inetache/core/form_widget/form_widget.dart';
import 'package:inetache/core/page_component/scrolling_menu.dart';
import 'package:inetache/routes/app_route.dart';

class ListeTache extends StatefulWidget {
  const ListeTache({super.key});

  @override
  State<ListeTache> createState() => _ListeTacheState();
}

class _ListeTacheState extends State<ListeTache> {
  final TextEditingController controllerSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mes Taches",
          style: TextStyle(color: CouleurApp.textprincipalColor, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {Get.toNamed(AppRoute.parametre);},
              icon: const Icon(
                Icons.settings,
                color: CouleurApp.textprincipalColor,
              ))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
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
              FilterWidget(nomFiltre: "Terminé",),
              FilterWidget(nomFiltre: "En cour",),
              FilterWidget(nomFiltre: "Date",),
              FilterWidget(nomFiltre: "Priorité",),
            ],
          ), 
          const SizedBox(height: 20,),
          ScrollingMenu(title: "Tache 1sgfsgvgsfd", moyenne: true, statut: "Terminé", date: "11/12/2024", description: "hvucvsdgchgaucvvvcsavgvvjcvvcvauvvchdvhvucvsdgchgaucvvvcsavgvvjcvvcvauvvchdvcahucvhvchvhhjvdschjvcsdvcvcsjvchjvshcahucvhvchvhhjvdschjvcsdvhvucvsdgchgaucvvvcsavgvvjcvvcvauvvchdvcahucvhvchvhhjvdschjvcsdvcvcsjvchjvshcvcsjvchjvsh",),
          const SizedBox(height: 10,),
          ScrollingMenu(title: "Tache 2",petite: true, statut: "En cour", date: "11/09/2024", description: "djdhfidsigsgghvusebckhukavv",),
          const SizedBox(height: 10,),
          ScrollingMenu(title: "Tache 3",moyenne: true, statut: "En cour", date: "11/01/2024", description: "hisgdysagyvvg",),
          const SizedBox(height: 10,),
          ScrollingMenu(title: "Tache 4",grande: true, statut: "Terminé", date: "11/08/2024", description: "hjfghuasdguysgyuag",)
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()=>Get.toNamed(AppRoute.ajouterTache), child: const Icon(Icons.add),),
    );
  }
}
