import 'dart:developer';

import 'package:easy_stepper/easy_stepper.dart';
import 'package:edspert_app/bloc/question/question_bloc.dart';
import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/constants/styles.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/question_response_model.dart';
import 'package:edspert_app/widgets/options_list_widget.dart';
import 'package:edspert_app/widgets/submit_modal_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class QuestionListPage extends StatefulWidget {
  final String exerciseId;
  const QuestionListPage({super.key, required this.exerciseId});

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  int _index = 0;
  String _result = "X";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          QuestionBloc(courseRemoteDatasource: CourseRemoteDatasource())
            ..add(GetQuestionListEvent(exerciseId: widget.exerciseId)),
      child: Scaffold(
        backgroundColor: ColorThemes.backgroundColor,
        appBar: AppBar(
          title: const Text(
            'Latihan Soal',
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          backgroundColor: ColorThemes.primary,
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<QuestionBloc, QuestionState>(
              builder: (context, state) {
                if (state is QuestionFailed) {
                  return Center(
                    child: Text(state.message ?? ""),
                  );
                }

                if (state is QuestionSuccess) {
                  return Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 13, vertical: 10),
                          child: SizedBox(
                            height: 25,
                            child: EasyStepper(
                              fitWidth: false,
                              steps: getSteps(state.questionResponse.data),
                              activeStep: _index,
                              showLoadingAnimation: false,
                              borderThickness: 2,
                              unreachedStepBorderColor: ColorThemes.primary,
                              unreachedStepTextColor: ColorThemes.primary,
                              activeStepTextColor: Colors.white,
                              activeStepBackgroundColor: ColorThemes.primary,
                              finishedStepTextColor: Colors.white,
                              defaultStepBorderType: BorderType.normal,
                              activeStepBorderColor: ColorThemes.primary,
                              finishedStepBackgroundColor: ColorThemes.primary,
                              stepRadius: 15,
                              padding: const EdgeInsets.all(0),
                              lineStyle: const LineStyle(
                                  defaultLineColor: Colors.white,
                                  lineWidth: 1,
                                  lineLength: 1),
                              enableStepTapping: false,
                              onStepReached: (index) {
                                setState(() => _index = index);
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Soal Nomor ${_index + 1}",
                              style:
                                  TextStyle(color: ColorThemes.textSubtitle1),
                            ),
                            const SizedBox(
                              height: 7,
                            ),
                            HtmlWidget(state.questionResponse.data?[_index]
                                    .questionTitle ??
                                ""),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _result = "A";
                                });
                              },
                              child: OptionListWidget(
                                  selectedValue: _result,
                                  result: "A",
                                  titleValue: state.questionResponse
                                          .data![_index].optionA ??
                                      ""),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _result = "B";
                                });
                              },
                              child: OptionListWidget(
                                  selectedValue: _result,
                                  result: "B",
                                  titleValue: state.questionResponse
                                          .data![_index].optionB ??
                                      ""),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _result = "C";
                                });
                              },
                              child: OptionListWidget(
                                  selectedValue: _result,
                                  result: "C",
                                  titleValue: state.questionResponse
                                          .data![_index].optionC ??
                                      ""),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _result = "D";
                                });
                              },
                              child: OptionListWidget(
                                  selectedValue: _result,
                                  result: "D",
                                  titleValue: state.questionResponse
                                          .data![_index].optionD ??
                                      ""),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _result = "E";
                                });
                              },
                              child: OptionListWidget(
                                  selectedValue: _result,
                                  result: "E",
                                  titleValue: state.questionResponse
                                          .data![_index].optionE ??
                                      ""),
                            ),
                            const SizedBox(
                              height: 26,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (_index > 0) ...[
                                  OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (_index > 0) {
                                            _index -= 1;
                                          }
                                        });
                                      },
                                      style: StyleTheme.outlineButton,
                                      child: const Text("Kembali")),
                                ] else ...[
                                  const SizedBox(
                                    width: 20,
                                  )
                                ],
                                if (_result != 'X') ...[
                                  if (_index ==
                                      state.questionResponse.data!.length -
                                          1) ...[
                                    // KUMPULIN BUTTON
                                    ElevatedButton(
                                      style: StyleTheme.primaryButton,
                                      onPressed: () {
                                        setState(() {
                                          state.questionResponse.data![_index]
                                              .studentAnswer = _result;
                                          showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SubmitModalWidget(
                                                questionList: state
                                                        .questionResponse
                                                        .data ??
                                                    [],
                                                exerciseId: widget.exerciseId,
                                              );
                                            },
                                          );
                                        });
                                      },
                                      child: const Text("Kumpulin"),
                                    )
                                  ] else ...[
                                    // SELANJUTNYA BUTTON
                                    ElevatedButton(
                                      style: StyleTheme.primaryButton,
                                      onPressed: () {
                                        setState(() {
                                          if (_index <=
                                              state.questionResponse.data!
                                                  .length) {
                                            state.questionResponse.data![_index]
                                                .studentAnswer = _result;
                                            _index += 1;
                                            _result = "X";
                                          }
                                        });
                                      },
                                      child: const Text("Selanjutnya"),
                                    )
                                  ]
                                ] else ...[
                                  const Text("Jawaban Belum Dipilih")
                                ]
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }

                if (state is QuestionFailed) {}

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  List<EasyStep> getSteps(List<QuestionData>? data) {
    final steps = <EasyStep>[];
    for (int i = 0; i < data!.length; i++) {
      int index = i + 1;
      steps.add(
        EasyStep(title: "", customStep: Text(index.toString())),
      );
    }
    return steps;
  }
}
