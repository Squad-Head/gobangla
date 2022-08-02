import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdminModel extends Equatable {
  final String id;
  final String roleName;
  final String roleSlug;
  final List access;
  AdminModel({
    required this.id,
    required this.roleName,
    required this.roleSlug,
    required this.access,
  });

  AdminModel copyWith({
    String? id,
    String? roleName,
    String? roleSlug,
    List? access,
  }) {
    return AdminModel(
      id: id ?? this.id,
      roleName: roleName ?? this.roleName,
      roleSlug: roleSlug ?? this.roleSlug,
      access: access ?? this.access,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'roleName': roleName});
    result.addAll({'roleSlug': roleSlug});
    result.addAll({'access': access});

    return result;
  }

  factory AdminModel.fromMap(Map<String, dynamic> map) {
    return AdminModel(
      id: map['id'] ?? '',
      roleName: map['roleName'] ?? '',
      roleSlug: map['roleSlug'] ?? '',
      access: List.from(map['access']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminModel.fromJson(String source) =>
      AdminModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminModel(id: $id, roleName: $roleName, roleSlug: $roleSlug, access: $access)';
  }

  @override
  List<Object> get props => [id, roleName, roleSlug, access];

  factory AdminModel.init() =>
      AdminModel(id: '', roleName: '', roleSlug: '', access: []);
}
