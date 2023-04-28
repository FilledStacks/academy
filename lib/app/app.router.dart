// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i12;
import 'package:stacked/stacked.dart' as _i11;
import 'package:stacked_services/stacked_services.dart' as _i9;

import '../models/models.dart' as _i13;
import '../ui/views/course_chapter/course_chapter_view.dart' as _i8;
import '../ui/views/course_details/course_details_view.dart' as _i5;
import '../ui/views/course_landing/course_landing_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/main_layout/main_layout_view.dart' as _i1;
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
        routeData: routeData,
        child: const _i1.MainLayoutView(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    UnknownViewRoute.name: (routeData) {
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.UnknownView(),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i11.CustomPage<dynamic>(
        routeData: routeData,
        child: _i3.HomeView(key: args.key),
        transitionsBuilder: _i11.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseLandingViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseLandingViewArgs>(
          orElse: () => CourseLandingViewArgs(
              courseId: pathParams.getString('courseId')));
      return _i11.CustomPage<dynamic>(
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
      return _i11.CustomPage<dynamic>(
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
        opaque: true,
        barrierDismissible: false,
      );
    },
    CourseChapterViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseChapterViewArgs>(
          orElse: () => CourseChapterViewArgs(
              chapterId: pathParams.getString('chapterId')));
      return _i11.CustomPage<dynamic>(
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
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          MainLayoutViewRoute.name,
          path: '/',
          children: [
            _i11.RouteConfig(
              HomeViewRoute.name,
              path: '',
              parent: MainLayoutViewRoute.name,
            ),
            _i11.RouteConfig(
              CourseLandingViewRoute.name,
              path: 'courses/:courseId',
              parent: MainLayoutViewRoute.name,
            ),
            _i11.RouteConfig(
              CourseDetailsViewRoute.name,
              path: 'details/:courseId',
              parent: MainLayoutViewRoute.name,
              children: [
                _i11.RouteConfig(
                  CourseChapterViewRoute.name,
                  path: ':chapterId',
                  parent: CourseDetailsViewRoute.name,
                )
              ],
            ),
            _i11.RouteConfig(
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
        _i11.RouteConfig(
          UnknownViewRoute.name,
          path: '/404',
        ),
        _i11.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '/404',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.MainLayoutView]
class MainLayoutViewRoute extends _i11.PageRouteInfo<void> {
  const MainLayoutViewRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainLayoutViewRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainLayoutView';
}

/// generated route for
/// [_i2.UnknownView]
class UnknownViewRoute extends _i11.PageRouteInfo<void> {
  const UnknownViewRoute()
      : super(
          UnknownViewRoute.name,
          path: '/404',
        );

  static const String name = 'UnknownView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i12.Key? key})
      : super(
          HomeViewRoute.name,
          path: '',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CourseLandingView]
class CourseLandingViewRoute extends _i11.PageRouteInfo<CourseLandingViewArgs> {
  CourseLandingViewRoute({
    _i12.Key? key,
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

  final _i12.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseLandingViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i5.CourseDetailsView]
class CourseDetailsViewRoute extends _i11.PageRouteInfo<CourseDetailsViewArgs> {
  CourseDetailsViewRoute({
    _i12.Key? key,
    required String courseId,
    List<_i11.PageRouteInfo>? children,
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

  final _i12.Key? key;

  final String courseId;

  @override
  String toString() {
    return 'CourseDetailsViewArgs{key: $key, courseId: $courseId}';
  }
}

/// generated route for
/// [_i6.UserProfileView]
class UserProfileViewRoute extends _i11.PageRouteInfo<void> {
  const UserProfileViewRoute()
      : super(
          UserProfileViewRoute.name,
          path: 'profile',
        );

  static const String name = 'UserProfileView';
}

/// generated route for
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
  CourseChapterViewRoute({
    _i12.Key? key,
    required String chapterId,
    _i13.Chapter? chapter,
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

  final _i12.Key? key;

  final String chapterId;

  final _i13.Chapter? chapter;

  @override
  String toString() {
    return 'CourseChapterViewArgs{key: $key, chapterId: $chapterId, chapter: $chapter}';
  }
}

extension RouterStateExtension on _i9.RouterService {
  Future<dynamic> navigateToMainLayoutView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUnknownView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToHomeView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      HomeViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCourseLandingView({
    _i12.Key? key,
    required String courseId,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CourseLandingViewRoute(
        key: key,
        courseId: courseId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCourseDetailsView({
    _i12.Key? key,
    required String courseId,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      CourseDetailsViewRoute(
        key: key,
        courseId: courseId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToUserProfileView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return navigateTo(
      const UserProfileViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToPaymentCaptureView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return navigateTo(
      PaymentCaptureViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> navigateToCourseChapterView({
    _i12.Key? key,
    required String chapterId,
    _i13.Chapter? chapter,
    void Function(_i11.NavigationFailure)? onFailure,
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
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const MainLayoutViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUnknownView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UnknownViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithHomeView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      HomeViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCourseLandingView({
    _i12.Key? key,
    required String courseId,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CourseLandingViewRoute(
        key: key,
        courseId: courseId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCourseDetailsView({
    _i12.Key? key,
    required String courseId,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      CourseDetailsViewRoute(
        key: key,
        courseId: courseId,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithUserProfileView(
      {void Function(_i11.NavigationFailure)? onFailure}) async {
    return replaceWith(
      const UserProfileViewRoute(),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithPaymentCaptureView({
    _i12.Key? key,
    void Function(_i11.NavigationFailure)? onFailure,
  }) async {
    return replaceWith(
      PaymentCaptureViewRoute(
        key: key,
      ),
      onFailure: onFailure,
    );
  }

  Future<dynamic> replaceWithCourseChapterView({
    _i12.Key? key,
    required String chapterId,
    _i13.Chapter? chapter,
    void Function(_i11.NavigationFailure)? onFailure,
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
