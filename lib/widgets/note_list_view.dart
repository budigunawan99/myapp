import 'package:flutter/material.dart';
import 'package:uwunotes/model/note.dart';
import 'package:uwunotes/provider/note_provider.dart';
import 'package:uwunotes/screens/note_screen.dart';
import 'package:uwunotes/widgets/note_card.dart';

class NoteListView extends StatelessWidget {
  final NoteProvider noteProvider;

  const NoteListView({super.key, required this.noteProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemBuilder: (context, index) {
          final Note note = noteProvider.getNotes[index];
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            background: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.white,
                  ),
                  Text(
                    "Swipe to delete",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            onDismissed: (direction) {
              noteProvider.deleteNote(index);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Note deleted successfully!'),
                ),
              );
            },
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NoteScreen(
                    note: note,
                    currentIndex: index,
                  );
                }));
              },
              child: NoteCard(note: note),
            ),
            confirmDismiss: (direction) => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Are you sure?'),
                  content: const Text('Do you want to delete the note?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('No')),
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Yes'))
                  ],
                );
              },
            ),
          );
        },
        itemCount: noteProvider.getNotes.length,
      ),
    );
  }
}
