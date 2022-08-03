import 'package:clean_api/clean_api.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_booking/domain/admin/auth/admin_user_model.dart';
import 'package:tourist_booking/domain/admin/auth/i_admin_auth_repo.dart';
import 'package:tourist_booking/domain/admin/user/admin_register_model.dart';

import '../../../domain/auth/user_model.dart';

class AdminAuthRepo extends IAdminAuthRepo {
  final cleanApi = CleanApi.instance;

  @override
  Future<Either<CleanFailure, List<UserListModel>>> adminLogIn(
      {required String username, required String password}) async {
    final response = await cleanApi.put(
        fromData: (json) {
          Logger.i(json);
          try {
            return json!['token'] as String;
          } catch (e) {
            if (json!['errors'] != null &&
                (json['errors'] as List).isNotEmpty) {
              final error = (json['errors'] as List).first;
              throw error['message'];
            } else {
              rethrow;
            }
          }
        },
        body: {"username": username, "password": password},
        endPoint: 'admin/login');
    return await response.fold((l) => left(l), (r) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', r);
      cleanApi.setToken({"Authorization": "Bearer $r"});
      return await getUserData();
    });
  }

  @override
  Future<Either<CleanFailure, AdminUserModel>> getAdminUserInfo() async {
    return await cleanApi.get(
        fromData: (json) {
          return AdminUserModel.fromMap(json['data']);
        },
        showLogs: true,
        endPoint: 'admin/get-logged-in-admin-info');
  }

  @override
  Future<Either<CleanFailure, List<UserListModel>>> getUserData() async {
    return await cleanApi.get(
        fromData: ((json) => List<UserListModel>.from(
            json['data'].map((e) => UserListModel.fromMap(e)))),
        showLogs: true,
        endPoint: 'user/get-all-users');
  }
}
