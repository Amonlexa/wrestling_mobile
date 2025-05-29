import 'package:wrestling_hub/core/resources/data_state_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wrestling_hub/src/domain/user/usecases/confirm_code_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

  final ConfirmCodeUseCase _confirmCodeUseCase;


  AuthBloc(
      this._confirmCodeUseCase,
      ) : super(AuthInitState()) {
    on<AuthConfirmEvent>(_onConfirmCode);

  }

  _onConfirmCode(AuthConfirmEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    String sortNumber = event.number.replaceAll(RegExp(r'[^\d]'), '');

    Map<String,String> data = {
      'number':sortNumber,
      'code': event.code,
    };

    final dataStateAuth = await _confirmCodeUseCase(params: data);

    if (dataStateAuth is DataAuthFailed) {
      emit(AuthErrorState(message: dataStateAuth.error.toString()));
    }

    if(dataStateAuth is DataWrongCode) {
      emit(AuthWrongCodeState(message: dataStateAuth.error.toString()));
      return;
    }

    if (dataStateAuth is DataAuthSuccess) {
      emit(AuthSuccessState(dataStateAuth.data!));
      return;
    }
  }


}
