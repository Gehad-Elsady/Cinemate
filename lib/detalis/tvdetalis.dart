// ignore_for_file: must_be_immutable, override_on_non_overriding_member, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_app/functions/trailerui.dart';
import 'package:movie_app/functions/tvdetalisfun.dart';
import 'package:movie_app/functions/userreviwe.dart';
import 'package:movie_app/homepage/Homepage.dart';
import 'package:movie_app/widget/slider.dart';

class TvDetalis extends StatelessWidget {
  var tvid;

  TvDetalis(this.tvid, {super.key});

  @override
  TvDetalisFunction td = TvDetalisFunction();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: td.TvDetalise(id: tvid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return TvDetalisUi(context);
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            }
          }),
    );
  }

  CustomScrollView TvDetalisUi(BuildContext context) {
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
                td.tvtrailerslist[0]['key'],
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
                      itemCount: td.tvsGeneres.length,
                      itemBuilder: (context, index) {
                        //generes box
                        return Container(
                            margin: const EdgeInsets.only(right: 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(25, 25, 25, 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(td.tvsGeneres[index]));
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
                    child: Text('${td.TvDetailss[0]['runtime']} min'))
              ],
            )
          ],
        ),
        const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text('Tv Series Story :')),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(td.TvDetailss[0]['overview'].toString())),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: UserReviwe(td.UserREviews),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text('Release Date : ${td.TvDetailss[0]['last_air_date']}')),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Text('Tv Series Name  : ${td.TvDetailss[0]['name']}')),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child:
                Text('First Air Date : ${td.TvDetailss[0]['first_air_date']}')),
        sliderLiast(td.similartvlist, "Similar Series", "movie",
            td.similartvlist.length, 'Date'),
        sliderLiast(td.recommendedtvlist, "Recommended Series", "movie",
            td.recommendedtvlist.length, 'Date'),
      ]))
    ]);
  }
}
