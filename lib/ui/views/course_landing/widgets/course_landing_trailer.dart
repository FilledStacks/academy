import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/widgets/common/vimeo_player/vimeo_player.dart';
import 'package:flutter/material.dart';

class CourseLandingTrailer extends StatelessWidget {
  const CourseLandingTrailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: const VimeoPlayer(
            // videoId: '518228118', // PUBLIC DOORDASH VIDEO
            // videoId: '498983118', // PUBLIC MICROSOFT VIDEO
            videoId: '812073036', // PUBLIC PERSONAL VIDEO
            videoThumbnail: 'assets/master-web-hero-image.png',
            token: '1f4a4c0be7ab1421a3c8e32933114634',
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
