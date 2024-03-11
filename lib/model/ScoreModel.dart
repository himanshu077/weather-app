// // To parse this JSON data, do
// //
// //     final scoreModel = scoreModelFromJson(jsonString);
//
// import 'dart:convert';
//
// import 'package:hive/hive.dart';
// part 'ScoreModel.g.dart';
//
// @HiveType(typeId: 0)
// class ScoreModel {
//   @HiveField(0)
//   int? score;
//
//   @HiveField(1)
//   int? timeStamp;
//
//   ScoreModel({
//     this.score,
//     this.timeStamp,
//   });
//
//   factory ScoreModel.fromJson(Map<String, dynamic> json) => ScoreModel(
//     score: json["score"],
//     timeStamp: json["timeStamp"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "score": score,
//     "timeStamp": timeStamp,
//   };
// }
//
//
//
// ScoreModel scoreModelFromJson(String str) => ScoreModel.fromJson(json.decode(str));
//
// String scoreModelToJson(ScoreModel data) => json.encode(data.toJson());
