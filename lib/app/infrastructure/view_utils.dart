import 'package:progress_dialog/progress_dialog.dart';

class ViewUtils {
  static ProgressDialog pr;

  static void showProgressDialog(context) {
    if (pr == null) pr = new ProgressDialog(context);
    pr.show();
  }

  static void dismissProgressDialog() {
    if (pr != null) pr.hide();
  }
}