import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdminAuth extends Equatable {
  final String username;
  final String password;
  const AdminAuth({
    required this.username,
    required this.password,
  });

  AdminAuth copyWith({
    String? username,
    String? password,
  }) {
    return AdminAuth(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'password': password,
    };
  }

  factory AdminAuth.fromMap(Map<String, dynamic> map) {
    return AdminAuth(
      username: map['username'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AdminAuth.fromJson(String source) =>
      AdminAuth.fromMap(json.decode(source));

  @override
  String toString() => 'AdminAuth(username: $username, password: $password)';

  @override
  List<Object> get props => [username, password];
}
