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
import 'package:flutter/material.dart' as _i6;
import 'package:stacked/stacked.dart' as _i5;
import 'package:stacked_services/stacked_services.dart' as _i1;

import '../ui/views/course_details/course_details_view.dart' as _i4;
import '../ui/views/home/home_view.dart' as _i3;
import '../ui/views/startup/startup_view.dart' as _i2;

final stackedRouter = StackedRouterWeb(_i1.StackedService.navigatorKey);

class StackedRouterWeb extends _i5.RootStackRouter {
  StackedRouterWeb([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    StartupViewRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.StartupView(),
        maintainState: false,
      );
    },
    HomeViewRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeViewArgs>(orElse: () => const HomeViewArgs());
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomeView(key: args.key),
        maintainState: false,
      );
    },
    CourseDetailsViewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<CourseDetailsViewArgs>(
          orElse: () => CourseDetailsViewArgs(
                id: pathParams.getString('id'),
                chapterId: pathParams.optString('chapterId'),
              ));
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.CourseDetailsView(
          key: args.key,
          id: args.id,
          chapterId: args.chapterId,
        ),
        maintainState: false,
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          StartupViewRoute.name,
          path: '/startup-view',
        ),
        _i5.RouteConfig(
          HomeViewRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          CourseDetailsViewRoute.name,
          path: 'course/:id/:chapterId',
        ),
      ];
}

/// generated route for
/// [_i2.StartupView]
class StartupViewRoute extends _i5.PageRouteInfo<void> {
  const StartupViewRoute()
      : super(
          StartupViewRoute.name,
          path: '/startup-view',
        );

  static const String name = 'StartupView';
}

/// generated route for
/// [_i3.HomeView]
class HomeViewRoute extends _i5.PageRouteInfo<HomeViewArgs> {
  HomeViewRoute({_i6.Key? key})
      : super(
          HomeViewRoute.name,
          path: '/',
          args: HomeViewArgs(key: key),
        );

  static const String name = 'HomeView';
}

class HomeViewArgs {
  const HomeViewArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'HomeViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.CourseDetailsView]
class CourseDetailsViewRoute extends _i5.PageRouteInfo<CourseDetailsViewArgs> {
  CourseDetailsViewRoute({
    _i6.Key? key,
    required String id,
    String? chapterId,
  }) : super(
          CourseDetailsViewRoute.name,
          path: 'course/:id/:chapterId',
          args: CourseDetailsViewArgs(
            key: key,
            id: id,
            chapterId: chapterId,
          ),
          rawPathParams: {
            'id': id,
            'chapterId': chapterId,
          },
        );

  static const String name = 'CourseDetailsView';
}

class CourseDetailsViewArgs {
  const CourseDetailsViewArgs({
    this.key,
    required this.id,
    this.chapterId,
  });

  final _i6.Key? key;

  final String id;

  final String? chapterId;

  @override
  String toString() {
    return 'CourseDetailsViewArgs{key: $key, id: $id, chapterId: $chapterId}';
  }
}
