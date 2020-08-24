import 'package:clean_arc_flutter/app/ui/pages/pages.dart';
import 'package:clean_arc_flutter/app/ui/pages/weather/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  RouteObserver<PageRoute> routeObserver;

  Router() {
    routeObserver = RouteObserver<PageRoute>();
  }

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.weather:
        return _buildRoute(settings, new WeatherPage());
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
