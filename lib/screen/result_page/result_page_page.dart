import 'package:edspert_app/bloc/question/question_bloc.dart';
import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/submit_question_request.dart';
import 'package:edspert_app/screen/home_screen/home_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPagePage extends StatelessWidget {
  final String exerciseId;
  const ResultPagePage({super.key, required this.exerciseId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            QuestionBloc(courseRemoteDatasource: CourseRemoteDatasource())
              ..add(GetExerciseResultEvent(exerciseId: exerciseId)),
        child: Scaffold(
          backgroundColor: ColorThemes.primary,
          appBar: AppBar(
            backgroundColor: ColorThemes.primary,
            leading: IconButton(
              onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreenPage(),
                  )),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            title: const Text(
              "Tutup",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          body: BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              if (state is QuestionFailed) {
                return Center(
                  child: Text(state.message ?? ""),
                );
              }
              if (state is ExerciseResultSuccess) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Selamat",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      const Text("Kamu telah menyelesaikan Kuiz ini",
                          style: TextStyle(color: Colors.white)),
                      const SizedBox(
                        height: 36,
                      ),
                      Image.asset(
                        "assets/images/result.png",
                        height: 180,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Nilai kamu :",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        state.resultResponse.data!.result!.jumlahScore!
                            .toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 96),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ));
  }
}
