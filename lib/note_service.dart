import 'dart:convert';

import 'package:latihan_login_api_rest/api_respone.dart';
import 'package:latihan_login_api_rest/note_for_list.dart';
import 'package:http/http.dart' as http;
import 'package:latihan_login_api_rest/api_respone.dart';

class NoteService {
  static const API = 'https://tq-notes-api-jkrgrdggbq-el.a.run.app/';
  static const headers = {'apiKey': '82d1148c-2d2e-4b65-b945-5f06b88e8192'};
  Future<ApiRespone<List<NoteForList>>> getNoteList() {
    return http.get(API + 'notes', headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final notes = <NoteForList>[];
        for (var item in jsonData) {
          final note = NoteForList(
              noteID: item['noteID'],
              notetitle: item['notetitle'],
              createDateTime: DateTime.parse(item['createDateTime']),
              lastEditDateTime: item['lastEditDateTime'] != null
                  ? DateTime.parse(item['lastEditDateTime'])
                  : null);
          notes.add(note);
        }
        return ApiRespone<List<NoteForList>>(data: notes);
      }
      return ApiRespone<List<NoteForList>>(
          error: true, errorMassage: 'an error occured BGSD');
    }).catchError((_) => ApiRespone<List<NoteForList>>(
        error: true, errorMassage: 'an error occured BGSD'));
  }
}
