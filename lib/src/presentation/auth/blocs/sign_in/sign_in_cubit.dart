import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wrestling_hub/core/resources/data_state.dart';
import 'package:wrestling_hub/core/utils/extensions/extensions.dart';
import 'package:wrestling_hub/src/domain/user/usecases/get_token_google_use_case.dart';
import 'package:wrestling_hub/src/domain/user/usecases/sign_out_google_usecase.dart';
import 'package:wrestling_hub/src/presentation/auth/blocs/sign_in/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final GetTokenGoogleUseCase _getTokenGoogleUseCase;
  final SignOutGoogleUseCase _signOutGoogleUseCase;


  SignInCubit(this._getTokenGoogleUseCase, this._signOutGoogleUseCase) : super(SignInInitState());



  void onChangeNumberPhone(String phone) {
    final isValid = phone.digitCount() == 11;
    if (state is SignInFormState) {
      emit((state as SignInFormState).copyWith(isPhoneNumberValid: isValid));
    } else {
      emit(SignInFormState(isPhoneNumberValid: isValid));
    }
  }

  onSignInGoogle() async {
    emit(SignInLoadingState());

    final dataStateToken = await _getTokenGoogleUseCase();
    if(dataStateToken is DataFailed) {
       emit(SignInFailureState(message: "Ошибка получения токена"));
       return;
    }

    final dataStateSignOut = await _signOutGoogleUseCase(params: dataStateToken.data.toString());
    if(dataStateSignOut is DataFailed) {
      emit(SignInFailureState(message: "Ошибка регистрации токена"));
    }
    if(dataStateSignOut is DataSuccess) {
      emit(SignInGoogleLoggedState());
    }
  }


}

