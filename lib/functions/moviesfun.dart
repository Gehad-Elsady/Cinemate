import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/alllinkes/allapi.dart';

class MoviesFun {
  List<Map<String, dynamic>> movies = [];
  List<Map<String, dynamic>> topmovies = [];
  List<Map<String, dynamic>> onarimovies = [];

  Future<void> popularmovis() async {
    var populartvs = await http.get(Uri.parse(popularmovieurl));
    if (populartvs.statusCode == 200) {
      var tempdata = jsonDecode(populartvs.body);
      var populartvjson = tempdata['results'];
      for (var i = 0; i < populartvjson.length; i++) {
        movies.add({
          'title': populartvjson[i]['title'],
          'poster_path': populartvjson[i]['poster_path'],
          'vote_average': populartvjson[i]['vote_average'],
          'release_date': populartvjson[i]['release_date'],
          'id': populartvjson[i]['id'],
        });
      }
    } else {
      // ignore: avoid_print
      print(populartvs.statusCode);
    }

    ////////////////////////////////

    var onarimove = await http.get(Uri.parse(nowplayingmovieurl));
    if (onarimove.statusCode == 200) {
      var tempdata = jsonDecode(onarimove.body);
      var onarimovejson = tempdata['results'];
      for (var i = 0; i < onarimovejson.length; i++) {
        onarimovies.add({
          'title': onarimovejson[i]['title'],
          'poster_path': onarimovejson[i]['poster_path'],
          'vote_average': onarimovejson[i]['vote_average'],
          'release_date': onarimovejson[i]['release_date'],
          'id': onarimovejson[i]['id'],
        });
      }
    } else {
      // ignore: avoid_print
      print(onarimove.statusCode);
    }

    ////////////////////////////////

    var topmovie = await http.get(Uri.parse(topratedmovieurl));
    if (topmovie.statusCode == 200) {
      var tempdata = jsonDecode(topmovie.body);
      var topmoviejson = tempdata['results'];
      for (var i = 0; i < topmoviejson.length; i++) {
        topmovies.add({
          'title': topmoviejson[i]['title'],
          'poster_path': topmoviejson[i]['poster_path'],
          'vote_average': topmoviejson[i]['vote_average'],
          'release_date': topmoviejson[i]['release_date'],
          'id': topmoviejson[i]['id'],
        });
      }
    } else {
      // ignore: avoid_print
      print(topmovie.statusCode);
    }

    //////////////////////////////.

    var upcoming = await http.get(Uri.parse(topratedmovieurl));
    if (upcoming.statusCode == 200) {
      var tempdata = jsonDecode(upcoming.body);
      var upcomingjson = tempdata['results'];
      for (var i = 0; i < upcomingjson.length; i++) {
        topmovies.add({
          'title': upcomingjson[i]['title'],
          'poster_path': upcomingjson[i]['poster_path'],
          'vote_average': upcomingjson[i]['vote_average'],
          'release_date': upcomingjson[i]['release_date'],
          'id': upcomingjson[i]['id'],
        });
      }
    } else {
      // ignore: avoid_print
      print(topmovie.statusCode);
    }
  }
}
