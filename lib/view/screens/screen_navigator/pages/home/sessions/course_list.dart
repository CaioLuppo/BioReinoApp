part of home_page;

class CourseList extends StatefulWidget {
  const CourseList({super.key});

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  final String myCoursesTitle = "MEUS CURSOS";
  final String allText = "Mostrar tudo";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 268,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 24.0,
              right: 24.0,
              bottom: 4,
            ),
            child: Row(
              children: [
                Text(
                  myCoursesTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                TextButton(
                  child: Text(
                    allText,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: BRColors.greyText,
                        ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          FutureBuilder(
            future: CoursesDAO.getAll(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const EmptyList();
                case ConnectionState.waiting:
                  return const Expanded(child: Center(child: LoadingBar()));
                case ConnectionState.active:
                  return const Expanded(child: Center(child: LoadingBar()));
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Course course = CoursesDAO.coursesList[index];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: CourseCard(
                              course: course,
                              progress: StudentDAO.student!.getProgress(course),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const EmptyList();
                  }
              }
            },
          ),
        ],
      ),
    );
  }
}
