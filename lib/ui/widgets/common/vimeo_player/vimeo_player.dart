import 'package:filledstacked_academy/ui/widgets/common/vimeo_player/vimeo_player_model.dart';
import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:stacked/stacked.dart';

class VimeoPlayer extends StackedView<VimeoPlayerModel> {
  final String videoId;
  final String videoThumbnail;
  final String? token;
  const VimeoPlayer({
    Key? key,
    required this.videoId,
    required this.videoThumbnail,
    this.token,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VimeoPlayerModel viewModel,
    Widget? child,
  ) {
    return PodVideoPlayer(
      controller: viewModel.controller,
      videoThumbnail: DecorationImage(
        image: AssetImage(videoThumbnail),
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  VimeoPlayerModel viewModelBuilder(BuildContext context) => VimeoPlayerModel(
        videoId: videoId,
        token: token,
      );
}
