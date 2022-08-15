import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:tourist_booking/domain/admin/auth/admin_user_model.dart';
import 'package:tourist_booking/domain/admin/user/user_list_model.dart';

class AdminAuthState extends Equatable {
  final CleanFailure failure;
  final bool loading;
  final AdminUserModel user;
  final List<UserListModel> userList;
  const AdminAuthState({
    required this.failure,
    required this.loading,
    required this.user,
    required this.userList,
  });

  AdminAuthState copyWith({
    CleanFailure? failure,
    bool? loading,
    AdminUserModel? user,
    List<UserListModel>? userList,
  }) {
    return AdminAuthState(
      failure: failure ?? this.failure,
      loading: loading ?? this.loading,
      user: user ?? this.user,
      userList: userList ?? this.userList,
    );
  }

  factory AdminAuthState.init() => AdminAuthState(
      failure: CleanFailure.none(),
      loading: false,
      user: AdminUserModel.empty(),
      userList: const []);

  @override
  List<Object> get props => [failure, loading, user, userList];
}
