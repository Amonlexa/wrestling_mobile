import 'package:go_router/go_router.dart';
import 'package:wrestling_hub/core/constants/app_colors.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/core/constants/app_urls.dart';
import 'package:wrestling_hub/core/route/app_router.dart';
import 'package:wrestling_hub/core/utils/wrestling_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinput/pinput.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wrestling_hub/src/presentation/auth/blocs/auth/auth_bloc.dart';
import 'package:wrestling_hub/src/presentation/auth/blocs/auth/auth_event.dart';
import 'package:wrestling_hub/src/presentation/auth/blocs/auth/auth_state.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/modal_bottom_feedback.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_button.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_progress_bar.dart';

class ConfirmOtpCode extends StatelessWidget {

  final String numberPhone;
  final String from;
  ConfirmOtpCode({super.key,required this.numberPhone, required this.from});

  final _controllerSms = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState> (
        bloc: context.read(),
         listener: (BuildContext context, AuthState state) {
           if (state is AuthWrongCodeState) {
              WrestlingSnackBar().show(context, AppStrings.otpWrongCode);
              _controllerSms.clear();
           }
           if (state is AuthSuccessState) {
             GoRouter.of(context).goNamed(from);
             WrestlingSnackBar().show(context, AppStrings.otpSuccessCode);
           }
         },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is AuthLoadingState) {
            return const Center(
                child: WrestlingProgressBar()
            );
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 12,
                  children: [
                    Text(AppStrings.otpNavigateToTelegramBotForCode,style: Theme.of(context).textTheme.titleLarge),
                    Center(
                      child: Pinput(
                        controller: _controllerSms,
                        showCursor: true,
                        defaultPinTheme: PinTheme(
                            height: 56.0,
                            width: 48.0,
                            textStyle: Theme.of(context).textTheme.bodyLarge,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: AppColors.bottomNav,
                                borderRadius: BorderRadius.circular(15),
                                border: state is AuthWrongCodeState ? Border.all(color: Colors.red, width: 1.0) : Border.all(color: const Color(0x24000000), width: 1.5)
                            )
                        ),
                        length: 4,
                      ),
                    ),
                    AppButton(
                      title: AppStrings.confirm,
                      onPressed: () {
                       if(_controllerSms.text.length < 3) {
                         Fluttertoast.showToast(msg: AppStrings.otpEnterCode);
                       }else{
                         context.read<AuthBloc>().add(AuthConfirmEvent(numberPhone,_controllerSms.text));
                       }
                      }
                    ),
                    GestureDetector(
                      onTap: () => launchUrl(Uri.parse(AppUrls.telegramBotAuth)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          const Icon(Icons.telegram_outlined,color: Colors.cyan),
                          Text(AppStrings.otpGoTelegramBot,style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                         ModalBottomFeedback().show(context);
                      },
                      child: Text(AppStrings.otpNeedHelp,style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                ),
            ),
          );
          },
        ),
      )
    );
  }
}