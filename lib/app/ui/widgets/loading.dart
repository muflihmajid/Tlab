import 'package:clean_arc_flutter/app/misc/constants.dart';
import 'package:flutter/material.dart';

class CommonLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: AppConstants.COLOR_WHITE,
      valueColor: new AlwaysStoppedAnimation<Color>(AppConstants.COLOR_PRIMARY_COLOR),
    );
  }
}
