import 'package:triple_search_cep/app/modules/home/domain/entity/params_search_cep.dart';
import 'package:triple_search_cep/app/modules/home/domain/usecases/search_cep_usecase.dart';
import 'package:triple_search_cep/app/modules/home/external/http/http_search_cep.dart';
import 'package:triple_search_cep/app/modules/home/infra/repositories/search_cep_repository_impl.dart';
import 'package:triple_search_cep/app/modules/home/presenter/stores/search_cep_store.dart';
import 'package:triple_test/triple_test.dart';

void main() {
  storeTest<SearchCepStore>(
    'ao pressionar enter deve procurar cep com sucesso',
    build: () => SearchCepStore(
        SearchCepUsecase(SearchCepRepositoryImpl(HttpSearchCep()))),
    act: (store) async {
      final params = ParamsSearchCep(cep: '81560615');
      await store.searchCep(params);
    },
    expect: () => [tripleLoading, tripleState, tripleLoading],
  );

  storeTest<SearchCepStore>(
    'ao pressionar enter com cep vazio deve dar erro',
    build: () => SearchCepStore(
        SearchCepUsecase(SearchCepRepositoryImpl(HttpSearchCep()))),
    act: (store) async {
      final params = ParamsSearchCep(cep: '');
      await store.searchCep(params);
    },
    expect: () => [tripleLoading, tripleError, tripleLoading],
  );

   storeTest<SearchCepStore>(
    'ao pressionar enter com cep errado deve dar erro',
    build: () => SearchCepStore(
        SearchCepUsecase(SearchCepRepositoryImpl(HttpSearchCep()))),
    act: (store) async {
      final params = ParamsSearchCep(cep: '99999');
      await store.searchCep(params);
    },
    expect: () => [tripleLoading, tripleError, tripleLoading],
  );
}
