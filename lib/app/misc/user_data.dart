import 'package:clean_arc_flutter/app/misc/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  // basic profile
  String namecity;

  UserData() {
    this.loadData();
  }
  void loadData() {
    this._getSharedPreferences().then((sp) {
      this.namecity = sp.getString(AppConstants.USER_DATA_NAME) ?? "";
    });
  }

  void clear() {
    this._getSharedPreferences().then((sp) {
      this.clearProperties();
      sp.clear();
    });
  }

  void clearWithCallback(Function callback) {
    this._getSharedPreferences().then((sp) {
      sp.clear().then((onValue) {
        this.clearProperties();
        callback();
      });
    });
  }

  void clearProperties() {
    this.namecity = null;
  }

  Future<void> save() {
    return this._getSharedPreferences().then((sp) {
      sp.setString(AppConstants.USER_DATA_NAME, this.namecity);
    });
  }


  Future<SharedPreferences> _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}
