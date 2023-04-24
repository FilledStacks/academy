// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i7;
import 'package:stacked/stacked.dart' as _i6;
import 'package:stacked_services/stacked_services.dart' as _i5;

import '../ui/views/course_details/course_details_view.dart' as _i3;
import '../ui/views/course_landing/course_landing_view.dart' as _i2;
import '../ui/views/home/home_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i4;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i5.StackedService.navigatorKey);

class StackedRouterWeb extends _i6.RootStackRouter {
  StackedRouterWeb({_i7.GlobalKey<_i7.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseLandingViewRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.CourseLandingView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseDetailsViewRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.CourseDetailsView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          CourseLandingViewRoute.name,
          path: '/course-landing-view',
        ),
        _i6.RouteConfig(
          CourseDetailsViewRoute.name,
          path: '/course-details-view',
        ),
        _i6.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i6.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i6.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '/',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i2.CourseLandingView]
class CourseLandingViewRoute extends _i6.PageRouteInfo<void> {
  const CourseLandingViewRoute()
      : super(
          CourseLandingViewRoute.name,
          path: '/course-landing-view',
        );

  static const String name = 'CourseLandingView';
}

/// generated route for
/// [_i3.CourseDetailsView]
class CourseDetailsViewRoute extends _i6.PageRouteInfo<void> {
  const CourseDetailsViewRoute()
      : super(
          CourseDetailsViewRoute.name,
          path: '/course-details-view',
        );

  static const String name = 'CourseDetailsView';
}

/// generated route for
/// [_i4.UnknownView]
class UnknownViewRoute extends _i6.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

extension RouterStateExtension on _i5.RouterService {
  Future<dynamic> navigateToHomeView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCourseLandingView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const CourseLandingViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCourseDetailsView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const CourseDetailsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCourseLandingView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const CourseLandingViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCourseDetailsView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const CourseDetailsViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i6.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }
}
