import 'package:flutter/material.dart';
import '/utils/AppExtensions.dart';

import '../../constants/AppColors.dart';
import '../../constants/AppFonts.dart';
import '../../constants/AppIcons.dart';
import '../../constants/TextStyles.dart';
import '../../coreComponents/AppButton.dart';
import '../../coreComponents/ImageView.dart';
import '../../coreComponents/TextView.dart';

class GameOverDialog extends StatelessWidget {
  final Function()? onStart;
  final Function()? onExit;
  final String message;
  final Function()? dismiss;
  const GameOverDialog({super.key, this.onStart, this.onExit, this.dismiss, required this.message});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        context.isPortraitMode ? mainView() : Expanded(child: SingleChildScrollView(
          child: mainView(),
        ))
      ],
    );
  }

  Widget  mainView(){
    return  Column(
      children: [
       const  ImageView(url: AppIcons.backButton,
          tintColor: AppColors.primaryColor,
          size: AppFonts.s40 * 2,),
        TextView(text: message, textStyle: TextStyles.regular16Black,
          textAlign: TextAlign.center,
          margin: const EdgeInsets.only(top: AppFonts.s10, bottom: AppFonts.s30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AppButton(
                padding: const EdgeInsets.symmetric(vertical: AppFonts.s16) ,
                onTap: onStart,
                label: 'Play again',
                labelStyle: TextStyles.medium14White,
              ),
            ),
            const SizedBox(width: AppFonts.s20,),
            Expanded(
              child: AppButton(
                padding: const EdgeInsets.symmetric(vertical: AppFonts.s16) ,
                onTap: onExit,
                label: 'Exit',
                labelStyle: TextStyles.medium14White,
              ),
            ),
          ],
        )


      ],
    );

  }
}
