import 'package:latihan_login_api_rest/note_for_list.dart';

class NoteService {
  List<NoteForList> getNoteList() {
    return [
      new NoteForList(
          noteId: "1",
          creatDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now(),
          notetitle: "note 1"),
      new NoteForList(
          noteId: "2",
          creatDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now(),
          notetitle: "note 1"),
      new NoteForList(
          noteId: "3",
          creatDateTime: DateTime.now(),
          lastEditDateTime: DateTime.now(),
          notetitle: "note 1")
    ];
  }
}
