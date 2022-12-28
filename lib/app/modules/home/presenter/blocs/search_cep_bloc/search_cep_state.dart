// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class SearchCepState {
}

class SearchCepInitialState extends SearchCepState {
  SearchCepInitialState();
}

class SearchCepLoadingState extends SearchCepState {
  SearchCepLoadingState();
}

class SearchCepSuccessState extends SearchCepState {
  String info;
  SearchCepSuccessState({required this.info});
}

class SearchCepFailState extends SearchCepState {
  String error;
  SearchCepFailState({required this.error});
}
