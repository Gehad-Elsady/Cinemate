// ignore_for_file: camel_case_types, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable,
class trailerwatch extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var traileryid;
  trailerwatch(this.traileryid, {super.key});

  @override
  State<trailerwatch> createState() => _trailerwatchState();
}

class _trailerwatchState extends State<trailerwatch> {
  late YoutubePlayerController controller;
  @override
  void initState() {
    super.initState();
    final videoid = YoutubePlayer.convertUrlToId(widget.traileryid);
    controller = YoutubePlayerController(
        initialVideoId: videoid.toString(),
        flags: const YoutubePlayerFlags(
          enableCaption: true,
          // autoPlay: true,
          mute: false,
          forceHD: false,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: YoutubePlayer(
        thumbnail: Image.network(
          "${"https://img.youtube.com/vi/" + widget.traileryid}/hqdefault.jpg",
          fit: BoxFit.cover,
        ),
        controlsTimeOut: const Duration(milliseconds: 1500),
        aspectRatio: 16 / 9,
        controller: controller,
        showVideoProgressIndicator: true,
        bufferIndicator: const Center(
          child: Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
          )),
        ),
        progressIndicatorColor: Colors.amber,
        bottomActions: [
          CurrentPosition(),
          ProgressBar(
              isExpanded: true,
              colors: const ProgressBarColors(
                playedColor: Colors.white,
                handleColor: Colors.amber,
              )),
          RemainingDuration(),
          FullScreenButton(),
        ],
      ),
    );
  }
}
