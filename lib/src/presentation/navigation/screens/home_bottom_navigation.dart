import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatefulWidget  {
  final StatefulNavigationShell navigationShell;

  const HomeBottomNavigation({super.key, required this.navigationShell});

  @override
  State<StatefulWidget> createState() => _HomeBottomNavigation();

}

class _HomeBottomNavigation extends State<HomeBottomNavigation> with TickerProviderStateMixin {

  TabController? _controllerTab;


  @override
  void initState() {
    _controllerTab = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: widget.navigationShell,
        bottomNavigationBar: _navBar(context),
      ),
    );
  }

  Widget _navBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          child: Container(
            color: AppColors.bottomNav,
            child: TabBar(
              controller: _controllerTab,
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4),
              unselectedLabelColor: Colors.white,
              labelColor: AppColors.white,
              dividerColor: Colors.transparent,
              indicatorColor: AppColors.accent,
              indicatorSize: TabBarIndicatorSize.label,
              indicator:const UnderlineTabIndicator(
                borderSide:BorderSide(color: AppColors.accent, width: 4.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                insets: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
              ),
              onTap: (val) {
                widget.navigationShell.goBranch(val);
              },
              tabs: const <Tab> [
                Tab(icon: Icon(CupertinoIcons.home)),
                Tab(icon: Icon(CupertinoIcons.play_circle_fill)),
                Tab(icon: Icon(CupertinoIcons.square_arrow_down)),
                Tab(icon: Icon(CupertinoIcons.profile_circled)),
              ],
            ),
          )
      ),
    );
  }

}