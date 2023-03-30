import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'user_profile_viewmodel.dart';

class UserProfileViewMobile extends ViewModelWidget<UserProfileViewModel> {
  const UserProfileViewMobile({super.key});

  @override
  Widget build(BuildContext context, UserProfileViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
