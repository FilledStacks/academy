import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'unknown_view.desktop.dart';
import 'unknown_view.tablet.dart';
import 'unknown_view.mobile.dart';
import 'unknown_viewmodel.dart';

class UnknownView extends StackedView<UnknownViewModel> {
  const UnknownView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UnknownViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const UnknownViewMobile(),
      tablet: (_) => const UnknownViewTablet(),
      desktop: (_) => const UnknownViewDesktop(),
    );
  }

  @override
  UnknownViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UnknownViewModel();
}
