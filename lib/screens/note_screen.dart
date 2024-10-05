import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uwunotes/model/note.dart';
import 'package:uwunotes/provider/note_provider.dart';
import 'package:uwunotes/widgets/appbar.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  final int? currentIndex;
  const NoteScreen({super.key, required this.note, this.currentIndex});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late String _title;
  late String _content;
  int _titleCounter = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  bool isEditMode = true;
  int? _currentIndex;

  @override
  void initState() {
    super.initState();

    _title = widget.note.title;
    _content = widget.note.content;
    _titleCounter = _title.length;
    _titleController.text = _title;
    _contentController.text = _content;
    _currentIndex = widget.currentIndex;

    if (_title == "" && _content == "") {
      isEditMode = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Appbar(isFirstPage: false),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      counterText: "",
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: null,
                    maxLength: 20,
                    onChanged: (value) {
                      setState(() {
                        _title = value;
                        _titleCounter = _title.length;
                      });
                    },
                  ),
                ),
                Text(
                  "${_titleCounter.toString()}/20",
                ),
              ],
            ),
            Expanded(
              child: TextField(
                controller: _contentController,
                decoration: const InputDecoration(
                  counterStyle: TextStyle(
                    fontSize: 14,
                  ),
                  border: InputBorder.none,
                  hintText: 'Enter Description',
                  hintStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 18,
                ),
                maxLines: null,
                maxLength: 50,
                onChanged: (value) {
                  setState(() {
                    _content = value;
                  });
                },
              ),
            ),
            Consumer<NoteProvider>(
              builder: (context, noteProvider, child) {
                return TextButton(
                  onPressed: () {
                    if (_title == "" || _content == "") {
                      return;
                    }
                    if (isEditMode) {
                      noteProvider.editNote(_currentIndex, _title, _content);
                    } else {
                      noteProvider.addNewNote(_title, _content);
                    }
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    backgroundColor: Colors.white,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
