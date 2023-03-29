import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:filledstacked_academy/ui/common/app_constants.dart';
import 'package:filledstacked_academy/ui/views/course_landing/course_landing_view.dart';
import 'package:filledstacked_academy/ui/widgets/common/academy_icon.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'main_layout_viewmodel.dart';

class MainLayoutView extends StackedView<MainLayoutViewModel> {
  const MainLayoutView({super.key});

  @override
  Widget builder(
    BuildContext context,
    MainLayoutViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(
        child: SizedBox(
          height: 1400,
          width: kdDesktopMaxContentWidth,
          child: ListView(
            children: [
              SizedBox(
                height: 90,
                child: Row(children: const [
                  AcademyIcon(),
                ]),
              ),
              const CourseLandingView(
                courseId: 'flutter-web',
              ),
              Container(
                  height: 150,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Copyright © ${DateTime.now().year}'),
                      const Text('Created and presented by Dane Mackier'),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  @override
  MainLayoutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MainLayoutViewModel();
}
