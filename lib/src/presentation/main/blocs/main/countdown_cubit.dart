import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wrestling_hub/src/data/main/models/events.dart';

class CountdownCubit extends Cubit<List<Events>> {
  CountdownCubit(super.initialState) {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final updatedList = state.map((event) {
        return event.copyWith(dateStart: event.dateStart);
      }).toList();
      emit(updatedList);
    });
  }

  late Timer _timer;

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }

}