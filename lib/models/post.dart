// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<userModel> userModelFromJson(String str) => List<userModel>.from(json.decode(str).map((x) => userModel.fromJson(x)));

String userModelToJson(List<userModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class userModel {
    int userId;
    int id;
    String title;
    String body;

    userModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory userModel.fromJson(Map<String, dynamic> json) => userModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
