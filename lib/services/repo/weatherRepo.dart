import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/model/addressModel.dart';
import 'package:weather_app/services/Api/apiService.dart';

abstract class WeatherRepository{
  Future<Either<Failure,AddressModel>> getAddressByCords({required double lat, required double lng});
  Future<Either<Failure,List<AddressModel>>> getAddressByName({required String name});
}

class WeatherRepoImpl extends WeatherRepository{
  final ApiService _service;

  WeatherRepoImpl({required ApiService service}) : _service = service;

  @override
  Future<Either<Failure, AddressModel>> getAddressByCords({required double lat, required double lng}) async{
    try{
      final response = await _service.getAddressByCords(lat, lng);
      final map = jsonDecode(response.bodyString) as Map<String,dynamic>;
      if(response.isSuccessful){
        final obj = AddressModel.fromJson_Cord(map);
        return Right(obj);
      }else{
        return Left(ErrorString(error: map['error']['message']));
      }
    }catch(e){
      return Left(ErrorString(error: 'expection :: '+e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AddressModel>>> getAddressByName({required String name}) async{
    try{
      final response = await _service.getAddressByName(name);
      final data = jsonDecode(response.bodyString) as Map<String,dynamic>;
       if(response.isSuccessful){
        final list = data['results'] ?? [];
        final obj = List<AddressModel>.from(list.map((json)=> AddressModel.fromJson_Name(json)));
        return Right(obj);
      }else{
        return Left(ErrorString(error: response.bodyString));
      }
    }catch(e){
      return Left(ErrorString(error: 'expection :: '+e.toString()));
    }
  }

}