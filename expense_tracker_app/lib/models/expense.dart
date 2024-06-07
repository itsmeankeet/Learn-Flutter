import 'package:isar/isar.dart';
part 'expense.g.dart';

//at cmd run: dart run build_runner build
@Collection()
class Expense {
  Id id = Isar.autoIncrement;
  late String name;
  late double amount;
  late DateTime date;

  Expense({required this.name, required this.amount, required this.date});
}
