import '../dtos/search_dto.dart';

abstract class SearchDatasource {
  Future<SearchDto> searchZipCode(String zipCode);
}