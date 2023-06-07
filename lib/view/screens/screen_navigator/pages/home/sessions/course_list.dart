part of home_page;

class CourseListSession extends StatefulWidget {
  final UpdatableDrawer drawer;
  const CourseListSession(this.drawer, {super.key});

  @override
  State<CourseListSession> createState() => _CourseListSessionState();
}

class _CourseListSessionState extends State<CourseListSession> {
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
                  style: ButtonStyle(
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    allText,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: BRColors.greyText,
                        ),
                  ),
                  onPressed: () => widget.drawer.updatePage(Pages.courses, showBackButton: true),
                )
              ],
            ),
          ),
          SizedBox(
            height: 216,
            child: FutureBuilder(
              future: CoursesDAO.getAll(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
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
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: CourseCard(
                            course: course,
                            progress: StudentDAO.student!.getProgress(course),
                          ),
                        );
                      },
                    );
                  } else {
                    return const EmptyList("Nenhum curso disponível.");
                  }
                }
                return const Center(child: LoadingBar());
              },
            ),
          ),
        ],
      ),
    );
  }
}
