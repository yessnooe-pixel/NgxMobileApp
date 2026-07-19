import 'package:flutter/material.dart';
import 'package:shorebirdpractice/note.dart';

class NoteEditorScreen extends StatefulWidget {
  final Note? note;
  const NoteEditorScreen({super.key, this.note});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  late final TextEditingController _contentController;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController(text: widget.note?.content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.note == null ? 'New Note' : 'Edit Note'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            tooltip: 'Save Note',
            onPressed: () {
              // In a real app, you'd save the note here.
              // For this MVP, we just pop the screen.
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _contentController,
          maxLines: null, // Allows the text field to expand
          expands: true,
          decoration: const InputDecoration(
            hintText: 'Start writing your note...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
