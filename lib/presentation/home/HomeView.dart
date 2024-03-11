import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/AppExtensions.dart';

import '../../components/constants/AppFonts.dart';
import '../../viewController/weather/weather_bloc.dart';
import '../cities/ManageCitiesView.dart';
import 'components/HomeAppBar.dart';
import 'components/HomeForecast.dart';
import 'components/WeatherPresentation.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  void _forecastClickAction() {}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HomeAppBar(
              onTap: ()=> context.pushNavigator(const ManageCitiesView()),
            ),
            Expanded(child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: AppFonts.s20),
              child: BlocConsumer<WeatherBloc, WeatherState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const WeatherPresentation(),
                      const SizedBox(height: AppFonts.s10,),
                      HomeForecast(onCardClick: _forecastClickAction,)
                    ],
                  );
                },
              ),
            ))
          ],
        ),
      ),
    );
  }
}
