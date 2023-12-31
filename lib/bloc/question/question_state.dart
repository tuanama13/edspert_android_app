part of 'question_bloc.dart';

@immutable
sealed class QuestionState {}

final class QuestionInitial extends QuestionState {}

final class QuestionLoading extends QuestionState {}

final class QuestionSuccess extends QuestionState {
  final QuestionResponse questionResponse;
  QuestionSuccess({required this.questionResponse});
}

final class ExerciseResultSuccess extends QuestionState {
  final ResultResponse resultResponse;
  ExerciseResultSuccess({required this.resultResponse});
}

final class QuestionFailed extends QuestionState {
  final String? message;
  QuestionFailed(this.message);
}
