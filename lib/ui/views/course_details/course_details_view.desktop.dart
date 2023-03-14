import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:stacked/stacked.dart';

import 'course_details_viewmodel.dart';

const double kdSidebarWidth = 450;

class CourseDetailsViewDesktop extends ViewModelWidget<CourseDetailsViewModel> {
  const CourseDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CourseDetailsViewModel viewModel) {
    return Scaffold(
        backgroundColor: kcBackgroundColor,
        body: Row(
          children: [
            SizedBox(
              width: kdSidebarWidth,
              child: ListView.separated(
                itemCount: viewModel.sidebarItems.length,
                separatorBuilder: (context, index) => SizedBox(height: 20),
                itemBuilder: (_, index) {
                  var sidebarItem = viewModel.sidebarItems[index];

                  if (sidebarItem is Module) {
                    return Container(
                      height: 80,
                      color: Colors.amber,
                    );
                  }

                  // HACK: I wonder if there's a better way to do this
                  (sidebarItem as Chapter);

                  return Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                            )),
                      ),
                      Text(sidebarItem.title),
                      const Spacer(),
                      Text(sidebarItem.durationReadableTime)
                    ],
                  );
                },
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  padding: const EdgeInsets.all(45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.red,
                        height: screenHeight(context) * 0.7,
                      ),
                      verticalSpaceLarge,
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('💻', style: ktsTitle2),
                          horizontalSpaceSmall,
                          GradientText(
                            'STACKED BASICS',
                            colors: kgTitle,
                            style: ktsTitle2,
                          ),
                        ],
                      ),
                      Text(
                        'Get to know Stacked, what it provides, how to use the CLI and how it works.',
                        style: ktsBodyRegular.copyWith(color: kcLightGrey),
                      ),
                      Container(
                        color: Colors.red,
                        height: screenHeight(context) * 0.7,
                      ),
                      verticalSpaceLarge,
                      Container(
                        color: Colors.red,
                        height: screenHeight(context) * 0.7,
                      ),
                      verticalSpaceLarge,
                    ],
                  )),
            )
          ],
        ));
  }
}
