// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:finance_app/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/widgets/multi_text_button.dart';
import 'package:finance_app/common/widgets/primary_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 60,
          bottom: 40,
        ),
        child: ListView(
          children: [
            Text(
              'Start Saving \n Your Money!',
              textAlign: .center,
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenLigthTwo
              ),
            ),
            Image.asset(
              'assets/images/sign_up_board.png'
            ),
            Form(
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: "John Doe",
                    labelText: "Your name",
                    textInputType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 40,
                    right: 40,
                  ),
                  child: PirmaryButton(
                    text: 'Sign Up',
                    onPressed: () => log('Register'),
                  ),
                ),
                MultiTextButton(
                  children: [
                    Text(
                      'Already have account? ',
                      style: AppTextStyles.smallText.copyWith(
                        color: AppColors.grey
                      ),
                    ),
                    Text(
                      'Log In',
                      style: AppTextStyles.smallText.copyWith(
                        color: AppColors.greenLigthTwo
                      ),
                    )
                  ],
                  onPressed: () => log("Register"),  
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}