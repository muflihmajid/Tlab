import 'package:clean_arc_flutter/domains/entities/forecast.dart';
import 'package:clean_arc_flutter/domains/entities/weather.dart';
import 'package:clean_arc_flutter/use_cases/forecast_weather/forecast.dart';
import 'package:clean_arc_flutter/use_cases/weather_current/weather.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class WeatherPresenter extends Presenter {
  GetWeatherUseCase _usecase;
  GetForcastUsecase _usecaseforecast;

  Function weatherOnNext;
  Function weatherOnComplete;
  Function weatherOnError;

  Function forecastOnNext;
  Function forecastOnComplete;
  Function forecastOnError;

  WeatherPresenter(
      GetWeatherUseCase usecase, GetForcastUsecase usecaseforecast) {
    _usecase = usecase;
    _usecaseforecast = usecaseforecast;
  }

  void onLoadWeather({Map<String, String> params = const {}}) {
    _usecase.execute(_GetWeatherUseCase(this), params);
  }

  void onLoadForecast({Map<String, String> params = const {}}) {
    _usecaseforecast.execute(_GetForecastUseCase(this), params);
  }

  void dispose() {
    _usecase.dispose();
    _usecaseforecast.dispose();
  }
}

class _GetForecastUseCase implements Observer<Forecast> {
  WeatherPresenter _presenter;

  _GetForecastUseCase(this._presenter);

  void onNext(Forecast weather) {
    _presenter.forecastOnNext(weather);
  }

  void onComplete() {
    _presenter.forecastOnComplete();
  }

  void onError(e) {
    _presenter.forecastOnError(e);
  }
}

class _GetWeatherUseCase implements Observer<WeatherCurrent> {
  WeatherPresenter _presenter;

  _GetWeatherUseCase(this._presenter);

  void onNext(WeatherCurrent weather) {
    _presenter.weatherOnNext(weather);
  }

  void onComplete() {
    _presenter.weatherOnComplete();
  }

  void onError(e) {
    _presenter.weatherOnError(e);
  }
}
