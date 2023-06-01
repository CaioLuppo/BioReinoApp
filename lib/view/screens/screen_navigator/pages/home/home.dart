library home_page;

import 'package:bioreino_mobile/controller/database/dao/courses_dao.dart';
import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/model/course.dart';
import 'package:bioreino_mobile/view/global_components/widgets/loading_bar.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

part 'components/course_card.dart';
part 'components/empty_list.dart';
part 'components/no_last_course.dart';
part 'components/progress_bar.dart';
part 'sessions/course_list.dart';
part 'sessions/last_course.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(24.0),
                child: LastCourse(),
              ),
              CourseList(),
            ],
          ),
        );
      },
    );
  }
}
