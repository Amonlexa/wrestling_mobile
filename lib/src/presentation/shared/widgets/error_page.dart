import 'package:flutter/material.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_button.dart';

class ErrorPage extends StatelessWidget {

  final String? errorText;
  final String? buttonText;
  final IconData? icon;
  final VoidCallback? onPress;

  const ErrorPage({super.key, required this.errorText, required this.onPress, required this.icon, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon ?? Icons.error_outline_sharp,color: AppColors.white,size: 200),
                const SizedBox(height: 10),
                Text(errorText!,style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
            child: AppButton(
                title: AppStrings.repeat,
                onPressed: () {
                  return onPress!();
                }
            ),
          ),
        ],
      ),
    );
  }


}