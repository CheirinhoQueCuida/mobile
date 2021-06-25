import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:nikutils/extensions/nke_context.dart';
import 'package:nikutils/nikutils.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: AppColors.background,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Image.asset("assets/images/c_logo.png")),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Card(
                    color: AppColors.primaryColor,
                    child: ListTile(
                      leading: Icon(
                        Mdi.spa,
                        color: AppColors.background,
                      ),
                      title: Text(
                        'Aromaterapia',
                        style: TextStyle(color: AppColors.background),
                      ),
                      onTap: () => Get.toNamed("/Categorias"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Card(
                    color: AppColors.primaryColor,
                    child: ListTile(
                      leading: Icon(
                        Mdi.water,
                        color: AppColors.background,
                      ),
                      title: Text('Óleos Essenciais',
                          style: TextStyle(color: AppColors.background)),
                      onTap: () => Get.toNamed("/Categorias"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Card(
                    color: AppColors.primaryColor,
                    child: ListTile(
                      leading: Icon(
                        Mdi.water,
                        color: AppColors.background,
                      ),
                      title: Text('Óleos Vegetais',
                          style: TextStyle(color: AppColors.background)),
                      onTap: () => Get.toNamed("/Vegetais"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Card(
                    color: AppColors.primaryColor,
                    child: ListTile(
                      leading: Icon(
                        Mdi.star,
                        color: AppColors.background,
                      ),
                      title: Text('Guia Rapido',
                          style: TextStyle(color: AppColors.background)),
                      onTap: () => Get.toNamed("/Categorias"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Card(
                    color: AppColors.primaryColor,
                    child: ListTile(
                      leading: Icon(
                        Mdi.waterPercent,
                        color: AppColors.background,
                      ),
                      title: Text(
                        'Diluição',
                        style: TextStyle(color: AppColors.background),
                      ),
                      onTap: () => Get.toNamed("/Diluicao"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
