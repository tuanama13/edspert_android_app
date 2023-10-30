part of 'exercise_bloc.dart';

@immutable
abstract class ExerciseEvent {}

class GetExerciseListEvent extends ExerciseEvent {
  final String courseId;
  GetExerciseListEvent({required this.courseId});
}

class InitExerciseEvent extends ExerciseEvent {}
