import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components/constants/AppFonts.dart';
import '../../../components/constants/AppIcons.dart';
import '../../../components/constants/AppStrings.dart';
import '../../../components/constants/TextStyles.dart';
import '../../../components/coreComponents/ImageView.dart';
import '../../../components/coreComponents/TextView.dart';
import '../../../viewController/weather/weather_bloc.dart';

class WeatherPresentation extends StatelessWidget {
  const WeatherPresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppFonts.s20),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
      return Column(
        children: [
          const Stack(
            alignment: Alignment.center,
            children: [
               ImageView(url: AppIcons.appLogo, size: 170,margin: EdgeInsets.only(bottom: AppFonts.s24 * 2),),
              Positioned(
                bottom: 0,
                  child:
               TextView(text: '24${AppStrings.degree}',textStyle: TextStyles.semiBold70WhiteShadow,))
            ],
          ),
          const TextView(text: 'Sunny',textStyle: TextStyles.medium16White,),
          const TextView(
            text: 'Feel like 27${AppStrings.degree} | Sat, 13:40',
            textStyle: TextStyles.regular14Grey,
            margin: EdgeInsets.only(bottom: AppFonts.s10),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _tile(icon: AppIcons.humidity, value: '51%'),
              _tile(icon: AppIcons.wind, value: '5km/h'),
              _tile(icon: AppIcons.search, value: '5km/h'),
            ],
          )
        ],
      );
        },
      ),
    );
  }

  Widget _tile({required String icon, required String value}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImageView(url: icon, size: AppFonts.s16,margin: const EdgeInsets.only(right: AppFonts.s7),),
        TextView(text: value,textStyle: TextStyles.medium14White,)
      ],
    );
  }
}