import 'package:clean_arc_flutter/app/infrastructure/app_component.dart';
import 'package:clean_arc_flutter/app/misc/constants.dart';
import 'package:clean_arc_flutter/app/ui/pages/weather/controller.dart';
import 'package:clean_arc_flutter/app/ui/res/generated/i18n.dart';
import 'package:clean_arc_flutter/app/ui/widgets/button.dart';
import 'package:clean_arc_flutter/app/ui/widgets/list_tile.dart';
import 'package:clean_arc_flutter/app/ui/widgets/loading.dart';
import 'package:clean_arc_flutter/app/ui/widgets/text_input.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:flutter/material.dart';

class WeatherPage extends View {
  WeatherPage({Key key}) : super(key: key);

  @override
  _WeatherPageState createState() => new _WeatherPageState(
      AppComponent.getInjector().getDependency<WeatherController>());
}

class _WeatherPageState extends ViewState<WeatherPage, WeatherController>
    with WidgetsBindingObserver {
  _WeatherPageState(WeatherController controller) : super(controller);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget buildPage() {
    return new Scaffold(
      key: globalKey,
      body: Container(
        alignment: Alignment.topLeft,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              child: CommonTextInput(
                isDense: true,
                isError: false,
                controller: controller.inputCity,
                placeholder: S.of(context).kota,
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              padding: EdgeInsets.fromLTRB(5, 50, 0, 0),
            ),
            Container(
              child: CommonButton(
                minWidth: MediaQuery.of(context).size.width / 10,
                height: 48,
                isDisabled: false,
                buttonText: controller.isLoading
                    ? CommonLoading()
                    : S.of(context).search.toUpperCase(),
                onPressed: () {
                  _onLoginButtonPressed();
                },
              ),
              padding: EdgeInsets.fromLTRB(
                  20, MediaQuery.of(context).size.height * 0.01, 20, 0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: controller.weather.datetime == null
                  ? SizedBox(
                      height: 10,
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 0, 2),
                          child: Text(
                            S.of(context).perkiraan,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                spreadRadius: 0.2,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.height * 0.18,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 0.2,
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            padding: EdgeInsets.only(left: 5),
                            width: MediaQuery.of(context).size.width * 0.97,
                            child: CommonListTile(
                              onPress: () {},
                              city: controller.inputCity.text.toUpperCase(),
                              suhu: controller.weather.main.temp.toString(),
                              description: controller.description == null
                                  ? "-"
                                  : controller.description,
                              humadity:
                                  controller.weather.main.humidity.toString(),
                              visibility:
                                  controller.weather.visibility.toString(),
                              speed: controller.weather.wind.speed.toString(),
                              thumbnailImage: controller.iconweathercurrent,
                              createdAt: DateTime.now().toString(),
                              views: 2,
                              overFlowWidth: 140,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(15, 15, 0, 10),
                          child: Text(
                            S.of(context).perkiraan5,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: controller.isLoading
                              ? Center(child: CommonLoading())
                              : getFaq(),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginButtonPressed() {
    controller.search();
  }

  ListView getFaq() {
    List<Container> items = controller.forecast
        .map(
          (f) => Container(
            padding: EdgeInsets.fromLTRB(5, 2, 5, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  spreadRadius: 0.2,
                  blurRadius: 10,
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.17,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 0.2,
                    blurRadius: 10,
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 5),
              width: MediaQuery.of(context).size.width * 0.97,
              child: CommonListTile(
                onPress: () {},
                city: controller.inputCity.text.toUpperCase(),
                suhu: f.main.temp.toString(),
                description: f.weather[0].description == null
                    ? "-"
                    : f.weather[0].description,
                humadity: f.main.humidity.toString(),
                visibility: f.visibility.toString(),
                speed: f.wind.speed.toString(),
                thumbnailImage: f.icon,
                createdAt: f.dttext,
                overFlowWidth: 140,
              ),
            ),
          ),
        )
        .toList();
    return ListView(children: items);
  }
}
