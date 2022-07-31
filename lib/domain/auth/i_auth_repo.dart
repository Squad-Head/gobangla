import 'package:clean_api/clean_api.dart';
import 'package:tourist_booking/domain/auth/registration_model.dart';
import 'package:tourist_booking/domain/auth/user_model.dart';

abstract class IAuthRepo {
  Future<Either<CleanFailure, UserModel>> registration(
      RegistrationModel registrationModel);

  Future<Either<CleanFailure, UserModel>> logIn(
      {required String phoneNo, required String password});

  Future<Either<CleanFailure, UserModel>> tryLogin();
}
