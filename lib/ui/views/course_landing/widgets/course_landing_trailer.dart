import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/widgets/common/iframe_player.dart';
import 'package:flutter/material.dart';

class CourseLandingTrailer extends StatelessWidget {
  const CourseLandingTrailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: const IframePlayer(
            videoId: '783455878',
            videoThumbnail: 'assets/master-web-hero-image.png',
          ),
        ),
        Positioned(
          left: 30,
          bottom: 30,
          child: Text('MASTER\nFLUTTER\nON THE WEB', style: ktsTitle),
        ),
      ],
    );
  }
}
