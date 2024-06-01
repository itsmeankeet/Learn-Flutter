import 'package:isar/isar.dart';
//to generate file run dart run build_runner build
part 'note.g.dart';

@Collection()
class Note {
  late final String text;
  Id id = Isar.autoIncrement;
}
