import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/core/constants/app_urls.dart';
import 'package:wrestling_hub/core/utils/wrestling_copy_clipboard.dart';

class ModalBottomFeedback {


  show(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColors.bottomNav,
        context: context,
        builder: (builder) {
          return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  const Text(AppStrings.feedback,style: TextStyle(fontFamily:'Open-Sans',fontWeight: FontWeight.w700,fontSize: 20,color: AppColors.white)),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      CopyClipBoard().copy(AppUrls.mailAmonlexa,AppStrings.copied);
                      Navigator.of(context).pop();
                    },
                    child: const Row(
                      children: [
                          Icon(Icons.mail,color: Colors.cyan),
                          SizedBox(width: 10),
                          Text(AppUrls.mailAmonlexa)
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () => launchUrl(Uri.parse(AppUrls.telegramAmonlexa)),
                    child: const Row(
                      children: [
                        Icon(Icons.telegram_outlined,color: Colors.cyan),
                        SizedBox(width: 10),
                        Text(AppStrings.techSupport,style: TextStyle(fontFamily: 'Open-Sans',fontWeight: FontWeight.w700,fontSize: 15,color: Colors.white),textAlign: TextAlign.center,),
                        ],
                      ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                      child: TextButton(
                        child: const Text(AppStrings.close, style: TextStyle(fontSize: 14, fontFamily: 'Open-Sans', color: AppColors.smallText, fontWeight: FontWeight.normal),),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      )
                  )
                ],
              )
          );
        });
  }


}