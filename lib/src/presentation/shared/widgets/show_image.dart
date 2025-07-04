import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_resource.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_progress_bar.dart';


class ShowImage extends StatelessWidget {

  final String? image;
  final double height;
  final double width;
  final double? opacity;
  final double circular;
  final bool? isCard;


  const ShowImage({super.key, required this.image, required this.height,required this.width, required this.circular,this.opacity = 1,this.isCard});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity!,
      child: CachedNetworkImage(
        color: Colors.white12,
        fit: BoxFit.cover,
        height: height,
        width: width,
        fadeInDuration: const Duration(milliseconds: 500),
        imageUrl: image != null ? '$image' : '',
        imageBuilder: (context, url) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(circular),
            image: DecorationImage(
              image: url,
              fit: isCard! ? BoxFit.cover : BoxFit.contain, // Оставляем как есть
            ),
          ),
        ),
        placeholder: (context, url) => const WrestlingProgressBar(),
        errorWidget: (context, url, error) => errorImage(context)
      ),
    );
  }

  Widget errorImage(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.bottomNav,
        borderRadius: BorderRadius.circular(circular),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AppResources.logoApp, height: 80, width: 80),
          ),
          const Text(AppStrings.errorLoadingImage,textAlign: TextAlign.center)
        ],
      ),
    );
  }



}