import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inetache/routes/app_page.dart';
import 'package:inetache/routes/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inet-Tache',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      initialRoute: AppRoute.splash,
      getPages: AppPage.page,
      // home: const MyHomePage(title: 'Inetache'),
    );
  }
}