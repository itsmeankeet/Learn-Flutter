import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;
  //initialize the database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //List of the notes
  List<Note> currentNodes = [];

  //create a database

  Future<void> addNote(String textFromUser) async {
    final newNote = Note()..text = textFromUser;
    //newnote bhney note ko object ho rw tyo object ko text ma textfromuser lageraw ralheko
    //newnote is the object of class Note and in the newobject.text we put the text entered by the user i.e textFromUser
    await isar.writeTxn(() => isar.notes.put(newNote));
    //database ma store gareko ho tyo chai
    //storing in the database

    //now read the dataa from database
    fetchNotes();
  }

  //read a databse

  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNodes.clear();
    currentNodes.addAll(fetchedNotes);
    notifyListeners();
  }

  //update a database
  Future<void> updateNote(String updateText, int id) async {
    final existingNode = await isar.notes.get(id);
    if (existingNode != null) {
      existingNode.text = updateText;
      await isar.writeTxn(() => isar.notes.put(existingNode));
      await fetchNotes();
    }
  }

  //delete a database
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
