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
<<<<<<< HEAD
<<<<<<< HEAD
import 'package:flutter/material.dart' as _i12;
import 'package:stacked/stacked.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i9;
=======
import 'package:flutter/foundation.dart' as _i12;
import 'package:flutter/material.dart' as _i10;
import 'package:stacked/stacked.dart' as _i9;
import 'package:stacked_services/stacked_services.dart' as _i1;
>>>>>>> 303667e (Finally completes the Native actions interaction for web)

import '../models/models.dart' as _i13;
import '../ui/views/course_chapter/course_chapter_view.dart' as _i8;
=======
import 'package:flutter/material.dart' as _i11;
import 'package:stacked/stacked.dart' as _i10;
import 'package:stacked_services/stacked_services.dart' as _i8;

import '../models/models.dart' as _i12;
import '../ui/views/course_chapter/course_chapter_view.dart' as _i7;
>>>>>>> 039c1fe (Generates working router)
import '../ui/views/course_details/course_details_view.dart' as _i5;
import '../ui/views/course_landing/course_landing_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/main_layout/main_layout_view.dart' as _i1;
<<<<<<< HEAD
import '../ui/views/payment_capture/payment_capture_view.dart' as _i7;
import '../ui/views/unknown/unknown_view.dart' as _i2;
import '../ui/views/user_profile/user_profile_view.dart' as _i6;
import 'guards/auth_guard.dart' as _i10;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i9.StackedService.navigatorKey,
  authGuard: _i10.AuthGuard(),
);

