import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdminUserModel extends Equatable {
  final String id;
  final bool hasAccess;
  final String name;
  final String email;
  final String username;
  final String role;
  const AdminUserModel({
    required this.id,
    required this.hasAccess,
    required this.name,
    required this.email,
    required this.username,
    required this.role,
  });

  AdminUserModel copyWith({
    String? id,
    bool? hasAccess,
    String? name,
    String? email,
    String? username,
    String? role,
  }) {
    return AdminUserModel(
      id: id ?? this.id,
      hasAccess: hasAccess ?? this.hasAccess,
      name: name ?? this.name,
      email: email ?? this.email,
      username: username ?? this.username,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hasAccess': hasAccess,
      'name': name,
      'email': email,
      'username': username,
      'role': role,
    };
  }

  factory AdminUserModel.empty() => const AdminUserModel(
      id: '', hasAccess: false, name: '', email: '', username: '', role: '');
  factory AdminUserModel.fromMap(Map<String, dynamic> map) {
    return AdminUserModel(
      id: map['_id'] ?? '',
      hasAccess: map['hasAccess'] ?? false,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminUserModel.fromJson(String source) =>
      AdminUserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminUserModel(id: $id, hasAccess: $hasAccess, name: $name, email: $email, username: $username, role: $role)';
  }

  @override
  List<Object> get props {
    return [
      id,
      hasAccess,
      name,
      email,
      username,
      role,
    ];
  }
}
