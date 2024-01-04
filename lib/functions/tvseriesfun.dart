import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/alllinkes/allapi.dart';

class TvSeriesFun {
  List<Map<String, dynamic>> populartv = [];
  List<Map<String, dynamic>> toptv = [];
  List<Map<String, dynamic>> onarie = [];

  Future<void> populartvseries() async {
    var populartvs = await http.get(Uri.parse(populartvurl));
    if (populartvs.statusCode == 200) {
      var tempdata = jsonDecode(populartvs.body);
      var populartvjson = tempdata['results'];
      for (var i = 0; i < populartvjson.length; i++) {
        populartv.add({
          'poster_path': populartvjson[i]['poster_path'],
          'vote_average': populartvjson[i]['vote_average'],
          'first_air_date': populartvjson[i]['first_air_date'],
          'id': populartvjson[i]['id'],
          'original_name': populartvjson[i]['original_name']
        });
      }
    } else {
      // ignore: avoid_print
      print(populartvs.statusCode);
    }

    ///////////////////////////////////////////

    var topratedtvs = await http.get(Uri.parse(topratedtvurl));
    if (topratedtvs.statusCode == 200) {
      var tempdata = jsonDecode(topratedtvs.body);
      var topratedtvsjson = tempdata['results'];
      for (var i = 0; i < topratedtvsjson.length; i++) {
        toptv.add({
          'poster_path': topratedtvsjson[i]['poster_path'],
          'vote_average': topratedtvsjson[i]['vote_average'],
          'first_air_date': topratedtvsjson[i]['first_air_date'],
          'id': topratedtvsjson[i]['id'],
          'original_name': topratedtvsjson[i]['original_name']
        });
      }
    } else {
      // ignore: avoid_print
      print(topratedtvs.statusCode);
    }

    ///////////////////////////////////////////

    var onthearitvs = await http.get(Uri.parse(ontheairtvurl));
    if (onthearitvs.statusCode == 200) {
      var tempdata = jsonDecode(onthearitvs.body);
      var onthearitvsjson = tempdata['results'];
      for (var i = 0; i < onthearitvsjson.length; i++) {
        onarie.add({
          'poster_path': onthearitvsjson[i]['poster_path'],
          'vote_average': onthearitvsjson[i]['vote_average'],
          'first_air_date': onthearitvsjson[i]['first_air_date'],
          'id': onthearitvsjson[i]['id'],
          'original_name': onthearitvsjson[i]['original_name']
        });
      }
    } else {
      // ignore: avoid_print
      print(onthearitvs.statusCode);
    }
  }
}
