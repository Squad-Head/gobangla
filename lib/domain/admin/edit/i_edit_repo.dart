import 'package:clean_api/clean_api.dart';
import 'package:tourist_booking/domain/admin/edit/edit_user_Model.dart';

import '../../auth/user_model.dart';

abstract class IEditRepo {
  Future<Either<CleanFailure, EditUserModel>> getUserInfo();
  Future<Either<CleanFailure, Unit>> editFullName({required String name});
}
