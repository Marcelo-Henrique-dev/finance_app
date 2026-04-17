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
  
  const CustomTextFormField({
    super.key,
    this.padding,
    this.hintText,
    this.labelText,
    this.textCapitalization,
    this.controller,
    this.textInputType,
    this.textInputAction,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  final defaultBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColors.greenLigthTwo,
    ),
    borderRadius: BorderRadius.all(Radius.circular(15),),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 24,
      ),
      child: TextFormField(
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hintText,
          labelText: widget.labelText?.toUpperCase(),
          labelStyle: AppTextStyles.inputLabelText.copyWith(
            color: AppColors.grey
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