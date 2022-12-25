
import 'package:http/http.dart' as http;

import '../../domain/entity/params_search_cep.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasources/search_cep_datasource.dart';

class HttpSearchCep implements SearchCepDatasource {
  @override
  Future<String> searchCep(ParamsSearchCep params) async {
    try {
      final result = await http
          .get(Uri.parse('https://viacep.com.br/ws/${params.cep}/json/'));
      if (result.statusCode == 200) {
        return result.body;
      } else {
        throw (SearchCepException(result.statusCode.toString()));
      }
    } catch (e) {
      throw (SearchCepException(e.toString()));
    }
  }
}
