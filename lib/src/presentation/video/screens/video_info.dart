import 'package:flutter/material.dart';
import 'package:wrestling_hub/core/constants/app_resource.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/modal_bottom_feedback.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_button.dart';

class VideoInfoScreen extends StatelessWidget {
  const VideoInfoScreen({super.key});


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppStrings.videosVKTitle, style: Theme.of(context).textTheme.titleLarge),
        ),
        body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                Center(
                    child: Image.asset(AppResources.iconVkVideo, height: 150, width: 150,alignment: Alignment.center)
                ),
                const Text(
                  'Использование технологии VK для показа видео',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Мы используем технологию VK для воспроизведения видео в нашем приложении. Это позволяет нам обеспечивать высокое качество воспроизведения и стабильную работу видеоплеера.',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  'Ваша статистика',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Обратите внимание, что ваша статистика просмотров и взаимодействий с видео не влияет на работу приложения и не передается третьим лицам. Мы уважаем вашу конфиденциальность и заботимся о защите ваших данных.',
                  style: TextStyle(fontSize: 16),
                ),
                const Text(
                  'Нашли свое видео?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Мы используем технологии VK для показа видео, и это не нарушает правил платформы.\n\nВаша статистика просмотров в VK не влияет на работу проекта, а только помогает улучшить его и популяризировать вольную борьбу.\nЕсли вы против использования ваших материалов, пожалуйста, напишите в нашу поддержку.\n\nЭтот проект создан для популяризации вольной борьбы и развития спортивного сообщества.',
                  style: TextStyle(fontSize: 16),
                ),
                AppButton(
                    title: AppStrings.techSupport,
                    onPressed: () async {
                      ModalBottomFeedback().show(context);
                    }
                ),
              ],
            ),
          ),
        ),
      );
  }


}