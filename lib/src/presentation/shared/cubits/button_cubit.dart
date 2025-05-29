import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wrestling_hub/core/usecase.dart';
import 'package:wrestling_hub/src/presentation/shared/cubits/button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonInitialState());

  void execute({dynamic params, required UseCase usecase}) async {

    emit(ButtonLoadingState());
    try {
      final result = await usecase.call(params: params);

      result.fold(
              (error) {
            emit(
                ButtonFailureState(errorMessage: error)
            );
          },
              (data) {
            emit(ButtonSuccessState());
          }
      );
    } catch(e){
      emit(
          ButtonFailureState(errorMessage: e.toString())
      );
    }
  }
}