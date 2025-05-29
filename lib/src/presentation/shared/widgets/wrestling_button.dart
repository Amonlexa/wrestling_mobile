import 'package:flutter/material.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';

class AppButton extends StatelessWidget {

  final String title;
  final VoidCallback onPressed;
  final bool loading;
  final bool active;
  final bool isFilled;
  final Color textColor;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.loading = false,
    this.active = true,
    this.isFilled = false,
    this.textColor = Colors.white
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 45,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 0.0, color: Colors.transparent),
              elevation: 0.0,
              splashFactory: InkRipple.splashFactory,
              foregroundColor: AppColors.white,
              shadowColor: AppColors.accent,
              backgroundColor: isFilled ? AppColors.accent : const Color(0xff969696),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          onPressed: () {
            if (active) {
              return onPressed();
            }
          },
          child: loading ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20, width: 20, child: CircularProgressIndicator(strokeWidth: 2.0, valueColor:AlwaysStoppedAnimation<Color>(Colors.white),)),
              const SizedBox(width: 8),
              Text("Загрузка...", style: TextStyle(color: isFilled ? Colors.white : AppColors.white)),
            ],
          ) : Text(title,style: const TextStyle(color: AppColors.white,fontSize: 15,fontWeight: FontWeight.normal)),
        ));
  }
}