import 'package:flutter/cupertino.dart';
import 'package:wrestling_hub/core/constants/app_resource.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1.1,
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(AppResources.logoApp, height: 150, width: 150),
          ),
        ),
      ),
    );
  }


}