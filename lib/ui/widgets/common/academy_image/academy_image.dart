import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import 'academy_image_model.dart';

class AcademyImage extends StackedView<AcademyImageModel> {
  final String name;
  final double height;
  final double width;
  const AcademyImage(
    this.name, {
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AcademyImageModel viewModel,
    Widget? child,
  ) {
    return AnimatedCrossFade(
      firstChild: SizedBox(
        height: height,
        width: width,
        child: Shimmer.fromColors(
          baseColor: kcDarkGreyColor,
          highlightColor: kcDarkGreyShimmerEndColor,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: kcMediumGrey,
          ),
        ),
      ),
      secondChild: Image.asset(
        name,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
      crossFadeState: viewModel.isLoadingImage
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  AcademyImageModel viewModelBuilder(BuildContext context) =>
      AcademyImageModel();
}
