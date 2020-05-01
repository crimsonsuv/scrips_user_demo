// To parse this JSON data, do
//
//     final questionnaireResponse = questionnaireResponseFromJson(jsonString);

import 'dart:convert';

QuestionnaireResponse questionnaireResponseFromJson(String str) => QuestionnaireResponse.fromJson(json.decode(str));

String questionnaireResponseToJson(QuestionnaireResponse data) => json.encode(data.toJson());

class QuestionnaireResponse {
  String questionnaireId;
  String subject;
  String author;
  String sourceId;
  List<Item> items;

  QuestionnaireResponse({
    this.questionnaireId,
    this.subject,
    this.author,
    this.sourceId,
    this.items,
  });

  factory QuestionnaireResponse.fromJson(Map<String, dynamic> json) => QuestionnaireResponse(
    questionnaireId: json["questionnaireId"] == null ? null : json["questionnaireId"],
    subject: json["subject"] == null ? null : json["subject"],
    author: json["author"] == null ? null : json["author"],
    sourceId: json["sourceId"] == null ? null : json["sourceId"],
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "questionnaireId": questionnaireId == null ? null : questionnaireId,
    "subject": subject == null ? null : subject,
    "author": author == null ? null : author,
    "sourceId": sourceId == null ? null : sourceId,
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  String questionId;
  String linkId;
  String text;
  String type;
  Answer answer;
  List<Item> items;

  Item({
    this.questionId,
    this.linkId,
    this.text,
    this.type,
    this.answer,
    this.items,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    questionId: json["questionId"] == null ? null : json["questionId"],
    linkId: json["linkId"] == null ? null : json["linkId"],
    text: json["text"] == null ? null : json["text"],
    type: json["type"] == null ? null : json["type"],
    answer: json["answer"] == null ? null : Answer.fromJson(json["answer"]),
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "questionId": questionId == null ? null : questionId,
    "linkId": linkId == null ? null : linkId,
    "text": text == null ? null : text,
    "type": type == null ? null : type,
    "answer": answer == null ? null : answer.toJson(),
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Answer {
  bool valueBoolean;
  String valueString;
  List<ValueCoding> valueCoding;

  Answer({
    this.valueBoolean,
    this.valueString,
    this.valueCoding,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
    valueBoolean: json["valueBoolean"] == null ? null : json["valueBoolean"],
    valueString: json["valueString"] == null ? null : json["valueString"],
    valueCoding: json["valueCoding"] == null ? null : List<ValueCoding>.from(json["valueCoding"].map((x) => ValueCoding.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "valueBoolean": valueBoolean == null ? false : valueBoolean,
    "valueString": valueString == null ? null : valueString,
    "valueCoding": valueCoding == null ? null : List<dynamic>.from(valueCoding.map((x) => x.toJson())),
  };
}

class ValueCoding {
  String code;
  String display;
  String system;

  ValueCoding({
    this.code,
    this.display,
    this.system,
  });

  factory ValueCoding.fromJson(Map<String, dynamic> json) => ValueCoding(
    code: json["code"] == null ? null : json["code"],
    display: json["display"] == null ? null : json["display"],
    system: json["system"] == null ? null : json["system"],
  );

  Map<String, dynamic> toJson() => {
    "code": code == null ? null : code,
    "display": display == null ? null : display,
    "system": system == null ? null : system,
  };
}
