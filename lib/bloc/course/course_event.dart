part of 'course_bloc.dart';

@immutable
sealed class CourseEvent {}

class GetCourseListEvent extends CourseEvent {}

class InitCourseEvent extends CourseEvent {}
