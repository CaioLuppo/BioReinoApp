part of home_page;

class CourseCard extends StatelessWidget {
  final Course course;
  final double progress;
  final double imageHeight;
  final Function setState;
  final bool side;

  const CourseCard({
    required this.course,
    required this.progress,
    required this.setState,
    this.imageHeight = 190,
    this.side = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 300,
      child: InkWell(
        onTap: () => {
          StudentDAO.student!.addProgress(course),
          changeScreen(
            context,
            LessonsScreen(course),
            dontReplace: true,
          ).then((_) => setState())
        },
        child: Card(
          margin: const EdgeInsets.all(0),
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Wrap(
                  children: [
                    Image.network(
                      course.imageUrl,
                      fit: BoxFit.cover,
                      height: imageHeight,
                      width: double.maxFinite,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 100,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.name,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Text(
                          "Prof: ${course.professor}",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Expanded(
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 8.0,
                              ),
                              child: ProgressBar(progress),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
