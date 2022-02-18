import 'package:brasil_fields/brasil_fields.dart';
import 'package:cep_search_clean_architecture/app/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/components/button.dart';
import '../components/zipcode_card_item.dart';
import '../controllers/search_controller.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    controller: controller.searchController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.primary,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CepInputFormatter(ponto: false),
                    ],
                    decoration: const InputDecoration(
                      labelText: 'Digite o CEP',
                      prefixIcon: Icon(
                        CupertinoIcons.search,
                        size: 18,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Button(
                      title: 'Limpar Pesquisa',
                      backgroundColor: AppColors.grey,
                      icon: CupertinoIcons.clear,
                      onPressed: controller.clearSearchInput,
                    ),
                    Button(
                      title: 'Pesquisar CEP',
                      backgroundColor: AppColors.primary,
                      icon: CupertinoIcons.search,
                      onPressed: controller.searchZipCode,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 50),
                controller.obx(
                  (state) => ZipCodeCardItem(entity: state!),
                  onLoading: const SizedBox(
                    height: 400,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  onError: (error) => SizedBox(
                    height: 400,
                    child: Center(
                      child: Text(error!),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}