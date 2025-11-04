import 'package:flutter/material.dart';

class OnBoardingContentWidget extends StatelessWidget {

  final String background;
  final String title;
  final String description;

  const OnBoardingContentWidget({super.key, required this.background, required this.title, required this.description});




  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(background),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: 0.5), BlendMode.dstATop),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontFamily: 'Open Sans', fontWeight: FontWeight.w900, letterSpacing: -1), textAlign: TextAlign.center),
          const SizedBox(height: 20),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(alignment: Alignment.center, child: Text(description, style: Theme.of(context).textTheme.bodyMedium,textAlign: TextAlign.start)),
            ),
          ),
        ],
      ),
    );
  }

}