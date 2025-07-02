import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/di.dart';
import 'package:wrestling_hub/core/route/app_router.dart';
import 'package:wrestling_hub/src/domain/user/usecases/get_onboarding_content_use_case.dart';
import 'package:wrestling_hub/src/presentation/auth/widgets/onboarding_content_screen.dart';
import 'package:wrestling_hub/src/data/user/data_source/local/user_data.dart';

class OnBoardingScreen extends StatefulWidget {

  const OnBoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnBoardingScreen();

}

class _OnBoardingScreen extends State<OnBoardingScreen> {

  final _controller = PageController();
  late final List<OnBoardingContentWidget> _contents;

  @override
  void initState() {
    _contents = sl<GetOnBoardingContent>().execute();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: _contents
          ),
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: CustomizableEffect(
                      activeDotDecoration: DotDecoration(width: 20, height: 6, color: Colors.white, borderRadius: BorderRadius.circular(30)),
                      dotDecoration: DotDecoration(borderRadius: BorderRadius.circular(30), width: 6, height: 6),
                    ),
                    onDotClicked: (index) => _controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn)
                ),
                IconButton(
                    onPressed: () {
                      if(_controller.page == 2) {
                        UserData.instance.setFirstLaunch();
                        context.go(AppRoute.main);
                      }else{
                        _controller.nextPage(duration: const Duration(milliseconds: 500), curve:  Curves.easeIn);
                      }
                    },
                    icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: AppColors.accent,
                        ),
                        child: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white)
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



}