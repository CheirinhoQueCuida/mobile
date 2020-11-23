import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/route.dart';
import 'package:mobile/services/categoriaservice.dart';
import 'package:mobile/services/fotoservice.dart';
import 'package:mobile/services/itemservice.dart';
import 'package:nikutils/utils/http/nk_http.dart';

void main() {
  runApp(MyApp());
  NkHttpService.initializeHttpInjection(baseUri: "api.nfadevelop.com.br");
  Ioc().bind(ItemService, (ioc) => new ItemService());
  Ioc().bind(CategoriaService, (ioc) => new CategoriaService());
  Ioc().bind(FotoService, (ioc) => new FotoService());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheirinho que Cuida',
      theme: AppColors.mainTheme,
      initialRoute: '/Pages',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
