import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:latihan_login_api_rest/api_respone.dart';
import 'package:latihan_login_api_rest/note_create.dart';
import 'package:latihan_login_api_rest/note_for_list.dart';
import 'package:latihan_login_api_rest/note_notif.dart';
import 'package:latihan_login_api_rest/note_service.dart';
import 'note_notif.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  NoteService get service => GetIt.I<NoteService>();

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  ApiRespone<List<NoteForList>> _apiRespone;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });
    _apiRespone = await service.getNoteList();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('list of notes'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NotesNotif()));
          },
          child: Icon(Icons.add),
        ),
        body: Builder(
          builder: (_) {
            if (_isLoading) {
              return CircularProgressIndicator();
            }
            if (_apiRespone.error) {
              return Center(
                child: Text(_apiRespone.errorMassage),
              );
            }
            return ListView.separated(
              separatorBuilder: (_, __) => Divider(
                height: 1,
                color: Colors.green,
              ),
              itemBuilder: (_, index) {
                return Dismissible(
                  key: ValueKey(_apiRespone.data[index].noteID),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction) {},
                  confirmDismiss: (direction) async {
                    final result = await showDialog(
                        context: context, builder: (_) => NoteDelete());
                    print(result);
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                  ),
                  child: ListTile(
                    title: Text(
                      _apiRespone.data[index].notetitle,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    subtitle: Text(
                        'last edition on ${formatDateTime(_apiRespone.data[index].lastEditDateTime)}'),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => NotesNotif(
                                noteID: _apiRespone.data[index].noteID,
                              )));
                    },
                  ),
                );
              },
              itemCount: _apiRespone.data.length,
            );
          },
        ));
  }
}
