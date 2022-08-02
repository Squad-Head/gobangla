import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserListModel extends Equatable {
  final bool hasAccess;
  final String fullName;
  final String password;
  final String nidNo;
  final String phoneNo;
  final String fathersName;
  final String mothersName;
  final String permanentAddress;
  final String presentAddress;
  final String recomandationGiverName;
  final String recomandationGiverAddress;
  final String recomandationGiverMobileNo;
  final String beachManagementCommiteeId;
  final String touristCommiteeId;
  final String validityDate;
  final String service;
  final String details;
  final String avater;
  final String cloudinaryId;
  const UserListModel({
    required this.hasAccess,
    required this.fullName,
    required this.password,
    required this.nidNo,
    required this.phoneNo,
    required this.fathersName,
    required this.mothersName,
    required this.permanentAddress,
    required this.presentAddress,
    required this.recomandationGiverName,
    required this.recomandationGiverAddress,
    required this.recomandationGiverMobileNo,
    required this.beachManagementCommiteeId,
    required this.touristCommiteeId,
    required this.validityDate,
    required this.service,
    required this.details,
    required this.avater,
    required this.cloudinaryId,
  });

  UserListModel copyWith({
    bool? hasAccess,
    String? fullName,
    String? password,
    String? nidNo,
    String? phoneNo,
    String? fathersName,
    String? mothersName,
    String? permanentAddress,
    String? presentAddress,
    String? recomandationGiverName,
    String? recomandationGiverAddress,
    String? recomandationGiverMobileNo,
    String? beachManagementCommiteeId,
    String? touristCommiteeId,
    String? validityDate,
    String? service,
    String? details,
    String? avater,
    String? cloudinaryId,
  }) {
    return UserListModel(
      hasAccess: hasAccess ?? this.hasAccess,
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      nidNo: nidNo ?? this.nidNo,
      phoneNo: phoneNo ?? this.phoneNo,
      fathersName: fathersName ?? this.fathersName,
      mothersName: mothersName ?? this.mothersName,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      presentAddress: presentAddress ?? this.presentAddress,
      recomandationGiverName:
          recomandationGiverName ?? this.recomandationGiverName,
      recomandationGiverAddress:
          recomandationGiverAddress ?? this.recomandationGiverAddress,
      recomandationGiverMobileNo:
          recomandationGiverMobileNo ?? this.recomandationGiverMobileNo,
      beachManagementCommiteeId:
          beachManagementCommiteeId ?? this.beachManagementCommiteeId,
      touristCommiteeId: touristCommiteeId ?? this.touristCommiteeId,
      validityDate: validityDate ?? this.validityDate,
      service: service ?? this.service,
      details: details ?? this.details,
      avater: avater ?? this.avater,
      cloudinaryId: cloudinaryId ?? this.cloudinaryId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'hasAccess': hasAccess,
      'fullName': fullName,
      'password': password,
      'nidNo': nidNo,
      'phoneNo': phoneNo,
      'fathersName': fathersName,
      'mothersName': mothersName,
      'permanentAddress': permanentAddress,
      'presentAddress': presentAddress,
      'recomandationGiverName': recomandationGiverName,
      'recomandationGiverAddress': recomandationGiverAddress,
      'recomandationGiverMobileNo': recomandationGiverMobileNo,
      'beachManagementCommiteeId': beachManagementCommiteeId,
      'touristCommiteeId': touristCommiteeId,
      'validityDate': validityDate,
      'service': service,
      'details': details,
      'avater': avater,
      'cloudinaryId': cloudinaryId,
    };
  }

  factory UserListModel.init() => const UserListModel(
      hasAccess: false,
      fullName: '',
      password: '',
      nidNo: '',
      phoneNo: '',
      fathersName: '',
      mothersName: '',
      permanentAddress: '',
      presentAddress: '',
      recomandationGiverName: '',
      recomandationGiverAddress: '',
      recomandationGiverMobileNo: '',
      beachManagementCommiteeId: '',
      touristCommiteeId: '',
      validityDate: '',
      service: '',
      details: '',
      avater: '',
      cloudinaryId: '');

  factory UserListModel.fromMap(Map<String, dynamic> map) {
    return UserListModel(
      hasAccess: map['hasAccess'] ?? false,
      fullName: map['fullName'] ?? '',
      password: map['password'] ?? '',
      nidNo: map['nidNo'] ?? '',
      phoneNo: map['phoneNo'] ?? '',
      fathersName: map['fathersName'] ?? '',
      mothersName: map['mothersName'] ?? '',
      permanentAddress: map['permanentAddress'] ?? '',
      presentAddress: map['presentAddress'] ?? '',
      recomandationGiverName: map['recomandationGiverName'] ?? '',
      recomandationGiverAddress: map['recomandationGiverAddress'] ?? '',
      recomandationGiverMobileNo: map['recomandationGiverMobileNo'] ?? '',
      beachManagementCommiteeId: map['beachManagementCommiteeId'] ?? '',
      touristCommiteeId: map['touristCommiteeId'] ?? '',
      validityDate: map['validityDate'] ?? '',
      service: map['service'] ?? '',
      details: map['details'] ?? '',
      avater: map['avater'] ?? '',
      cloudinaryId: map['cloudinaryId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserListModel.fromJson(String source) =>
      UserListModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AdminRegisterModel(hasAccess: $hasAccess, fullName: $fullName, password: $password, nidNo: $nidNo, phoneNo: $phoneNo, fathersName: $fathersName, mothersName: $mothersName, permanentAddress: $permanentAddress, presentAddress: $presentAddress, recomandationGiverName: $recomandationGiverName, recomandationGiverAddress: $recomandationGiverAddress, recomandationGiverMobileNo: $recomandationGiverMobileNo, beachManagementCommiteeId: $beachManagementCommiteeId, touristCommiteeId: $touristCommiteeId, validityDate: $validityDate, service: $service, details: $details, avater: $avater, cloudinaryId: $cloudinaryId)';
  }

  @override
  List<Object> get props {
    return [
      hasAccess,
      fullName,
      password,
      nidNo,
      phoneNo,
      fathersName,
      mothersName,
      permanentAddress,
      presentAddress,
      recomandationGiverName,
      recomandationGiverAddress,
      recomandationGiverMobileNo,
      beachManagementCommiteeId,
      touristCommiteeId,
      validityDate,
      service,
      details,
      avater,
      cloudinaryId,
    ];
  }
}
