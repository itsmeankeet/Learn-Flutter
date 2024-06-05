import 'package:isar/isar.dart';
part 'habit.g.dart';

// to runt this run this is cmd dart run build_runner build
@Collection()
class Habit {
  //id
  Id id = Isar.autoIncrement;
  //haabit
  late String habit;
  //completed days (habit0)
  List<DateTime> completeddays = [
    //DateTime(2024,10,2)
  ];
}
