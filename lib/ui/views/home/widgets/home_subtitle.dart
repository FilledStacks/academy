import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class HomeSubtitle extends ViewModelWidget<HomeViewModel> {
  const HomeSubtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final children = [
      Text(
        'Build amazing software, the right way.',
        style: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      if (!viewModel.hasUser)
        Text(
          ' Sign up now',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: kcTitleGradientRight,
          ),
        ).scaleOnHover().moveOnHover(y: 5),
    ];

    return ScreenTypeLayout.builder(
      mobile: (_) => Column(children: children),
      tablet: (_) => Row(children: children),
      desktop: (_) => Row(children: children),
    );
  }
}
