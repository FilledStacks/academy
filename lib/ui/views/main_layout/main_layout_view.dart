import 'package:filledstacked_academy/ui/common/app_colors.dart';
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
          width: viewModel.contentWidth,
          child: ListView(
            children: [
              SizedBox(
                height: 90,
                child: Row(children: const [
                  AcademyIcon(),
                ]),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints.tightFor(height: 900),
                child: NestedRouter(
                  navigatorObservers: () => [
                    RebuildObserver(viewModel),
                  ],
                ),
              )
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

class RebuildObserver extends RouteObserver {
  final MainLayoutViewModel viewModel;

  RebuildObserver(this.viewModel);

  @override
  void didPush(Route route, Route? previousRoute) {
    viewModel.rebuildUi();
    print('REBUILD UI =====> ');
  }
}
