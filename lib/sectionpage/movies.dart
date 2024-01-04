// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_app/functions/moviesfun.dart';
import 'package:movie_app/widget/slider.dart';

class Movies extends StatelessWidget {
  Movies({super.key});

  MoviesFun mv = MoviesFun();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: mv.popularmovis(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.amber.shade400),
            );
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sliderLiast(
                      mv.movies, 'Popular Movies', 'movie', 20, 'release_date'),
                  sliderLiast(mv.onarimovies, 'Now playing movies', 'movie', 20,
                      'release_date'),
                  sliderLiast(
                      mv.topmovies, 'Top movies', 'movie', 20, 'release_date')
                ]);
          }
        });
  }
}
