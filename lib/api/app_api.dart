import 'package:filledstacks_academy/models/models.dart';

abstract class AppApi {
  Future<List<Course>> getCourses();

  Future<Course> getCourse({required String id});
}
