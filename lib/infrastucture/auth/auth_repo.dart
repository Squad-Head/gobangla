import 'package:clean_api/clean_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_booking/domain/auth/i_auth_repo.dart';
import 'package:tourist_booking/domain/auth/registration_model.dart';
import 'package:tourist_booking/domain/auth/user_model.dart';

class AuthRepo extends IAuthRepo {
  final cleanApi = CleanApi.instance;

  @override
  Future<Either<CleanFailure, UserModel>> registration(
      RegistrationModel registrationModel) async {
    //Logger.i(registrationModel.toMap());
    final prefs = await SharedPreferences.getInstance();
    final userData = await cleanApi.post(
        showLogs: true,
        fromData: (json) {
          Logger.i(json);
          try {
            final token = json['token'] as String;
            prefs.setString('token', token);
            cleanApi.setToken({"Authorization": "Bearer $token"});
            return UserModel.fromMap(json['data']);
          } catch (e) {
            if (json['errors'] != null && (json['errors'] as List).isNotEmpty) {
              final error = (json['errors'] as List).first;
              throw error['message'];
            } else {
              rethrow;
            }
          }
        },
        body: registrationModel.toMap(),
        endPoint: 'user/registration');
    Logger.i(userData);
    return userData;
  }

  @override
  Future<Either<CleanFailure, UserModel>> logIn(
      {required String phoneNo, required String password}) async {
    final response = await cleanApi.post(
        fromData: (json) {
          Logger.i(json);
          try {
            return json['token'] as String;
          } catch (e) {
            if (json['errors'] != null && (json['errors'] as List).isNotEmpty) {
              final error = (json['errors'] as List).first;
              throw error['message'];
            } else {
              rethrow;
            }
          }
        },
        body: {"phoneNo": phoneNo, "password": password},
        endPoint: 'user/login');
    return await response.fold((l) => left(l), (r) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', r);
      cleanApi.setToken({"Authorization": "Bearer $r"});
      return await getUserInfo();
    });
  }

  getUserInfo() async {
    return cleanApi.get(
        fromData: (json) {
          return UserModel.fromMap(json['data']);
        },
        endPoint: 'user/get-loggedin-user-info');
  }
}
