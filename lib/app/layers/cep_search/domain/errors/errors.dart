abstract class FailureSearch implements Exception {}

class InvalidTextError implements FailureSearch {}

class DatasourceError implements FailureSearch {
  final String? message;

  DatasourceError({this.message});
}
