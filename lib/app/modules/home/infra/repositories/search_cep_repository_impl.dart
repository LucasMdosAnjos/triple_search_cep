import 'package:triple_search_cep/app/modules/home/domain/errors/errors.dart';
import 'package:triple_search_cep/app/modules/home/domain/entity/params_search_cep.dart';
import 'package:dartz/dartz.dart';
import 'package:triple_search_cep/app/modules/home/domain/repositories/search_cep_repository.dart';
import 'package:triple_search_cep/app/modules/home/infra/datasources/search_cep_datasource.dart';

class SearchCepRepositoryImpl implements SearchCepRepository {
  final SearchCepDatasource datasource;

  SearchCepRepositoryImpl(this.datasource);
  @override
  Future<Either<SearchCepException, String>> searchCep(
      ParamsSearchCep params) async {
    try {
      return Right(await datasource.searchCep(params));
    } on SearchCepException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(SearchCepException(e.toString()));
    }
  }
}
