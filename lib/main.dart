import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/theme/app_theme.dart';
import 'app/layers/cep_search/presenter/bindings/search_binding.dart';
import 'app/layers/cep_search/presenter/pages/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Via CEP - Consulta',
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/search_page',
      getPages: [
        GetPage(
          name: '/search_page',
          page: () => const SearchPage(),
          binding: SearchBinding(),
        ),
      ],
    );
  }
}
