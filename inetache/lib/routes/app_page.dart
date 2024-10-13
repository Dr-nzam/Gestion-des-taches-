import 'package:get/get.dart';
import 'package:inetache/ecrans/Ajouter_tache.dart';
import 'package:inetache/ecrans/Listes_taches.dart';
import 'package:inetache/ecrans/Modifier_tache.dart';
import 'package:inetache/ecrans/parametre.dart';
import 'package:inetache/ecrans/splash.dart';
import 'package:inetache/routes/app_route.dart';

class AppPage {
  static List<GetPage> page = [
    GetPage(
        name: AppRoute.splash, page: () => const Splash()),
    GetPage(
        name: AppRoute.ajouterTache, page: () => const AjouterTache()),
    GetPage(
        name: AppRoute.listeTache, page: () => const ListeTache()),
    GetPage(
        name: AppRoute.modifierTache, page: () => const ModifierTache()),
    GetPage(
        name: AppRoute.parametre, page: () => const Parametre()),
  ];
}
