import 'package:filledstacks_academy/models/models.dart';

/// Returns the spacing to separate the sidebar items in [CourseDetailsViewDesktop].
/// The spacing between the chapter items is 20 and the spacing between a chapter
/// item and a module should be 50.

double getSpacingForSidebarItems({
  required int index,
  required List<dynamic> items,
}) {
  final currentSideBarItem = items[index];

  dynamic nextSidebarItem;
  if (index == items.length - 1) {
    nextSidebarItem = items[index];
  } else {
    nextSidebarItem = items[index + 1];
  }

  return nextSidebarItem is Module && currentSideBarItem is Chapter ? 50 : 20;
}
