import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/admin/admin%20auth/admin_auth_state.dart';
import 'package:tourist_booking/domain/admin/auth/i_admin_auth_repo.dart';
import 'package:tourist_booking/infrastucture/admin/auth/admin_auth_repo.dart';

final adminAuthProvider =
    StateNotifierProvider<AdminAuthNotifier, AdminAuthState>((ref) {
  return AdminAuthNotifier(AdminAuthRepo());
});

class AdminAuthNotifier extends StateNotifier<AdminAuthState> {
  IAdminAuthRepo iAdminAuthRepo;
  AdminAuthNotifier(this.iAdminAuthRepo) : super(AdminAuthState.init());

  adminLogin({required String username, required String password}) async {
    state = state.copyWith(loading: true);
    final data =
        await iAdminAuthRepo.adminLogIn(username: username, password: password);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        userList: r,
        failure: CleanFailure.none(),
      ),
    );
    Logger.i(data);
  }

  getUserData() async {
    state = state.copyWith(loading: true);
    final data = await iAdminAuthRepo.getUserData();
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(loading: false, userList: r),
    );
  }
}
