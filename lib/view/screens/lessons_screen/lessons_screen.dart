library lessons_page;

import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/screens/route_handler.dart';
import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/model/course.dart';
import 'package:bioreino_mobile/model/lesson.dart';
import 'package:bioreino_mobile/view/global_components/assets/brassets.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:bioreino_mobile/view/screens/watch_lesson_screen/watch_lesson_screen.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

part 'components/lesson_card.dart';

class LessonsScreen extends StatelessWidget {
  final Course course;

  const LessonsScreen(this.course, {super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return true as Future<bool>;
      },
      child: Scaffold(
        appBar: BRAppBar(
          leading: BRBackButton(() => Navigator.pop(context)),
        ),
        drawerEnableOpenDragGesture: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: SizedBox(
                          height: 150,
                          width: double.maxFinite,
                          child: Image.network(
                            course.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 20,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course.name,
                        textAlign: TextAlign.start,
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: fromBrightnessColor(
                                    context,
                                    Colors.black,
                                    Colors.white,
                                  ),
                                  fontFamily: GoogleFonts.fredoka().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      Text(
                        "Prof: ${course.professor}",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: BRColors.greyText,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    scrollDirection: Axis.vertical,
                    children: _generateLessonsList(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _generateLessonsList() {
    List<Widget> list = List.generate(
      course.lessons!.length,
      (index) => LessonCard(
        course.lessons![index],
        StudentDAO.student!.isLessonComplete(
          course.name,
          course.lessons![index].title,
        ),
      ),
    );
    return list;
  }
}
