import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_config.dart';
import 'package:wrestling_hub/core/constants/app_text_styles.dart';


class NumberFormField extends StatelessWidget {

  final ValueChanged<String> onChanged;
  final int? maxLength;
  final int minLine;
  final int? maxLine;
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;

  const NumberFormField({
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
      style: Theme.of(context).textTheme.bodyMedium,
      keyboardType: inputType,
      inputFormatters: [
        PhoneInputFormatter()
      ],
      decoration: InputDecoration(
        counterText: '',
        fillColor: AppColors.bottomNav,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
        hintText: hintText, alignLabelWithHint: true ,hintStyle: AppTextStyles.hintStyle,
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