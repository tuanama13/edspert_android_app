import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/question_response_model.dart';
import 'package:edspert_app/model/submit_question_request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../model/exercise_result_response_model.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final CourseRemoteDatasource courseRemoteDatasource;

  QuestionBloc({required this.courseRemoteDatasource})
      : super(QuestionInitial()) {
    on<QuestionEvent>((event, emit) async {
      if (event is GetQuestionListEvent) {
        emit(QuestionLoading());
        final result =
            await courseRemoteDatasource.getQuestionList(event.exerciseId);
        emit(QuestionSuccess(questionResponse: result));
      }

      if (event is SubmitQuestionEvent) {
        emit(QuestionLoading());
        final result =
            await courseRemoteDatasource.submitQuestion(event.request);
        emit(QuestionSuccess(questionResponse: result));
      }

      if (event is GetExerciseResultEvent) {
        emit(QuestionLoading());
        final result =
            await courseRemoteDatasource.getExercisesResult(event.exerciseId);
        emit(ExerciseResultSuccess(resultResponse: result));
      }
    });
  }
}
