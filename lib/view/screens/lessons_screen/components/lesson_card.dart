part of lessons_page;

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final Course course;
  final bool complete;
  final Function widgetSetState;
  final double spacing;

  const LessonCard(
    this.course,
    this.lesson,
    this.complete,
    this.widgetSetState, {
    this.spacing = 16,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      width: double.maxFinite,
      child: Card(
        color: Theme.of(context).cardColor,
        elevation: 5,
        margin: EdgeInsets.only(bottom: spacing),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {
            StudentDAO.student!.addProgress(
              course,
              lesson: lesson,
            );
            changeScreen(
              context,
              WatchLessonScreen(course, lesson),
              dontReplace: true,
            ).then((_) => widgetSetState());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  complete ? BRAssets.lessonIconComplete : BRAssets.lessonIcon,
                  height: 40,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          lesson.title,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyLarge,
                          maxLines: 1,
                        ),
                        Text(
                          lesson.description,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
