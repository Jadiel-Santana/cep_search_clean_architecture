import 'package:cep_search_clean_architecture/app/layers/cep_search/data/datasources/zipcode_search_datasource_imp.dart';
import 'package:cep_search_clean_architecture/app/layers/cep_search/domain/usecases/search_by_zipcode.dart';
import 'package:get/get.dart';

import '../../../../core/data/services/http_client_imp.dart';
import '../../infra/repositories/search_repository_imp.dart';
import '../controllers/search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(
      () => SearchController(
        SearchByZipCodeImp(
          SearchRepositoryImp(
            ZipCodeSearchDatasourceImp(
              HttpClientImp(),
            ),
          ),
        ),
      ),
    );
  }
}