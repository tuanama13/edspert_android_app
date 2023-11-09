import 'package:edspert_app/bloc/course/course_bloc.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/widgets/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCourseListPage extends StatelessWidget {
  final CourseBloc courseBloc;
  const AllCourseListPage({super.key, required this.courseBloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: courseBloc,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A7FD5),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Pilih Pelajaran",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 22.0, right: 22.0, top: 12.0),
              child: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state is CourseFailed) {
                    return Center(
                      child: Text(state.message ?? ""),
                    );
                  }
                  if (state is CourseSuccess) {
                    return CourseListWidget(
                      courseList: state.courseResponse.data ?? [],
                      itemCount: 10,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
