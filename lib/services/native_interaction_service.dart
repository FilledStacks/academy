import 'native_interaction_other.dart'
    if (dart.library.js) 'native_interaction_web.dart';

class NativeInteractionService implements NativeInteractionsInterface {
  static NativeInteractionsInterface? _instance;
  static NativeInteractionsInterface get instance {
    _instance ??= NativeInteractionImplementation();

    return _instance!;
  }

  @override
  Future<String> callOpenPopup() => instance.callOpenPopup();
}

abstract class NativeInteractionsInterface {
  Future<String> callOpenPopup();
}
