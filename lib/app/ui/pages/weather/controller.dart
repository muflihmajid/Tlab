import 'package:clean_arc_flutter/app/infrastructure/contract/base_controller.dart';
import 'package:clean_arc_flutter/app/misc/user_data.dart';
import 'package:clean_arc_flutter/app/ui/pages/weather/presenter.dart';
import 'package:clean_arc_flutter/domains/entities/forecast.dart';
import 'package:clean_arc_flutter/domains/entities/weather.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherController extends BaseController {
  WeatherPresenter _presenter;
  WeatherCurrent _weather;
  UserData _userData;
  String _description, _iconweather, _iconweathercurent;

  List<WeatherForecast> _forecast = <WeatherForecast>[];
  List<WeatherIn> _weatherin = <WeatherIn>[];
  bool loading = false;

  TextEditingController _inputCity = new TextEditingController();
  String get iconweathercurrent => _iconweathercurent;

  String get iconweather => _iconweather;
  String get description => _description;
  TextEditingController get inputCity => _inputCity;
  WeatherCurrent get weather => _weather;
  List<WeatherForecast> get forecast => _forecast;

  WeatherController(this._presenter, this._userData) : super() {
    _weather = WeatherCurrent();
    _userData.loadData();
    if (_userData.namecity.isNotEmpty) {
      _inputCity.text = _userData.namecity;
    }
    _inputCity.addListener(_onInputChange);
  }

  void search() {
    showLoading();
    refreshUI();
    _userData.namecity = _inputCity.text;
    _userData.save();
    _presenter.onLoadWeather(params: {
      "q": _inputCity.text,
      "appid": DotEnv().env['APIKEY'],
    });
  }

  String iconCurent(String data) {
    if (data == "Clear") {
      _iconweathercurent = 'lib/app/ui/assets/images/clear.png';
    } else if (data == "Clouds") {
      _iconweathercurent = 'lib/app/ui/assets/images/Clouds.png';
    } else if (data == "Rain") {
      _iconweathercurent = 'lib/app/ui/assets/images/rain.png';
    }
    return _iconweathercurent;
  }

  String icon(String data) {
    if (data == "Clear") {
      _iconweather = 'lib/app/ui/assets/images/clear.png';
      refreshUI();
    } else if (data == "Clouds") {
      _iconweather = 'lib/app/ui/assets/images/Clouds.png';
      refreshUI();
    } else if (data == "Rain") {
      _iconweather = 'lib/app/ui/assets/images/rain.png';
      refreshUI();
    }
    return _iconweather;
  }

  @override
  void initListeners() {
    super.initListeners();

    _presenter.weatherOnNext = (WeatherCurrent weather) {
      _weather = weather;
      print("masuk on next");
      refreshUI();
    };

    _presenter.weatherOnComplete = () async {
      _description = weather.weather[0].description;
      iconCurent(weather.weather[0].main);
      _presenter.onLoadForecast(params: {
        "q": _inputCity.text,
        "appid": DotEnv().env['APIKEY'],
      });
    };

    _presenter.weatherOnError = (e) {
      // do log here
      dismissLoading();
    };

    _presenter.forecastOnNext = (Forecast forecast) {
      _forecast.addAll(forecast.list);
      _weatherin.addAll(forecast.weather);
      refreshUI();
    };

    _presenter.forecastOnComplete = () async {
      for (int i = 0; i < _forecast.length; i++) {
        if (_forecast[i].weather == null) {
          _forecast[i].weather = List();
        }
        _forecast[i].weather.add(_weatherin[i]);
        if (_forecast[i].weather[0].main == "Clear") {
          _iconweather = 'lib/app/ui/assets/images/clear.png';
          _forecast[i].icon=_iconweather;
          refreshUI();
        } else if (_forecast[i].weather[0].main == "Clouds") {
          _iconweather = 'lib/app/ui/assets/images/Clouds.png';
          _forecast[i].icon=_iconweather;
          refreshUI();
        } else if (_forecast[i].weather[0].main == "Rain") {
          _iconweather = 'lib/app/ui/assets/images/rain.png';
          _forecast[i].icon=_iconweather;
          refreshUI();
        }
        print("icon");
        refreshUI();
      }
      dismissLoading();
    };

    _presenter.forecastOnError = (e) {
      // do log here
      print("eror ini forecast $e");
      dismissLoading();
    };
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }

  void _onInputChange() {
    //send data
    // _presenter.onLoadWeather(params: {
    //   "q": _inputCity.text,
    //   "appid": DotEnv().env['APIKEY'],
    // });
  }
}

class ErrorMessage {
  String employeecode = '';
  bool isValid() {
    return employeecode.isEmpty ? true : false;
  }
}
