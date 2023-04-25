// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i9;
import 'package:stacked/stacked.dart' as _i8;
import 'package:stacked_services/stacked_services.dart' as _i7;

import '../models/models.dart' as _i10;
import '../ui/views/course_chapter/course_chapter_view.dart' as _i6;
import '../ui/views/course_details/course_details_view.dart' as _i5;
import '../ui/views/course_landing/course_landing_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/main_layout/main_layout_view.dart' as _i1;
import '../ui/views/unknown/unknown_view.dart' as _i2;

final stackedRouter =
    StackedRouterWeb(navigatorKey: _i7.StackedService.navigatorKey);

class StackedRouterWeb extends _i8.RootStackRouter {
  StackedRouterWeb({_i9.GlobalKey<_i9.NavigatorState>? navigatorKey})
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MainLayoutViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.UnknownView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseLandingViewRoute.name: (routeData) {
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.CourseLandingView(),
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
    CourseChapterViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseChapterViewArgs>(
          orElse: () => CourseChapterViewArgs(
              chapterId: pathParams.getString('chapterId')));
      return _i8.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.CourseChapterView(
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
          children: [
            _i8.RouteConfig(
              HomeViewRoute.name,
              path: '',
              parent: MainLayoutViewRoute.name,
            ),
            _i8.RouteConfig(
              CourseLandingViewRoute.name,
              path: 'course-landing-view',
              parent: MainLayoutViewRoute.name,
            ),
            _i8.RouteConfig(
              CourseDetailsViewRoute.name,
              path: 'course/:courseId',
              parent: MainLayoutViewRoute.name,
              children: [
                _i8.RouteConfig(
                  CourseChapterViewRoute.name,
                  path: ':chapterId',
                  parent: CourseDetailsViewRoute.name,
                )
              ],
            ),
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
/// [_i1.MainLayoutView]
class MainLayoutViewRoute extends _i8.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainLayoutViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i2.UnknownView]
class UnknownViewRoute extends _i8.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i8.PageRouteInfo<void> {
  const HomeViewRoute()
      : super(
          HomeViewRoute.name,
          path: '',
        );

  static const String name = 'HomeView';
}

/// generated route for
/// [_i4.CourseLandingView]
class CourseLandingViewRoute extends _i8.PageRouteInfo<void> {
  const CourseLandingViewRoute()
      : super(
          CourseLandingViewRoute.name,
          path: 'course-landing-view',
        );

  static const String name = 'CourseLandingView';
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
          path: 'course/:courseId',
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
/// [_i6.CourseChapterView]
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

extension RouterStateExtension on _i7.RouterService {
  Future<dynamic> navigateToMainLayoutView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCourseLandingView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const CourseLandingViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCourseDetailsView({
    _i9.Key? key,
    required String courseId,
    void Function(_i8.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CourseDetailsViewRoute(
        key: key,
        courseId: courseId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCourseChapterView({
    _i9.Key? key,
    required String chapterId,
    _i10.Chapter? chapter,
    void Function(_i8.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CourseChapterViewRoute(
        key: key,
        chapterId: chapterId,
        chapter: chapter,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithMainLayoutView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const HomeViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCourseLandingView(
      {void Function(_i8.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const CourseLandingViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCourseDetailsView({
    _i9.Key? key,
    required String courseId,
    void Function(_i8.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CourseDetailsViewRoute(
        key: key,
        courseId: courseId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCourseChapterView({
    _i9.Key? key,
    required String chapterId,
    _i10.Chapter? chapter,
    void Function(_i8.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CourseChapterViewRoute(
        key: key,
        chapterId: chapterId,
        chapter: chapter,
      ),
      onFailure: onFailure,
    );
  }
}
