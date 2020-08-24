import 'package:clean_arc_flutter/app/infrastructure/di/controller_module.dart';
import 'package:clean_arc_flutter/app/infrastructure/di/mapper_module.dart';
import 'package:clean_arc_flutter/app/infrastructure/di/presenter_module.dart';
import 'package:clean_arc_flutter/app/infrastructure/di/repository_module.dart';
import 'package:clean_arc_flutter/app/infrastructure/di/root_module.dart';
import 'package:clean_arc_flutter/app/infrastructure/di/use_case_module.dart';
import 'package:injector/injector.dart';

// Commonly here to declare dependency injection
class AppComponent {

  static void init() {
    Injector injector = getInjector();
    RootModule.init(injector);
    MapperModule.init(injector);
    RepositoryModule.init(injector);
    UseCaseModule.init(injector);
    PresenterModule.init(injector);
    ControllerModule.init(injector);
  }

  static Injector getInjector() {
    return Injector.appInstance;
  }
}