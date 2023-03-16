// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i5;
import 'package:stacked/stacked.dart' as _i4;
import 'package:stacked_services/stacked_services.dart' as _i1;

import '../ui/views/course_details/course_details_view.dart' as _i3;
import '../ui/views/home/home_view.dart' as _i2;

final stackedRouter = StackedRouterWeb(_i1.StackedService.navigatorKey);

class StackedRouterWeb extends _i4.RootStackRouter {
  StackedRouterWeb([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.HomeView(key: args.key),
        maintainState: false,
      );
    },
    CourseDetailsViewRoute.name: (routeData) {
      final args = routeData.argsAs<CourseDetailsViewArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.CourseDetailsView(
          key: args.key,
        ),
        maintainState: false,
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          CourseDetailsViewRoute.name,
          path: '/course-details-view',
        ),
      ];
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i4.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i5.Key? key})
      : super(
          HomeViewRoute.name,
          path: '/',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.CourseDetailsView]
class CourseDetailsViewRoute extends _i4.PageRouteInfo<CourseDetailsViewArgs> {
  CourseDetailsViewRoute({
    _i5.Key? key,
    required String courseId,
  }) : super(
          CourseDetailsViewRoute.name,
          path: '/course-details-view',
          args: CourseDetailsViewArgs(
            key: key,
            courseId: courseId,
          ),
        );

  static const String name = 'CourseDetailsView';
}

class CourseDetailsViewArgs {
  const CourseDetailsViewArgs({
    this.key,
    required this.courseId,
  });

  final _i5.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseDetailsViewArgs{key: $key, courseId: $courseId}';
  }
}
