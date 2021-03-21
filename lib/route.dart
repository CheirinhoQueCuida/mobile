import 'package:flutter/material.dart';
import 'package:mobile/pages/items/oleospage.dart';
import 'package:mobile/pages/pages.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/Pages':
        return MaterialPageRoute(builder: (_) => Pages());

      case '/Items':
        return MaterialPageRoute(
            builder: (_) => OleosPage(
                  categoria: args,
                ));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
