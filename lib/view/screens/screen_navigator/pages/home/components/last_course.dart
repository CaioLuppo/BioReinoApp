part of home_page;

class LastCourse extends StatefulWidget {
  final Map<String, dynamic> lastCourse;
  const LastCourse(this.lastCourse, {super.key});

  @override
  State<LastCourse> createState() => _LastCourseState();
}

class _LastCourseState extends State<LastCourse> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CoursesDAO.getAll(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Course? course;
          Lesson? lesson;
          bool complete = false;
          for (var element in CoursesDAO.coursesList) {
            if (element.name == widget.lastCourse["courseTitle"]) {
              course = element;
              if (widget.lastCourse["lastLesson"] != null) {
                for (var elementLesson in element.lessons!) {
                  if (elementLesson.title ==
                      widget.lastCourse["lastLesson"]["lessonTitle"]) {
                    lesson = elementLesson;
                    complete = StudentDAO.student!.isLessonComplete(
                      element.name,
                      lesson.title,
                    );
                    break;
                  }
                }
              } else if (element.lessons != null) {
                lesson = element.lessons![0];
                complete = StudentDAO.student!.isLessonComplete(
                  element.name,
                  element.lessons![0].title,
                );
              } else {
                return const NoLastCourse();
              }
              break;
            }
          }
          return InkWell(
            onTap: () => changeScreen(
              context,
              LessonsScreen(course!),
              dontReplace: true,
            ).then((_) => setState(() {})),
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.only(top: 16),
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 190,
                      child: Image.network(
                        widget.lastCourse["imageUrl"],
                        height: double.maxFinite,
                        width: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 150,
                        width: double.maxFinite,
                        color: Theme.of(context).cardColor,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.lastCourse["courseTitle"],
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              Text(
                                "Prof: ${widget.lastCourse["professor"]}",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: LessonCard(
                                    course!,
                                    lesson!,
                                    complete,
                                    () => setState(() {}),
                                    spacing: 0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox(
          height: 250,
          child: Center(
            child: LoadingBar(),
          ),
        );
      },
    );
  }
}
