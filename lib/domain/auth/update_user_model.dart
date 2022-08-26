// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class UpdateUserModel extends Equatable {
  final bool hasAccess;
  final String fullName;
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
  final bool phoneVarified;
  const UpdateUserModel(
      {required this.hasAccess,
      required this.fullName,
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
      required this.phoneVarified});

  UpdateUserModel copyWith(
      {bool? hasAccess,
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
      bool? phoneVarified}) {
    return UpdateUserModel(
      phoneVarified: phoneVarified ?? this.phoneVarified,
      hasAccess: hasAccess ?? this.hasAccess,
      fullName: fullName ?? this.fullName,
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
      'phoneVarified': phoneVarified,
      'hasAccess': hasAccess,
      'fullName': fullName,
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

  factory UpdateUserModel.fromMap(Map<String, dynamic> map) {
    return UpdateUserModel(
      phoneVarified: map['phoneVarified'],
      hasAccess: map['hasAccess'] as bool,
      fullName: map['fullName'] as String,
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

  factory UpdateUserModel.fromJson(String source) =>
      UpdateUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      phoneVarified,
      hasAccess,
      fullName,
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

  factory UpdateUserModel.init() => const UpdateUserModel(
      phoneVarified: false,
      hasAccess: false,
      fullName: '',
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
