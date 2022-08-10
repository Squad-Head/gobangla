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
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../domain/admin/user/user_list_model.dart' as _i10;
import '../admin/auth/admin_login_page.dart' as _i3;
import '../admin/dashboard/add_member_screen.dart' as _i5;
import '../admin/dashboard/admin_panel.dart' as _i4;
import '../personal_details.dart' as _i6;
import '../user/auth/landing_page.dart' as _i1;
import '../user/auth/registration/registration_screen.dart' as _i2;
import '../user_details_screen.dart' as _i7;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    RegistrationRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationScreen());
    },
    AdminLoginRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AdminLoginPage());
    },
    AdminPanelRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.AdminPanelPage());
    },
    AddMemberRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.AddMemberScreen());
    },
    PersonalDetailsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PersonalDetailsScreen());
    },
    UserDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailsRouteArgs>();
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.UserDetailsScreen(key: args.key, user: args.user));
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(LandingRoute.name, path: '/'),
        _i8.RouteConfig(RegistrationRoute.name, path: '/registration-screen'),
        _i8.RouteConfig(AdminLoginRoute.name, path: 'admin-login'),
        _i8.RouteConfig(AdminPanelRoute.name, path: 'admin-dashboard'),
        _i8.RouteConfig(AddMemberRoute.name, path: 'add-member'),
        _i8.RouteConfig(PersonalDetailsRoute.name,
            path: '/personal-details-screen'),
        _i8.RouteConfig(UserDetailsRoute.name, path: '/user-details-screen')
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i8.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationRoute extends _i8.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(RegistrationRoute.name, path: '/registration-screen');

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i3.AdminLoginPage]
class AdminLoginRoute extends _i8.PageRouteInfo<void> {
  const AdminLoginRoute() : super(AdminLoginRoute.name, path: 'admin-login');

  static const String name = 'AdminLoginRoute';
}

/// generated route for
/// [_i4.AdminPanelPage]
class AdminPanelRoute extends _i8.PageRouteInfo<void> {
  const AdminPanelRoute()
      : super(AdminPanelRoute.name, path: 'admin-dashboard');

  static const String name = 'AdminPanelRoute';
}

/// generated route for
/// [_i5.AddMemberScreen]
class AddMemberRoute extends _i8.PageRouteInfo<void> {
  const AddMemberRoute() : super(AddMemberRoute.name, path: 'add-member');

  static const String name = 'AddMemberRoute';
}

/// generated route for
/// [_i6.PersonalDetailsScreen]
class PersonalDetailsRoute extends _i8.PageRouteInfo<void> {
  const PersonalDetailsRoute()
      : super(PersonalDetailsRoute.name, path: '/personal-details-screen');

  static const String name = 'PersonalDetailsRoute';
}

/// generated route for
/// [_i7.UserDetailsScreen]
class UserDetailsRoute extends _i8.PageRouteInfo<UserDetailsRouteArgs> {
  UserDetailsRoute({_i9.Key? key, required _i10.UserListModel user})
      : super(UserDetailsRoute.name,
            path: '/user-details-screen',
            args: UserDetailsRouteArgs(key: key, user: user));

  static const String name = 'UserDetailsRoute';
}

class UserDetailsRouteArgs {
  const UserDetailsRouteArgs({this.key, required this.user});

  final _i9.Key? key;

  final _i10.UserListModel user;

  @override
  String toString() {
    return 'UserDetailsRouteArgs{key: $key, user: $user}';
  }
}
