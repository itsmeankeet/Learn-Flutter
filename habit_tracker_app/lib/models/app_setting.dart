import 'package:isar/isar.dart';

part 'app_setting.g.dart';

@Collection()
class AppSetting {
  //id
  Id id = Isar.autoIncrement;
  //first launch date of the app
  DateTime? firstLaunchDate;
}
