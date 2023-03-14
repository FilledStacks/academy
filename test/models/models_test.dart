import 'package:filledstacked_academy/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void testMultiple<T>(
  String testLabel, {
  required List<List<dynamic>> testData,
}) {
  for (var testEntry in testData) {
    test('testLabel - ${testEntry[0]}', () {
      final data = testEntry[1];

      final result = (testEntry[2] as Function(T))(data as T);
      expect(result, testEntry[3]);
    });
  }
}

void main() {
  group('ModelsTest -', () {
    group('Chapter -', () {
      testMultiple<Chapter>(
        'isSelected',
        testData: [
          [
            'Given id readme, the chapter should return true',
            Chapter(
              id: 'readme',
              title: 'Readme',
              description: 'Read this before',
              durationInSeconds: 910,
            ),
            (Chapter chapter) => chapter.isSelected(id: 'readme'),
            true,
          ],
          [
            'Given id not_readme, the chapter should return false',
            Chapter(
              id: 'readme',
              title: 'Readme',
              description: 'Read this before',
              durationInSeconds: 910,
            ),
            (Chapter chapter) => chapter.isSelected(id: 'not_readme'),
            false,
          ],
        ],
      );
    });

    group('Module -', () {
      group('isSelected -', () {
        test('Given id readme, the module should return selected', () {
          final module = Module(
            id: 'module1',
            title: 'Prerequisite',
            chapters: [
              Chapter(
                id: 'readme',
                title: 'README',
                description: 'Read me before',
                durationInSeconds: 100,
              ),
              Chapter(
                id: 'installation',
                title: 'Installation',
                description: 'Install what\'s required',
                durationInSeconds: 100,
              ),
            ],
          );

          final result = module.isSelected(chapterId: 'readme');
          expect(result, true);
        });

        test('Given id not_readme, the module should return false', () {
          final module = Module(
            id: 'module1',
            title: 'Prerequisite',
            chapters: [
              Chapter(
                id: 'readme',
                title: 'README',
                description: 'Read me before',
                durationInSeconds: 100,
              ),
              Chapter(
                id: 'installation',
                title: 'Installation',
                description: 'Install what\'s required',
                durationInSeconds: 100,
              ),
            ],
          );

          final result = module.isSelected(chapterId: 'not_readme');
          expect(result, false);
        });
      });
    });
  });
}
