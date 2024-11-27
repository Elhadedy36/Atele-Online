

import 'package:atele_online/core/functions/navigation.dart';
import 'package:atele_online/core/utils/app_strings.dart';
import 'package:atele_online/core/widgets/custom_button.dart';
import 'package:atele_online/feature/onboarding/data/models/on_boarding_model.dart';

import 'package:flutter/material.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({super.key, required this.currentIndex, required this.controller});
final int currentIndex;
final PageController controller;
  @override
  Widget build(BuildContext context) {

if(currentIndex == onBoardingData.length - 1)
{
     return Column(
                      children: [
                        CustomBtn(
                          text: 'Create account',
                          onPressed: () { 
                            customNavigaeReplacement(context, path:   '/signUp');}
                        ),
                        SizedBox(height: 16,),
                        GestureDetector(onTap: () {
                          customNavigaeReplacement(context,path:  '/signIn');
                        },child: Text('AppStrings.loginNow',)),
                      ],
                    );
}else
{
  return
   CustomBtn(
                      text: 'next',
                      onPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInCirc);
                      },
                    );
}
    
  }
}