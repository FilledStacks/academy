part of 'course_details_view.desktop.dart';

class _SideSelectionList extends StatelessWidget {
  final bool busy;
  final List<dynamic> items;
  final Function(SideBarItem) isItemSelected;
  const _SideSelectionList({
    required this.items,
    required this.isItemSelected,
    this.busy = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kdSidebarWidth,
      child: busy
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: items.length,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: getSpacingForSidebarItems(
                    index: index,
                    items: items,
                  ),
                );
              },
              itemBuilder: (_, index) {
                var sidebarItem = items[index];

                if (sidebarItem is Module) {
                  final moduleSelected = isItemSelected(sidebarItem);
                  return _ModuleHeaderListItem(
                    moduleSelected: moduleSelected,
                    module: sidebarItem,
                  );
                }

                return _CourseChapterListItem(chapter: sidebarItem);
              },
            ),
    );
  }
}

class _ModuleHeaderListItem extends StatelessWidget {
  final Module module;
  final bool moduleSelected;
  const _ModuleHeaderListItem({
    required this.moduleSelected,
    required this.module,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: moduleSelected ? Colors.white : kcMediumGrey,
          boxShadow: [
            if (moduleSelected)
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                blurRadius: 20,
              )
          ]),
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO (Improvement): Get random Emoji in the place of 🚀
          Text(
            module.leadingEmoji ?? '🚀',
            style: ktsBodyRegular.copyWith(
              color: moduleSelected ? Colors.black : Colors.white,
            ),
          ),
          horizontalSpaceTiny,
          Text(module.title,
              style: ktsBodyRegular.copyWith(
                color: moduleSelected ? Colors.black : Colors.white,
              )),
        ],
      ),
    );
  }
}

class _CourseChapterListItem extends ViewModelWidget<CourseDetailsViewModel> {
  final Chapter chapter;
  const _CourseChapterListItem({
    required this.chapter,
  });

  @override
  Widget build(BuildContext context, CourseDetailsViewModel viewModel) {
    return GestureDetector(
      // onTap: () => viewModel.showChapter(chapter),
      onTap: () {
        context.router.push(CourseChapterViewRoute(
          chapterId: chapter.id,
          chapter: chapter,
        ));
      },
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
              ),
              color: viewModel.isSidebarItemSelected(chapter)
                  ? Colors.white
                  : Colors.transparent,
            ),
          ),
          horizontalSpaceMedium,
          Expanded(child: Text(chapter.title)),
          horizontalSpaceMedium,
          Text(chapter.durationReadableTime)
        ],
      ).showCursorOnHover,
    );
  }
}
