import 'package:flutter/painting.dart';

class AppConstants {
  // Primary Color reference https://www.schemecolor.com/mitsubishi-logo-red.php
  static const Color COLOR_PRIMARY_COLOR = Color.fromRGBO(202, 1, 17, 1.0);
  static const Color COLOR_PRIMARY_BACKGROUND =
      Color.fromRGBO(229, 229, 229, 1.0);
  static const Color COLOR_PROFILE_BACKGROUND = Color.fromRGBO(66, 66, 66, 1.0);
  static const Color COLOR_BACKGROUND_FOCUSED =
      Color.fromRGBO(213, 212, 212, 1.0);
  static const Color COLOR_DISABLED_BUTTON = Color.fromRGBO(200, 200, 200, 1.0);
  static const Color COLOR_DISABLED_TEXT = Color.fromRGBO(151, 151, 151, 1.0);
  static const Color COLOR_NOTIFICATION_READ =
      Color.fromRGBO(250, 226, 228, 1.0);
  static const Color COLOR_GREYED_TEXT = Color.fromRGBO(147, 147, 147, 1.0);
  static const Color COLOR_GREYED_TEXT_TRANSPARANT = Color.fromRGBO(147, 147, 147, 0.5);
  static const Color COLORED_GREYED_TEXT_TRANSPARANT = Color.fromRGBO(147, 147, 147, 0.25);
  static const Color COLOR_SUCCESS = Color.fromRGBO(1, 193, 124, 1.0);
  static const Color COLOR_ERROR = Color.fromRGBO(218, 0, 39, 1.0);
  static const Color COLOR_RED_NOTICE = Color.fromRGBO(255, 50, 50, 1.0);
  static const Color COLOR_BLACK = Color.fromRGBO(0, 0, 0, 1.0);
  static const Color COLOR_WHITE = Color.fromRGBO(255, 255, 255, 1.0);
  static const Color COLOR_RED = Color.fromRGBO(255, 0, 0, 1.0);
  static const Color COLOR_PROFILE = Color(0xff333333);
  static const Color COLOR_PROFILE_SILVER = Color.fromRGBO(180,180,180,1.0);
  static const Color COLOR_PROFILE_REGULER = Color(0xffAD8A56);
  static const Color COLOR_PROFILE_GOLD = Color.fromRGBO(239,206,74,1.0);

  // user data
  static const String USER_DATA_ID = "id";
  static const String USER_CHANGE = "change";
  static const String USER_DATA_NAME = "name";
  static const String USER_DATA_SALES_CODE = "sales_code";
  static const String USER_DATA_PHONE = "phone";
  static const String USER_DATA_EMAIL = "email";
  static const String USER_DATA_LEVEL = "level";
  static const String USER_DATA_POSITION = "position";
  static const String USER_DATA_LOCATION = "location";
  static const String USER_DATA_PHOTO = "photo";
  static const String USER_DATA_CURRENT_GRADE = "current_grade";
  static const String USER_DATA_PREV_GRADE = "prev_grade";
  static const String USER_DATA_TEAM_CATEGORY = "team_category";
  static const String USER_DATA_ENTRY_DATE = "entry_date";
  static const String USER_DATA_SUPERVISOR = "supervisor";
  static const String USER_DATA_DEALER_NAME = "dealer_name";
  static const String USER_DATA_DEALER_AREA = "dealer_area";
  static const String USER_DATA_DEALER_CITY = "dealer_city";
  static const String USER_DATA_DEALER_BRANCH = "dealer_branch";
  static const String USER_DATA_DEALER_GROUP = "dealer_group";
  static const String USER_DATA_DEALER_CODE = "dealer_code";
  static const String USER_DATA_TOKEN = "token";
  static const String USER_DATA_EXPIRES_AT = "expires_at";
  static const String USER_DATA_FORGOT_PASSWORD = "forgot_password";
  static const String USER_DATA_HAS_NOTIFICATIONS = "has_notifications";
  static const String USER_DATA_IS_FIRST_TIME = "is_first_time";
  static const String USER_DATA_LOGOUT_REASON = "logout_reason";
  static const String USER_DATA_LAST_USER = "last_user";
  static const String USER_DATA_IS_REGISTERED = "is_registered";
  static const String USER_DATA_APP_INFO = "app_info";
  static const String USER_DATA_FCM_TOKEN = "fcm_token";
  static const String USER_DATA_PASSWORD = "password";
  static const String USER_DATA_SALESMAN_EMAIL = "salesman_email";
  static const String USER_DATA_SALESMAN_PHONE = "salesman_phone";

  static const String USER_DATA_ANALYTIC_DEALER = "dealer_id";
  static const String USER_DATA_ANALYTIC_BRANCH = "branch_id";
  static const String USER_DATA_ANALYTIC_POSITION = "position_id";
  static const String USER_DATA_ANALYTIC_CITY = "city_id";
  static const String USER_DATA_ANALYTIC_PLATFORM = "platform";

  // image data
  static const String IMAGE_DATA_SALESMAN_CUSTOMER = "image_salesman_customer";
  static const String IMAGE_DATA_SERVICE_BOOK = "image_service_book";
  static const String IMAGE_DATA_MY_MITSUBISHI = "image_my_mitsubishi";

  // notifications
  static const String NOTIFICATION_CHANNEL_ID = "sfid_mobile_announcement";
  static const String NOTIFICATION_CHANNEL_NAME = "SFID Mobile";
  static const String NOTIFICATION_CHANNEL_DESCRIPTION = "SFID Mobile Notification Channel";
  static const String NEW_NOTIFICATION = "new_notification";
  static const String NEW_MATERIAL = "new_material";

  static const String URL_CATALOG = "https://www.mitsubishi-motors.co.id/brosur";
  static const String URL_ELEARNING = "https://ktb.docebosaas.com/learn";
  static const String OFFICEVIEW = "https://view.officeapps.live.com/op/view.aspx?src=";
  static const String GOOGLEVIEW ="https://docs.google.com/gview?embedded=true&url=";
}
