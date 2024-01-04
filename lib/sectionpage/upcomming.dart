// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_app/functions/upcomingfun.dart';
import 'package:movie_app/widget/slider.dart';

class UpComming extends StatelessWidget {
  UpComming({super.key});
  Upcomingmovie up = Upcomingmovie();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: up.upcome(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.amber.shade400),
            );
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  sliderLiast(up.upcoming, 'Up coming movies', 'upcome', 20,
                      'release_date'),
                  sliderLiast(up.latest, 'TV Shows Airing Today', 'upcome', 20,
                      'first_air_date'),
                  // sliderLiast(up.pop, 'Popular People', 'upcome', 20)
                ]);
          }
        });
  }
}
