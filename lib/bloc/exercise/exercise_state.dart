part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseState {}

final class ExerciseInitial extends ExerciseState {}

final class ExerciseLoading extends ExerciseState {}
final class ExerciseSuccess extends ExerciseState {
  final ExerciseResponse exerciseResponse;
  ExerciseSuccess({required this.exerciseResponse});
}
final class ExerciseFailed extends ExerciseState {
  final String? message;
  ExerciseFailed(this.message);
}
