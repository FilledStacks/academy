import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'user_profile_view.desktop.dart';
import 'user_profile_view.mobile.dart';
import 'user_profile_viewmodel.dart';

class UserProfileView extends StackedView<UserProfileViewModel> {
  const UserProfileView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UserProfileViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const UserProfileViewMobile(),
      desktop: (_) => const UserProfileViewDesktop(),
    );
  }

  @override
  UserProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UserProfileViewModel();
}
