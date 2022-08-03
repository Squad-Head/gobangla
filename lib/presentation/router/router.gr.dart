// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../admin/auth/admin_login_page.dart' as _i3;
import '../admin/dashboard/admin_panel.dart' as _i4;
import '../user/auth/landing_page.dart' as _i1;
import '../user/auth/registration/registration_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    RegistrationRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationScreen());
    },
    AdminLoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AdminLoginPage());
    },
    AdminPanelRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AdminPanelPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LandingRoute.name, path: '/'),
        _i5.RouteConfig(RegistrationRoute.name, path: '/registration-screen'),
        _i5.RouteConfig(AdminLoginRoute.name, path: 'admin-login'),
        _i5.RouteConfig(AdminPanelRoute.name, path: 'admin-dashboard')
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i5.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationRoute extends _i5.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(RegistrationRoute.name, path: '/registration-screen');

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i3.AdminLoginPage]
class AdminLoginRoute extends _i5.PageRouteInfo<void> {
  const AdminLoginRoute() : super(AdminLoginRoute.name, path: 'admin-login');

  static const String name = 'AdminLoginRoute';
}

/// generated route for
/// [_i4.AdminPanelPage]
class AdminPanelRoute extends _i5.PageRouteInfo<void> {
  const AdminPanelRoute()
      : super(AdminPanelRoute.name, path: 'admin-dashboard');

  static const String name = 'AdminPanelRoute';
}
