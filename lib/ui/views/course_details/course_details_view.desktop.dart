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
            Expanded(
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: screenHeight(context) * 0.7,
                          alignment: Alignment.center,
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                'assets/master-web-hero-image.png',
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Center(
                                child: Text(
                                  viewModel.selectedChapter?.id ??
                                      'Select a Chapter on the left',
                                  style: ktsTitle,
                                ),
                              ),
                            ],
                          ),
                        ),
                        verticalSpaceLarge,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('💻', style: ktsTitle2),
                            horizontalSpaceSmall,
                            GradientText(
                              viewModel.selectedChapter?.title ?? '',
                              colors: kgTitle,
                              style: ktsTitle2,
                            ),
                          ],
                        ),
                        Text(
                          viewModel.selectedChapter?.description ?? '',
                          style: ktsBodyRegular.copyWith(color: kcLightGrey),
                        ),
                      ],
                    )))
          ],
        ));
  }
}
