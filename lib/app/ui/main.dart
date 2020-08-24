import 'dart:io';

import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/infrastructure/event/connection.dart';
import 'package:clean_arc_flutter/app/infrastructure/event/dio_error.dart';
import 'package:clean_arc_flutter/app/infrastructure/event/error.dart';
import 'package:clean_arc_flutter/app/infrastructure/event/reset_ui.dart';
import 'package:clean_arc_flutter/app/infrastructure/router.dart';
import 'package:clean_arc_flutter/app/misc/constants.dart';
import 'package:clean_arc_flutter/app/ui/pages/splash/view.dart';
import 'package:clean_arc_flutter/app/ui/res/generated/i18n.dart';
import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:clean_arc_flutter/app/misc/string_utils.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:clean_arc_flutter/app/ui/widgets/dialog.dart';

main() {
  DotEnv().load('.env'); // load env
  AppComponent.init(); // init dependency

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp()); // run app
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Router _router;
  static bool isConnectedToInternet = false;
  final EventBus _eventBus =
      AppComponent.getInjector().getDependency<EventBus>();
  final _navigatorKey = GlobalKey<NavigatorState>();
  MyApp() : _router = Router() {
    _initEventListeners();
    _initConnectionListener();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('id'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
    );
  }
  void _handleCheckConnectivity(ConnectivityResult result) async {
    try {
      if (result == ConnectivityResult.none) {
        isConnectedToInternet = false;
        _eventBus.fire(new ConnectionEvent(false));
      } else {
        final connection = await InternetAddress.lookup('google.com');
        if (connection.isNotEmpty && connection[0].rawAddress.isNotEmpty) {
          isConnectedToInternet = true;
          _eventBus.fire(new ConnectionEvent(true));
        }
      }
    } on SocketException catch (_) {
      isConnectedToInternet = false;
      _eventBus.fire(new ConnectionEvent(false));
    }
  }
  void _initConnectionListener() {

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      this._handleCheckConnectivity(result);
    });
  }

  void _initEventListeners() {
    _eventBus.on<ErrorEvent>().listen((event) {});
    _eventBus.on<DioErrorEvent>().listen((event) {
      if (!isConnectedToInternet) {
        _eventBus.fire(new ResetUIEvent());
        return;
      }
      

      Widget iconX = const RotationTransition(
        turns: AlwaysStoppedAnimation(45 / 360),
        child: Icon(
          Icons.add_circle,
          color: AppConstants.COLOR_WHITE,
          size: 24,
        ),
      );
      if (event.code == "401") {
        iconX = Icon(
          Icons.warning,
          color: AppConstants.COLOR_WHITE,
          size: 24,
        );
      }

      showDialog(
          barrierDismissible: false,
          context: _navigatorKey.currentState.overlay.context,
          builder: (context) => CustomDialog.errorDialog(
                icon: iconX,
                context: context,
                title: event.code == "401"
                    ? S.of(context).failed
                    : S.of(context).failed,
                content: event.code == "401"
                    ? S.of(context).apikey
                    : StringUtils.getAlertContent(context, event.message),
                onConfirm: () {
                  Navigator.pop(context);
                  _eventBus.fire(new ResetUIEvent());
                },
              ));
    });
  }
}
