part of home_page;

class LastCourseSession extends StatefulWidget {
  const LastCourseSession({super.key});

  @override
  State<LastCourseSession> createState() => _LastCourseSessionState();
}

class _LastCourseSessionState extends State<LastCourseSession> {
  final String lastCourseText = "ÚLTIMO CURSO";

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? lastCourse = StudentDAO.student?.lastCourse;
    return Wrap(
      children: [
        Text(
          lastCourseText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        lastCourse != null
            ? LastCourse(lastCourse)
            : const NoLastCourse(), // Colocar nolastcourse
      ],
    );
  }
}
