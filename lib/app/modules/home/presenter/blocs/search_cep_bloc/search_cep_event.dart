// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:triple_search_cep/app/modules/home/domain/entity/params_search_cep.dart';

abstract class SearchCepEvent{

}

class LoadCepEvent extends SearchCepEvent {
  ParamsSearchCep params;
  LoadCepEvent({
    required this.params,
  });
}
