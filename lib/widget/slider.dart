import 'package:flutter/material.dart';
import 'package:movie_app/detalis/moviedetalis.dart';
import 'package:movie_app/detalis/tvdetalis.dart';

Widget sliderLiast(
    List firstlistname, String catogory, String type, int itemcount,
    [String? datetype]) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
          padding: const EdgeInsets.only(left: 10, top: 15, bottom: 40),
          child: Text(
            catogory,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'PlayfairDisplay'),
          )),
      SizedBox(
        height: 245,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: itemcount,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (type == 'movie') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MoviesDetails(firstlistname[index]['id'])));
                } else if (type == 'tv') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TvDetalis(firstlistname[index]['id'])));
                }
              },
              child: Container(
                margin: const EdgeInsets.only(left: 13),
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3), BlendMode.darken),
                    image: NetworkImage(
                      'http://image.tmdb.org/t/p/w500${firstlistname[index]['poster_path'] ?? 'NO DATA'}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 6),
                      child: Text(
                        firstlistname[index][datetype] ?? 'NO DATA',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'PlayfairDisplay'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 2, left: 6),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 2, bottom: 2, left: 5, right: 5),
                          child: Row(
                            children: [
                              Text(
                                firstlistname[index]['vote_average'].toString(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'PlayfairDisplay'),
                              ),
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
      const SizedBox(
        height: 20,
      )
    ],
  );
}
