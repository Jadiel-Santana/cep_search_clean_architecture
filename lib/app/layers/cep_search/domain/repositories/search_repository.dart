import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/entities/search_entity.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, SearchEntity>> search(String zipCode);
}