import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:edspert_app/constants/constants.dart';
import 'package:edspert_app/model/course_reponse_model.dart';
import 'package:edspert_app/model/exercise_response_model.dart';
import 'package:edspert_app/model/exercise_result_response_model.dart';
import 'package:edspert_app/model/question_response_model.dart';
import 'package:edspert_app/model/submit_question_request.dart';

class CourseRemoteDatasource {
  Future<CourseResponse> getCourses() async {
    try {
      final url = '${LearningConstants.baseUrl}${LearningConstants.coursePath}';

      final result = await Dio().get(
        url,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );
      final courseResponse = CourseResponse.fromJson(result.data);
      return courseResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }

  Future<ExerciseResponse> getExercises(String courseId) async {
    try {
      final url =
          '${LearningConstants.baseUrl}${LearningConstants.excerciseListPath}';

      final result = await Dio().get(url,
          options: Options(
            headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
          ),
          //?course_id=132&user_email=testerngbayu@gmail.com
          queryParameters: {
            'course_id': courseId,
            'user_email': 'testerngbayu@gmail.com'
          });
      final exerciseResponse = ExerciseResponse.fromJson(result.data);
      return exerciseResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }

  Future<QuestionResponse> getQuestionList(String exerciseId) async {
    try {
      final url =
          '${LearningConstants.baseUrl}${LearningConstants.excerciseQuestionPath}';
      final payload = FormData.fromMap(
        {
          "exercise_id": exerciseId,
          "user_email": "testerngbayu@gmail.com",
        },
      );
      final result = await Dio().post(
        url,
        data: payload,
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      final questionResponse = QuestionResponse.fromJson(result.data);
      return questionResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }

  Future<QuestionResponse> submitQuestion(SubmitQuestionRequest request) async {
    try {
      final url =
          '${LearningConstants.baseUrl}${LearningConstants.submitQuestionPath}';

      final result = await Dio().post(
        url,
        data: request.toJson(),
        options: Options(
          headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
        ),
      );

      final questionResponse = QuestionResponse.fromJson(result.data);
      return questionResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }

  Future<ResultResponse> getExercisesResult(String exerciseId) async {
    try {
      final url =
          '${LearningConstants.baseUrl}${LearningConstants.exerciseResultPath}';

      final result = await Dio().get(url,
          options: Options(
            headers: {'x-api-key': '18be70c0-4e4d-44ff-a475-50c51ece99a0'},
          ),
          //?course_id=132&user_email=testerngbayu@gmail.com
          queryParameters: {
            'exercise_id': exerciseId,
            'user_email': 'testerngbayu@gmail.com'
          });
      final exerciseResultResponse = ResultResponse.fromJson(result.data);
      return exerciseResultResponse;
    } catch (e, stacktrace) {
      log(e.toString(), stackTrace: stacktrace, error: e);
      rethrow;
    }
  }
}
