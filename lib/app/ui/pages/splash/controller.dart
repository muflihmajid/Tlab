import 'dart:async';
import 'package:clean_arc_flutter/app/infrastructure/contract/base_controller.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/pages.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends BaseController {
  UserData _sp;


  SplashController(this._sp) : super() {
    _navigate();
  }

  @override
  void initListeners() {
    super.initListeners();
  }

  _navigate() {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, () {
      return Navigator.pushReplacementNamed(getContext(), Pages.weather);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
