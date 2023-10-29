import 'package:edspert_app/datasource/banner_remote_datasource.dart';
import 'package:edspert_app/datasource/course_remote_datasource.dart';
import 'package:edspert_app/model/banner_response_model.dart';
import 'package:edspert_app/model/course_reponse_model.dart';
import 'package:edspert_app/widgets/banner_list_widget.dart';
import 'package:edspert_app/widgets/course_list_widget.dart';
import 'package:flutter/material.dart';

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
    getBanner();
    getCourse();
    super.initState();
  }

  void getBanner() async {
    bannerResponse = await bannerRemoteDatasource.getBanners();
    setState(() {});
  }

  void getCourse() async {
    courseResponse = await courseRemoteDatasource.getCourses();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    TextButton(onPressed:() {}, child: const Text("Lihat Semua"))
                  ],
                ),
                courseResponse == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CourseListWidget(courseList: courseResponse?.data ?? []),
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
                bannerResponse == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : BannerListWidget(
                        bannerList: bannerResponse?.data ?? [],
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
