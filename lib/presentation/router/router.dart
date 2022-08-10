import 'package:auto_route/auto_route.dart';
import 'package:tourist_booking/presentation/admin/auth/admin_login_page.dart';
import 'package:tourist_booking/presentation/admin/dashboard/add_member_screen.dart';
import 'package:tourist_booking/presentation/admin/dashboard/admin_panel.dart';
import 'package:tourist_booking/presentation/personal_details.dart';
import 'package:tourist_booking/presentation/user/auth/landing_page.dart';
import 'package:tourist_booking/presentation/user/auth/registration/registration_screen.dart';
import 'package:tourist_booking/presentation/user_details_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LandingPage, initial: true),
    AutoRoute(
      page: RegistrationScreen,
    ),
    AutoRoute(
      page: AdminLoginPage,
      path: 'admin-login',
    ),
    AutoRoute(page: AdminPanelPage, path: 'admin-dashboard'),
    AutoRoute(page: AddMemberScreen, path: 'add-member'),
    AutoRoute(
      page: PersonalDetailsScreen,
    ),
    AutoRoute(
      page: UserDetailsScreen,
    ),
  ],
)
class $AppRouter {}
