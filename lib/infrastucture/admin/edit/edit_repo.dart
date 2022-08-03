import 'package:clean_api/clean_api.dart';
import 'package:tourist_booking/domain/admin/edit/edit_user_Model.dart';
import 'package:tourist_booking/domain/admin/edit/i_edit_repo.dart';

import '../../../domain/auth/user_model.dart';

class EditRepo extends IEditRepo {
  final cleanApi = CleanApi.instance;
  @override
  Future<Either<CleanFailure, EditUserModel>> getUserInfo() async {
    return await cleanApi.get(
        fromData: (json) {
          return EditUserModel.fromMap(json['data']);
        },
        showLogs: true,
        endPoint: 'user/get-loggedin-user-info');
  }

  @override
  Future<Either<CleanFailure, Unit>> editFullName(
      {required String name}) async {
    return await cleanApi.post(
        fromData: (json) => unit,
        body: {"fullName": name},
        endPoint: 'user/edit-user-by-user-id');

    //return await getUserInfo();
  }

  //   @override
  // Future<Either<CleanFailure, UserModel>> registration(
  //     RegistrationModel registrationModel) async {
  //   //Logger.i(registrationModel.toMap());
  //   final prefs = await SharedPreferences.getInstance();
  //   final userData = await cleanApi.post(
  //       showLogs: true,
  //       fromData: (json) {
  //         Logger.i(json);
  //         try {
  //           final token = json['token'] as String;
  //           prefs.setString('token', token);
  //           cleanApi.setToken({"Authorization": "Bearer $token"});
  //           return UserModel.fromMap(json['data']);
  //         } catch (e) {
  //           if (json['errors'] != null && (json['errors'] as List).isNotEmpty) {
  //             final error = (json['errors'] as List).first;
  //             throw error['message'];
  //           } else {
  //             rethrow;
  //           }
  //         }
  //       },
  //       body: registrationModel.toMap(),
  //       endPoint: 'user/registration');
  //   Logger.i(userData);
  //   return userData;
  // }

}
