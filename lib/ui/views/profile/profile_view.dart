import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_viewmodel.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Logged User: ${viewModel.currentUser.email}',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (viewModel.currentUser.hasProfilePicture) ...[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      viewModel.currentUser.profilePicture!,
                      scale: 50.0,
                    ),
                  ),
                  horizontalSpaceSmall,
                ],
                MaterialButton(
                  child: const Text('Sign Out'),
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: viewModel.logout,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
