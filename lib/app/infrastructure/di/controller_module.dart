import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/splash/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/weather/controller.dart';
import 'package:clean_arc_flutter/app/ui/pages/weather/presenter.dart';
import 'package:injector/injector.dart';

class ControllerModule {
  static void init(Injector injector) {
    injector.registerDependency<SplashController>((Injector injector) {
      return SplashController(injector.getDependency<UserData>());
    });
    injector.registerDependency<WeatherController>((Injector injector) {
      return WeatherController(
          injector.getDependency<WeatherPresenter>(),
          injector.getDependency<UserData>());
    });
  }
  
}
