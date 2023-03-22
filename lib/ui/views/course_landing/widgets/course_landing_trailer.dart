import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';

class CourseLandingTrailer extends StatelessWidget {
  const CourseLandingTrailer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: screenHeight(context) * 0.7,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.asset(
                    'assets/master-web-hero-image.png',
                    fit: BoxFit.cover,
                    color: Colors.white.withOpacity(0.30),
                    colorBlendMode: BlendMode.modulate,
                  ),
                ),
                Positioned(
                  left: 30,
                  bottom: 30,
                  child: Text('MASTER\nFLUTTER\nON THE WEB', style: ktsTitle),
                ),
                Container(
                  child: Image.asset('assets/play-button.png'),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.75),
                    shape: BoxShape.circle,
                  ),
                  margin: EdgeInsets.all(
                    screenWidthFraction(context, dividedBy: 8),
                  ),
                  padding: EdgeInsets.all(
                    screenWidthFraction(context, dividedBy: 22),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
