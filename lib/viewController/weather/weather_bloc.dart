import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/core/failure.dart';
import 'package:weather_app/model/cords.dart';
import 'package:weather_app/presentation/home/HomeView.dart';
import 'package:weather_app/presentation/location/locationOptionsView.dart';
import 'package:weather_app/presentation/location/searchCityView.dart';
import 'package:weather_app/services/repo/weatherRepo.dart';
import 'package:weather_app/services/storage/sharedPref.dart';
import 'package:weather_app/utils/DateTimeUtils.dart';

import '../../model/addressModel.dart';
import '../../utils/LocationUtils.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  late final WeatherRepository _repo;
  Cords? _cords;

  String get appbarDate => DateTimeUtils.getCurrentTimeStamp.ddMMMyyyy;

  String  _appbarLocation = '';
  String get appbarLocation => _appbarLocation;

  List<AddressModel> searchCities = [];

  List<AddressModel> savedCities = [];

  bool citiesEditState = false;
  bool get deleteBtnEdit => savedCities.where((element) => element.selected).isNotEmpty;

  Cords? get cords => _cords;



  void setAppBarLocation(AddressModel data) => _appbarLocation = data.getAddress;

  WeatherBloc({required WeatherRepository repo}) : super(WeatherInitial()) {
    _repo = repo;
    on<StartEvent>(_onStart);
    on<GetCurrentLocationEvent>(_onGetCurrentLocation);
    on<SearchCityEvent>(_onSearchCity);
    on<AddCityEvent>(_onAddCity);
    on<GetAddressByCordsEvent>(_getAddressByCords);
    on<GetAddressListSearchByName>(_getAddressListByName);
    on<ChooseCityForUpdatesEvent>(_onChooseCityForUpdates);
    on<ClearSearchCitiesEvent>(_onClearSearchCities);
    on<EditCityEvent>(_onEditCity);
    on<EditCityStateEvent>(_onEditCityState);
    on<RemoveCitiesEvent>(_onRemoveCities);
  }



  FutureOr<void> _getAddressByCords(
      GetAddressByCordsEvent event, Emitter<WeatherState> emit) async {
    await _repo.getAddressByCords(lat: event.value.lat!, lng: event.value.lng!).then((value) {
      value.fold((l) {
        if (l is ErrorString) {
          print('someError occur ooooo' + l.error);
        } else {
          print('someError occur ooooo');
        }
      }, (address) {
        add(AddCityEvent(value: address));
      });
    });
  }

  FutureOr<void> _getAddressListByName(GetAddressListSearchByName event, Emitter<WeatherState> emit) async{
    await _repo.getAddressByName(name: event.search).then((value) {
      value.fold((l) {
        if (l is ErrorString) {
          print('someError occur' + l.error);
        } else {
          print('someError occur');
        }
      }, (r) => print('got addresss...'));
    });
  }

  FutureOr<void> _onStart(StartEvent event, Emitter<WeatherState> emit) async{
    final cords = await SharedPref.getCords();
    _cords = cords;
    if(this.cords != null ){
      SharedPref.getCities().then((value) {
        savedCities.clear();
        savedCities.addAll(value);
        int index = savedCities.indexWhere((element) => element.isCordsEqual(this.cords!));
        setAppBarLocation(savedCities[index]);
      });
    }
    emit(LauncherState(hasLocation: cords != null));
  }

  FutureOr<void> _onGetCurrentLocation(GetCurrentLocationEvent event, Emitter<WeatherState> emit) async {
    emit(const LoadingState(screenName: LocationSelectorView.name));
    final result = await _getCurrentLocation();
    result.fold((error) {
      print(error.error);
    }, (cord) {
      emit(LocationSuccessState());
      add(GetAddressByCordsEvent(value: cord));
    });
  }

  FutureOr<void> _onSearchCity(SearchCityEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherInitial());
    if(event.value.length > 2){
      await _repo.getAddressByName(name: event.value).then((value) {
        value.fold((failure){
        }, (list){
          searchCities.clear();
          searchCities.addAll(list);
          emit(const SuccessState(screenName: SearchCityView.name));
        });
      });
    }
  }

  FutureOr<void> _onAddCity(AddCityEvent event, Emitter<WeatherState> emit) async{
    emit(WeatherInitial());
    bool cityExits = false;
    if(savedCities.isNotEmpty) cityExits =  savedCities.indexWhere((element) => element == event.value) > -1;

    if(cords == null){
      _cords = Cords.copyFromAddress(data: event.value);
      SharedPref.setCords(lat: _cords!.lat!, lng: cords!.lng!);
      if(savedCities.isEmpty){
        setAppBarLocation(event.value);
      }
    }

    if(!cityExits){
      savedCities.add(event.value);
      SharedPref.setCities(list: savedCities);
    }
    emit(const SuccessState(screenName: ''));
    add(ClearSearchCitiesEvent());
  }

  FutureOr<void> _onChooseCityForUpdates(ChooseCityForUpdatesEvent event, Emitter<WeatherState> emit) async{
    emit(const LoadingState(screenName: HomeView.name));
    setAppBarLocation(event.value);
    _cords = event.value.getCords;

    //TODO Get weather updates here.......
    await Future.delayed(Duration(seconds: 3));
    emit(const SuccessState(screenName: HomeView.name));
  }

  FutureOr<void> _onClearSearchCities(ClearSearchCitiesEvent event, Emitter<WeatherState> emit) async{
    emit(WeatherInitial());
    searchCities.clear();
    emit(const SuccessState(screenName: ''));
  }

  FutureOr<void> _onEditCity(EditCityEvent event, Emitter<WeatherState> emit) async{
    emit(WeatherInitial());
    citiesEditState = event.value;
    if(!event.value){
      for(int i = 0; i < savedCities.length; i++){
        savedCities[i].selected = false;
      }
    }
    emit(const SuccessState(screenName: ''));
  }

  FutureOr<void> _onEditCityState(EditCityStateEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherInitial());
    savedCities[event.index].selected = event.value;
    emit(const SuccessState(screenName: ''));
  }

  FutureOr<void> _onRemoveCities(RemoveCitiesEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherInitial());
    savedCities.removeWhere((element) => element.selected);
    SharedPref.setCities(list: savedCities);
    citiesEditState = false;
    emit(const SuccessState(screenName: ''));
  }
}

Future <Either<ErrorString, Cords>> _getCurrentLocation() async{
  bool status = false;
  if (!(await LocationUtils.hasLocationPermission())) {
    await LocationUtils.getPermission();
    status = await LocationUtils.hasLocationPermission();
  } else {
    status = true;
  }

  if (status) {
    final location = await LocationUtils.getCurrentLocation();
    return Right(Cords(lat: location.latitude,lng: location.longitude));
  } else {
    return const Left(ErrorString(error: 'location permission not granted'));
  }
}




