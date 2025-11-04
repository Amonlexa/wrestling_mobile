import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/core/constants/app_text_styles.dart';
import 'package:wrestling_hub/core/constants/app_urls.dart';

class DonatWidget extends StatelessWidget {
  const DonatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(AppUrls.donatLink)),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: AppColors.bottomNav,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.smallText, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.donatTitle,
               style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(height: 5),
            Text(
              AppStrings.donatDescription,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 5),
            const Text(
              AppUrls.donatLink,
              style: AppTextStyles.link
            ),
          ],
        ),
      ),
    );
  }



}