class StackedRouterWeb extends _i11.RootStackRouter {
  StackedRouterWeb({
    _i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i10.AuthGuard authGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    MainLayoutViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
=======
import '../ui/views/unknown/unknown_view.dart' as _i2;
import '../ui/views/user_profile/user_profile_view.dart' as _i6;
import 'guards/auth_guard.dart' as _i9;

final stackedRouter = StackedRouterWeb(
  navigatorKey: _i8.StackedService.navigatorKey,
  authGuard: _i9.AuthGuard(),
);

class StackedRouterWeb extends _i10.RootStackRouter {
  StackedRouterWeb({
    _i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
    required this.authGuard,
  }) : super(navigatorKey);

  final _i9.AuthGuard authGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    MainLayoutViewRoute.name: (routeData) {
      return _i10.CustomPage<dynamic>(
>>>>>>> 039c1fe (Generates working router)
        routeData: routeData,
        child: const _i1.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
<<<<<<< HEAD
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.UnknownView(),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
=======
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.UnknownView(),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
>>>>>>> 039c1fe (Generates working router)
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
<<<<<<< HEAD
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.HomeView(key: args.key),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
=======
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.HomeView(key: args.key),
        transitionsBuilder: _i10.TransitionsBuilders.fadeIn,
>>>>>>> 039c1fe (Generates working router)
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseLandingViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseLandingViewArgs>(
          orElse: () => CourseLandingViewArgs(
              courseId: pathParams.getString('courseId')));
<<<<<<< HEAD
      return _i11.CustomPage<dynamic>(
=======
      return _i10.CustomPage<dynamic>(
>>>>>>> 039c1fe (Generates working router)
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
<<<<<<< HEAD
      return _i11.CustomPage<dynamic>(
=======
      return _i10.CustomPage<dynamic>(
>>>>>>> 039c1fe (Generates working router)
        routeData: routeData,
        child: _i5.CourseDetailsView(
          key: args.key,
          courseId: args.courseId,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UserProfileViewRoute.name: (routeData) {
<<<<<<< HEAD
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.UserProfileView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PaymentCaptureViewRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentCaptureViewArgs>(
          orElse: () => const PaymentCaptureViewArgs());
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i7.PaymentCaptureView(key: args.key),
=======
      return _i10.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.UserProfileView(),
>>>>>>> 039c1fe (Generates working router)
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseChapterViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseChapterViewArgs>(
          orElse: () => CourseChapterViewArgs(
              chapterId: pathParams.getString('chapterId')));
<<<<<<< HEAD
      return _i11.CustomPage<dynamic>(
=======
      return _i10.CustomPage<dynamic>(
>>>>>>> 039c1fe (Generates working router)
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
<<<<<<< HEAD
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          children: [
            _i11.RouteConfig(
=======
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          children: [
            _i10.RouteConfig(
>>>>>>> 039c1fe (Generates working router)
              HomeViewRoute.name,
              path: '',
              parent: MainLayoutViewRoute.name,
            ),
<<<<<<< HEAD
            _i11.RouteConfig(
=======
            _i10.RouteConfig(
>>>>>>> 039c1fe (Generates working router)
              CourseLandingViewRoute.name,
              path: 'courses/:courseId',
              parent: MainLayoutViewRoute.name,
            ),
<<<<<<< HEAD
            _i11.RouteConfig(
=======
            _i10.RouteConfig(
>>>>>>> 039c1fe (Generates working router)
              CourseDetailsViewRoute.name,
              path: 'details/:courseId',
              parent: MainLayoutViewRoute.name,
              children: [
<<<<<<< HEAD
                _i11.RouteConfig(
=======
                _i10.RouteConfig(
>>>>>>> 039c1fe (Generates working router)
                  CourseChapterViewRoute.name,
                  path: ':chapterId',
                  parent: CourseDetailsViewRoute.name,
                )
              ],
            ),
<<<<<<< HEAD
            _i11.RouteConfig(
=======
            _i10.RouteConfig(
>>>>>>> 039c1fe (Generates working router)
              UserProfileViewRoute.name,
              path: 'profile',
              parent: MainLayoutViewRoute.name,
              guards: [authGuard],
            ),
            _i11.RouteConfig(
              PaymentCaptureViewRoute.name,
              path: 'payment-capture',
              parent: MainLayoutViewRoute.name,
              guards: [authGuard],
            ),
          ],
        ),
<<<<<<< HEAD
        _i11.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i11.RouteConfig(
=======
        _i10.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i10.RouteConfig(
>>>>>>> 039c1fe (Generates working router)
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.MainLayoutView]
<<<<<<< HEAD
class MainLayoutViewRoute extends _i11.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i11.PageRouteInfo>? children})
=======
class MainLayoutViewRoute extends _i10.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i10.PageRouteInfo>? children})
>>>>>>> 039c1fe (Generates working router)
      : super(
          MainLayoutViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i2.UnknownView]
<<<<<<< HEAD
class UnknownViewRoute extends _i11.PageRouteInfo<void> {
=======
class UnknownViewRoute extends _i10.PageRouteInfo<void> {
>>>>>>> 039c1fe (Generates working router)
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
<<<<<<< HEAD
<<<<<<< HEAD
/// [_i3.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<HomeViewArgs> {
=======
/// [_i4.HomeView]
class HomeViewRoute extends _i9.PageRouteInfo<HomeViewArgs> {
>>>>>>> 303667e (Finally completes the Native actions interaction for web)
  HomeViewRoute({_i12.Key? key})
=======
/// [_i3.HomeView]
class HomeViewRoute extends _i10.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i11.Key? key})
>>>>>>> 039c1fe (Generates working router)
      : super(
          HomeViewRoute.name,
          path: '',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CourseLandingView]
<<<<<<< HEAD
class CourseLandingViewRoute extends _i11.PageRouteInfo<CourseLandingViewArgs> {
=======
class CourseLandingViewRoute extends _i10.PageRouteInfo<CourseLandingViewArgs> {
>>>>>>> 039c1fe (Generates working router)
  CourseLandingViewRoute({
    _i11.Key? key,
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

  final _i11.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseLandingViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i5.CourseDetailsView]
<<<<<<< HEAD
class CourseDetailsViewRoute extends _i11.PageRouteInfo<CourseDetailsViewArgs> {
=======
class CourseDetailsViewRoute extends _i10.PageRouteInfo<CourseDetailsViewArgs> {
>>>>>>> 039c1fe (Generates working router)
  CourseDetailsViewRoute({
    _i11.Key? key,
    required String courseId,
<<<<<<< HEAD
    List<_i11.PageRouteInfo>? children,
=======
    List<_i10.PageRouteInfo>? children,
>>>>>>> 039c1fe (Generates working router)
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

  final _i11.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseDetailsViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i6.UserProfileView]
<<<<<<< HEAD
class UserProfileViewRoute extends _i11.PageRouteInfo<void> {
=======
class UserProfileViewRoute extends _i10.PageRouteInfo<void> {
>>>>>>> 039c1fe (Generates working router)
  const UserProfileViewRoute()
      : super(
          UserProfileViewRoute.name,
          path: 'profile',
        );

  static const String name = 'UserProfileView';
}

/// generated route for
<<<<<<< HEAD
/// [_i7.PaymentCaptureView]
class PaymentCaptureViewRoute
    extends _i11.PageRouteInfo<PaymentCaptureViewArgs> {
  PaymentCaptureViewRoute({_i12.Key? key})
      : super(
          PaymentCaptureViewRoute.name,
          path: 'payment-capture',
          args: PaymentCaptureViewArgs(key: key),
        );

  static const String name = 'PaymentCaptureView';
}

class PaymentCaptureViewArgs {
  const PaymentCaptureViewArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'PaymentCaptureViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.CourseChapterView]
class CourseChapterViewRoute extends _i11.PageRouteInfo<CourseChapterViewArgs> {
=======
/// [_i7.CourseChapterView]
class CourseChapterViewRoute extends _i10.PageRouteInfo<CourseChapterViewArgs> {
>>>>>>> 039c1fe (Generates working router)
  CourseChapterViewRoute({
    _i11.Key? key,
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

  final _i11.Key? key;

  final String chapterId;

  final _i12.Chapter? chapter;

  @override
  String toString() {
    return 'CourseChapterViewArgs{key: $key, chapterId: $chapterId, chapter: $chapter}';
  }
}
