import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:web_url_by_router/splash_screen.dart';

import 'landing_page.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static Handler _splashHandler =
      Handler(handlerFunc: (context, params) => SplashScreen());

  static Handler _mainHandler = Handler(handlerFunc: (context, params) {
    print('params: $params');
    return LandingPage(
      page: params['name']![0],
    );
  });

  static Handler _mainHandler2 = Handler(handlerFunc: (context, params) {
    return LandingPage(
      // page: 'page',
      page: params['name']![0],
      // extra: 'extra',
      extra: params['extra']![0],
    );
  });

  static void setupRouter() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, dynamic> params) {
      return SplashScreen();
    });

    router.define(
      '/',
      handler: _splashHandler,
    );
    router.define(
      '/main/:name',
      handler: _mainHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      '/main/:name/:extra',
      handler: _mainHandler2,
      transitionType: TransitionType.fadeIn,
    );
  }
}
