// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:movie_app/functions/searchbarfun.dart';
import 'package:movie_app/sectionpage/movies.dart';
import 'package:movie_app/sectionpage/tvseries.dart';
import 'package:movie_app/sectionpage/upcomming.dart';

class SectionBar extends StatefulWidget {
  const SectionBar({super.key});

  @override
  State<SectionBar> createState() => _SectionBarState();
}

class _SectionBarState extends State<SectionBar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SliverList(
        delegate: SliverChildListDelegate([
      const searchbarfun(),
      Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
              physics: const BouncingScrollPhysics(),
              labelPadding: const EdgeInsets.symmetric(horizontal: 25),
              // isScrollable: true,
              controller: tabController,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber.withOpacity(0.4)),
              tabs: const [
                Tab(child: Text('Tv Series')),
                Tab(child: Text('Movies')),
                Tab(child: Text('Upcoming'))
              ])),
      Container(
          height: 1100,
          width: MediaQuery.of(context).size.width,
          child: TabBarView(controller: tabController, children: [
            TvSeries(),
            Movies(),
            UpComming(),
          ]))
    ]));
  }
}
