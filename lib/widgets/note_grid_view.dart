import 'package:flutter/material.dart';
import 'package:uwunotes/provider/note_provider.dart';
import 'package:uwunotes/screens/note_screen.dart';
import 'package:uwunotes/widgets/note_card.dart';
import 'package:collection/collection.dart';

class NoteGridView extends StatelessWidget {
  final int gridCount;
  final NoteProvider noteProvider;

  const NoteGridView(
      {super.key, required this.gridCount, required this.noteProvider});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: gridCount,
        crossAxisSpacing: 20,
        children: noteProvider.getNotes.mapIndexed(
          (index, note) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.vertical,
              background: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                child: const Center(
                  child: Icon(
                    Icons.delete,
                    size: 40,
                    color: Colors.white,
                  ),
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
        ).toList(),
      ),
    );
  }
}
