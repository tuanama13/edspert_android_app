import 'package:edspert_app/bloc/exercise/exercise_bloc.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllExercisePage extends StatelessWidget {
  final String courseId;
  final String courseTitle;
  const AllExercisePage({super.key, required this.courseId, required this.courseTitle});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExerciseBloc(courseRemoteDatasource: CourseRemoteDatasource())
            ..add(GetExerciseListEvent(courseId: courseId)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A7FD5),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text(
            courseTitle,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseFailed) {
              return Center(
                child: Text(state.message ?? ""),
              );
            }
            if (state is ExerciseSuccess) {
              return GridView.builder(
                itemCount: state.exerciseResponse.data?.length,
                itemBuilder: (context, index) {
                  final exercise = state.exerciseResponse.data?[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              color: Colors.grey[350],
                              padding: const EdgeInsets.all(8),
                              child: Image.network(
                                exercise?.icon ?? "",
                                height: 16,
                                width: 16,
                              )),
                          Text(exercise?.exerciseTitle ?? "no Title"),
                          Text("${exercise?.jumlahDone}/${exercise?.jumlahSoal}"),
                        ],
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
