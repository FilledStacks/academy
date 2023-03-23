import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/views/course_landing/widgets/course_landing_chapters_grid.dart';
import 'package:filledstacked_academy/ui/views/course_landing/widgets/course_landing_overview.dart';
import 'package:filledstacked_academy/ui/views/course_landing/widgets/course_landing_trailer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_landing_viewmodel.dart';

class CourseLandingViewDesktop extends ViewModelWidget<CourseLandingViewModel> {
  const CourseLandingViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseLandingViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kcBackgroundColor,
        centerTitle: false,
        title: Text(
          ksAppBarTitle,
          style: ktsTitle.copyWith(fontSize: 15),
        ),
        titleSpacing: 45,
        toolbarHeight: 45,
      ),
      backgroundColor: kcBackgroundColor,
      body: viewModel.isBusy
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CourseLandingTrailer(),
                  verticalSpaceLarge,
                  CourseLandingOverview(),
                  verticalSpaceLarge,
                  CourseLandingChaptersGrid(),
                  verticalSpaceLarge,
                ],
              ),
            ),
      endDrawer: Drawer(
        backgroundColor: kcBackgroundColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: kcBackgroundColor),
              child: Text(ksAppBarTitle),
            ),
            ListTile(
              title: Text('Option 1', style: ktsBodyLarge),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Option 2', style: ktsBodyLarge),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
