import 'package:filledstacked_academy/app/app.logger.dart';
import 'package:filledstacked_academy/models/models.dart';

class CourseService {
  final log = getLogger('CourseService');

  List<Course> get courses => [
        Course(
            id: 'flutter-web',
            readableId: 'flutter-web',
            title: 'Master Flutter on The Web',
            modules: [
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
                  Chapter(
                    id: 'intro-services',
                    title: 'Intro to Stacked Services',
                    description:
                        'An introduction to the Services provided by Stacked that give you the basic functionality for an application',
                    durationInSeconds: 383,
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
                  Chapter(
                    id: 'landing',
                    title: 'The Landing Page',
                    description:
                        'Lets build the landing page of the application. The view the user will see first',
                    durationInSeconds: 322,
                  ),
                  Chapter(
                    id: 'intro-services',
                    title: 'Intro to Stacked Services',
                    description:
                        'An introduction to the Services provided by Stacked that give you the basic functionality for an application',
                    durationInSeconds: 1234,
                  ),
                ],
              ),
              Module(
                id: 'prerequisites',
                title: 'Prerequisites',
                chapters: [
                  Chapter(
                    id: 'readme',
                    title: 'README',
                    description:
                        'Everything you need to know before starting this course.',
                    durationInSeconds: 4324,
                  ),
                  Chapter(
                    id: 'basics',
                    title: 'Stacked Basics',
                    description:
                        'Get to know Stacked, what it provides, how to use the CLI and how it works',
                    durationInSeconds: 3433,
                  ),
                  Chapter(
                    id: 'intro-services',
                    title: 'Intro to Stacked Services',
                    description:
                        'An introduction to the Services provided by Stacked that give you the basic functionality for an application',
                    durationInSeconds: 2213,
                  ),
                ],
              ),
              Module(
                id: 'prerequisites',
                title: 'Prerequisites',
                chapters: [
                  Chapter(
                    id: 'readme',
                    title: 'README',
                    description:
                        'Everything you need to know before starting this course.',
                    durationInSeconds: 1122,
                  ),
                  Chapter(
                    id: 'basics',
                    title: 'Stacked Basics',
                    description:
                        'Get to know Stacked, what it provides, how to use the CLI and how it works',
                    durationInSeconds: 334,
                  ),
                  Chapter(
                    id: 'intro-services',
                    title: 'Intro to Stacked Services',
                    description:
                        'An introduction to the Services provided by Stacked that give you the basic functionality for an application',
                    durationInSeconds: 887,
                  ),
                ],
              ),
            ])
      ];

  Future<Course?> getCourseForId(String id) async {
    try {
      // Delay added to avoid execute a sync function as Future
      await Future.delayed(const Duration(microseconds: 100));
      return courses.firstWhere((element) => element.id == id);
    } on StateError catch (_) {
      log.w('Course with id equal "$id" not found');
      return null;
    } catch (e) {
      log.e(e.toString());
      return null;
    }
  }
}
