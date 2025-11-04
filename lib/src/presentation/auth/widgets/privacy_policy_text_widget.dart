import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/core/constants/app_text_styles.dart';
import 'package:wrestling_hub/core/constants/app_urls.dart';

class PrivacyPolicyTextWidget extends StatelessWidget {
  const PrivacyPolicyTextWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: AppStrings.authPrivacyStart,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          TextSpan(
            text: AppStrings.authPrivacyCenter,
            style: AppTextStyles.link,
            recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse(AppUrls.privacy)),
          ),
          TextSpan(
            text: AppStrings.authPrivacyEnd,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }


}