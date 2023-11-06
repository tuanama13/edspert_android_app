import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/exercise_response_model.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final CourseRemoteDatasource courseRemoteDatasource;

  ExerciseBloc({required this.courseRemoteDatasource})
      : super(ExerciseInitial()) {
    on<ExerciseEvent>((event, emit) async {
      if (event is GetExerciseListEvent) {
        emit(ExerciseLoading());
        final result =
            await courseRemoteDatasource.getExercises(event.courseId);
        emit(ExerciseSuccess(exerciseResponse: result));
      }

      // if (event is InitExerciseEvent) {
      //   add(GetExerciseListEvent(courseId: ));
      // }
    });
  }
}
