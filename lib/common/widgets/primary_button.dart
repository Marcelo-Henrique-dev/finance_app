import 'package:finance_app/common/constants/app_colors.dart';
import 'package:finance_app/common/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class PirmaryButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final String text;

  const PirmaryButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(38.0)),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(38.0)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: onPressed != null ? AppColors.greenGradient : AppColors.greyGradient
          ),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(38.0)),
          onTap: () {
            onPressed;
          },
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(.circular(38.0))
            ),
            alignment: .center,
            height: 64,
            child: Text(
              text,
              style: AppTextStyles.mediumText18.copyWith(
                color: AppColors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}