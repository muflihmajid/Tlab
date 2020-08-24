import 'package:clean_arc_flutter/app/misc/constants.dart';
import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final dynamic buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  final bool isDisabled, isAutoFocus;
  final double minWidth, height, fontSize, borderRadius;
  final FontWeight buttonTextWeight;
  final Color borderColor;
  final EdgeInsetsGeometry outerPadding;
  final double elevation;

  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const CommonButton(
      {Key key,
      this.onPressed,
      @required this.buttonText,
      this.borderColor = Colors.transparent,
      this.isDisabled = false,
      this.isAutoFocus = false,
      this.minWidth = 88.0,
      this.height = 36.0,
      this.borderRadius = 7.0,
      this.outerPadding = const EdgeInsets.fromLTRB(32.0, 2.0, 32.0, 2.0),
      this.fontSize = 14.0,
      this.buttonColor = AppConstants.COLOR_PRIMARY_COLOR,
      this.buttonTextColor = AppConstants.COLOR_WHITE,
      this.elevation,
      this.buttonTextWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: outerPadding,
      child: ButtonTheme(
        minWidth: minWidth,
        height: height,
        child: RaisedButton(
          autofocus: isAutoFocus,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10),
            side: BorderSide(color: borderColor),
          ),
          onPressed: isDisabled ? null : onPressed,
          disabledColor: AppConstants.COLOR_DISABLED_BUTTON.withOpacity(0.7),
          color: buttonColor,
          textColor: buttonTextColor,
          child: buttonText is String
              ? Text(buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: buttonTextColor == null
                          ? AppConstants.COLOR_WHITE
                          : buttonTextColor,
                      fontWeight: buttonTextWeight,
                      fontFamily: 'MMC'))
              : buttonText,
        ),
      ),
    );
  }
}

/// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
/// Pastikan tidak merusak tampilan yang lainnya
/// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
/// =====================================================
///
class CommonButtonNoPadding extends StatelessWidget {
  final VoidCallback onPressed;
  final dynamic buttonText;
  final Color buttonTextColor;
  final Color buttonColor;
  final bool isDisabled, isAutoFocus;
  final double minWidth, height, fontSize;
  final FontWeight buttonTextWeight;
  final Color borderColor;

  const CommonButtonNoPadding(
      {Key key,
      this.onPressed,
      @required this.buttonText,
      this.borderColor = Colors.transparent,
      this.isDisabled = false,
      this.isAutoFocus = false,
      this.minWidth = 88.0,
      this.height = 36.0,
      this.fontSize = 14.0,
      this.buttonColor = AppConstants.COLOR_PRIMARY_COLOR,
      this.buttonTextColor = AppConstants.COLOR_WHITE,
      this.buttonTextWeight = FontWeight.bold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: EdgeInsets.only(),
      child: ButtonTheme(
        minWidth: minWidth,
        height: height,
        child: RaisedButton(
          autofocus: isAutoFocus,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(7.0),
            side: BorderSide(color: borderColor),
          ),
          onPressed: isDisabled ? null : onPressed,
          disabledColor: AppConstants.COLOR_DISABLED_BUTTON,
          color: buttonColor,
          textColor: buttonTextColor,
          child: buttonText is String
              ? Text(buttonText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fontSize,
                      color: buttonTextColor == null
                          ? AppConstants.COLOR_WHITE
                          : buttonTextColor,
                      fontWeight: buttonTextWeight,
                      fontFamily: 'MMC'))
              : buttonText,
        ),
      ),
    );
  }
}
