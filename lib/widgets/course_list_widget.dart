import 'package:edspert_app/model/course_reponse_model.dart';
import 'package:edspert_app/screen/all_exercise_list/all_exercise_list_page.dart';
import 'package:flutter/material.dart';

class CourseListWidget extends StatelessWidget {
  final List<CourseData> courseList;
  final itemCount;
  final isHomeScreen;

  const CourseListWidget(
      {super.key,
      required this.courseList,
      this.itemCount = 3,
      this.isHomeScreen = true});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        physics: isHomeScreen
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        itemCount: isHomeScreen ? itemCount : courseList.length,
        itemBuilder: (context, index) {
          final course = courseList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contex) =>
                      AllExercisePage(courseId: course.courseId ?? "", courseTitle: course.courseName ?? "",),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 18),
              height: 96,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(13),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F7F8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      course.urlCover ?? '',
                      height: 28,
                      width: 28,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 28,
                        height: 28,
                        color: Colors.amberAccent,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.courseName ?? "",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "${course.jumlahDone}/${course.jumlahMateri} Paket Latihan Soal",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const SizedBox(height: 4),
                        const LinearProgressIndicator(
                          value: 0.5,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
