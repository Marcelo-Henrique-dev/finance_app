import 'dart:developer';

import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final TextCapitalization? textCapitalization;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Widget? sufixIcon;
  final bool? obscureText;
  final FormFieldValidator<String>? validator;
  final String? helperText;
  
  const CustomTextFormField({
    super.key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.textInputType,
    this.textInputAction,
    this.sufixIcon,
    this.obscureText,
    this.validator,
    this.helperText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenTwo,
    ),
    borderRadius: BorderRadius.all(Radius.circular(15),),
  );

  String? _helperText;

  @override
  void initState() {
    super.initState();
    _helperText = widget.helperText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: TextFormField(
        onChanged: (value) {
          if(value.length == 1){
            setState(() {
              _helperText = null;
            });
          } else if(value.isEmpty){
            setState(() {
              _helperText = widget.helperText;  
            });
          }
        },
        validator: widget.validator,
        obscureText: widget.obscureText ?? false,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        controller: widget.controller,
        decoration: InputDecoration(
          helperText: _helperText,
          helperMaxLines: 3,
          suffixIcon: widget.sufixIcon,
          hintText: widget.hintText,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputText.copyWith(
            color: AppColors.grey
          ),
          hintStyle: AppTextStyles.inputHintText.copyWith(
            color: AppColors.greenTwo
          ),
          focusedBorder: defaultBorder,
          errorBorder: defaultBorder.copyWith(
            borderSide: BorderSide(
              color: Colors.red
            ),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: BorderSide(
              color: Colors.red
            ),
          ),
          enabledBorder: defaultBorder,
          disabledBorder: defaultBorder,
        ),
      ),
    );
  }
}