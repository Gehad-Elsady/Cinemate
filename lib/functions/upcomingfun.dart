// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movie_app/alllinkes/allapi.dart';

class Upcomingmovie {
  List<Map<String, dynamic>> upcoming = [];
  List<Map<String, dynamic>> latest = [];
  // List<Map<String, dynamic>> pop = [];

  Future<void> upcome() async {
    var upcomemovie = await http.get(Uri.parse(upcomingmovies));
    if (upcomemovie.statusCode == 200) {
      var tempdata = jsonDecode(upcomemovie.body);
      var upcomemoviejson = tempdata['results'];
      for (var i = 0; i < upcomemoviejson.length; i++) {
        upcoming.add({
          'title': upcomemoviejson[i]['title'],
          'poster_path': upcomemoviejson[i]['poster_path'],
          'vote_average': upcomemoviejson[i]['vote_average'],
          'release_date': upcomemoviejson[i]['release_date'],
          'id': upcomemoviejson[i]['id'],
        });
      }
    } else {
      print(upcomemovie.statusCode);
    }

    ////////////////////////////

    var latestmovie = await http.get(Uri.parse(tVShowsAiringToday));
    if (latestmovie.statusCode == 200) {
      var tempdata = jsonDecode(latestmovie.body);
      var latestmoviejson = tempdata['results'];
      for (var i = 0; i < latestmoviejson.length; i++) {
        latest.add({
          'name': latestmoviejson[i]['name'],
          'poster_path': latestmoviejson[i]['poster_path'],
          'vote_average': latestmoviejson[i]['vote_average'],
          'first_air_date': latestmoviejson[i]['first_air_date'],
          'id': latestmoviejson[i]['id'],
        });
      }
    } else {
      print(latestmovie.statusCode);
    }

    //////////////////////////
    // var popularprson = await http.get(Uri.parse(popularper));
    // if (popularprson.statusCode == 200) {
    //   var tempdata = jsonDecode(popularprson.body);
    //   var popularprsonjson = tempdata['results'];
    //   for (var i = 0; i < popularprsonjson.length; i++) {
    //     pop.add({
    //       'name': popularprsonjson[i]['name'],
    //       'poster_path': popularprsonjson[i]['poster_path'],
    //       'id': popularprsonjson[i]['id'],
    //     });
    //   }
    // } else {
    //   print(popularprson.statusCode);
    // }
  }
}
