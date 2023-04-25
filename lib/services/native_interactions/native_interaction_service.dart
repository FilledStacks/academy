import 'native_interaction_other.dart'
    if (dart.library.js) 'native_interaction_web.dart';

class NativeInteractionService implements NativeInteractionInterface {
  static NativeInteractionInterface? _instance;
  static NativeInteractionInterface get instance {
    _instance ??= NativeInteractionImplementation();

    return _instance!;
  }

  @override
  Future<String> openPopup() => instance.openPopup();
}

abstract class NativeInteractionInterface {
  Future<String> openPopup();
}
