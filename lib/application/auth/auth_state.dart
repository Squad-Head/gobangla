// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:tourist_booking/domain/auth/user_model.dart';

class AuthState extends Equatable {
  final CleanFailure failure;
  final bool loading;
  final UserModel user;
  final bool loggedIn;
  const AuthState({
    required this.failure,
    required this.loading,
    required this.user,
    required this.loggedIn,
  });

  @override
  List<Object> get props => [failure, loading, user, loggedIn];

  @override
  bool get stringify => true;

  AuthState copyWith({
    CleanFailure? failure,
    bool? loading,
    UserModel? user,
    bool? loggedIn,
  }) {
    return AuthState(
      failure: failure ?? this.failure,
      loading: loading ?? this.loading,
      user: user ?? this.user,
      loggedIn: loggedIn ?? this.loggedIn,
    );
  }

  factory AuthState.init() => AuthState(
      failure: CleanFailure.none(),
      loading: false,
      user: UserModel.init(),
      loggedIn: false);
}
