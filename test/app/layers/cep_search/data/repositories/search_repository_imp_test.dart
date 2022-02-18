import 'package:cep_search_clean_architecture/app/layers/cep_search/data/datasources/search_datasource.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/data/repositories/search_repository_imp.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/search_entity_mock.dart';

class SearchDatasourceMock extends Mock implements SearchDatasource {}

void main() {
  late SearchDatasource datasource;
  late SearchRepositoryImp repository;

  setUp(() {
    datasource = SearchDatasourceMock();
    repository = SearchRepositoryImp(datasource);
  });

  test('Deve retornar um SearchDto ao chamar o datasource', () async {
    when(() => datasource.searchZipCode(any()))
        .thenAnswer((_) async => searchDtoMock);
    final result = await repository.search('45810-000');
    expect(result, Right(searchDtoMock));
    verify(() => datasource.searchZipCode(any())).called(1);
  });

  test('Deve retornar um DatasourceError se o Datasource falhar', () async {
    when(() => datasource.searchZipCode(any())).thenThrow(DatasourceError());
    final result = await repository.search('45810-000');
    expect(result.fold(id, id), isA<DatasourceError>());
    verify(() => datasource.searchZipCode(any())).called(1);
  });
}