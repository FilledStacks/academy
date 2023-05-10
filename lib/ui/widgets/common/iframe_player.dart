// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

enum VideoPlatform {
  vimeo(src: 'https://player.vimeo.com/video/'),
  youtube(src: 'https://www.youtube.com/embed/');

  final String src;
  const VideoPlatform({this.src = 'https://player.vimeo.com/video/'});
}

class IframePlayer extends StatelessWidget {
  final String videoId;
  final String videoThumbnail;
  final VideoPlatform platform;
  const IframePlayer({
    Key? key,
    required this.videoId,
    required this.videoThumbnail,
    this.platform = VideoPlatform.vimeo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _iframeElement = IFrameElement()
      ..src = '${platform.src}$videoId'
      ..style.height = '100%'
      ..style.width = '100%'
      ..style.border = 'none'
      ..allow = 'autoplay; fullscreen;';

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );

    return SizedBox(
      child: const HtmlElementView(viewType: 'iframeElement'),
      height: MediaQuery.of(context).size.height * 0.55,
      width: double.infinity,
    );
  }
}
