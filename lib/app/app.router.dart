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
import 'package:flutter/material.dart' as _i7;
import 'package:stacked/stacked.dart' as _i6;
import 'package:stacked_services/stacked_services.dart' as _i1;

import '../models/models.dart' as _i8;
import '../ui/views/course_chapter/course_chapter_view.dart' as _i5;
import '../ui/views/course_details/course_details_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i2;

final stackedRouter = StackedRouterWeb(_i1.StackedService.navigatorKey);

class StackedRouterWeb extends _i6.RootStackRouter {
  StackedRouterWeb([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.StartupView(),
        maintainState: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomeView(key: args.key),
        maintainState: false,
      );
    },
    CourseDetailsViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseDetailsViewArgs>(
          orElse: () => CourseDetailsViewArgs(
              courseId: pathParams.getString('courseId')));
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CourseDetailsView(
          key: args.key,
          courseId: args.courseId,
        ),
        maintainState: false,
      );
    },
    CourseChapterViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseChapterViewArgs>(
          orElse: () => CourseChapterViewArgs(
              chapterId: pathParams.getString('chapterId')));
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.CourseChapterView(
          key: args.key,
          chapterId: args.chapterId,
          chapter: args.chapter,
        ),
        maintainState: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          StartupViewRoute.name,
          path: '/startup-view',
        ),
        _i6.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          CourseDetailsViewRoute.name,
          path: '/course/:courseId',
          children: [
            _i6.RouteConfig(
              CourseChapterViewRoute.name,
              path: ':chapterId',
              parent: CourseDetailsViewRoute.name,
            )
          ],
        ),
      ];
}

/// generated route for
/// [_i2.StartupView]
class StartupViewRoute extends _i6.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/startup-view',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i6.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i7.Key? key})
      : super(
          HomeViewRoute.name,
          path: '/',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CourseDetailsView]
class CourseDetailsViewRoute extends _i6.PageRouteInfo<CourseDetailsViewArgs> {
  CourseDetailsViewRoute({
    _i7.Key? key,
    required String courseId,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CourseDetailsViewRoute.name,
          path: '/course/:courseId',
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

  final _i7.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseDetailsViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i5.CourseChapterView]
class CourseChapterViewRoute extends _i6.PageRouteInfo<CourseChapterViewArgs> {
  CourseChapterViewRoute({
    _i7.Key? key,
    required String chapterId,
    _i8.Chapter? chapter,
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

  final _i7.Key? key;

  final String chapterId;

  final _i8.Chapter? chapter;

  @override
  String toString() {
    return 'CourseChapterViewArgs{key: $key, chapterId: $chapterId, chapter: $chapter}';
  }
}
