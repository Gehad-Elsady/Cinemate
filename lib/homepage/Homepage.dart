// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:movie_app/widget/appbar.dart';
import 'package:movie_app/widget/sectinbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [MyCustomAppBar(), SectionBar()],
      ),
    );
  }
}
