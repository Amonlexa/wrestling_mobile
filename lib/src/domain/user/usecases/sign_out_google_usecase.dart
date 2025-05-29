import 'package:wrestling_hub/core/resources/data_state.dart';
import 'package:wrestling_hub/core/usecase.dart';
import 'package:wrestling_hub/src/data/user/models/user.dart';
import 'package:wrestling_hub/src/domain/user/repository/user_repository.dart';

class SignOutGoogleUseCase implements UseCase<DataState<User>,String> {

  SignOutGoogleUseCase(this._userRepository);

  final UserRepository _userRepository;

  @override
  Future<DataState<User>> call({void params}) {
    return _userRepository.signInGoogle(params as String);
  }

}