

import 'package:triple_search_cep/app/modules/home/domain/entity/params_search_cep.dart';

abstract class SearchCepDatasource{
  Future<String> searchCep(ParamsSearchCep params);
}