import 'dart:convert';

import 'package:clean_api/clean_api.dart';
import 'package:equatable/equatable.dart';

import 'package:tourist_booking/domain/admin/edit/edit_user_Model.dart';

class EditState extends Equatable {
  final CleanFailure failure;
  final bool loading;
  final EditUserModel user;
  const EditState({
    required this.failure,
    required this.loading,
    required this.user,
  });

  EditState copyWith({
    CleanFailure? failure,
    bool? loading,
    EditUserModel? user,
  }) {
    return EditState(
      failure: failure ?? this.failure,
      loading: loading ?? this.loading,
      user: user ?? this.user,
    );
  }

  factory EditState.init() => EditState(
      failure: CleanFailure.none(), loading: false, user: EditUserModel.init());

  @override
  String toString() =>
      'EditState(failure: $failure, loading: $loading, user: $user)';

  @override
  List<Object> get props => [failure, loading, user];
}
