import 'package:cep_search_clean_architecture/app/layers/cep_search/data/datasources/zipcode_search_datasource_imp.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/errors/errors.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/search_json_mock.dart';

class HttpMock extends Mock implements Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late HttpMock http;
  late ZipCodeSearchDatasourceImp datasource;

  setUp(() {
    http = HttpMock();
    datasource = ZipCodeSearchDatasourceImp(http);
  });

  setUpAll(() {
    registerFallbackValue(FakeUri());
  });

  test('Deve retornar um SearchDto', () {
    when(() => http.get(any())).thenAnswer(
      (_) async => Response(searchJsonMock, 200),
    );

    final future = datasource.searchZipCode('45810-000');
    expect(future, completes);
  });

  test('Deve retornar um DatasourceError se o statusCode não for 200', () {
    when(() => http.get(any())).thenAnswer(
      (_) async => Response(
        'something went wrong',
        401,
      ),
    );

    final future = datasource.searchZipCode('45810-000');
    expect(future, throwsA(isA<DatasourceError>()));
  });
}