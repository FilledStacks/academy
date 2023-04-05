@JS()
library app_function.js;

import 'dart:js' as js;

import 'package:js/js.dart';
import 'package:js/js_util.dart';

import 'native_interaction_service.dart';

@JS('jsPromiseFunction')
external dynamic _jsPromiseFunction(String message);

@JS('jsOpenTabFunction')
external dynamic _jsOpenTabFunction(String url);

class NativeInteractionImplementation implements NativeInteractionsInterface {
  @override
  String getPlatformFromJS() {
    return js.context.callMethod('getPlatform');
  }

  @override
  Future<String> callJSPromise() async {
    return await promiseToFuture(_jsPromiseFunction("I am back from JS"));
  }

  @override
  Future<String> callOpenTab() async {
    return await promiseToFuture(_jsOpenTabFunction('https://google.com/'));
  }
}
