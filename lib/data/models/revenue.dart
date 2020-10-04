import 'package:floor/floor.dart';

@entity
class Revenue {
  @PrimaryKey(autoGenerate: true)
  int id;
  String description;
  double value;
  String date;
  String categorie;
  String observation;

  Revenue({
    this.id,
    this.description,
    this.value,
    this.date,
    this.categorie,
    this.observation,
  });

  Revenue.fromMap(Map<String, dynamic> map) {
    this.description = map['description'];
    this.value = map['value'];
    this.date = map['date'];
    this.categorie = map['categorie'];
    this.observation = map['observation'];
  }

  Map toMap(Revenue revenue) {
    Map<String, dynamic> map = {
      'description': revenue.description,
      'value': revenue.value,
      'date': revenue.date,
      'categorie': revenue.categorie,
      'observation': revenue.observation
    };

    return map;
  }
}