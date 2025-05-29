import 'package:wrestling_hub/core/resources/data_state.dart';
import 'package:wrestling_hub/core/usecase.dart';
import 'package:wrestling_hub/src/domain/user/repository/user_repository.dart';

class GetTokenGoogleUseCase implements UseCase<DataState<String>, void> {

  GetTokenGoogleUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<String>> call({void params}) {
    return _userRepository.getTokenGoogleAuth();
  }

}