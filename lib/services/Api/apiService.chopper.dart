// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$ApiService extends ApiService {
  _$ApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = ApiService;

  @override
  Future<Response<dynamic>> getAddressByCords(
    num lat,
    num lng,
  ) {
    final Uri $url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?lat=${lat}&lon=${lng}&format=json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getAddressByName(String name) {
    final Uri $url = Uri.parse(
        'https://geocoding-api.open-meteo.com/v1/search?name=${name}&format=json');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
