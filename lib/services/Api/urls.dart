
class UrlKeys{
  static const String lat = 'lat';
  static const String lng = 'lng';
  static const String name = 'name';
}


class Urls{
  static const String baseUrl = 'https://api.open-meteo.com/v1';
  // static const String baseUrl = 'https://api.open-meteo.com/v1/forecast?';


  static const String openStreetBaseUrl = 'https://nominatim.openstreetmap.org';
  static const String getAddressByCords = '$openStreetBaseUrl/reverse?lat={${UrlKeys.lat}}&lon={${UrlKeys.lng}}&format=json';
  static const String getAddressByName = 'https://geocoding-api.open-meteo.com/v1/search?name={${UrlKeys.name}}&format=json';
}