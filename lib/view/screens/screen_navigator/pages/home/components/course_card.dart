part of home_page;

class CourseCard extends StatefulWidget {
  final Course course;

  const CourseCard(this.course, {super.key});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  Widget? progressWidget;

  @override
  Widget build(BuildContext context) {
    StudentDAO.student?.getProgress(widget.course);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await StudentDAO.student?.getProgress(widget.course);
      final double progress =
          await StudentDAO.student?.getProgress(widget.course) ?? 0;
      setState(() => progressWidget = ProgressBar(progress));
    });
    return SizedBox(
      height: 100,
      width: 300,
      child: Card(
        margin: const EdgeInsets.all(0),
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Image.network(
                    widget.course.imageUrl,
                    fit: BoxFit.cover,
                    height: 190,
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
                  color: Theme.of(context).scaffoldBackgroundColor,
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
                        widget.course.name,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Text(
                        "Prof: ${widget.course.professor}",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8.0,
                            ),
                            child: progressWidget ?? const LoadingBar(),
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
    );
  }
}
