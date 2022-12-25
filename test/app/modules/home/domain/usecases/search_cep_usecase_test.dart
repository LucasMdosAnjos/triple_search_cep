
import 'package:flutter_test/flutter_test.dart';
import 'package:triple_search_cep/app/modules/home/domain/entity/params_search_cep.dart';
import 'package:triple_search_cep/app/modules/home/domain/usecases/search_cep_usecase.dart';
import 'package:triple_search_cep/app/modules/home/external/http/http_search_cep.dart';
import 'package:triple_search_cep/app/modules/home/infra/repositories/search_cep_repository_impl.dart';


void main() {
  final datasource = HttpSearchCep();
  final repository = SearchCepRepositoryImpl(datasource);
  final usecase = SearchCepUsecase(repository);

  test('search cep com sucesso',()async{
    final params = ParamsSearchCep(cep: '81560615');
    final result = await usecase(params);
    expect(result.isRight(),true);
  });

  test('search cep com erro',()async{
    final params = ParamsSearchCep(cep: '');
    final result = await usecase(params);
    expect(result.isLeft(),true);
  });
}
