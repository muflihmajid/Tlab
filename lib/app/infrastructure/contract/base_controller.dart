import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/infrastructure/event/connection.dart';
import 'package:clean_arc_flutter/app/infrastructure/event/error.dart';
import 'package:clean_arc_flutter/app/infrastructure/event/reset_ui.dart';
import 'package:clean_arc_flutter/app/infrastructure/view_utils.dart';
import 'package:connectivity/connectivity.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class BaseController extends Controller {
  EventBus _eventBus = AppComponent.getInjector().getDependency<EventBus>();
  bool _internetAvailable = true;
  bool isLoading = false;

  bool get internetAvailable => _internetAvailable;

  @override
  void initListeners() {
    checkInternetConnection();

    _eventBus.on<ResetUIEvent>().listen((event) {
      dismissLoading();
      ViewUtils.dismissProgressDialog();
      refreshUI();
    });

    // Check if data/wifi is active every OS setting change
    _eventBus.on<ConnectionEvent>().listen((event) {
      if (event.isConnected) {
        internetAvailabilityCycle(true);
        refreshUI();
      } else {
        internetAvailabilityCycle(false);
        dismissLoading();
        refreshUI();
      }
    });
  }

  void internetAvailabilityCycle(bool status) {
    if (status) {
      _internetAvailable = status;
      onInternetDisconnected();
    } else {
      _internetAvailable = status;
      onInternetConnected();
    }
  }

  void onError({String title = "Error", String message = "Please try again!"}) {
    _eventBus.fire(ErrorEvent(message));
  }

  void checkInternetConnection() {
    // Check if data/wifi is active every init controller
    Connectivity().checkConnectivity().then((connection) {
      if (connection == ConnectivityResult.none) {
        dismissLoading();
        internetAvailabilityCycle(false);
        refreshUI();
      } else {
        internetAvailabilityCycle(true);
        refreshUI();
      }
    });
  }

  void onInternetConnected() {}

  void onInternetDisconnected() {}

  void onProgressLoading() {
    ViewUtils.showProgressDialog(getContext());
  }

  void onFinishLoading() {
    ViewUtils.dismissProgressDialog();
  }

  void onLoad() {
    isLoading = true;
    refreshUI();
  }

  void dismissLoading() {
    isLoading = false;
  }

  void showLoading() {
    isLoading = true;
  }
}
