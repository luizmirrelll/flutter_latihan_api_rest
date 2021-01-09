import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:latihan_login_api_rest/note.dart';
import 'package:latihan_login_api_rest/note_service.dart';
import 'package:latihan_login_api_rest/note_service.dart';

import 'note_service.dart';

class NotesNotif extends StatefulWidget {
  final String noteID;
  NotesNotif({this.noteID});

  @override
  _NotesNotifState createState() => _NotesNotifState();
}

class _NotesNotifState extends State<NotesNotif> {
  bool get isEditing => widget.noteID != null;

  NoteService get noteService => GetIt.I<NoteService>();

  String errormassage;
  Note note;

  TextEditingController _titleContoller = TextEditingController();
  TextEditingController _titleContent = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
        super.initState();
    setState(() {
      _isLoading = true;
    });
    noteService.getNote(widget.noteID).then((response) {
      if (response.error) {
        errormassage = response.errorMassage ?? 'in lagi errror';
      }
      note = response.data;
      _titleContoller.text = note.noteTitle;
      _titleContent.text = note.noteContent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing == null ? 'edit note' : 'create note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: _isLoading ? CircularProgressIndicator() : Column(
          children: <Widget>[
            TextField(
              controller: _titleContoller,
              decoration: InputDecoration(hintText: 'notes title'),
            ),
            Container(
              height: 8,
            ),
            TextField(
              controller: _titleContoller,
              decoration: InputDecoration(hintText: 'notes context'),
            ),
            Container(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              height: 35,
              child: RaisedButton(
                child: Text(
                  'submit',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  if (isEditing) {
                  } else {}
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
