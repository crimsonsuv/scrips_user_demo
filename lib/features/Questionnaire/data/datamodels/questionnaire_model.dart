// To parse this JSON data, do
//
//     final questionnaire = questionnaireFromJson(jsonString);

import 'dart:convert';

import 'package:scrips_core/common/data/datamodels/valueset_data_model.dart';

Questionnaire questionnaireFromJson(String str) =>
    Questionnaire.fromJson(json.decode(str));

String questionnaireToJson(Questionnaire data) => json.encode(data.toJson());

class Questionnaire {
  List<Item> items;
  String id;
  DateTime date;
  String publisher;
  bool isArchive;
  String identifier;
  String subjectType;
  String title;
  String description;
  String status;
  String organizationId;
  String practitionerId;
  String questionnaireRuleId;
  String specialtyId;
  String version;
  DateTime updatedOn;
  QuestionnaireRule questionnaireRule;

  Questionnaire({
    this.items,
    this.id,
    this.date,
    this.publisher,
    this.isArchive,
    this.identifier,
    this.subjectType,
    this.title,
    this.description,
    this.status,
    this.organizationId,
    this.practitionerId,
    this.questionnaireRuleId,
    this.specialtyId,
    this.version,
    this.updatedOn,
    this.questionnaireRule,
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) => Questionnaire(
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        date: (json["date"] == null || json["date"] == "")
            ? null
            : DateTime.parse(json["date"]),
        publisher: json["publisher"] == null ? null : json["publisher"],
        isArchive: json["isArchive"] == null ? null : json["isArchive"],
        identifier: json["identifier"] == null ? null : json["identifier"],
        subjectType: json["subjectType"] == null ? null : json["subjectType"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        status: json["status"] == null ? null : json["status"],
        organizationId:
            json["organizationId"] == null ? null : json["organizationId"],
        practitionerId:
            json["practitionerId"] == null ? null : json["practitionerId"],
        questionnaireRuleId: json["questionnaireRuleId"] == null
            ? null
            : json["questionnaireRuleId"],
        specialtyId: json["specialtyId"] == null ? null : json["specialtyId"],
        version: json["version"] == null ? null : json["version"],
        updatedOn: (json["updatedOn"] == null || json["updatedOn"] == "")
            ? null
            : DateTime.parse(json["updatedOn"]),
        questionnaireRule: json["questionnaireRule"] == null
            ? null
            : QuestionnaireRule.fromJson(json["questionnaireRule"]),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "date": date == null ? null : date.toIso8601String(),
        "publisher": publisher == null ? "" : publisher,
        "isArchive": isArchive == null ? false : isArchive,
        "identifier": identifier == null ? "" : identifier,
        "subjectType": subjectType == null ? "" : subjectType,
        "title": title == null ? "" : title,
        "description": description == null ? "" : description,
        "status": status == null ? "Retired" : status,
        "organizationId": organizationId == null ? "" : organizationId,
        "practitionerId": practitionerId == null ? "" : practitionerId,
        "questionnaireRuleId":
            questionnaireRuleId == null ? "" : questionnaireRuleId,
        "specialtyId": specialtyId == null ? "" : specialtyId,
        "version": version == null ? "" : version,
        "updatedOn": updatedOn == null ? "" : updatedOn.toIso8601String(),
        "questionnaireRule":
            questionnaireRule == null ? null : questionnaireRule.toJson(),
      };
}

class Item {
  String id;
  String linkId;
  String type;
  String practitionerId;
  String specialtyId;
  String groupId;
  String text;
  bool required;
  int maxLength;
  int order;
  DateTime date;
  String createdBy;
  dynamic updatedBy;
  bool isArchive;
  bool isUpdated;
  QuestionType questionType;
  Groups groups;
  List<Item> items;
  List<AnswerOption> answerOptions;
  bool isEdit = false;

  Item({
    this.isEdit = false,
    this.id,
    this.linkId,
    this.type,
    this.practitionerId,
    this.specialtyId,
    this.groupId,
    this.text,
    this.required,
    this.maxLength,
    this.order,
    this.date,
    this.createdBy,
    this.updatedBy,
    this.isArchive,
    this.isUpdated,
    this.questionType,
    this.groups,
    this.items,
    this.answerOptions,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"] == null ? null : json["id"],
        linkId: json["linkId"] == null ? null : json["linkId"],
        type: json["type"] == null ? null : json["type"],
        practitionerId:
            json["practitionerId"] == null ? null : json["practitionerId"],
        specialtyId: json["specialtyId"] == null ? null : json["specialtyId"],
        groupId: json["groupId"] == null ? null : json["groupId"],
        text: json["text"] == null ? null : json["text"],
        required: json["required"] == null ? null : json["required"],
        maxLength: json["maxLength"] == null ? null : json["maxLength"],
        order: json["order"] == null ? null : json["order"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        updatedBy: json["updatedBy"],
        isArchive: json["isArchive"] == null ? null : json["isArchive"],
        isUpdated: json["isUpdated"] == null ? null : json["isUpdated"],
        questionType: json["questionType"] == null
            ? null
            : QuestionType.fromJson(json["questionType"]),
        groups: json["groups"] == null ? null : Groups.fromJson(json["groups"]),
        items: json["items"] == null
            ? null
            : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        answerOptions: json["answerOptions"] == null
            ? null
            : List<AnswerOption>.from(
                json["answerOptions"].map((x) => AnswerOption.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? "" : id,
        "linkId": linkId == null ? "" : linkId,
        "type": type == null ? "" : type,
        "practitionerId": practitionerId == null ? "" : practitionerId,
        "specialtyId": specialtyId == null ? "" : specialtyId,
        "groupId": groupId == null ? "" : groupId,
        "text": text == null ? "" : text,
        "required": required == null ? "" : required,
        "maxLength": maxLength == null ? 0 : maxLength,
        "order": order == null ? 0 : order,
        "date": date == null ? "" : date.toIso8601String(),
        "createdBy": createdBy == null ? "" : createdBy,
        "updatedBy": updatedBy == null ? "" : updatedBy,
        "isArchive": isArchive == null ? false : isArchive,
        "isUpdated": isUpdated == null ? false : isUpdated,
        "questionType": questionType == null ? {} : questionType.toJson(),
        "groups": groups == null ? {} : groups.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items.map((x) => x.toJson())),
        "answerOptions": answerOptions == null
            ? []
            : List<dynamic>.from(answerOptions.map((x) => x.toJson())),
      };
}

class AnswerOption {
  ValueCoding valueCoding;

  AnswerOption({
    this.valueCoding,
  });

  factory AnswerOption.fromJson(Map<String, dynamic> json) => AnswerOption(
        valueCoding: json["valueCoding"] == null
            ? null
            : ValueCoding.fromJson(json["valueCoding"]),
      );

  Map<String, dynamic> toJson() => {
        "valueCoding": valueCoding == null ? null : valueCoding.toJson(),
      };
}

class Groups {
  String id;
  String name;
  String url;
  String icon;
  bool isSearchable;

  Groups({
    this.id,
    this.name,
    this.url,
    this.icon,
    this.isSearchable,
  });

  factory Groups.fromJson(Map<String, dynamic> json) => Groups(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
        icon: json["icon"] == null ? null : json["icon"],
        isSearchable:
            json["isSearchable"] == null ? null : json["isSearchable"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
        "icon": icon == null ? null : icon,
        "isSearchable": isSearchable == null ? null : isSearchable,
      };
}

class QuestionType {
  String type;
  String title;
  bool isActive;

  QuestionType({
    this.type,
    this.title,
    this.isActive,
  });

  factory QuestionType.fromJson(Map<String, dynamic> json) => QuestionType(
        type: json["type"] == null ? null : json["type"],
        title: json["title"] == null ? null : json["title"],
        isActive: json["isActive"] == null ? null : json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "title": title == null ? null : title,
        "isActive": isActive == null ? null : isActive,
      };
}

class QuestionnaireRule {
  String id;
  String title;

  QuestionnaireRule({
    this.id,
    this.title,
  });

  factory QuestionnaireRule.fromJson(Map<String, dynamic> json) =>
      QuestionnaireRule(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
