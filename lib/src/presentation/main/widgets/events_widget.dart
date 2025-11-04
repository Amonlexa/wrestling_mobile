import 'package:flutter/material.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Container(
      width: widgetSize.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.cardColor
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Чемпионат мира',style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }


}