import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_greet_user.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_image.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_subtitle.dart';
import 'package:filledstacked_academy/ui/views/home/widgets/home_title.dart';
import 'package:filledstacked_academy/ui/widgets/common/google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: kdDesktopMaxContentWidth * 0.6,
            child: ListView(
              children: [
                verticalSpace(150),
                const HomeTitle(),
                const HomeSubtitle(),
                verticalSpaceMedium,
                Container(
                  height: 130,
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: SvgPicture.asset(
                    'assets/sign-up-arrow.svg',
                    placeholderBuilder: (context) => Shimmer.fromColors(
                      baseColor: kcDarkGreyColor,
                      highlightColor: kcDarkGreyShimmerEndColor,
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: kcMediumGrey,
                      ),
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Row(
                  children: [
                    viewModel.hasUser
                        ? const HomeGreetUser()
                        : const GoogleSignIn(),
                  ],
                ),
                verticalSpace(120),
              ],
            ),
          ),
          const HomeImage(),
        ],
      ),
    );
  }
}
