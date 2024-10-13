import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inetache/core/colors.dart';
import 'package:inetache/routes/app_page.dart';
import 'package:inetache/routes/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inet-Tache',
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
      initialRoute: AppRoute.splash,
      getPages: AppPage.page,
      // home: const MyHomePage(title: 'Inetache'),
    );
  }
}
