import 'package:flutter/material.dart';
import 'package:uwunotes/model/note.dart';

class NoteProvider with ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get getNotes {
    return _notes;
  }

  void addNewNote(String title, String content) {
    Note note = Note(title: title, content: content);
    _notes.add(note);
    notifyListeners();
  }

  void editNote(int? index, String title, String content) {
    if (index == null) {
      return;
    }
    Note newNote = Note(title: title, content: content);
    _notes[index] = newNote;
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }
}
