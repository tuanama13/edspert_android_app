import 'package:edspert_app/bloc/banner/banner_bloc.dart';
import 'package:edspert_app/bloc/course/course_bloc.dart';
import 'package:edspert_app/constants/colors.dart';
import 'package:edspert_app/datasource/banner_remote_datasource.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/banner_response_model.dart';
import 'package:edspert_app/model/course_reponse_model.dart';
import 'package:edspert_app/screen/all_course_list/all_course_list_page.dart';
import 'package:edspert_app/widgets/banner_list_widget.dart';
import 'package:edspert_app/widgets/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum BannerStatus { initial, loading, success, error }

enum CourseStatus { initial, loading, success, error }

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final bannerRemoteDatasource = BannerRemoteDataSource();
  final courseRemoteDatasource = CourseRemoteDatasource();

  BannerResponse? bannerResponse;
  BannerStatus bannerStatus = BannerStatus.initial;

  CourseResponse? courseResponse;
  CourseStatus courseStatus = CourseStatus.initial;

  @override
  void initState() {
    super.initState();
  }

  final courseBloc =
      CourseBloc(courseRemoteDataSource: CourseRemoteDatasource());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              BannerBloc(bannerRemoteDataSource: BannerRemoteDataSource())
                ..add(GetBannerListEvent()),
        ),
        BlocProvider(
          create: (context) => courseBloc..add(GetCourseListEvent()),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorThemes.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Ama",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Selamat Datang",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: 17.5,
                        backgroundImage: NetworkImage(
                            "https://cdn.iconscout.com/icon/free/png-512/avatar-370-456322.png"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 147,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF3A7fd5),
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 26,
                            left: 20,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Mau kerjain\n latihan soal\n apa hari ini?",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset("assets/images/homescreen.png"),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Pilih Pelajaran",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllCourseListPage(
                                        courseBloc: courseBloc)));
                          },
                          child: const Text("Lihat Semua"))
                    ],
                  ),
                  BlocBuilder<CourseBloc, CourseState>(
                    builder: (context, state) {
                      if (state is CourseFailed) {
                        return Center(child: Text(state.message ?? ""));
                      } else if (state is CourseSuccess) {
                        return CourseListWidget(
                          courseList: state.courseResponse.data ?? [],
                          isHomeScreen: true,
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Terbaru",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  BlocBuilder<BannerBloc, BannerState>(
                    builder: (context, state) {
                      if (state is BannerFailed) {
                        return Center(child: Text(state.message ?? ""));
                      } else if (state is BannerSuccess) {
                        return BannerListWidget(
                          bannerList: state.bannerResponse.data ?? [],
                        );
                      }
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
