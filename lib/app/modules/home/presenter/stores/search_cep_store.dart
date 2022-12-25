import 'package:flutter_triple/flutter_triple.dart';

import '../../domain/entity/params_search_cep.dart';
import '../../domain/errors/errors.dart';
import '../../domain/usecases/search_cep_usecase.dart';

class SearchCepStore extends NotifierStore<SearchCepException, String> {
  final SearchCepUsecase usecase;
  SearchCepStore(this.usecase) : super("");

  searchCep(ParamsSearchCep params) async {
    setLoading(true);
    final result = await usecase(params);
    result.fold((l) {
      setError(l);
    }, (r) {
      update(r);
    });
    setLoading(false);
  }
}
