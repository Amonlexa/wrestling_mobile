import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/core/route/app_router.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/error_page.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_progress_bar.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_tab_bar.dart';
import 'package:wrestling_hub/src/presentation/video/cubits/videos/videos_cubit.dart';
import 'package:wrestling_hub/src/presentation/video/cubits/videos/videos_state.dart';

class VideosScreen extends StatefulWidget {

  const VideosScreen({super.key});

  @override
  State<StatefulWidget> createState() => _VideosScreen();

}

class _VideosScreen extends State<VideosScreen> with TickerProviderStateMixin{

  TabController? _controllerTab;


  @override
  void initState() {
    context.read<VideosCubit>().onGetVideos(false);
    _controllerTab = TabController(vsync: this, length: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controllerTab?.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppStrings.videosWHTitle, style: Theme.of(context).textTheme.titleLarge),
        bottom: PreferredSize(
         preferredSize: const Size.fromHeight(50.0),
          child: BlocListener<VideosCubit, VideosState> (
            bloc: context.read(),
            listener: (BuildContext context, VideosState state) {
              if(state is VideosSuccessState) {
                if(!state.isRefresh) {
                  _controllerTab = TabController(length: state.tabs.length, vsync: this);
                }
              }
            },
            child: BlocBuilder<VideosCubit, VideosState>(
              builder: (context, state) {
                if (state is VideosLoadingState) {
                  return const Center(child: WrestlingProgressBar());
                } else if (state is VideosSuccessState) {
                  return WrestlingTabBar(
                    controller: _controllerTab,
                    tabs: state.tabs,
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {
            GoRouter.of(context).push(AppRoute.vkVideoInfo);
          }, 
          icon: const Icon(Icons.info_outline))
        ],
      ),
      body: NestedScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [];
        },
        body: BlocBuilder<VideosCubit, VideosState>(
          builder: (context, state) {
            if (state is VideosFailureState) {
              return ErrorPage(
                  errorText: state.message,
                  buttonText: AppStrings.repeat,
                  onPress: () {
                    context.read<VideosCubit>().onGetVideos(false);
                  },
                  icon: Icons.videocam_off_outlined
              );
            }
            if (state is VideosLoadingState) {
              return const Center(child: WrestlingProgressBar());
            }
            if (state is VideosSuccessState) {
              return TabBarView(
                controller: _controllerTab,
                children: state.pages.map((page) {
                  return RefreshIndicator(
                    color: AppColors.accent,
                      strokeWidth: 2.75,
                      backgroundColor: AppColors.background,
                      onRefresh: () async {
                      return await context.read<VideosCubit>().onGetVideos(true);
                    },
                    child: page
                  );
                }).toList(),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }



}