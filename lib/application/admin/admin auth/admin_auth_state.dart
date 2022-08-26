import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:tourist_booking/domain/admin/auth/admin_user_model.dart';
import 'package:tourist_booking/domain/admin/user/user_list_model.dart';

class AdminAuthState extends Equatable {
  final CleanFailure failure;
  final bool loading;
  final AdminUserModel user;
  final List<UserListModel> userList;
  final List<UserListModel> allUserList;
  const AdminAuthState(
      {required this.failure,
      required this.loading,
      required this.user,
      required this.userList,
      required this.allUserList});

  AdminAuthState copyWith({
    CleanFailure? failure,
    bool? loading,
    AdminUserModel? user,
    List<UserListModel>? userList,
    List<UserListModel>? allUserList,
  }) {
    return AdminAuthState(
        failure: failure ?? this.failure,
        loading: loading ?? this.loading,
        user: user ?? this.user,
        userList: userList ?? this.userList,
        allUserList: allUserList ?? this.allUserList);
  }

  factory AdminAuthState.init() => AdminAuthState(
      failure: CleanFailure.none(),
      loading: false,
      user: AdminUserModel.empty(),
      allUserList: const [],
      userList: const []);

  @override
  List<Object> get props => [failure, loading, user, userList, allUserList];
}
