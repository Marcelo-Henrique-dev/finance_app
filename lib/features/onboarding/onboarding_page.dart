// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:finance_app/common/widgets/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: AppColors.iceWhite,
              child: Image.asset(
                'assets/images/man.png'
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.white,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Spend Smarter \n Save More',
                      style: AppTextStyles.mediumText.copyWith(color: AppColors.greenLigthTwo),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PirmaryButton(text: 'Get Starded', onPressed: (){},),
                    ),
                    Text(
                      'Already Habe Account? Log In',
                      style: AppTextStyles.smallText.copyWith(color: AppColors.grey),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}