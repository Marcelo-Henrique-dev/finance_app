// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:finance_app/common/widgets/custom_text_form_field.dart';

class PasswordFormField extends StatefulWidget {

  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const PasswordFormField({
    super.key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.textInputAction,
    this.helperText,
  });

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {

  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      validator: widget.validator,
      obscureText: isHidden,
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      textInputAction: widget.textInputAction,
      sufixIcon: InkWell(
        borderRadius: .circular(23),
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
        ),
        onTap: (){
          log("Pressed");
          setState(() {
            isHidden = !isHidden;
          });
        },
      ),
    );
  }
}