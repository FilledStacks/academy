import 'package:flutter/foundation.dart';

import 'native_interaction_other.dart'
    if (dart.library.js) 'native_interaction_web.dart';

class NativeInteractionService implements NativeInteractionsInterface {
  static NativeInteractionsInterface? _instance;
  static NativeInteractionsInterface get instance {
    if (_instance == null) {
      if (kIsWeb) {
        _instance = NativeInteractionImplementation();
      } else {
        _instance = NativeInteractionImplementation();
      }
    }

    return _instance!;
  }

  @override
  Future<String> callJSPromise() => instance.callJSPromise();

  @override
  Future<String> callOpenTab() => instance.callOpenTab();

  @override
  String getPlatformFromJS() => instance.getPlatformFromJS();
}

abstract class NativeInteractionsInterface {
  String getPlatformFromJS();
  Future<String> callJSPromise();
  Future<String> callOpenTab();
}
