import 'package:filledstacked_academy/extensions/hover_extensions.dart';
import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/shared_styles.dart';
import 'package:filledstacked_academy/ui/common/ui_helpers.dart';
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
              child: viewModel.isBusy
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(60),
                      itemCount: viewModel.sidebarItems.length,
                      separatorBuilder: (context, index) {
                        final currentSideBarItem =
                            viewModel.sidebarItems[index];

                        dynamic nextSidebarItem;
                        if (index == viewModel.sidebarItems.length - 1) {
                          nextSidebarItem = viewModel.sidebarItems[index];
                        } else {
                          nextSidebarItem = viewModel.sidebarItems[index + 1];
                        }
                        return SizedBox(
                            height: nextSidebarItem is Module &&
                                    currentSideBarItem is Chapter
                                ? 50
                                : 20);
                      },
                      itemBuilder: (_, index) {
                        var sidebarItem = viewModel.sidebarItems[index];

                        if (sidebarItem is Module) {
                          final moduleSelected =
                              viewModel.isSidebarItemSelected(sidebarItem);
                          return Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: moduleSelected
                                    ? Colors.white
                                    : kcMediumGrey,
                                boxShadow: [
                                  if (moduleSelected)
                                    BoxShadow(
                                      color: Colors.white.withOpacity(0.5),
                                      blurRadius: 20,
                                    )
                                ]),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // TODO (Improvement): Get random Emoji in the place of 🚀
                                Text(
                                  sidebarItem.leadingEmoji ?? '🚀',
                                  style: ktsBodyRegular.copyWith(
                                    color: moduleSelected
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                ),
                                horizontalSpaceTiny,
                                Text(sidebarItem.title,
                                    style: ktsBodyRegular.copyWith(
                                      color: moduleSelected
                                          ? Colors.black
                                          : Colors.white,
                                    )),
                              ],
                            ),
                          );
                        }

                        // HACK: I wonder if there's a better way to do this
                        (sidebarItem as Chapter);

                        return GestureDetector(
                          onTap: () => viewModel.showChapter(sidebarItem),
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  color: viewModel
                                          .isSidebarItemSelected(sidebarItem)
                                      ? Colors.white
                                      : Colors.transparent,
                                ),
                              ),
                              horizontalSpaceMedium,
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
