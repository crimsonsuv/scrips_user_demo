// To parse this JSON data, do
//
//     final patientList = patientListFromJson(jsonString);

import 'dart:convert';

List<PatientList> patientListFromJson(String str) => List<PatientList>.from(json.decode(str).map((x) => PatientList.fromJson(x)));

String patientListToJson(List<PatientList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PatientList {
  String patientId;
  String organizationId;
  String practiceId;
  String name;
  dynamic email;
  DateTime birthDate;
  bool staus;
  String mrn;
  String contactNumber;
  DateTime lastUpdated;
  bool isArchived;

  PatientList({
    this.patientId,
    this.organizationId,
    this.practiceId,
    this.name,
    this.email,
    this.birthDate,
    this.staus,
    this.mrn,
    this.contactNumber,
    this.lastUpdated,
    this.isArchived,
  });

  factory PatientList.fromJson(Map<String, dynamic> json) => PatientList(
    patientId: json["patientId"] == null ? null : json["patientId"],
    organizationId: json["organizationId"] == null ? null : json["organizationId"],
    practiceId: json["practiceId"] == null ? null : json["practiceId"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"],
    birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
    staus: json["staus"] == null ? null : json["staus"],
    mrn: json["mrn"] == null ? null : json["mrn"],
    contactNumber: json["contactNumber"] == null ? null : json["contactNumber"],
    lastUpdated: json["lastUpdated"] == null ? null : DateTime.parse(json["lastUpdated"]),
    isArchived: json["isArchived"] == null ? null : json["isArchived"],
  );

  Map<String, dynamic> toJson() => {
    "patientId": patientId == null ? null : patientId,
    "organizationId": organizationId == null ? null : organizationId,
    "practiceId": practiceId == null ? null : practiceId,
    "name": name == null ? null : name,
    "email": email,
    "birthDate": birthDate == null ? null : birthDate.toIso8601String(),
    "staus": staus == null ? null : staus,
    "mrn": mrn == null ? null : mrn,
    "contactNumber": contactNumber == null ? null : contactNumber,
    "lastUpdated": lastUpdated == null ? null : lastUpdated.toIso8601String(),
    "isArchived": isArchived == null ? null : isArchived,
  };
}
