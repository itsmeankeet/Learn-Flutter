import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesTile extends StatelessWidget {
  final String notes;
  final VoidCallback? onEditButton;
  final VoidCallback? onDeleteButton;

  NotesTile({
    Key? key,
    required this.notes,
    required this.onEditButton,
    required this.onDeleteButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            notes,
            style: GoogleFonts.dmSerifText(fontSize: 25),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: onEditButton,
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: onDeleteButton,
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
