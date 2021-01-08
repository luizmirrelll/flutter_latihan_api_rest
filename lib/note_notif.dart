import 'package:flutter/material.dart';

class NotesNotif extends StatelessWidget {
  final String noteID;
  bool get isEditing => noteID != null;
  NotesNotif({this.noteID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing == null ? 'edit note' : 'create note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: 'notes title'),
            ),
            Container(
              height: 8,
            ),
            TextField(
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
                    
                  } else {
                  }
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
