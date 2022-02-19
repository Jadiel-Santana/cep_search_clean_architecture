import 'dart:convert';

import 'package:cep_search_clean_architecture/app/layers/cep_search/data/datasources/search_datasource.dart';

import '../../../../core/domain/services/http_service.dart';
import '../../domain/errors/errors.dart';
import '../dtos/search_dto.dart';

extension on String {
  normalize() => replaceAll('-', '');
}

class ZipCodeSearchDatasourceImp implements SearchDatasource {
  final HttpService _http;

  ZipCodeSearchDatasourceImp(this._http);

  @override
  Future<SearchDto> searchZipCode(String zipCode) async {
    final response = await _http
        .get('https://viacep.com.br/ws/${zipCode.normalize()}/json/');
    if (response.statusCode == 200) {
      return SearchDto.fromJson(jsonDecode(response.data));
    } else {
      throw DatasourceError();
    }
  }
}