import 'package:clean_api/clean_api.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_booking/domain/admin/auth/admin_user_model.dart';
import 'package:tourist_booking/domain/admin/auth/i_admin_auth_repo.dart';
import 'package:tourist_booking/domain/admin/user/admin_register_model.dart';

class AdminAuthRepo extends IAdminAuthRepo {
  final cleanApi = CleanApi.instance;

  @override
  Future<Either<CleanFailure, AdminUserModel>> adminLogIn(
      {required String username, required String password}) async {
    final response = await cleanApi.put(
        withToken: false,
        showLogs: true,
        fromData: (data) {
          final json = data!;
          try {
            return json['token'] as String;
          } catch (e) {
            if (json['success'] == false) {
              final error = json['message'];
              throw error;
            } else {
              rethrow;
            }
          }
        },
        body: {"username": username, "password": password},
        endPoint: 'admin/login');
    return await response.fold((l) => left(l), (r) async {
      Logger.i("hoho $r");
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('admin-token', r);
      cleanApi.setToken({"Authorization": "Bearer $r"});
      return await getAdminUserInfo();
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

  @override
  Future<Either<CleanFailure, AdminUserModel>> tryLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final r = prefs.getString('admin-token');
      cleanApi.setToken({"Authorization": "Bearer $r"});
      return await getAdminUserInfo();
    } catch (e) {
      return left(
          CleanFailure(tag: 'Initial login check', error: e.toString()));
    }
  }
}
