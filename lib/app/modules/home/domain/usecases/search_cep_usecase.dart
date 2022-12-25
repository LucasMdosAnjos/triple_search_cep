import 'package:dartz/dartz.dart';

import '../entity/params_search_cep.dart';
import '../errors/errors.dart';
import '../repositories/search_cep_repository.dart';

abstract class ISearchCepUsecase {
  Future<Either<SearchCepException, String>> call(ParamsSearchCep params);
}

class SearchCepUsecase implements ISearchCepUsecase {
  final SearchCepRepository repository;

  SearchCepUsecase(this.repository);
  @override
  Future<Either<SearchCepException, String>> call(
      ParamsSearchCep params) async {
    if (params.cep.isEmpty) {
      return Left(SearchCepException('Cep não pode ser vazio'));
    }
    return await repository.searchCep(params);
  }
}
