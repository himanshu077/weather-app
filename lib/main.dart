import 'package:flutter/material.dart';
import 'package:weather_app/utils/LocationUtils.dart';
import '../viewController/weather/weather_bloc.dart';

import 'components/constants/AppTheme.dart';
import 'presentation/splashView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/Api/apiService.dart';
import 'services/repo/weatherRepo.dart';
import 'services/storage/sharedPref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref().init();
  LocationUtils();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final _service = ApiService.create();
    final _repo = WeatherRepoImpl(service: _service);

    return MultiBlocProvider(
      providers: [
        // BlocProvider(create: (context) => WeatherBloc(repo: _repo)..add(GetAddressByCordsEvent())),
        // BlocProvider(create: (context) => WeatherBloc(repo: _repo)..add(GetAddressListSearchByName(search: 'tira sujanpur'))),
        BlocProvider(
            create: (context) => WeatherBloc(repo: _repo)..add(StartEvent())),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
