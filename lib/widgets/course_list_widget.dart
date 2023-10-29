import 'package:edspert_app/model/course_reponse_model.dart';
import 'package:flutter/material.dart';

class CourseListWidget extends StatelessWidget {
  final List<CourseData> courseList;
  const CourseListWidget({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) => const SizedBox(
          height: 15,
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          final course = courseList[index];
          return Container(
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
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.majorName ?? ""),
                      Text(
                          "${course.jumlahDone}/${course.jumlahMateri} Paket Latihan Soal"),
                      const SizedBox(height: 4),
                       const LinearProgressIndicator(
                            value: 0.5,
                          )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
