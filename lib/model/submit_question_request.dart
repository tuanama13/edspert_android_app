// To parse this JSON data, do
//
//     final submitQuestionRequest = submitQuestionRequestFromJson(jsonString);

import 'dart:convert';

SubmitQuestionRequest submitQuestionRequestFromJson(String str) =>
    SubmitQuestionRequest.fromJson(json.decode(str));

String submitQuestionRequestToJson(SubmitQuestionRequest data) =>
    json.encode(data.toJson());

class SubmitQuestionRequest {
  String? userEmail;
  String? exerciseId;
  List<String>? bankQuestionId;
  List<String>? studentAnswer;

  SubmitQuestionRequest({
    this.userEmail,
    this.exerciseId,
    this.bankQuestionId,
    this.studentAnswer,
  });

  factory SubmitQuestionRequest.fromJson(Map<String, dynamic> json) =>
      SubmitQuestionRequest(
        userEmail: json["user_email"],
        exerciseId: json["exercise_id"],
        bankQuestionId: json["bank_question_id"] == null
            ? []
            : List<String>.from(json["bank_question_id"]!.map((x) => x)),
        studentAnswer: json["student_answer"] == null
            ? []
            : List<String>.from(json["student_answer"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "user_email": userEmail,
        "exercise_id": exerciseId,
        "bank_question_id": bankQuestionId == null
            ? []
            : List<dynamic>.from(bankQuestionId!.map((x) => x)),
        "student_answer": studentAnswer == null
            ? []
            : List<dynamic>.from(studentAnswer!.map((x) => x)),
      };
}
