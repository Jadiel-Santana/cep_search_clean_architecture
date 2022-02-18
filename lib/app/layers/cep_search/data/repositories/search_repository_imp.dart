import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/entities/search_entity.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/search_repository.dart';
import '../datasources/search_datasource.dart';

class SearchRepositoryImp implements SearchRepository {
  final SearchDatasource _datasource;

  SearchRepositoryImp(this._datasource);

  @override
  Future<Either<FailureSearch, SearchEntity>> search(String zipCode) async {
    try {
      final result = await _datasource.searchZipCode(zipCode);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}