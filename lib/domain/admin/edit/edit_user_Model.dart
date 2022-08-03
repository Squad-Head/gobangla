import 'dart:convert';

import 'package:equatable/equatable.dart';

class EditUserModel extends Equatable {
  final String id;
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
  final String createdAt;
  final String updatedAt;
  EditUserModel({
    required this.id,
    required this.hasAccess,
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
    required this.createdAt,
    required this.updatedAt,
  });

  EditUserModel copyWith({
    String? id,
    bool? hasAccess,
    String? fullName,
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
    String? createdAt,
    String? updatedAt,
  }) {
    return EditUserModel(
      id: id ?? this.id,
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
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory EditUserModel.init() => EditUserModel(
      id: '',
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
      details: '',
      createdAt: '',
      updatedAt: '');

  Map<String, dynamic> toMap() {
    return {
      'id': id,
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
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory EditUserModel.fromMap(Map<String, dynamic> map) {
    return EditUserModel(
      id: map['id'] ?? '',
      hasAccess: map['hasAccess'] ?? false,
      fullName: map['fullName'] ?? '',
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
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory EditUserModel.fromJson(String source) =>
      EditUserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'EditUserModel(id: $id, hasAccess: $hasAccess, fullName: $fullName, nidNo: $nidNo, phoneNo: $phoneNo, fathersName: $fathersName, mothersName: $mothersName, permanentAddress: $permanentAddress, presentAddress: $presentAddress, recomandationGiverName: $recomandationGiverName, recomandationGiverAddress: $recomandationGiverAddress, recomandationGiverMobileNo: $recomandationGiverMobileNo, beachManagementCommiteeId: $beachManagementCommiteeId, touristCommiteeId: $touristCommiteeId, validityDate: $validityDate, service: $service, details: $details, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
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
      createdAt,
      updatedAt,
    ];
  }
}
