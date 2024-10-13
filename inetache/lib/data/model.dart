class Tache {
  final int? id;
  final String titre;
  final String description;
  final int priorite;
  final String date;
  int? isDone; // Utilisez int pour représenter un booléen

  Tache({
    this.id,
    this.titre =" ",
    this.description =" ",
    this.priorite = 0,
    this.date = "",
    this.isDone, // Par défaut, la tâche est non terminée
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titre': titre,
      'description': description,
      'priorite': priorite,
      'date': date,
      'isDone': isDone,
    };
  }

  static Tache fromMap(Map<String, dynamic> map) {
    return Tache(
      id: map['id'],
      titre: map['titre'],
      description: map['description'],
      priorite: map['priorite'],
      date: map['date'],
      isDone: map['isDone'], // Assurez-vous de gérer les valeurs nulles
    );
  }
}
