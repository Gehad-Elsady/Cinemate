// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, avoid_print

import 'dart:convert';

import 'package:movie_app/apikey/apikey.dart';
import 'package:http/http.dart' as http;

class TvDetalisFunction {
  List<Map<String, dynamic>> TvDetailss = [];
  List<Map<String, dynamic>> UserREviews = [];
  List<Map<String, dynamic>> similartvlist = [];
  List<Map<String, dynamic>> recommendedtvlist = [];
  List<Map<String, dynamic>> tvtrailerslist = [];

  List tvsGeneres = [];

  Future<void> TvDetalise({required var id}) async {
    var tvdetailurl = 'https://api.themoviedb.org/3/tv/$id?api_key=$apiKey';
    var UserReviewurl =
        'https://api.themoviedb.org/3/tv/$id/reviews?api_key=$apiKey';
    var similartvurl =
        'https://api.themoviedb.org/3/tv/$id/similar?api_key=$apiKey';
    var recommendedtvurl =
        'https://api.themoviedb.org/3/tv/$id/recommendations?api_key=$apiKey';
    var tvtrailersurl =
        'https://api.themoviedb.org/3/tv/$id/videos?api_key=$apiKey';

    var tvdetailresponse = await http.get(Uri.parse(tvdetailurl));
    if (tvdetailresponse.statusCode == 200) {
      var tvdetailjson = jsonDecode(tvdetailresponse.body);
      for (var i = 0; i < 1; i++) {
        TvDetailss.add({
          "backdrop_path": tvdetailjson['backdrop_path'],
          "name": tvdetailjson['name'],
          "vote_average": tvdetailjson['vote_average'],
          "overview": tvdetailjson['overview'], //
          "last_air_date": tvdetailjson['last_air_date'], //
          "runtime": tvdetailjson['runtime'], //
          "episode_number": tvdetailjson['episode_number'],
          "first_air_date": tvdetailjson['first_air_date'],
        });
      }
      for (var i = 0; i < tvdetailjson['genres'].length; i++) {
        tvsGeneres.add(tvdetailjson['genres'][i]['name']);
      }
    } else {}

    // /////////////////////////////User Reviews///////////////////////////////
    var UserReviewresponse = await http.get(Uri.parse(UserReviewurl));
    if (UserReviewresponse.statusCode == 200) {
      var UserReviewjson = jsonDecode(UserReviewresponse.body);
      for (var i = 0; i < UserReviewjson['results'].length; i++) {
        UserREviews.add({
          "name": UserReviewjson['results'][i]['author'],
          "review": UserReviewjson['results'][i]['content'],
          //check rating is null or not
          "rating":
              UserReviewjson['results'][i]['author_details']['rating'] == null
                  ? "Not Rated"
                  : UserReviewjson['results'][i]['author_details']['rating']
                      .toString(),
          "avatarphoto": UserReviewjson['results'][i]['author_details']
                      ['avatar_path'] ==
                  null
              ? "https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png"
              : "https://image.tmdb.org/t/p/w500" +
                  UserReviewjson['results'][i]['author_details']['avatar_path'],
          "creationdate":
              UserReviewjson['results'][i]['created_at'].substring(0, 10),
          "fullreviewurl": UserReviewjson['results'][i]['url'],
        });
      }
    } else {}
    // /////////////////////////////similar movies
    var similartvresponse = await http.get(Uri.parse(similartvurl));
    if (similartvresponse.statusCode == 200) {
      var similartvjson = jsonDecode(similartvresponse.body);
      for (var i = 0; i < similartvjson['results'].length; i++) {
        similartvlist.add({
          "poster_path": similartvjson['results'][i]['poster_path'],
          "name": similartvjson['results'][i]['title'],
          "vote_average": similartvjson['results'][i]['vote_average'],
          "Date": similartvjson['results'][i]['first_air_date'],
          "id": similartvjson['results'][i]['id'],
        });
      }
    } else {}
    print(similartvlist);
    /////////////////////////////recommended movies
    var recommendedtvresponse = await http.get(Uri.parse(recommendedtvurl));
    if (recommendedtvresponse.statusCode == 200) {
      var recommendedtvjson = jsonDecode(recommendedtvresponse.body);
      for (var i = 0; i < recommendedtvjson['results'].length; i++) {
        recommendedtvlist.add({
          "poster_path": recommendedtvjson['results'][i]['poster_path'],
          "name": recommendedtvjson['results'][i]['title'],
          "vote_average": recommendedtvjson['results'][i]['vote_average'],
          "Date": recommendedtvjson['results'][i]['first_air_date'],
          "id": recommendedtvjson['results'][i]['id'],
        });
      }
    } else {}
    print(recommendedtvlist);
    /////////////////////////////movie trailers
    var tvtrailersresponse = await http.get(Uri.parse(tvtrailersurl));
    if (tvtrailersresponse.statusCode == 200) {
      var tvtrailersjson = jsonDecode(tvtrailersresponse.body);
      for (var i = 0; i < tvtrailersjson['results'].length; i++) {
        if (tvtrailersjson['results'][i]['type'] == "Trailer") {
          tvtrailerslist.add({
            "key": tvtrailersjson['results'][i]['key'],
          });
        }
      }
      tvtrailerslist.add({'key': 'aJ0cZTcTh90'});
    } else {}
    print(tvtrailerslist);
  }
}
