import 'package:floor/floor.dart';

@entity
class Expense {
  @PrimaryKey(autoGenerate: true)
  int id;
  String description;
  double value;
  String date;
  String categorie;
  String observation;

  Expense({
    this.id,
    this.description,
    this.value,
    this.date,
    this.categorie,
    this.observation,
  });

  Expense.fromMap(Map<String, dynamic> map) {
    this.description = map['description'];
    this.value = map['value'];
    this.date = map['date'];
    this.categorie = map['categorie'];
    this.observation = map['observation'];
  }

  Map toMap(Expense expense) {
    Map<String, dynamic> map = {
      'description': expense.description,
      'value': expense.value,
      'date': expense.date,
      'categorie': expense.categorie,
      'observation': expense.observation
    };

    return map;
  }
}
