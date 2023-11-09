import 'dart:developer';

import 'package:edspert_app/bloc/question/question_bloc.dart';
import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/constants/styles.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/question_response_model.dart';
import 'package:edspert_app/model/submit_question_request.dart';
import 'package:edspert_app/screen/result_page/result_page_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitModalWidget extends StatefulWidget {
  final List<QuestionData> questionList;
  final String exerciseId;
  const SubmitModalWidget(
      {super.key, required this.questionList, required this.exerciseId});

  @override
  State<SubmitModalWidget> createState() => _SubmitModalWidgetState();
}

class _SubmitModalWidgetState extends State<SubmitModalWidget> {
  String? myData;
  Widget? loading;

  Future<void> submitData(SubmitQuestionRequest req) async {
    var a = 'Loading';

    setState(() {
      myData = a;
    });

    var res = await CourseRemoteDatasource().submitQuestion(req);

    setState(() {
      if (res.status == 1) myData = 'Done';
    });

    moveToResult();
  }

  void moveToResult() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPagePage(exerciseId: widget.exerciseId),
        ));
  }

  Widget submitDataWidget(SubmitQuestionRequest req) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (myData == 'Loaded') {
          return Text(myData!);
        }
        if (myData == 'Error') {
          return Text(myData!);
        }
        submitData(req);
        return const Text("ss");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final request = SubmitQuestionRequest();
    request.userEmail = "testerngbayu@gmail.com";
    request.exerciseId = widget.exerciseId;

    List<String> bankQuestionList = [];
    for (var element in widget.questionList) {
      bankQuestionList.add(element.bankQuestionId ?? '-');
    }
    request.bankQuestionId = bankQuestionList;

    List<String> studentAnswerList = [];
    for (var element in widget.questionList) {
      studentAnswerList.add(element.studentAnswer ?? '-');
    }
    request.studentAnswer = studentAnswerList;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          if (myData == 'Loading') ...[
            const SizedBox(
              height: 200,
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()),
            )
          ] else ...[
            Image.asset("assets/images/end_form.png"),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Kumpulkan latihan soal sekarang?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Boleh langsung kumpulin dong",
              style: TextStyle(color: ColorThemes.textSubtitle1),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: StyleTheme.outlineButton,
                    child: const Text("Nanti Dulu"),
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                      onPressed: () {
                        submitData(request);
                      },
                      style: StyleTheme.primaryButton,
                      child: const Text("Ya"),
                    ),
                  )
                ],
              ),
            )
          ]
        ],
      ),
    );
  }
}
