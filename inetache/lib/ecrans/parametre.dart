import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inetache/core/colors.dart';

class Parametre extends StatefulWidget {
  const Parametre({super.key});

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Paramètres",
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
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              color: CouleurApp.textprincipalColor,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: const [
          ListTile(
            leading: Icon(Icons.language_rounded),
            title: const Text("Langue"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.notifications_none_outlined),
            title: const Text("Notifications"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.color_lens_outlined),
            title: const Text("Apparence"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.help_outline_outlined),
            title: const Text("Aide"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.key_outlined),
            title: const Text("Confidentialité"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.info_outline_rounded),
            title: const Text("A propos"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      )
    );
  }
}
