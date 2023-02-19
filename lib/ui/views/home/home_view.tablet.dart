import 'package:filledstacked_academy/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewTablet extends ViewModelWidget<HomeViewModel> {
  const HomeViewTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Scaffold(
      backgroundColor: kcBackgroundColor,
      body: Center(child: Text('Tablet Layout')),
    );
  }
}
