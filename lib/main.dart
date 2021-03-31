import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/pages/homepage.dart';
import 'package:mobile/route.dart';
import 'package:mobile/services/categoriaservice.dart';
import 'package:mobile/services/imagemservice.dart';
import 'package:mobile/services/oleoservice.dart';
import 'package:nikutils/utils/http/nk_http.dart';
import 'package:nikutils/nikutils.dart';

void main() {
  runApp(MyApp());
  NkHttpService.initializeHttpService(baseUri: "webcheirinho.com.br/api");
  Get.put(OleoService());
  Get.put(CategoriaService());
  Get.put(ImagemService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheirinho que Cuida',
      theme: AppColors.mainTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: HomePage(),
    );
  }
}
