// ignore_for_file: non_constant_identifier_names, prefer_interpolation_to_compose_strings, avoid_print

import 'package:movie_app/apikey/apikey.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieDetaliseFunction {
  List<Map<String, dynamic>> MoviesDetailss = [];
  List<Map<String, dynamic>> UserREviews = [];
  List<Map<String, dynamic>> similarmovieslist = [];
  List<Map<String, dynamic>> recommendedmovieslist = [];
  List<Map<String, dynamic>> movietrailerslist = [];

  List MoviesGeneres = [];

  Future<void> MovieDetalise({required var id}) async {
    var moviedetailurl =
        'https://api.themoviedb.org/3/movie/$id?api_key=$apiKey';
    var UserReviewurl =
        'https://api.themoviedb.org/3/movie/$id/reviews?api_key=$apiKey';
    var similarmoviesurl =
        'https://api.themoviedb.org/3/movie/$id/similar?api_key=$apiKey';
    var recommendedmoviesurl =
        'https://api.themoviedb.org/3/movie/$id/recommendations?api_key=$apiKey';
    var movietrailersurl =
        'https://api.themoviedb.org/3/movie/$id/videos?api_key=$apiKey';

    var moviedetailresponse = await http.get(Uri.parse(moviedetailurl));
    if (moviedetailresponse.statusCode == 200) {
      var moviedetailjson = jsonDecode(moviedetailresponse.body);
      for (var i = 0; i < 1; i++) {
        MoviesDetailss.add({
          "backdrop_path": moviedetailjson['backdrop_path'],
          "title": moviedetailjson['title'],
          "vote_average": moviedetailjson['vote_average'],
          "overview": moviedetailjson['overview'],
          "release_date": moviedetailjson['release_date'],
          "runtime": moviedetailjson['runtime'],
          "budget": moviedetailjson['budget'],
          "revenue": moviedetailjson['revenue'],
        });
      }
      for (var i = 0; i < moviedetailjson['genres'].length; i++) {
        MoviesGeneres.add(moviedetailjson['genres'][i]['name']);
      }
    } else {}

    /////////////////////////////User Reviews///////////////////////////////
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
    /////////////////////////////similar movies
    var similarmoviesresponse = await http.get(Uri.parse(similarmoviesurl));
    if (similarmoviesresponse.statusCode == 200) {
      var similarmoviesjson = jsonDecode(similarmoviesresponse.body);
      for (var i = 0; i < similarmoviesjson['results'].length; i++) {
        similarmovieslist.add({
          "poster_path": similarmoviesjson['results'][i]['poster_path'],
          "name": similarmoviesjson['results'][i]['title'],
          "vote_average": similarmoviesjson['results'][i]['vote_average'],
          "Date": similarmoviesjson['results'][i]['release_date'],
          "id": similarmoviesjson['results'][i]['id'],
        });
      }
    } else {}
    // print(similarmovieslist);
    /////////////////////////////recommended movies
    var recommendedmoviesresponse =
        await http.get(Uri.parse(recommendedmoviesurl));
    if (recommendedmoviesresponse.statusCode == 200) {
      var recommendedmoviesjson = jsonDecode(recommendedmoviesresponse.body);
      for (var i = 0; i < recommendedmoviesjson['results'].length; i++) {
        recommendedmovieslist.add({
          "poster_path": recommendedmoviesjson['results'][i]['poster_path'],
          "name": recommendedmoviesjson['results'][i]['title'],
          "vote_average": recommendedmoviesjson['results'][i]['vote_average'],
          "Date": recommendedmoviesjson['results'][i]['release_date'],
          "id": recommendedmoviesjson['results'][i]['id'],
        });
      }
    } else {}
    // print(recommendedmovieslist);
    /////////////////////////////movie trailers
    var movietrailersresponse = await http.get(Uri.parse(movietrailersurl));
    if (movietrailersresponse.statusCode == 200) {
      var movietrailersjson = jsonDecode(movietrailersresponse.body);
      for (var i = 0; i < movietrailersjson['results'].length; i++) {
        if (movietrailersjson['results'][i]['type'] == "Trailer") {
          movietrailerslist.add({
            "key": movietrailersjson['results'][i]['key'],
          });
        }
      }
      movietrailerslist.add({'key': 'aJ0cZTcTh90'});
    } else {}
    print(movietrailerslist);
  }
}
