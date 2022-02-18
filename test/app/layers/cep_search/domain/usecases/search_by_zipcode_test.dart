import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/errors/errors.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/repositories/search_repository.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/usecases/search_by_zipcode.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/search_entity_mock.dart';

class SearchRepositoryMock extends Mock implements SearchRepository{}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchByZipCodeImp(repository);

  test('Deve retornar uma SearchEntity', () async {
    when(() => repository.search(any())).thenAnswer((_) async => Right(searchDtoMock));
    final result = await usecase('45810-000');
    expect(result, Right(searchDtoMock));
    verify(() => repository.search(any())).called(1);
  });

  test('Deve retornar uma InvalidTextError caso o texto seja null', () async {
    when(() => repository.search(any())).thenAnswer((_) async => Right(searchDtoMock));
    var result = await usecase(null);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });

  test('Deve retornar uma InvalidTextError caso o texto seja vazio', () async {
    when(() => repository.search(any())).thenAnswer((_) async => Right(searchDtoMock));
    var result = await usecase('');
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}