import 'package:flutter/material.dart';

import '../../../components/constants/AppColors.dart';
import '../../../components/constants/AppFonts.dart';
import '../../../components/constants/AppIcons.dart';
import '../../../components/constants/AppStrings.dart';
import '../../../components/constants/TextStyles.dart';
import '../../../components/coreComponents/ImageView.dart';
import '../../../components/coreComponents/TapWidget.dart';
import '../../../components/coreComponents/TextView.dart';

class HomeForecast extends StatelessWidget {
  final Function() onCardClick;
  const HomeForecast({super.key, required this.onCardClick});

  @override
  Widget build(BuildContext context) {
    const hPadding =
        EdgeInsets.symmetric(horizontal: AppFonts.s20, vertical: 5);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header('Hourly Forecast'),
        SizedBox(
          height: 140,
          child: ListView.separated(
              padding: hPadding,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) => hourlyTile(onTap: onCardClick),
              separatorBuilder: (context, index) => const SizedBox(
                    width: AppFonts.s16,
                  ),
              itemCount: 10),
        ),
        header('Daily Forecast'),
        ListView.separated(
            padding: hPadding,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => dailyTile(onTap: onCardClick),
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppFonts.s12),
            itemCount: 10)
      ],
    );
  }

  Widget header(text) {
    return TextView(
      text: text,
      textStyle: TextStyles.semiBold16White,
      margin: const EdgeInsets.only(
          top: AppFonts.s20,
          bottom: AppFonts.s7,
          left: AppFonts.s20,
          right: AppFonts.s20),
    );
  }

  Widget dailyTile({required Function() onTap}) {
    return cardContainer(
        onTap: onTap,
        child: const Row(
          children: [
            Expanded(
                flex: 5,
                child: TextView(
                  text: 'Today',
                  textStyle: TextStyles.medium14White,
                )),
            ImageView(
              url: AppIcons.appLogo,
              size: 30,
            ),
            Expanded(
                flex: 4,
                child: TextView(
                  text: '24${AppStrings.degree}/24${AppStrings.degree}',
                  textAlign: TextAlign.end,
                  textStyle: TextStyles.medium14White,
                )),
          ],
        ));
  }

  Widget hourlyTile({required Function() onTap}) {
    return cardContainer(
        onTap: onTap,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextView(
              text: '12:30',
              textStyle: TextStyles.medium16White,
            ),
            ImageView(
                url: AppIcons.appLogo,
                size: 40,
                margin: EdgeInsets.symmetric(vertical: 5)),
            TextView(
              text: '27${AppStrings.degree}',
              textStyle: TextStyles.medium16White,
            ),
          ],
        ));
  }
}

Widget cardContainer({required Widget child,  Function()? onTap, double? width, Color? bgColor}) {
  const radius = AppFonts.s10;
  return Stack(
    children: [
      Container(
        width: width,
        padding: const EdgeInsets.all(AppFonts.s16),
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.grey20.withOpacity(0.2),
            borderRadius: BorderRadius.circular(radius)),
        child: child,
      ),
      Positioned.fill(
          child: TapWidget(
            radius: radius,
            onTap: onTap,
          ))
    ],
  );
}
