import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/errors/errors.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/usecases/search_by_zipcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../domain/entities/search_entity.dart';

class SearchController extends GetxController with StateMixin<SearchEntity> {
  final SearchByZipCode _usecase;

  SearchController(this._usecase);

  final searchController = TextEditingController(text: '');

  @override
  void onInit() {
    super.onInit();
    searchZipCode();
  }

  void clearSearchInput() => searchController.clear();

  searchZipCode() async {
    change(null, status: RxStatus.loading());
    var result = await _usecase(searchController.text);
    return result.fold(
      (error) => change(
        null,
        status: RxStatus.error(
          (error is DatasourceError)
            ? 'Nenhum resultado encontrado'
            : 'Digite um CEP',
        ),
      ),
      (success) => change(success, status: RxStatus.success()),
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
