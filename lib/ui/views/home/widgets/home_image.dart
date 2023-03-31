import 'package:cached_network_image/cached_network_image.dart';
import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HomeImage extends ViewModelWidget<HomeViewModel> {
  const HomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return GestureDetector(
      onTap: viewModel.navigateToCourse,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl:
              'packages/filledstacked_academy/assets/master-web-hero-image.png',
          width: getValueForScreenType<double>(
            context: context,
            mobile: double.infinity,
            tablet: kdDesktopMaxContentWidth * 0.4,
            desktop: kdDesktopMaxContentWidth * 0.4,
          ),
          height: getValueForScreenType<double>(
            context: context,
            mobile: 650,
          ),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: kcDarkGreyColor,
            highlightColor: kcDarkGreyShimmerEndColor,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: kcMediumGrey,
            ),
          ),
          fit: BoxFit.cover,
        ),
      ).showCursorOnHover,
    );
  }
}
