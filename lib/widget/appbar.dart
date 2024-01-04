import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/functions/trending.dart';

class MyCustomAppBar extends StatefulWidget {
  const MyCustomAppBar({super.key});

  @override
  State<MyCustomAppBar> createState() => _MyCustomAppBarState();
}

class _MyCustomAppBarState extends State<MyCustomAppBar> {
  Trendig tre = Trendig();
  int uvalue = 1;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          background: FutureBuilder(
              future: tre.trendinglisthome(uval: uvalue),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CarouselSlider(
                      options: CarouselOptions(
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          height: MediaQuery.of(context).size.height),
                      items: tre.trendinglist.map((i) {
                        return Builder(builder: (BuildContext context) {
                          return GestureDetector(
                            onTap: () {},
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.3),
                                            BlendMode.darken),
                                        image: NetworkImage(
                                            'http://image.tmdb.org/t/p/w500${i['poster_path']}'),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          );
                        });
                      }).toList());
                } else {
                  return const Center(
                      child: CircularProgressIndicator(
                          backgroundColor: Colors.amber));
                }
              })),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Trending" "🔥",
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 45,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: DropdownButton(
                onChanged: (value) {
                  setState(() {
                    tre.trendinglist.clear();
                    uvalue = int.parse(value.toString());
                  });
                },
                autofocus: true,
                underline: Container(
                  height: 0,
                  color: Colors.black.withOpacity(0.8),
                ),
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.amber.withOpacity(0.8),
                ),
                value: uvalue,
                items: const [
                  DropdownMenuItem(
                    value: 1,
                    child: Text(
                      "Daily",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 2,
                    child: Text(
                      "Weekly",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
