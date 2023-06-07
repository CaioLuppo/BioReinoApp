library home_page;

import 'package:bioreino_mobile/controller/database/dao/courses_dao.dart';
import 'package:bioreino_mobile/controller/database/dao/student_dao.dart';
import 'package:bioreino_mobile/controller/screens/route_animation.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/pages_enum.dart';
import 'package:bioreino_mobile/controller/screens/screen_navigator/updatable_drawer_mixin.dart';
import 'package:bioreino_mobile/controller/util/list_util.dart';
import 'package:bioreino_mobile/controller/util/theme_util.dart';
import 'package:bioreino_mobile/model/category.dart';
import 'package:bioreino_mobile/model/course.dart';
import 'package:bioreino_mobile/view/global_components/widgets/loading_bar.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/pages/courses/courses.dart';
import 'package:bioreino_mobile/view/screens/screen_navigator/screen_navigator.dart';
import 'package:bioreino_mobile/view/themes/theme.dart';
import 'package:flutter/material.dart';

part 'components/category_card.dart';
part 'components/course_card.dart';
part 'components/empty_list.dart';
part 'components/no_last_course.dart';
part 'components/progress_bar.dart';
part 'components/bullet.dart';
part 'components/categories_list.dart';

part 'sessions/categories.dart';
part 'sessions/course_list.dart';
part 'sessions/last_course.dart';

class HomePage extends StatefulWidget {
  final UpdatableDrawer drawer;
  const HomePage(this.drawer, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BasePage(
      widget.drawer,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(24, 8, 24, 24),
              child: LastCourseSession(),
            ),
            CourseListSession(widget.drawer),
            CategoriesSession(),
          ],
        ),
      ),
    );
  }
}
