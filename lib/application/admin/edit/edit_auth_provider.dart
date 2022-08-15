import 'package:clean_api/clean_api.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tourist_booking/application/admin/edit/edit_state.dart';
import 'package:tourist_booking/domain/admin/edit/i_edit_repo.dart';
import 'package:tourist_booking/infrastucture/admin/edit/edit_repo.dart';

final editProvider = StateNotifierProvider<EditNotifier, EditState>((ref) {
  return EditNotifier(EditRepo());
});

class EditNotifier extends StateNotifier<EditState> {
  final IEditRepo authRepo;
  EditNotifier(this.authRepo) : super(EditState.init());

  getUserInfo() async {
    state = state.copyWith(loading: true);
    final data = await authRepo.getUserInfo();
    state = data.fold(
      (l) => state.copyWith(loading: false, failure: l),
      (r) => state.copyWith(
        loading: false,
        user: r,
        failure: CleanFailure.none(),
      ),
    );
  }

  // editFullName(String name) async {
  //   state = state.copyWith(loading: true);
  //   final data = await authRepo.editFullName(name: name);
  //   state = data.fold((l) => state.copyWith(loading: false, failure: l),
  //       (r) => state.copyWith(loading: false, failure: CleanFailure.none()));
  //   getUserInfo();
  // }
}
