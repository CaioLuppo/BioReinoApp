part of lessons_page;

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  final bool complete;
  const LessonCard(this.lesson, this.complete, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 88,
      width: 300,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 16),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () => changeScreen(
            context,
            WatchLessonScreen(lesson),
            dontReplace: true,
          ),
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
