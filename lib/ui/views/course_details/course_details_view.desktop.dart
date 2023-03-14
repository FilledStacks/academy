import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
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
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
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

                  return GestureDetector(
                    onTap: () => viewModel.showChapter(id: sidebarItem.id),
                    child: Row(
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
                    ).showCursorOnHover,
                  );
                },
              ),
            ),
            const Expanded(child: NestedRouter())
          ],
        ));
  }
}
