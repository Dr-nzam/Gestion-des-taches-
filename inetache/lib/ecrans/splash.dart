import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inetache/routes/app_route.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){Get.offAllNamed(AppRoute.listeTache);}, child: Text("Commencer"))
      ),
    );
  }
}
