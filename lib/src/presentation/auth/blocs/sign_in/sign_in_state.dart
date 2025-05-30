abstract class SignInState  {

}

class SignInInitState extends SignInState {}
class SignInLoadingState extends SignInState {}

class SignInGoogleLoggedState extends SignInState {}


class SignInFailureState extends SignInState {
  final String message;
  SignInFailureState({required this.message});
}

class SignInFormState extends SignInState {
  final bool isPhoneNumberValid;

  SignInFormState({
    this.isPhoneNumberValid = false,
  });

  SignInFormState copyWith({
    bool? isPhoneNumberValid,
  }) {
    return SignInFormState(
      isPhoneNumberValid: isPhoneNumberValid ?? this.isPhoneNumberValid,
    );
  }
}