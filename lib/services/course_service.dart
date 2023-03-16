import 'package:filledstacked_academy/models/models.dart';

class CourseService {
  List<Course> get courses => [
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
            id: 'intro-to-flutter',
            title: 'Intro to Flutter Web',
            chapters: [
              Chapter(
                id: 'html-vs-canvas',
                title: 'Html Vs Canvas',
                description:
                    'Understand the difference between a normal website framework and Flutter web. We look at html vs canvas rendering',
                durationInSeconds: 3578,
              ),
              Chapter(
                id: 'seo-vs-web-app',
                title: 'SEO vs WEb App',
                description:
                    'What is the difference between as SEO built website or a Web Application and why does it matter?',
                durationInSeconds: 322,
              ),
            ],
          ),
          Module(
            id: 'building-ui',
            title: 'Building Flutter Web UI',
            chapters: [
              Chapter(
                id: 'building-landing',
                title: 'Building a Landing Page',
                description:
                    'A follow along tutorial building the landing page for our web app',
                durationInSeconds: 4324,
              ),
              Chapter(
                id: 'basics-of-responsive',
                title: 'Basics of Responsiveness in Flutter',
                description:
                    'Understand the basics of the responsive UI setup we use in Flutter.',
                durationInSeconds: 3433,
              ),
            ],
          ),
          Module(
            id: 'responsive-ui-deepdive',
            title: 'Responsive UI Deepdive',
            chapters: [
              Chapter(
                id: 'the-responsive-builder-pattern',
                title: 'The Responsive Builder Pattern',
                description:
                    'How the Responsive Builder pattern works, what its intended to achieve ad how we should use it',
                durationInSeconds: 1122,
              ),
              Chapter(
                id: 'build-detailed-responsive-ui',
                title: 'Building a Complex Responsive UI',
                description:
                    'A step-by-step guide of building an overly complex responsive UI',
                durationInSeconds: 334,
              ),
              Chapter(
                id: 'alternative-responsive-ui',
                title: 'Alternative responsive Design',
                description:
                    'A look at the different packages on Flutter that provide different types of responsive building patterns for different use cases',
                durationInSeconds: 887,
              ),
            ],
          ),
        ])
      ];

  Future<Course> getCourseForId(String id) async {
    return courses.firstWhere((element) => element.id == id);
  }
}
