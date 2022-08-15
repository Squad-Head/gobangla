import 'package:clean_api/clean_api.dart';

import 'package:tourist_booking/domain/admin/auth/admin_user_model.dart';
import 'package:tourist_booking/domain/admin/user/user_list_model.dart';

abstract class IAdminAuthRepo {
  Future<Either<CleanFailure, AdminUserModel>> adminLogIn(
      {required String username, required String password});
  Future<Either<CleanFailure, AdminUserModel>> getAdminUserInfo();
  Future<Either<CleanFailure, List<UserListModel>>> getUserData();
  Future<Either<CleanFailure, AdminUserModel>> tryLogin();
  Future logout();

  Future<Option<CleanFailure>> deleteUser(String userId);
}
