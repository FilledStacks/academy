import 'package:email_validator/email_validator.dart';
import 'package:filledstacked_academy/ui/views/home/home_view.form.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'home_view.desktop.dart';
import 'home_view.mobile.dart';
import 'home_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'email',
    validator: HomeViewValidators.validateEmail,
  )
])
class HomeView extends StackedView<HomeViewModel> with $HomeView {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => HomeViewMobile(emailController: emailController),
      tablet: (_) => HomeViewDesktop(emailController: emailController),
      desktop: (_) => HomeViewDesktop(emailController: emailController),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }
}

class HomeViewValidators {
  static String? validateEmail(String? email) {
    final emailValid = EmailValidator.validate(email ?? '');
    return emailValid ? null : 'Please enter a valid email';
  }
}
