import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inetache/controller/theme_controller.dart';
import 'package:inetache/core/colors.dart';
import 'package:inetache/routes/app_page.dart';
import 'package:inetache/routes/app_route.dart';

class MyApp extends StatelessWidget {
  final ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return
    GetMaterialApp(
      title: 'Inet-Tache',

      // theme: ThemeData(
      //   scaffoldBackgroundColor:
      //       CouleurApp.getBackgroundColor(themeController.isDarkMode.value),
      //   appBarTheme: AppBarTheme(
      //     backgroundColor:
      //         CouleurApp.getBackgroundColor(themeController.isDarkMode.value),
      //     titleTextStyle: TextStyle(
      //         color: CouleurApp.getTextPrincipalColor(
      //             themeController.isDarkMode.value)),
      //   ),
      //   textTheme: TextTheme(
      //       // Ajoutez d'autres styles si nécessaire
      //       titleLarge: TextStyle(color: CouleurApp.getTextPrincipalColor(themeController.isDarkMode.value)), // Pour les titres
      //       bodyMedium: TextStyle(color: CouleurApp.getTextPrincipalColor(themeController.isDarkMode.value)), // Texte normal
      //     ),
      // ),
      

      theme: ThemeData(
        primarySwatch: CouleurApp.primaryColor,
        primaryColor:CouleurApp.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: CouleurApp.primaryColor,),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            backgroundColor: CouleurApp.primaryColor,
            elevation: 0,
            centerTitle: true),
      ),
      initialRoute: AppRoute.listeTache,
      getPages: AppPage.page,
      // home: const MyHomePage(title: 'Inetache'),
    );
  });}
}
