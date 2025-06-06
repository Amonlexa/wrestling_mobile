import 'package:flutter/material.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_config.dart';


class WrestlingFormField extends StatelessWidget {

  final ValueChanged<String> onChanged;
  final int? maxLength;
  final int minLine;
  final int? maxLine;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;

  const WrestlingFormField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.onChanged,
    this.hintText = '',
    this.maxLength,
    this.minLine = 1,
    this.maxLine,
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        maxLines: maxLine,
        minLines: minLine,
        maxLength: maxLength,
        keyboardType: inputType,
        decoration: InputDecoration(
          counterText: '',
          fillColor: AppColors.bottomNav,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        onChanged: (v) {
          return onChanged(v);
        },
    );
  }



}