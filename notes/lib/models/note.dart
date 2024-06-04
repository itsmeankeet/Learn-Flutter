import 'package:isar/isar.dart';
part 'note.g.dart';

@Collection()
class Note {
  late String text;
  Id id = Isar.autoIncrement;
}
