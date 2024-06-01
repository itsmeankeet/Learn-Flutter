import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  const NoteTile({super.key, required this.note});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(note.text),
    );
  }
}
