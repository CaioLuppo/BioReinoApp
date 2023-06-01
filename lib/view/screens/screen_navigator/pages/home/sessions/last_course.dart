part of home_page;

class LastCourse extends StatelessWidget {
  const LastCourse({super.key});

  final String lastCourseText = "ÚLTIMO CURSO";

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          lastCourseText,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const NoLastCourse()
      ],
    );
  }
}
