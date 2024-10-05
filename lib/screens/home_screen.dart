import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uwunotes/model/note.dart';
import 'package:uwunotes/provider/note_provider.dart';
import 'package:uwunotes/screens/note_screen.dart';
import 'package:uwunotes/widgets/appbar.dart';
import 'package:uwunotes/widgets/note_grid_view.dart';
import 'package:uwunotes/widgets/note_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteProvider>(
      builder: (context, noteProvider, child) {
        return Scaffold(
          appBar: const Appbar(
            isFirstPage: true,
          ),
          resizeToAvoidBottomInset: false,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              final Note newNote = Note(
                title: "",
                content: "",
              );
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NoteScreen(
                  note: newNote,
                );
              }));
            },
            tooltip: 'Add Notes',
            child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (noteProvider.getNotes.isEmpty) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset(
                            'images/nodata.png',
                            height: 350,
                          ),
                          const Text("Add your first note!")
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                if (constraints.maxWidth <= 600) {
                  return NoteListView(noteProvider: noteProvider);
                } else if (constraints.maxWidth <= 1200) {
                  return NoteGridView(gridCount: 3, noteProvider: noteProvider);
                } else {
                  return NoteGridView(gridCount: 5, noteProvider: noteProvider);
                }
              }
            },
          ),
        );
      },
    );
  }
}
