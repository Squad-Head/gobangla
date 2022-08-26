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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../domain/admin/user/user_list_model.dart' as _i12;
import '../admin/auth/admin_login_page.dart' as _i3;
import '../admin/dashboard/add_member_screen.dart' as _i7;
import '../admin/dashboard/admin_panel.dart' as _i6;
import '../personal_details.dart' as _i8;
import '../personal_details_edit_admin_page.dart' as _i5;
import '../personal_details_edit_page.dart' as _i4;
import '../user/auth/landing_page.dart' as _i1;
import '../user/auth/registration/registration_screen.dart' as _i2;
import '../user_details_screen.dart' as _i9;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    LandingRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LandingPage());
    },
    RegistrationRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegistrationScreen());
    },
    AdminLoginRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.AdminLoginPage());
    },
    PersonalDetailsEditRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.PersonalDetailsEditScreen());
    },
    PersonalDetailsEditAdminRoute.name: (routeData) {
      final args = routeData.argsAs<PersonalDetailsEditAdminRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.PersonalDetailsEditAdminScreen(
              key: args.key, user: args.user));
    },
    AdminPanelRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.AdminPanelPage());
    },
    AddMemberRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.AddMemberScreen());
    },
    PersonalDetailsRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.PersonalDetailsScreen());
    },
    UserDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<UserDetailsRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i9.UserDetailsScreen(key: args.key, user: args.user));
    }
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(LandingRoute.name, path: '/'),
        _i10.RouteConfig(RegistrationRoute.name, path: '/registration-screen'),
        _i10.RouteConfig(AdminLoginRoute.name, path: 'admin-login'),
        _i10.RouteConfig(PersonalDetailsEditRoute.name,
            path: 'edit-personal-details'),
        _i10.RouteConfig(PersonalDetailsEditAdminRoute.name,
            path: 'edit-personal-details-admina'),
        _i10.RouteConfig(AdminPanelRoute.name, path: 'admin-dashboard'),
        _i10.RouteConfig(AddMemberRoute.name, path: 'add-member'),
        _i10.RouteConfig(PersonalDetailsRoute.name,
            path: '/personal-details-screen'),
        _i10.RouteConfig(UserDetailsRoute.name, path: '/user-details-screen')
      ];
}

/// generated route for
/// [_i1.LandingPage]
class LandingRoute extends _i10.PageRouteInfo<void> {
  const LandingRoute() : super(LandingRoute.name, path: '/');

  static const String name = 'LandingRoute';
}

/// generated route for
/// [_i2.RegistrationScreen]
class RegistrationRoute extends _i10.PageRouteInfo<void> {
  const RegistrationRoute()
      : super(RegistrationRoute.name, path: '/registration-screen');

  static const String name = 'RegistrationRoute';
}

/// generated route for
/// [_i3.AdminLoginPage]
class AdminLoginRoute extends _i10.PageRouteInfo<void> {
  const AdminLoginRoute() : super(AdminLoginRoute.name, path: 'admin-login');

  static const String name = 'AdminLoginRoute';
}

/// generated route for
/// [_i4.PersonalDetailsEditScreen]
class PersonalDetailsEditRoute extends _i10.PageRouteInfo<void> {
  const PersonalDetailsEditRoute()
      : super(PersonalDetailsEditRoute.name, path: 'edit-personal-details');

  static const String name = 'PersonalDetailsEditRoute';
}

/// generated route for
/// [_i5.PersonalDetailsEditAdminScreen]
class PersonalDetailsEditAdminRoute
    extends _i10.PageRouteInfo<PersonalDetailsEditAdminRouteArgs> {
  PersonalDetailsEditAdminRoute(
      {_i11.Key? key, required _i12.UserListModel user})
      : super(PersonalDetailsEditAdminRoute.name,
            path: 'edit-personal-details-admina',
            args: PersonalDetailsEditAdminRouteArgs(key: key, user: user));

  static const String name = 'PersonalDetailsEditAdminRoute';
}

class PersonalDetailsEditAdminRouteArgs {
  const PersonalDetailsEditAdminRouteArgs({this.key, required this.user});

  final _i11.Key? key;

  final _i12.UserListModel user;

  @override
  String toString() {
    return 'PersonalDetailsEditAdminRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i6.AdminPanelPage]
class AdminPanelRoute extends _i10.PageRouteInfo<void> {
  const AdminPanelRoute()
      : super(AdminPanelRoute.name, path: 'admin-dashboard');

  static const String name = 'AdminPanelRoute';
}

/// generated route for
/// [_i7.AddMemberScreen]
class AddMemberRoute extends _i10.PageRouteInfo<void> {
  const AddMemberRoute() : super(AddMemberRoute.name, path: 'add-member');

  static const String name = 'AddMemberRoute';
}

/// generated route for
/// [_i8.PersonalDetailsScreen]
class PersonalDetailsRoute extends _i10.PageRouteInfo<void> {
  const PersonalDetailsRoute()
      : super(PersonalDetailsRoute.name, path: '/personal-details-screen');

  static const String name = 'PersonalDetailsRoute';
}

/// generated route for
/// [_i9.UserDetailsScreen]
class UserDetailsRoute extends _i10.PageRouteInfo<UserDetailsRouteArgs> {
  UserDetailsRoute({_i11.Key? key, required _i12.UserListModel user})
      : super(UserDetailsRoute.name,
            path: '/user-details-screen',
            args: UserDetailsRouteArgs(key: key, user: user));

  static const String name = 'UserDetailsRoute';
}

class UserDetailsRouteArgs {
  const UserDetailsRouteArgs({this.key, required this.user});

  final _i11.Key? key;

  final _i12.UserListModel user;

  @override
  String toString() {
    return 'UserDetailsRouteArgs{key: $key, user: $user}';
  }
}
