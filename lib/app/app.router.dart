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
import 'package:flutter/material.dart' as _i10;
import 'package:stacked/stacked.dart' as _i9;
import 'package:stacked_services/stacked_services.dart' as _i1;

import '../models/models.dart' as _i12;
import '../ui/views/course_chapter/course_chapter_view.dart' as _i8;
import '../ui/views/course_details/course_details_view.dart' as _i6;
import '../ui/views/course_landing/course_landing_view.dart' as _i5;
import '../ui/views/home/home_view.dart' as _i4;
import '../ui/views/main_layout/main_layout_view.dart' as _i2;
import '../ui/views/unknown/unknown_view.dart' as _i3;
import '../ui/views/user_profile/user_profile_view.dart' as _i7;
import 'guards/auth_guard.dart' as _i11;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i1.StackedService.navigatorKey,
  authGuard: _i11.AuthGuard(),
);

class StackedRouterWeb extends _i9.RootStackRouter {
  StackedRouterWeb({
    _i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i11.AuthGuard authGuard;

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    MainLayoutViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.UnknownView(),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.HomeView(key: args.key),
        transitionsBuilder: _i9.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseLandingViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseLandingViewArgs>(
          orElse: () => CourseLandingViewArgs(
              courseId: pathParams.getString('courseId')));
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i5.CourseLandingView(
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
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.CourseDetailsView(
          key: args.key,
          courseId: args.courseId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserProfileViewRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i7.UserProfileView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseChapterViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseChapterViewArgs>(
          orElse: () => CourseChapterViewArgs(
              chapterId: pathParams.getString('chapterId')));
      return _i9.CustomPage<dynamic>(
        routeData: routeData,
        child: _i8.CourseChapterView(
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
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          children: [
            _i9.RouteConfig(
              HomeViewRoute.name,
              path: '',
              parent: MainLayoutViewRoute.name,
            ),
            _i9.RouteConfig(
              CourseLandingViewRoute.name,
              path: 'courses/:courseId',
              parent: MainLayoutViewRoute.name,
            ),
            _i9.RouteConfig(
              CourseDetailsViewRoute.name,
              path: 'details/:courseId',
              parent: MainLayoutViewRoute.name,
              children: [
                _i9.RouteConfig(
                  CourseChapterViewRoute.name,
                  path: ':chapterId',
                  parent: CourseDetailsViewRoute.name,
                )
              ],
            ),
            _i9.RouteConfig(
              UserProfileViewRoute.name,
              path: 'profile',
              parent: MainLayoutViewRoute.name,
              guards: [authGuard],
            ),
          ],
        ),
        _i9.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i9.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i2.MainLayoutView]
class MainLayoutViewRoute extends _i9.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i9.PageRouteInfo>? children})
      : super(
          MainLayoutViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i3.UnknownView]
class UnknownViewRoute extends _i9.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i4.HomeView]
class HomeViewRoute extends _i9.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i10.Key? key})
      : super(
          HomeViewRoute.name,
          path: '',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.CourseLandingView]
class CourseLandingViewRoute extends _i9.PageRouteInfo<CourseLandingViewArgs> {
  CourseLandingViewRoute({
    _i10.Key? key,
    required String courseId,
  }) : super(
          CourseLandingViewRoute.name,
          path: 'courses/:courseId',
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

  final _i10.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseLandingViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i6.CourseDetailsView]
class CourseDetailsViewRoute extends _i9.PageRouteInfo<CourseDetailsViewArgs> {
  CourseDetailsViewRoute({
    _i10.Key? key,
    required String courseId,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CourseDetailsViewRoute.name,
          path: 'details/:courseId',
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

  final _i10.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseDetailsViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i7.UserProfileView]
class UserProfileViewRoute extends _i9.PageRouteInfo<void> {
  const UserProfileViewRoute()
      : super(
          UserProfileViewRoute.name,
          path: 'profile',
        );

  static const String name = 'UserProfileView';
}

/// generated route for
/// [_i8.CourseChapterView]
class CourseChapterViewRoute extends _i9.PageRouteInfo<CourseChapterViewArgs> {
  CourseChapterViewRoute({
    _i10.Key? key,
    required String chapterId,
    _i12.Chapter? chapter,
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

  final _i10.Key? key;

  final String chapterId;

  final _i12.Chapter? chapter;

  @override
  String toString() {
    return 'CourseChapterViewArgs{key: $key, chapterId: $chapterId, chapter: $chapter}';
  }
}
