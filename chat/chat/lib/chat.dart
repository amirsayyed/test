// To parse this JSON data, do
//
//     final messages = messagesFromJson(jsonString);

import 'dart:convert';

Messages messagesFromJson(String str) => Messages.fromJson(json.decode(str));

String messagesToJson(Messages data) => json.encode(data.toJson());

class Messages {
  Messages({
    this.code,
    this.result,
  });

  int code;
  List<Result> result;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        code: json["code"],
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.isSent,
    this.message,
    this.timestamp,
  });

  int isSent;
  String message;
  String timestamp;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        isSent: json["is_sent"],
        message: json["message"],
        timestamp: json["timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "is_sent": isSent,
        "message": message,
        "timestamp": timestamp,
      };
}
