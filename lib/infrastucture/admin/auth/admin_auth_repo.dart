import 'package:clean_api/clean_api.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_booking/domain/admin/auth/admin_user_model.dart';
import 'package:tourist_booking/domain/admin/auth/i_admin_auth_repo.dart';
import 'package:tourist_booking/domain/admin/user/user_list_model.dart';
import 'package:tourist_booking/domain/auth/registration_model.dart';
import 'package:tourist_booking/domain/auth/update_user_model.dart';
import 'package:tourist_booking/domain/auth/update_user_model_with_id.dart';

class AdminRepo extends IAdminRepo {
  final cleanApi = CleanApi.instance;

  @override
  Future<Either<CleanFailure, AdminUserModel>> adminLogIn(
      {required String username, required String password}) async {
    final response = await cleanApi.put(
        withToken: false,
        showLogs: true,
        fromData: (data) {
          final json = data;
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
      Logger.i('token $r');
      cleanApi.setToken({"Authorization": "Bearer $r"});
      return await getAdminUserInfo();
    } catch (e) {
      return left(
          CleanFailure(tag: 'Initial login check', error: e.toString()));
    }
  }

  @override
  Future<Option<CleanFailure>> deleteUser(String userId) async {
    final data = await cleanApi.delete(
        fromData: (json) => unit,
        endPoint: 'user/delete-user-by-admin?params=$userId');

    return data.fold((l) => some(l), (r) => none());
  }

  @override
  Future logout() async {
    cleanApi.setToken({'Authorization': ''});
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Future<Option<CleanFailure>> addMember(RegistrationModel body) async {
    final data = await cleanApi.post(
        showLogs: true,
        fromData: (json) => json,
        body: body.toMap(),
        endPoint: 'user/add-new-user-by-admin');

    return data.fold((l) => some(l), (r) => none());
  }

  @override
  Future<Either<CleanFailure, Unit>> update(
      UpdateUserModelWithId updateUserModel) async {
    final data = await cleanApi.post(
        fromData: (json) => json,
        showLogs: true,
        body: updateUserModel.toMap(),
        endPoint: 'user/edit-user-by-user-id');

    return data.fold((l) => left(l), (r) => right(unit));
  }

  @override
  Future<void> uploadImage(XFile image, String userId) async {
    try {
      final uri = Uri.parse(
          'https://beach-data.up.railway.app/api/user/upload-user-image-by-admin?params=$userId');
      Logger.i(
          'https://beach-data.up.railway.app/api/user/upload-user-image-by-admin?params=$userId');

      var request = MultipartRequest('POST', uri);
      final bytes = await image.readAsBytes();
      final httpImage =
          MultipartFile.fromBytes('image', bytes, filename: image.name);
      final headers = await cleanApi.header(true);
      request.headers.addAll(headers);
      request.headers.addAll({"Content-Type": image.mimeType!});
      Logger.i(request.headers);
      request.files.add(httpImage);
      final response = await request.send();
      Logger.i(response.statusCode);
      final respStr = await response.stream.bytesToString();
      Logger.i(respStr);
    } catch (e) {
      Logger.e(e);
    }
  }
}
