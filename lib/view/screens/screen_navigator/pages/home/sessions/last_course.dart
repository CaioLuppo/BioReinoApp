part of home_page;

class LastCourseSession extends StatelessWidget {
  const LastCourseSession({super.key});

  final String lastCourseText = "ÚLTIMO CURSO";

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          lastCourseText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const NoLastCourse(),
      ],
    );
  }
}
