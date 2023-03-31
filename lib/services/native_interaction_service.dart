export 'native_interaction_mobile.dart'
    if (dart.library.js) 'native_interaction_web.dart'
    if (dart.library.io) 'native_interaction_mobile.dart';
