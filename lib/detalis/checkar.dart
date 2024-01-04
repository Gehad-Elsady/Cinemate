// ignore_for_file: override_on_non_overriding_member, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:movie_app/detalis/moviedetalis.dart';
import 'package:movie_app/detalis/tvdetalis.dart';

class ChrckerPoint extends StatelessWidget {
  var nweid;
  var newtype;

  ChrckerPoint(this.nweid, this.newtype, {super.key});

  @override
  checkertype() {
    if (newtype == 'movie') {
      return MoviesDetails(nweid);
    } else if (newtype == 'tv') {
      return TvDetalis(nweid);
    } else {
      return errorui();
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  errorui() {
    return const Scaffold(
      body: Center(
        child: Text(
          'error',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
