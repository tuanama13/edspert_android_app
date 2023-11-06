part of 'question_bloc.dart';

@immutable
sealed class QuestionEvent {}

class GetQuestionListEvent extends QuestionEvent {
  final String exerciseId;
  GetQuestionListEvent({required this.exerciseId});
}
