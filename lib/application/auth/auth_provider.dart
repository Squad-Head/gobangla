import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/auth/auth_state.dart';
import 'package:tourist_booking/domain/auth/i_auth_repo.dart';
import 'package:tourist_booking/domain/auth/registration_model.dart';
import 'package:tourist_booking/infrastucture/auth/auth_repo.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(AuthRepo());
});

class AuthNotifier extends StateNotifier<AuthState> {
  final IAuthRepo authRepo;
  AuthNotifier(this.authRepo) : super(AuthState.init());

  registration(RegistrationModel registrationModel) async {
    state = state.copyWith(loading: true);
    final data = await authRepo.registration(registrationModel);
    Logger.i(data);
    state = data.fold((l) => state.copyWith(loading: false, failure: l),
        (r) => state.copyWith(loading: false, user: r));
  }

  login({required String phoneNo, required String password}) async {
    state = state.copyWith(loading: true);
    final data = await authRepo.logIn(phoneNo: phoneNo, password: password);
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
          loading: false,
          user: r,
          failure: CleanFailure.none(),
          loggedIn: true),
    );
    Logger.i(data);
  }
}
