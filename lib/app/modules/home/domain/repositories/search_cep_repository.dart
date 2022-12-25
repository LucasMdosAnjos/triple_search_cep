import 'package:dartz/dartz.dart';

import '../entity/params_search_cep.dart';
import '../errors/errors.dart';

abstract class SearchCepRepository{
  Future<Either<SearchCepException,String>> searchCep(ParamsSearchCep params);
}