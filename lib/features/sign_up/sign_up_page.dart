// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:finance_app/common/utils/validator.dart';
import 'package:finance_app/common/widgets/custom_text_form_field.dart';
import 'package:finance_app/common/widgets/password_form_field.dart';
import 'package:finance_app/features/sign_up/sign_up_controller.dart';
import 'package:finance_app/features/sign_up/sign_up_state.dart';
import 'package:flutter/material.dart';

import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:finance_app/common/widgets/multi_text_button.dart';
import 'package:finance_app/common/widgets/primary_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _controller = SignUpController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          builder: (context) => Center(child: CircularProgressIndicator()),
        );
      }
      if (_controller.state is SignUpSuccesState) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Scaffold(body: Center(child: Text('Nova Tela'))),
          ),
        );
      }
      if (_controller.state is SignUpErrorState) {
        showDialog(
          context: context,
          builder: (context) => SizedBox(
            height: 150,
            child: Text("Erro ao logar, tente novamente"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: ListView(
          children: [
            Text(
              'Start Saving \n Your Money!',
              textAlign: .center,
              style: AppTextStyles.mediumText.copyWith(
                color: AppColors.greenTwo,
              ),
            ),
            Image.asset('assets/images/sign_up_board.png'),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: "John Doe",
                    labelText: "Your name",
                    textInputAction: TextInputAction.next,
                    validator: Validator.validateName,
                  ),
                  CustomTextFormField(
                    hintText: 'email@email.com',
                    labelText: 'your email',
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    validator: Validator.validateEmail,
                  ),
                  PasswordFormField(
                    controller: _passwordController,
                    labelText: 'choose your password',
                    hintText: '*********',
                    textInputAction: .next,
                    helperText:
                        "Must have at least 8 characters, 1 capital letter and 1 number",
                    validator: Validator.validatePassword,
                  ),
                  PasswordFormField(
                    labelText: 'confirm your password',
                    hintText: '*********',
                    textInputAction: .done,
                    validator: (value) => Validator.validateConfirmPassword(
                      value,
                      _passwordController.text,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 40, right: 40),
              child: PirmaryButton(
                text: 'Sign Up',
                onPressed: () {
                  final valid =
                      _formKey.currentContext != null &&
                      _formKey.currentState!.validate();
                  if (valid) {
                    _controller.doSignUp();
                  } else {
                    log("Erro ao registrar!");
                  }
                },
              ),
            ),
            MultiTextButton(
              children: [
                Text(
                  'Already have account? ',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.grey,
                  ),
                ),
                Text(
                  'Log In',
                  style: AppTextStyles.smallText.copyWith(
                    color: AppColors.greenTwo,
                  ),
                ),
              ],
              onPressed: () => log("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
