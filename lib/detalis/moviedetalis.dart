// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:movie_app/functions/moviedetalisfun.dart';
import 'package:movie_app/functions/trailerui.dart';
import 'package:movie_app/functions/userreviwe.dart';
import 'package:movie_app/homepage/Homepage.dart';
import 'package:movie_app/widget/slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoviesDetails extends StatelessWidget {
  var id;
  MovieDetaliseFunction md = MovieDetaliseFunction();

  MoviesDetails(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 14, 14, 1),
      body: FutureBuilder(
          future: md.MovieDetalise(id: id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return MovieInfo(context);
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            }
          }),
    );
  }

  // ignore: non_constant_identifier_names
  CustomScrollView MovieInfo(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SliverAppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(FontAwesomeIcons.circleArrowLeft),
              iconSize: 28,
              color: Colors.white),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false);
                },
                icon: const Icon(FontAwesomeIcons.houseUser),
                iconSize: 25,
                color: Colors.white)
          ],
          backgroundColor: const Color.fromRGBO(18, 18, 18, 0.5),
          centerTitle: false,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.4,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: FittedBox(
              fit: BoxFit.fill,
              child: trailerwatch(
                md.movietrailerslist[0]['key'],
              ),
            ),
          )),
      SliverList(
          delegate: SliverChildListDelegate([
        Column(
          children: [
            Row(children: [
              Container(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: md.MoviesGeneres.length,
                      itemBuilder: (context, index) {
                        //generes box
                        return Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(25, 25, 25, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(md.MoviesGeneres[index]));
                      })),
            ]),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(left: 10, top: 10),
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(25, 25, 25, 1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('${md.MoviesDetailss[0]['runtime']} min'))
              ],
            )
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text('Movie Story :')),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(md.MoviesDetailss[0]['overview'].toString())),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: UserReviwe(md.UserREviews),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child:
                Text('Release Date : ${md.MoviesDetailss[0]['release_date']}')),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text('Budget : ${md.MoviesDetailss[0]['budget']}')),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text('Revenue : ${md.MoviesDetailss[0]['revenue']}')),
        sliderLiast(md.similarmovieslist, "Similar Movies", "movie",
            md.similarmovieslist.length, 'Date'),
        sliderLiast(md.recommendedmovieslist, "Recommended Movies", "movie",
            md.recommendedmovieslist.length, 'Date'),
      ]))
    ]);
  }
}
