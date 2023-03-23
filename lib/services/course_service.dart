import 'package:filledstacked_academy/models/models.dart';

class CourseService {
  List<Course> get courses => [
        Course(
          id: 'flutter-web',
          title: 'Master Flutter on The Web',
          description: '''
The course teaches patterns, file layouts and development principles used to build the FilledStacks Academy. Yes, the website you’re using right now. 

By the end of this course you will have built the first version of the Academy with me.''',
          perks: [
            '📖 Lifetime Access',
            '⭐️ Private Slack Support',
            '🔥️ 75% Discount on Written Version',
          ],
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
                  id: 'app-intro-services',
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
          ],
        )
      ];

  Future<Course?> getCourseForId(String id) async {
    return courses.firstWhere((element) => element.id == id);
  }
}
