class Endpoints {
  String baseUrl;

  Endpoints(String baseUrl) {
    this.baseUrl = baseUrl;
  }

  String weathercur() {
    return '/data/2.5/weather';
  }

  String forecast() {
    return '/data/2.5/forecast';
  }

}
