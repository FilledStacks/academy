import 'package:filledstacks_academy/app/app.logger.dart';
import 'package:filledstacks_academy/exceptions/resource_not_found.dart';
import 'package:filledstacks_academy/models/models.dart';

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
                    id: 'system-requirements',
                    title: 'System Requirements',
                    description:
                        'What you need to have installed, what version we will be working with.',
                    durationInSeconds: 450,
                  ),
                  Chapter(
                    id: 'knowledge-requirements',
                    title: 'Knowledge Requirements',
                    description:
                        'What you need to know to get the most out of this course',
                    durationInSeconds: 683,
                  ),
                ],
              ),
              Module(
                id: 'intro-flutter-web',
                title: 'Intro to Flutter Web',
                chapters: [
                  Chapter(
                    id: 'html-vs-canvas',
                    title: 'Html vs Canvas',
                    description:
                        'The difference between Html and Canvas flutter web apps',
                    durationInSeconds: 3578,
                  ),
                  Chapter(
                    id: 'seo-vs-web',
                    title: 'SEO vs Web app',
                    description:
                        'The difference between an SEO built website and a Web application',
                    durationInSeconds: 322,
                  ),
                ],
              ),
              Module(
                id: 'stacked',
                title: 'Stacked',
                chapters: [
                  Chapter(
                    id: 'what-is-stacked',
                    title: 'What is Stacked',
                    description: 'What is Stacked and why we use it',
                    durationInSeconds: 4324,
                  ),
                  Chapter(
                    id: 'getting-started',
                    title: 'Getting Started with Stacked',
                    description:
                        'How to get started with stacked and create your first project',
                    durationInSeconds: 3433,
                  ),
                  Chapter(
                    id: 'state-in-stacked',
                    title: 'State management in Stacked',
                    description: 'How state management works in Stacked',
                    durationInSeconds: 2213,
                  ),
                  Chapter(
                    id: 'stacked-navigation',
                    title: 'Navigation in Stacked',
                    description:
                        'An overview of how navigation works in Stacked',
                    durationInSeconds: 2213,
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
                id: 'building-web-ui',
                title: 'Building Web UI',
                chapters: [
                  Chapter(
                    id: 'building-landing',
                    title: 'Build a landing page',
                    description: 'Build the applications landing page',
                    durationInSeconds: 1122,
                  ),
                  Chapter(
                    id: 'refactor-for-responsive',
                    title: 'Refactor for Responsive',
                    description: 'Refactor the widgets for Responsive Design',
                    durationInSeconds: 334,
                  ),
                  Chapter(
                    id: 'overview-of-responsive-builder',
                    title: 'Overview of Responsive Builder',
                    description:
                        'An overview of the responsive builder package and how it works.',
                    durationInSeconds: 887,
                  ),
                  Chapter(
                    id: 'build-mobile-responsive-ui',
                    title: 'Building a responsive mobile UI',
                    description: 'Building a mobile UI for the landing page',
                    durationInSeconds: 887,
                  ),
                ],
              ),
            ])
      ];

  Future<Course> getCourseForId(String id) async {
    try {
      // Delay added to avoid execute a sync function as Future
      await Future.delayed(const Duration(microseconds: 100));
      return courses.firstWhere((element) => element.id == id);
    } on StateError catch (_) {
      log.w('Course with id equal "$id" not found');
      throw ResourceNotFoundException(name: 'courses', id: id);
    } catch (e) {
      log.e(e.toString());
      rethrow;
    }
  }
}
