import 'dart:developer';

import 'package:edspert_app/bloc/exercise/exercise_bloc.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/screen/question_list/question_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllExercisePage extends StatelessWidget {
  final String courseId;
  final String courseTitle;
  const AllExercisePage(
      {super.key, required this.courseId, required this.courseTitle});

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
        body: Container(
          color: Color(0xFFF3F7F8),
          child: BlocBuilder<ExerciseBloc, ExerciseState>(
            builder: (context, state) {
              if (state is ExerciseFailed) {
                return Center(
                  child: Text(state.message ?? ""),
                );
              }
              if (state is ExerciseSuccess) {
                int totalData = state.exerciseResponse.data?.length ?? 0;
                if (totalData > 0) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Pilih Paket Soal",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: GridView.builder(
                            itemCount: state.exerciseResponse.data?.length,
                            itemBuilder: (context, index) {
                              final exercise =
                                  state.exerciseResponse.data?[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => QuestionListPage(
                                          exerciseId:
                                              exercise?.exerciseId ?? ""),
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: const EdgeInsets.all(8),
                                            child: Image.network(
                                              exercise?.icon ?? "",
                                              height: 16,
                                              width: 16,
                                            )),
                                        Text(
                                          exercise?.exerciseTitle ?? "no Title",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "${exercise?.jumlahDone}/${exercise?.jumlahSoal} Soal",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey[400]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/Illustrasi.png"),
                        const SizedBox(
                          height: 12,
                        ),
                        const Text(
                          "Yah, Paket tidak tersedia",
                          style: TextStyle(fontSize: 28),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          child: Text(
                            "Tenang, masih banyak yang bisa kamu pelajari. cari lagi yuk!",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[500]),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  );
                }
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
