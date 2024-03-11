import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/AppExtensions.dart';
import '../../components/constants/AppFonts.dart';
import '../../components/constants/AppIcons.dart';
import '../../components/constants/AppStrings.dart';
import '../../components/constants/TextStyles.dart';
import '../../components/coreComponents/ImageView.dart';
import '../../components/coreComponents/TextView.dart';
import '../../components/widgets/AppBar2.dart';
import '../../viewController/weather/weather_bloc.dart';
import '../home/components/HomeForecast.dart';

class ManageCitiesView extends StatefulWidget {
  const ManageCitiesView({super.key});

  @override
  State<ManageCitiesView> createState() => _ManageCitiesViewState();
}

class _ManageCitiesViewState extends State<ManageCitiesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppBar2(
                title: 'Manage Cities',
                titleStyle: TextStyles.medium20White,
                onLeadTap: context.pop,
              ),
              Expanded(
                  child: BlocConsumer<WeatherBloc, WeatherState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return ListView.separated(
                      padding: const EdgeInsets.only(
                        top: AppFonts.s20,
                        left: AppFonts.s20,
                        right: AppFonts.s20,
                        bottom: 100,
                      ),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => _card(),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: AppFonts.s20,
                          ),
                      itemCount: 20);
                },
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(Icons.add),
        ));
  }

  Widget _card() {
    return cardContainer(
        child: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ImageView(
                          url: AppIcons.location,
                          size: 10,
                          margin: EdgeInsets.only(right: 3),
                        ),
                        TextView(
                          text: 'City Name',
                          textStyle: TextStyles.semiBold16White,
                        ),
                      ],
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      text: '6${AppStrings.degree}',
                      textStyle: TextStyles.medium20White,
                    ),
                    TextView(
                      text: 'Sunny',
                      textStyle: TextStyles.regular12White,
                    ),
                  ],
                ))
          ],
        ),
        onTap: () {});
  }
}
