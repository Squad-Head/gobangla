// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegistrationModel extends Equatable {
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
  const RegistrationModel({
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
  });

  RegistrationModel copyWith({
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
  }) {
    return RegistrationModel(
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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
    };
  }

  factory RegistrationModel.fromMap(Map<String, dynamic> map) {
    return RegistrationModel(
      hasAccess: map['hasAccess'] as bool,
      fullName: map['fullName'] as String,
      password: map['password'] as String,
      nidNo: map['nidNo'] as String,
      phoneNo: map['phoneNo'] as String,
      fathersName: map['fathersName'] as String,
      mothersName: map['mothersName'] as String,
      permanentAddress: map['permanentAddress'] as String,
      presentAddress: map['presentAddress'] as String,
      recomandationGiverName: map['recomandationGiverName'] as String,
      recomandationGiverAddress: map['recomandationGiverAddress'] as String,
      recomandationGiverMobileNo: map['recomandationGiverMobileNo'] as String,
      beachManagementCommiteeId: map['beachManagementCommiteeId'] as String,
      touristCommiteeId: map['touristCommiteeId'] as String,
      validityDate: map['validityDate'] as String,
      service: map['service'] as String,
      details: map['details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegistrationModel.fromJson(String source) =>
      RegistrationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

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
    ];
  }

  factory RegistrationModel.init() => const RegistrationModel(
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
      details: '');
}
