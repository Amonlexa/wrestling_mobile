abstract class SignInState  {

}

class SignInInitState extends SignInState {}
class SignInLoadingState extends SignInState {}

class SignInFailureState extends SignInState {
  final String message;
  SignInFailureState({required this.message});
}

class SignInSuccessState extends SignInState {
  SignInSuccessState();
}