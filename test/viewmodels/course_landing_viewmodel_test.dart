import 'package:filledstacked_academy/models/models.dart';
import 'package:filledstacked_academy/ui/views/course_landing/course_landing_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:filledstacked_academy/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CourseLandingViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    final List<Course> testCourses = [
      Course(id: 'flutter-web', title: 'Master Flutter on The Web', modules: [
        Module(
          id: 'prerequisites',
          title: 'Prerequisites',
          chapters: [
            Chapter(
              id: 'readme',
              title: 'README',
              description:
                  'Everything you need to know before starting this course.',
              durationInSeconds: 450,
            ),
            Chapter(
              id: 'basics',
              title: 'Stacked Basics',
              description:
                  'Get to know Stacked, what it provides, how to use the CLI and how it works',
              durationInSeconds: 683,
            ),
          ],
        ),
        Module(
          id: 'app',
          title: 'App',
          chapters: [
            Chapter(
              id: 'what-are-we-building',
              title: 'What we will build',
              description: 'Everything you need to know to build',
              durationInSeconds: 3578,
            ),
          ],
        ),
      ])
    ];

    group('extractAllChapters -', () {
      test(
        'When called with course equal null, should return an empty list',
        () async {
          final model = CourseLandingViewModel(courseId: 'flutter-web');
          await model.futureToRun();
          final chapters = model.extractAllChapters(null);

          expect(chapters.length, 0);
        },
      );

      test(
        'When called with valid course, should return all chapters',
        () async {
          getAndRegisterCourseService(courses: testCourses);

          final model = CourseLandingViewModel(courseId: 'flutter-web');
          await model.futureToRun();
          final chapters = model.extractAllChapters(model.fetchedCourse);

          expect(chapters.length, 3);
        },
      );
    });
  });
}
