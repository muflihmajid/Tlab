import 'package:clean_arc_flutter/app/ui/res/generated/i18n.dart';
import 'package:flutter/material.dart';

class StringUtils {
  static String getAlertContent(BuildContext context, String message) {
    var response;
    switch (message) {
      case "login.fail.salesman_not_registered":
        response = S.of(context).notFound;
        break;
      case "verify_vin.fail.vin_not_found":
        response = S.of(context).apikey;
        break;
      default:
        response = message;
    }

    return response;
  }

  static String getValidTopicName(String str) {
    return str.replaceAll("[^A-Za-z0-9]", "").replaceAll(" ", "").trim().toLowerCase();
  }

  static bool isEmpty(String str) {
    return str == null || "" == str;
  }
}