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
import 'package:flutter/material.dart' as _i9;
import 'package:stacked/stacked.dart' as _i8;
import 'package:stacked_services/stacked_services.dart' as _i1;

import '../models/models.dart' as _i10;
import '../ui/views/course_chapter/course_chapter_view.dart' as _i7;
import '../ui/views/course_details/course_details_view.dart' as _i5;
import '../ui/views/course_landing/course_landing_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/main_layout/main_layout_view.dart' as _i2;
import '../ui/views/unknown/unknown_view.dart' as _i6;

final stackedRouter = StackedRouterWeb(_i1.StackedService.navigatorKey);

class StackedRouterWeb extends _i8.RootStackRouter {
  StackedRouterWeb([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MainLayoutViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.HomeView(key: args.key),
        transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseLandingViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseLandingViewArgs>(
          orElse: () => CourseLandingViewArgs(
              courseId: pathParams.getString('courseId')));
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.CourseLandingView(
          key: args.key,
          courseId: args.courseId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseDetailsViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseDetailsViewArgs>(
          orElse: () => CourseDetailsViewArgs(
              courseId: pathParams.getString('courseId')));
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.CourseDetailsView(
          key: args.key,
          courseId: args.courseId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.UnknownView(),
        transitionsBuilder: _i8.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseChapterViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseChapterViewArgs>(
          orElse: () => CourseChapterViewArgs(
              chapterId: pathParams.getString('chapterId')));
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.CourseChapterView(
          key: args.key,
          chapterId: args.chapterId,
          chapter: args.chapter,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
        ),
        _i8.RouteConfig(
          HomeViewRoute.name,
          path: '/home-view',
        ),
        _i8.RouteConfig(
          CourseLandingViewRoute.name,
          path: '/courses/:courseId',
        ),
        _i8.RouteConfig(
          CourseDetailsViewRoute.name,
          path: '/courses/:courseId',
          children: [
            _i8.RouteConfig(
              CourseChapterViewRoute.name,
              path: ':chapterId',
              parent: CourseDetailsViewRoute.name,
            )
          ],
        ),
        _i8.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i8.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i2.MainLayoutView]
class MainLayoutViewRoute extends _i8.PageRouteInfo<void> {
  const MainLayoutViewRoute()
      : super(
          MainLayoutViewRoute.name,
          path: '/',
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i8.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i9.Key? key})
      : super(
          HomeViewRoute.name,
          path: '/home-view',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CourseLandingView]
class CourseLandingViewRoute extends _i8.PageRouteInfo<CourseLandingViewArgs> {
  CourseLandingViewRoute({
    _i9.Key? key,
    required String courseId,
  }) : super(
          CourseLandingViewRoute.name,
          path: '/courses/:courseId',
          args: CourseLandingViewArgs(
            key: key,
            courseId: courseId,
          ),
          rawPathParams: {'courseId': courseId},
        );

  static const String name = 'CourseLandingView';
}

class CourseLandingViewArgs {
  const CourseLandingViewArgs({
    this.key,
    required this.courseId,
  });

  final _i9.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseLandingViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i5.CourseDetailsView]
class CourseDetailsViewRoute extends _i8.PageRouteInfo<CourseDetailsViewArgs> {
  CourseDetailsViewRoute({
    _i9.Key? key,
    required String courseId,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CourseDetailsViewRoute.name,
          path: '/courses/:courseId',
          args: CourseDetailsViewArgs(
            key: key,
            courseId: courseId,
          ),
          rawPathParams: {'courseId': courseId},
          initialChildren: children,
        );

  static const String name = 'CourseDetailsView';
}

class CourseDetailsViewArgs {
  const CourseDetailsViewArgs({
    this.key,
    required this.courseId,
  });

  final _i9.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseDetailsViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i6.UnknownView]
class UnknownViewRoute extends _i8.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i7.CourseChapterView]
class CourseChapterViewRoute extends _i8.PageRouteInfo<CourseChapterViewArgs> {
  CourseChapterViewRoute({
    _i9.Key? key,
    required String chapterId,
    _i10.Chapter? chapter,
  }) : super(
          CourseChapterViewRoute.name,
          path: ':chapterId',
          args: CourseChapterViewArgs(
            key: key,
            chapterId: chapterId,
            chapter: chapter,
          ),
          rawPathParams: {'chapterId': chapterId},
        );

  static const String name = 'CourseChapterView';
}

class CourseChapterViewArgs {
  const CourseChapterViewArgs({
    this.key,
    required this.chapterId,
    this.chapter,
  });

  final _i9.Key? key;

  final String chapterId;

  final _i10.Chapter? chapter;

  @override
  String toString() {
    return 'CourseChapterViewArgs{key: $key, chapterId: $chapterId, chapter: $chapter}';
  }
}
