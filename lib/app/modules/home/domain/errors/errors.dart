class SearchCepException implements Exception{
  final String message;

  SearchCepException(this.message);
  @override
  String toString() {
    return message;
  }

}