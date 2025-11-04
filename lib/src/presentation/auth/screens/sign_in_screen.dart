import 'package:wrestling_hub/core/constants/app_config.dart';
import 'package:wrestling_hub/core/constants/app_resource.dart';
import 'package:wrestling_hub/core/constants/app_strings.dart';
import 'package:wrestling_hub/core/constants/app_text_styles.dart';
import 'package:wrestling_hub/core/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:wrestling_hub/src/presentation/auth/blocs/sign_in/sign_in_cubit.dart';
import 'package:wrestling_hub/src/presentation/auth/blocs/sign_in/sign_in_state.dart';
import 'package:wrestling_hub/src/presentation/auth/widgets/privacy_policy_text_widget.dart';
import 'package:wrestling_hub/src/presentation/auth/widgets/sign_in_widget.dart';
import 'package:wrestling_hub/src/presentation/auth/widgets/number_form_field.dart';
import 'package:wrestling_hub/src/presentation/profile/blocs/profile/profile_bloc.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/dissmissible_keyboard_widget.dart';
import 'package:wrestling_hub/src/presentation/shared/widgets/wrestling_button.dart';

class SignInScreen extends StatefulWidget {

  final String from;

  const SignInScreen({super.key, required this.from});

  @override
  State<StatefulWidget> createState() => _SignInScreen();


}
class _SignInScreen extends State<SignInScreen>{

  final TextEditingController numberController = TextEditingController(text: '+ 7');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailureState) {
          Fluttertoast.showToast(msg: state.message);
        }
        if(state is SignInGoogleLoggedState) {
          context.read<ProfileBloc>().add(ProfileGetLocalEvent());
          GoRouter.of(context).goNamed(widget.from);
        }
      },
      builder: (context, state) {
        return DismissibleKeyboardWidget(
          child: Scaffold(
            appBar: AppBar(),
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10,
                  children: [
                    // const AppLogoWidget(),
                    Text(
                      AppStrings.authTitle,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    if(state is SignInFormState && !state.isPhoneNumberValid)
                      const Center(
                        child: Text(
                          AppStrings.authWarmMessage,
                          style: AppTextStyles.warmTextStyle,
                        ),
                      ),
                    NumberFormField(
                      controller: numberController,
                      inputType: TextInputType.phone,
                      hintText: AppStrings.authHintNumber,
                      maxLine: 1,
                      onChanged: (val) => context.read<SignInCubit>().onChangeNumberPhone(val),
                    ),
                    Text(
                      AppStrings.authDescription,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    AppButton(
                      title: AppStrings.next,
                      isEnabled: state is SignInFormState && state.isPhoneNumberValid,
                      onPressed: () {
                        GoRouter.of(context).pushNamed(
                          AppRoute.sms,
                          pathParameters: {
                            'number': numberController.text.toString(),
                            'from' : widget.from
                          },
                        );
                      },
                    ),
                    const Spacer(),
                    Text(
                      AppStrings.authContinueWithAcc,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    if (!AppConfig.isIos)
                      SignInWidget(
                        title: AppStrings.authContinueWithGoogle,
                        iconPath: AppResources.iconGoogle,
                        onPressed: () {
                          context.read<SignInCubit>().onSignInGoogle();
                        },
                      ),
                    const PrivacyPolicyTextWidget()
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

