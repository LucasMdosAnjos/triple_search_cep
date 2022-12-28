// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:triple_search_cep/app/modules/home/domain/entity/params_search_cep.dart';

import 'package:triple_search_cep/app/modules/home/domain/usecases/search_cep_usecase.dart';
import 'package:triple_search_cep/app/modules/home/presenter/blocs/search_cep_bloc/search_cep_event.dart';
import 'package:triple_search_cep/app/modules/home/presenter/blocs/search_cep_bloc/search_cep_state.dart';

class SearchCepBloc extends Bloc<SearchCepEvent, SearchCepState> {
  final SearchCepUsecase usecase;

  SearchCepBloc(
    this.usecase,
  ) : super(SearchCepInitialState()) {
    on<LoadCepEvent>((event, emit) async {
      emit(SearchCepLoadingState());
      final result = await usecase(event.params);
      result.fold((l) {
        emit(SearchCepFailState(error: l.message));
      }, (r) {
        emit(SearchCepSuccessState(info: r));
      });
    });
  }
}
