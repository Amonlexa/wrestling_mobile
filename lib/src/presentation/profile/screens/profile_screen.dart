import 'package:wrestling_hub/core/constants/app_urls.dart';
import 'package:wrestling_hub/core/route/app_router.dart';
import 'package:wrestling_hub/src/presentation/profile/widgets/donat_widget.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/modal_bottom_feedback.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_button.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_info_alertdialog.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_simple_alertdialog.dart';
import 'package:wrestling_hub/src/presentation/auth/blocs/auth/auth_bloc.dart';
import 'package:wrestling_hub/src/presentation/auth/blocs/auth/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wrestling_hub/src/presentation/profile/blocs/profile/profile_bloc.dart';
import 'package:wrestling_hub/src/presentation/profile/widgets/profile_menu_item.dart';
import 'package:wrestling_hub/src/presentation/profile/widgets/profile_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<StatefulWidget> createState() => _ProfileScreen();
}
class _ProfileScreen extends State<ProfileScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: context.read<ProfileBloc>()..add(ProfileGetLocalEvent()),
        builder: (context, state) {
          // Автоматический переход после авторизации
          if (state is ProfileNoLoggedState) {
            final authState = context.watch<AuthBloc>().state;
            if (authState is AuthSuccessState) {
              context.read<ProfileBloc>().add(ProfileGetLocalEvent());
            }
          }

          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('Профиль', style: Theme.of(context).textTheme.titleLarge),
                actions: [
                  PopupMenuButton(
                    icon: const Icon(CupertinoIcons.settings),
                    color: Colors.black,
                    itemBuilder: (context) => [
                      if (state is ProfileLoggedState)
                        PopupMenuItem(
                          onTap: () => _showLogoutDialog(context),
                          child: Text('Выйти из аккаунта', style: Theme.of(context).textTheme.titleSmall),
                        ),
                      PopupMenuItem(
                        onTap: () => _showVersionDialog(context),
                        child: Text('Версия приложения', style: Theme.of(context).textTheme.titleSmall),
                      ),
                    ],
                  )
                ],
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state is ProfileLoggedState) ...[
                        ProfileWidget(avatar: state.user.avatars, width: 90, height: 90),
                        Text(state.user.getInitials(), style: Theme.of(context).textTheme.titleLarge),
                        Text('Дата регистрации: ${state.user.creationDateTime}', style: Theme.of(context).textTheme.titleSmall),
                        Row(
                          children: [
                            Text('Статус:', style: Theme.of(context).textTheme.titleSmall),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () => _showStatusInfoDialog(context),
                              child: state.icon,
                            ),
                          ],
                        ),
                      ],
                      AppButton(
                        title: state is ProfileLoggedState ? 'Редактировать профиль' : 'Войти в профиль',
                        onPressed: () {
                          if (state is ProfileLoggedState) {
                            GoRouter.of(context).pushNamed(AppRoute.profileEdit).then((val) {
                              if (val == true && context.mounted) {
                                context.read<ProfileBloc>().add(ProfileGetLocalEvent());
                              }
                            });
                          } else {
                            GoRouter.of(context).pushNamed(AppRoute.auth).then((val) {
                              if (val == 'auth' && context.mounted) {
                                context.read<ProfileBloc>().add(ProfileGetLocalEvent());
                              }
                            });
                          }
                        },
                      ),
                      const DonatWidget(),
                      ProfileMenuItem(
                        title: 'Политика конфиденциальности',
                        icon: CupertinoIcons.doc_append,
                        endIcon: true,
                        onPress: () => launchUrl(Uri.parse(AppUrls.privacy)),
                      ),
                      ProfileMenuItem(
                        title: 'Поделиться с друзьями',
                        icon: CupertinoIcons.share,
                        endIcon: false,
                        onPress: () async => await Share.share(
                          'Установите мобильное приложение Amonlexa Wrestling Hub ${AppUrls.storeApp}',
                        ),
                      ),
                      ProfileMenuItem(
                        title: 'Оценить приложение',
                        icon: CupertinoIcons.star,
                        endIcon: false,
                        onPress: () => launchUrl(Uri.parse(AppUrls.storeApp)),
                      ),
                      Text('Обратная связь', style: Theme.of(context).textTheme.titleLarge),
                      ProfileMenuItem(
                        title: 'Наши контакты',
                        icon: CupertinoIcons.star,
                        endIcon: false,
                        onPress: () => ModalBottomFeedback().show(context),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


  void _showLogoutDialog(BuildContext context) {
    WrestlingSimpleAlertDialog(
      title: 'Выход',
      description: 'Вы точно хотите выйти из аккаунта?',
      onYesButton: () {
        GoRouter.of(context).pop();
        context.read<ProfileBloc>().add(ProfileExitEvent());
      },
      onNoButton: () => GoRouter.of(context).pop(),
    ).showAlertDialog(context);
  }

  void _showVersionDialog(BuildContext context) {
    WrestlingInfoAlertdialog(
      title: 'Текущая версия приложения',
      onClose: () => GoRouter.of(context).pop(),
      contentWidget: Text("1.0.1", style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
    ).showAlertDialog(context);
  }

  void _showStatusInfoDialog(BuildContext context) {
    WrestlingInfoAlertdialog(
      title: 'Статусы',
      contentWidget: const Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Row(children: [Icon(Icons.verified, color: Colors.blueGrey), Text('Не заполненный аккаунт')]),
          SizedBox(height: 5),
          Row(children: [Icon(Icons.verified, color: Colors.cyan), Text('Аккаунт заполнен')]),
          SizedBox(height: 5),
          Row(children: [Icon(Icons.verified, color: Colors.amber), Text('Активный')]),
        ],
      ),
      onClose: () => GoRouter.of(context).pop(),
    ).showAlertDialog(context);
  }


}