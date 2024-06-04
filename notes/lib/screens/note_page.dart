import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes/components/my_drawer.dart';
import 'package:notes/components/notes_tile.dart';
import 'package:notes/models/note.dart';
import 'package:notes/models/note_database.dart';
import 'package:notes/screens/settings_page.dart';
import 'package:provider/provider.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    super.initState();
    readNotes();
  }

  final textController = TextEditingController();
  //add item to the container
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  addItem() {
    context.read<NoteDatabase>().addNote(textController.text);
    Navigator.pop(context);
    textController.clear();
  }

  showDialogBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: const Text("Add Note?"),
              content: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              actions: [
                MaterialButton(
                    onPressed: addItem, child: const Text("Confirm?")),
              ],
            ));
  }

  updateNote(node) {
    textController.text = node.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.surface,
              title: const Text("Update Your Note?"),
              content: TextField(
                controller: textController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),
              actions: [
                MaterialButton(
                    child: const Text("Update ?"),
                    onPressed: () {
                      context
                          .read<NoteDatabase>()
                          .updateNote(textController.text, node.id);
                      Navigator.pop(context);
                      textController.clear();
                    })
              ],
            ));
  }

  deleteNote(note) {
    context.read<NoteDatabase>().deleteNote(note.id);
  }

  settingsOntap() {
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SettingsPage()));
  }

  @override
  Widget build(BuildContext context) {
    final notedatabase = context.watch<NoteDatabase>();
    List<Note> currentNotes = notedatabase.currentNodes;
    //view notes

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      drawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(
              child: Column(
            children: [
              Image.asset(
                "images/edit.png",
                height: 70,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Write, Remember, Achieve",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )),
          MyDrawer(
              name: "Home",
              imageAddress: "images/homw.png",
              onTap: () {
                Navigator.pop(context);
              }),
          MyDrawer(
            name: "Settings",
            imageAddress: "images/settings.png",
            onTap: settingsOntap,
          )
        ],
      )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Headings
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                  fontSize: 50,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          //list of notes
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (BuildContext context, int index) {
                  Note note = currentNotes[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                    child: NotesTile(
                      notes: note.text,
                      onEditButton: () => updateNote(note),
                      onDeleteButton: () => deleteNote(note),
                    ),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: showDialogBox,
          child: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.inversePrimary,
          )),
    );
  }
}
