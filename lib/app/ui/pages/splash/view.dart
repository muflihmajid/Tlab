import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/splash/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class SplashPage extends View {
  SplashPage({Key key}) : super(key: key);
  @override
  _SplashPageState createState() => new _SplashPageState(
      SplashController(AppComponent.getInjector().getDependency<UserData>()));
}

class _SplashPageState extends ViewState<SplashPage, SplashController> {
  _SplashPageState(SplashController controller) : super(controller);
  Image splashImage;

  @override
  void initState() {
    splashImage = Image.asset(
      'lib/app/ui/assets/images/Lancong.png',
      width: 400,
      height: 400,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(splashImage.image, context);
  }

  @override
  Widget buildPage() {
    return Scaffold(
      key: globalKey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: Container(
                child: splashImage,
              ),
            ),
            SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
