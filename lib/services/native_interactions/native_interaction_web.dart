@JS()
library app_functions.js;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'native_interaction_service.dart';

@JS('jsOpenPopup')
external dynamic _jsOpenPopup(String message);

class NativeInteractionImplementation implements NativeInteractionInterface {
  @override
  Future<String> openPopup() async {
    return await promiseToFuture(_jsOpenPopup('https://google.com/'));
  }
}
