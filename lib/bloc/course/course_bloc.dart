import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/course_reponse_model.dart';
import 'package:meta/meta.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRemoteDatasource courseRemoteDataSource;

  CourseBloc({required this.courseRemoteDataSource}) : super(CourseInitial()) {
    on<CourseEvent>((event, emit) async {
      if (event is GetCourseListEvent) {
        emit(CourseLoading());
        final result = await courseRemoteDataSource.getCourses();
        emit(CourseSuccess(courseResponse: result));
      }

      if (event is InitCourseEvent) {
        add(GetCourseListEvent());
      }
    });
  }
}
