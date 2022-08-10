import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/admin/admin%20auth/admin_auth_state.dart';
import 'package:tourist_booking/domain/admin/auth/i_admin_auth_repo.dart';
import 'package:tourist_booking/domain/auth/registration_model.dart';
import 'package:tourist_booking/infrastucture/admin/auth/admin_auth_repo.dart';

final adminAuthProvider =
    StateNotifierProvider<AdminAuthNotifier, AdminAuthState>((ref) {
  return AdminAuthNotifier(AdminRepo());
});

class AdminAuthNotifier extends StateNotifier<AdminAuthState> {
  IAdminRepo repo;
  AdminAuthNotifier(this.repo) : super(AdminAuthState.init());

  adminLogin({required String username, required String password}) async {
    state = state.copyWith(loading: true);
    final data = await repo.adminLogIn(username: username, password: password);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        user: r,
        failure: CleanFailure.none(),
      ),
    );
    Logger.i(data);
  }

  getUserData() async {
    state = state.copyWith(loading: true);
    final data = await repo.getUserData();
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(loading: false, userList: r),
    );
  }

  addMember(RegistrationModel body) async {
    state = state.copyWith(loading: true);
    final data = await repo.addMember(body);
    state = data.match(
      (l) => state.copyWith(loading: false, failure: l),
      () => state.copyWith(
        loading: false,
      ),
    );
    getUserData();
  }

  tryLogin() async {
    state = state.copyWith(loading: true);
    final data = await repo.tryLogin();

    state = data.fold(
        (l) => state.copyWith(
              loading: false,
            ),
        (r) => state.copyWith(
            loading: false, user: r, failure: CleanFailure.none()));
  }

  deleteUser(String userId) async {
    state = state.copyWith(loading: true);
    final data = await repo.deleteUser(userId);
    Logger.i(data);
    data.match((l) {
      state = state.copyWith(
        loading: false,
      );
    }, () {
      getUserData();
    });
  }

  logout() async {
    await repo.logout();

    state = AdminAuthState.init();
  }
}
