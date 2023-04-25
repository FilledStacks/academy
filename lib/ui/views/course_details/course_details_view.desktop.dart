import 'package:filledstacks_academy/extensions/hover_extensions.dart';
import 'package:filledstacks_academy/models/models.dart';
import 'package:filledstacks_academy/ui/common/app_colors.dart';
import 'package:filledstacks_academy/ui/common/shared_styles.dart';
import 'package:filledstacks_academy/ui/common/ui_helpers.dart';
import 'package:filledstacks_academy/ui/common/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

import 'course_details_viewmodel.dart';

part '_widgets.dart';

const double kdSidebarWidth = 450;

class CourseDetailsViewDesktop extends ViewModelWidget<CourseDetailsViewModel> {
  const CourseDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseDetailsViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: Row(
          children: [
            _SideSelectionList(
              busy: viewModel.isBusy,
              items: viewModel.sidebarItems,
              isItemSelected: viewModel.isSidebarItemSelected,
            ),
            const Expanded(child: NestedRouter()),
          ],
        ));
  }
}
