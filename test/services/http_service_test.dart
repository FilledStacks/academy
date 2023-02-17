import 'package:flutter_test/flutter_test.dart';
import 'package:filledstacked_academy/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('HttpServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
