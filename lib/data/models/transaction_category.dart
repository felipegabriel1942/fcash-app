import 'package:floor/floor.dart';

@entity
class TransactionCategory {
  @PrimaryKey(autoGenerate: true)
  int id;
  String category;
  String transactionType;
  String icon;

  TransactionCategory({
    this.id,
    this.category,
    this.transactionType,
    this.icon,
  });
}
