import 'package:wrestling_hub/main.dart';
import 'package:wrestling_hub/src/data/main/models/news.dart';
import 'package:wrestling_hub/src/data/video/models/video.dart';
import 'package:wrestling_hub/src/presentation/auth/screens/confirm_code_screen.dart';
import 'package:wrestling_hub/src/presentation/auth/screens/sign_in_screen.dart';
import 'package:wrestling_hub/src/presentation/auth/screens/onboarding_screen.dart';
import 'package:wrestling_hub/src/presentation/auth/screens/splash_screen.dart';
import 'package:wrestling_hub/src/presentation/favorites/screens/favorites_screen.dart';
import 'package:wrestling_hub/src/presentation/main/screens/full_news_screen.dart';
import 'package:wrestling_hub/src/presentation/main/screens/main_screen.dart';
import 'package:wrestling_hub/src/presentation/main/screens/news_comments_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestling_hub/src/presentation/main/screens/search_news_screen.dart';
import 'package:wrestling_hub/src/presentation/navigation/screens/home_bottom_navigation.dart';
import 'package:wrestling_hub/src/presentation/profile/screens/profile_edit_screen.dart';
import 'package:wrestling_hub/src/presentation/profile/screens/profile_screen.dart';
import 'package:wrestling_hub/src/presentation/video/screens/video_info.dart';
import 'package:wrestling_hub/src/presentation/video/screens/video_vkplayer_screen.dart';
import 'package:wrestling_hub/src/presentation/video/screens/videos_screen.dart';
import 'app_router.dart';

class AppRouterConfig {

  final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
        GoRoute(
            path: AppRoute.root,
            name: AppRoute.root,
            builder: (BuildContext context,state) {
              return const SplashScreen();
            }
        ),
        GoRoute(
            path: AppRoute.authPath,
            name: AppRoute.authName,
            builder: (BuildContext context,state) {
              return SignInScreen(
                from: state.pathParameters['from']!,
              );
            }
        ),
        GoRoute(
          path: '/sms/:number/:from',
          name: AppRoute.sms,
          builder: (context, state)  {
            return ConfirmOtpCode(
              numberPhone: state.pathParameters['number'].toString(),
              from: state.pathParameters['from'].toString(),
            );
          },
        ),
        GoRoute(
          path: AppRoute.profileEdit,
          name: AppRoute.profileEdit,
          builder: (BuildContext context,state) => const ProfileEditScreen(),
        ),
        GoRoute(
            path: AppRoute.onboard,
            name: AppRoute.onboard,
            builder: (BuildContext context,state) => const OnBoardingScreen()
        ),
        StatefulShellRoute.indexedStack(
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoute.main,
                  name: AppRoute.main,
                  builder: (context, state) => const MainScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoute.video,
                    name: AppRoute.video,
                    builder: (context, state) => const VideosScreen(),
                  ),
                ]
            ),
            StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: AppRoute.favorite,
                    name: AppRoute.favorite,
                    builder: (context, state) => const FavoritesScreen(),
                  ),
                ]
            ),
            StatefulShellBranch(
              navigatorKey: sectionANavigatorKey,
                routes: [
                  GoRoute(
                    path: AppRoute.profile,
                    name: AppRoute.profile,
                    builder: (context, state) => const ProfileScreen(),
                  ),
                ]
            ),
          ],
          builder: (context, state, nav) {
            return HomeBottomNavigation(navigationShell: nav);
          },
        ),
        GoRoute(
            path: AppRoute.searchNews,
            name: AppRoute.searchNews,
            builder: (context, state)  =>  const SearchNewsScreen()
        ),
        GoRoute(
            path: AppRoute.fullNews,
            name: AppRoute.fullNews,
            builder: (context, state)  {
              News fullNews = state.extra as News;
              return FullNewsScreen(
                  fullNews: fullNews
              );
            }
        ),
        GoRoute(
            path: '/news/comments/:id',
            name: AppRoute.commentNews,
            builder: (context, state)  {
              return NewsCommentsScreen(
                idNews: state.pathParameters['id'].toString(),
              );
            }
        ),
        GoRoute(
            path: AppRoute.vkVideo,
            name: AppRoute.vkVideo,
            builder: (context, state)  {
              Video video = state.extra as Video;
              return VideoVkPlayerScreen(
                  video: video
              );
            }
        ),
        GoRoute(
            path: AppRoute.vkVideoInfo,
            name: AppRoute.vkVideoInfo,
            builder: (context, state)  {
              return const VideoInfoScreen();
            }
        ),
        // GoRoute(
        //     path: AppRoute.privacy,
        //     name: AppRoute.privacy,
        //     builder: (context, state)  {
        //       return const PrivacyPolicyScreen();
        //     }
        // ),
      ],
      initialLocation: AppRoute.root,
  );
}