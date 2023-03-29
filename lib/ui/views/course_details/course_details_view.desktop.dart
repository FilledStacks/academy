import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:filledstacked_academy/ui/common/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'course_details_viewmodel.dart';

part '_widgets.dart';

const double kdSidebarWidth = 350;

class CourseDetailsViewDesktop extends ViewModelWidget<CourseDetailsViewModel> {
  const CourseDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseDetailsViewModel viewModel) {
    return Row(
      children: [
        SizedBox(
          height: 900,
          child: _SideSelectionList(
            busy: viewModel.isBusy,
            items: viewModel.sidebarItems,
            isItemSelected: viewModel.isSidebarItemSelected,
          ),
        ),
        Expanded(
            child: Stack(
          children: [
            const NestedRouter(),
            if (viewModel.busyFetchingCourese)
              const Center(child: CircularProgressIndicator())
          ],
        ))
      ],
    );
  }
}
