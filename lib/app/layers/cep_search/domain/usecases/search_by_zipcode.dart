import 'package:dartz/dartz.dart';

import '../entities/search_entity.dart';
import '../errors/errors.dart';
import '../repositories/search_repository.dart';

abstract class SearchByZipCode {
  Future<Either<FailureSearch, SearchEntity>> call(String zipCode);
}

class SearchByZipCodeImp implements SearchByZipCode {
  final SearchRepository _repository;

  SearchByZipCodeImp(this._repository);

  @override
  Future<Either<FailureSearch, SearchEntity>> call(String? zipCode) async {
    if(zipCode == null || zipCode.isEmpty) {
      return Left(InvalidTextError());
    }
    return await _repository.search(zipCode);
  }
}