import 'package:clean_arc_flutter/app/misc/constants.dart';
import 'package:flutter/material.dart';

class CommonTextInput extends StatelessWidget {
  final TextStyle textStyle, textInputStyle;
  final bool isError, isDense,readonly,interactive;
  final String errorText;
  final TextEditingController _controller;
  final FormFieldValidator<String> validator;
  final String placeholder;
  final bool isPassword;
  final double elevation;
  final Widget prefixIcon, suffixIcon;
  final bool textObscured;
  final Function onVisibilityPressed;
  final TextInputType keyboardType;
  final EdgeInsetsGeometry outerPadding, innerPadding;
  
  /// HATI-HATI KETIKA MENGEDIT REUSABLE WIDGET/COMPONENT
  /// Pastikan tidak merusak tampilan yang lainnya
  /// Karena REUSABLE WIDGET/COMPONENT memiliki arti widget/component ini dipakai di berbagai screen/layar
  const CommonTextInput(
      {Key key,
      @required TextEditingController controller,
      this.textStyle,
      this.textInputStyle,
      this.onVisibilityPressed,
      this.keyboardType,
      this.innerPadding = const EdgeInsets.symmetric(vertical: 15),
      this.textObscured = true,
      this.isError = false,
      this.readonly = false,
      this.interactive = true,
      this.errorText,
      this.validator,
      this.isDense = false,
      this.elevation = 4.0,
      this.outerPadding = const EdgeInsets.fromLTRB(32.0, 0.5, 32.0, 0),
      this.prefixIcon = const Icon(Icons.person),
      this.suffixIcon = const Icon(
        Icons.error_outline,
        size: 30,
        color: Color.fromRGBO(255, 0, 0, 1.0),
      ),
      this.placeholder,
      this.isPassword = false})
      : _controller = controller,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        key: key,
        padding: outerPadding,
        child: Column(
          children: <Widget>[
            Material(
              elevation: elevation,
              shadowColor: AppConstants.COLOR_BLACK,
              borderRadius: BorderRadius.circular(10.0),
              child: TextFormField(
                
                readOnly: readonly,
                controller: _controller,
                keyboardType: keyboardType,
                obscureText: _showPassword(),
                enableInteractiveSelection: interactive,
                validator: validator,
                style: textInputStyle,
                decoration: new InputDecoration(
                    hintText: placeholder,
                    hintStyle: textStyle,
                    isDense: isDense,
                    prefixIcon: prefixIcon,
                    contentPadding: innerPadding,
                    suffix: isError && isPassword
                        ? Icon(
                            Icons.error_outline,
                            size: 25,
                            color: Color.fromRGBO(255, 0, 0, 1.0),
                          )
                        : null,
                    suffixIcon: _suffixIcon(),
                    fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                    filled: true,
                    focusedBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: new BorderSide(
                            color: isError
                                ? AppConstants.COLOR_RED
                                : AppConstants.COLOR_WHITE,
                            width: 1.0)),
                    enabledBorder: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: new BorderSide(
                            color: isError
                                ? AppConstants.COLOR_RED
                                : AppConstants.COLOR_WHITE,
                            width: 1.0))),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 3, 0, 8),
                child: isError
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            isError ? errorText : '',
                            style: TextStyle(
                                color: AppConstants.COLOR_RED,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.000005)),
          ],
        ));
  }

  Widget _suffixIcon() {
    if (isPassword) {
      return IconButton(
        onPressed: isPassword ? onVisibilityPressed : null,
        icon: textObscured
            ? Icon(
                Icons.visibility_off,
              )
            : Icon(
                Icons.visibility,
              ),
      );
    }
    return isError ? suffixIcon : null;
  }

  bool _showPassword() {
    if (isPassword) {
      return textObscured;
    }
    return false;
  }
}
