import 'package:flutter/material.dart';
import 'package:mobile/pages/dilutionpage.dart';
import 'package:mobile/pages/homepage.dart';
import 'package:mobile/pages/items/catspage.dart';
import 'package:mobile/pages/items/oleospage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/Oleos':
        return MaterialPageRoute(
            builder: (_) => OleosPage(
                  categoria: args,
                ));
      case '/Categorias':
        return MaterialPageRoute(builder: (_) => CatsPage());

      case '/Diluicao':
        return MaterialPageRoute(builder: (_) => DilutionPage());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: SafeArea(child: Center(child: Text('Route Error')))));
    }
  }
}
