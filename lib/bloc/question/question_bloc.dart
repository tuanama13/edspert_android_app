import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/question_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

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
    });
  }
}
