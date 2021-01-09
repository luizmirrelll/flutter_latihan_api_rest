import 'dart:convert';

import 'package:latihan_login_api_rest/api_respone.dart';
import 'package:latihan_login_api_rest/note.dart';
import 'package:latihan_login_api_rest/note_for_list.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_login_api_rest/api_respone.dart';

class NoteService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app';
  static const headers = {'apiKey': '82d1148c-2d2e-4b65-b945-5f06b88e8192'};
  Future<ApiRespone<List<NoteForList>>> getNoteList() {
    return http.get(API + '/notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForList>[];
        for (var item in jsonData) {
          notes.add(NoteForList.fromJson(item));
        }
        return ApiRespone<List<NoteForList>>(data: notes);
      }
      return ApiRespone<List<NoteForList>>(
          error: true, errorMassage: 'error di sini');
    }).catchError((_) => ApiRespone<List<NoteForList>>(
        error: true, errorMassage: 'an error occured BGSD'));
  }

  Future<ApiRespone<Note>> getNote(String noteID) {
    return http.get(API + '/notes/' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return ApiRespone<Note>(data: Note.fromJson(jsonData));
      }
      return ApiRespone<Note>(error: true, errorMassage: 'error di sini');
    }).catchError((_) => ApiRespone<List<Note>>(
        error: true, errorMassage: 'an error occured BGSD'));
  }
}
