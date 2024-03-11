import 'package:flutter/material.dart';
import '../viewController/weather/weather_bloc.dart';

import 'components/constants/AppTheme.dart';
import 'presentation/splashView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}

List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => WeatherBloc()),
];
