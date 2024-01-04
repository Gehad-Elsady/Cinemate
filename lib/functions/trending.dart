import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_app/alllinkes/allapi.dart';

class Trendig {
  List<Map<String, dynamic>> trendinglist = [];

  Future<void> trendinglisthome({required int uval}) async {
    if (uval == 1) {
      await gettrending(trendingdayutl);
    } else if (uval == 2) {
      await gettrending(trendingweekutl);
    }
  }

  Future<void> gettrending(String trendingtype) async {
    var trendingweek = await http.get(Uri.parse(trendingtype));
    if (trendingweek.statusCode == 200) {
      var tempdata = jsonDecode(trendingweek.body);
      var trendingweekjson = tempdata['results'];
      for (var i = 0; i < trendingweekjson.length; i++) {
        trendinglist.add({
          'id': trendingweekjson[i]['id'],
          'poster_path': trendingweekjson[i]['poster_path'],
          'vote_average': trendingweekjson[i]['vote_average'],
          'media_type': trendingweekjson[i]['media_type'],
          'indexno': i
        });
      }
    }
  }
}
