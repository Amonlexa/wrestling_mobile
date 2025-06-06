import 'package:wrestling_hub/core/resources/data_state.dart';
import 'package:wrestling_hub/core/usecase.dart';
import 'package:wrestling_hub/src/data/main/models/news.dart';
import 'package:wrestling_hub/src/domain/main/repository/main_repository.dart';

class GetSearchNewsUseCase implements UseCase<DataState<List<News>>, Map<String,String>> {
  GetSearchNewsUseCase(this._mainRepository);

  final MainRepository _mainRepository;

  @override
  Future<DataState<List<News>>> call({void params}) {
    return _mainRepository.getSearchNews(params as Map<String,String>);
  }
}