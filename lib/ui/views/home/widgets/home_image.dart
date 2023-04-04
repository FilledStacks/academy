import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_image/academy_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class HomeImage extends ViewModelWidget<HomeViewModel> {
  const HomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final height = getValueForScreenType<double>(
      context: context,
      mobile: 650,
    );

    final width = getValueForScreenType<double>(
      context: context,
      mobile: double.infinity,
      tablet: kdDesktopMaxContentWidth * 0.4,
      desktop: kdDesktopMaxContentWidth * 0.4,
    );

    return GestureDetector(
      onTap: viewModel.navigateToCourse,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: AcademyImage(
          'assets/master-web-hero-image.png',
          height: height,
          width: width,
        ),
      ).showCursorOnHover,
    );
  }
}
