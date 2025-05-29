import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_config.dart';
class WrestlingProgressBar extends StatelessWidget {

  final double? size;

  const WrestlingProgressBar({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform.scale(
        scale: size ?? 0.5,
        child: AppConfig.isIos ? const CupertinoActivityIndicator(radius: 20,color: AppColors.white,) : const CircularProgressIndicator(color: AppColors.accent)
      ),
    );
  }

}