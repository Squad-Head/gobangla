import 'package:clean_api/clean_api.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tourist_booking/domain/auth/i_auth_repo.dart';
import 'package:tourist_booking/domain/auth/registration_model.dart';
import 'package:tourist_booking/domain/auth/user_model.dart';
import 'package:path/path.dart';

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

  @override
  Future<Either<CleanFailure, UserModel>> tryLogin() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final r = prefs.getString('token');
      cleanApi.setToken({"Authorization": "Bearer $r"});
      return await getUserInfo();
    } catch (e) {
      return left(
          CleanFailure(tag: 'Initial login check', error: e.toString()));
    }
  }

  @override
  Future<Either<CleanFailure, UserModel>> getUserInfo() async {
    return await cleanApi.get(
        fromData: (json) {
          return UserModel.fromMap(json['data']);
        },
        showLogs: true,
        endPoint: 'user/get-loggedin-user-info');
  }

  @override
  Future<void> uploadImage(XFile image, String userId) async {
    try {
      final uri = Uri.parse(
          'https://beach-data.up.railway.app/api/user/upload-user-image?params=$userId');
      Logger.i(
          'https://beach-data.up.railway.app/api/user/upload-user-image?params=$userId');
      // final uri = Uri.https('beach-data.up.railway.app',
      //     '/api/user/upload-user-image', {'params': userId});
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
