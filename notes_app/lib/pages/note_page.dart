import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final textController = TextEditingController();
  @override
  void initState() {
    super.initState();
    readNotes();
  }

  updateNote(note) {
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("New Note"),
              content: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              actions: [
                MaterialButton(
                    child: const Text("Confirm Update?"),
                    onPressed: () {
                      context
                          .read<NoteDatabase>()
                          .updateNote(textController.text, note.id);
                      textController.clear();
                      Navigator.pop(context);
                    })
              ],
            ));
  }

  deleteNote(Note note) {
    context.read<NoteDatabase>().deleteNote(note.id);
  }

  void onPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Enter your note here"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Notes",
          ),
        ),
        actions: [
          MaterialButton(
            child: const Text("Create"),
            onPressed: () {
              context.read<NoteDatabase>().addNote(textController.text);
              textController.clear();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    // Connect to the db
    final noteDatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = noteDatabase.currentNodes;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 5),
        child: ListView.builder(
          itemCount: currentNotes.length,
          itemBuilder: (context, int index) {
            // Get a note
            Note note = currentNotes[index];
            return ListTile(
              title: Text(note.text),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () => updateNote(note)),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteNote(note),
                  )
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(Icons.add),
      ),
    );
  }
}
