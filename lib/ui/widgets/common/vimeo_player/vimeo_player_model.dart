import 'package:filledstacks_academy/app/app.logger.dart';
import 'package:pod_player/pod_player.dart';
import 'package:stacked/stacked.dart';

class VimeoPlayerModel extends BaseViewModel {
  final log = getLogger('VimeoPlayerModel');

  final String videoId;
  final String? token;
  VimeoPlayerModel({
    required this.videoId,
    this.token,
  }) {
    if (token != null) {
      headers['Authorization'] = 'Bearer $token';
    }

    log.w(headers);

    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(videoId, httpHeaders: headers),
      // playVideoFrom: PlayVideoFrom.vimeoPrivateVideos(
      //   videoId,
      //   httpHeaders: headers,
      // ),
      podPlayerConfig: const PodPlayerConfig(
        autoPlay: false,
        isLooping: false,
        videoQualityPriority: [1080, 720, 480, 360],
      ),
    )..initialise();

    controller.addListener(() {
      /// When controller.videoState == PodVideoState.playing hide overlay widgets
    });
  }

  final Map<String, String> headers = <String, String>{};

  late PodPlayerController controller;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
