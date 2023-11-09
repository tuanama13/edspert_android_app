part of 'question_bloc.dart';

@immutable
sealed class QuestionEvent {}

class GetQuestionListEvent extends QuestionEvent {
  final String exerciseId;
  GetQuestionListEvent({required this.exerciseId});
}

class SubmitQuestionEvent extends QuestionEvent {
  final SubmitQuestionRequest request;
  SubmitQuestionEvent({required this.request});
}

class GetExerciseResultEvent extends QuestionEvent {
  final String exerciseId;
  GetExerciseResultEvent({required this.exerciseId});
}
