// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:movie_app/functions/tvseriesfun.dart';
import 'package:movie_app/widget/slider.dart';

class TvSeries extends StatelessWidget {
  TvSeries({super.key});

  TvSeriesFun tv = TvSeriesFun();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: tv.populartvseries(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.amber.shade400),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                sliderLiast(tv.populartv, 'Popular tv series', 'tv', 20,
                    'first_air_date'),
                sliderLiast(
                    tv.onarie, 'On the air', 'tv', 20, 'first_air_date'),
                sliderLiast(
                    tv.toptv, 'Top rated series', 'tv', 20, 'first_air_date')
              ],
            );
          }
        });
  }
}
