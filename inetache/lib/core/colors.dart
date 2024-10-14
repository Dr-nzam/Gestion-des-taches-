import 'package:flutter/material.dart';

class CouleurApp {
  // Couleurs du mode clair
  static const primaryColor = Colors.blue;
  static const backgroundColor = Color(0XFFFFFFFF);
  static const textprincipalColor = Colors.white;
  static const filterColor = Colors.grey;
  static const titreColor = Color(0xFF001849);

  static const prioritePetiteColor = Colors.green;
  static const prioriteMoyenneColor = Colors.orange;
  static const prioriteHauteColor = Colors.red;

  static const deleteColor = Colors.red;

  // Couleurs du mode sombre
  static const darkBackgroundColor = Color(0XFF121212);
  static const darkTextPrincipalColor = Colors.white;
  static const darkFilterColor = Colors.grey;
  static const darkTitreColor = Colors.white;

  static const darkPrioritePetiteColor = Colors.lightGreen;
  static const darkPrioriteMoyenneColor = Colors.deepOrange;
  static const darkPrioriteHauteColor = Colors.redAccent;

  static const darkDeleteColor = Colors.redAccent;

  // Méthode pour obtenir la couleur selon le mode
  static Color getTextPrincipalColor(bool isDarkMode) {
    return isDarkMode ? darkTextPrincipalColor : textprincipalColor;
  }

  static Color getBackgroundColor(bool isDarkMode) {
    return isDarkMode ? darkBackgroundColor : backgroundColor;
  }

  // Ajoutez d'autres méthodes si nécessaire
}
