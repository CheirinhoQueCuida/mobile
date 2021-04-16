import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/repositories/categoriarepository.dart';
import 'package:mobile/repositories/oleorepository.dart';
import 'package:mobile/route.dart';
import 'package:mobile/views/homepage.dart';
import 'package:nikutils/utils/http/nk_http.dart';
import 'package:nikutils/nikutils.dart';

void main() {
  runApp(MyApp());
  NkHttpService.initializeHttpService(baseUrl: "webcheirinho.com.br/api");
  Get.put(OleoRepository());
  Get.put(CategoriaRepository());
  // Get.put(ImagemService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cheirinho que Cuida',
      theme: AppColors.mainTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePage(),
    );
  }
}
