// ignore_for_file: non_constant_identifier_names, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';

class UserReviwe extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var revdealist;
  UserReviwe(this.revdealist, {super.key});

  @override
  State<UserReviwe> createState() => _UserReviweState();
}

class _UserReviweState extends State<UserReviwe> {
  bool showall = false;
  @override
  Widget build(BuildContext context) {
    List ReviweDetalis = widget.revdealist;
    if (ReviweDetalis.isEmpty) {
      return const Center(
        child: Text('no reviwes'),
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10, right: 20),
            child: LessAll(ReviweDetalis),
          ),
          showall == true
              ? Reviewui(context, ReviweDetalis)
              : Container(
                  child: Reviewdis(ReviweDetalis, 0),
                )
        ],
      );
    }
  }

  Row LessAll(List<dynamic> ReviweDetalis) {
    return Row(
      children: [
        const Expanded(
          child: Text('User Reviews',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'PlayfairDisplay',
              )),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              showall = !showall;
            });
          },
          child: Row(children: [
            showall == false
                ? Text(
                    'All Reviews' ' ${ReviweDetalis.length}',
                    style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PlayfairDisplay'),
                  )
                : const Text(
                    'Show Less',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PlayfairDisplay'),
                  ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.white,
            )
          ]),
        )
      ],
    );
  }

  Container Reviewui(BuildContext context, List<dynamic> ReviweDetalis) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ReviweDetalis.length,
        itemBuilder: (context, index) {
          return Reviewdis(ReviweDetalis, index);
        },
      ),
    );
  }

  Padding Reviewdis(List<dynamic> ReviweDetalis, int index) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 20, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  ReviweDetalis[index]['avatarphoto']),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            ReviweDetalis[index]['name'],
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'PlayfairDisplay',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          ReviweDetalis[index]['creationdate'],
                          style: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'PlayfairDisplay'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        ReviweDetalis[index]['rating'],
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                ReviweDetalis[index]['review'],
              ))
            ],
          )
        ],
      ),
    );
  }
}
