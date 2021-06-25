import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/categoria.dart';
import 'package:mobile/repositories/categoriarepository.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/extensions/nke_context.dart';

class CatsPage extends StatefulWidget {
  CatsPage({Key? key}) : super(key: key);

  @override
  _CatsPageState createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future _refresh() async {
    await Get.find<CategoriaRepository>().loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nossas Categorias"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GetBuilder<CategoriaRepository>(
                init: CategoriaRepository(),
                builder: (repo) {
                  if (repo.isBusy)
                    return Container(
                        alignment: Alignment.topCenter,
                        child: RefreshProgressIndicator());
                  if (!repo.success) {
                    return Container(
                      width: context.width,
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Ocorrou um erro com o servidor!",
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                  return repo.categorias.length > 0
                      ? ListView.builder(
                          itemCount: repo.categorias.length,
                          itemBuilder: (context, i) =>
                              _buildCatItem(repo.categorias[i]))
                      : Container(
                          width: context.width,
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Nenhuma categoria encontrada!",
                          ),
                        );
                },
              ))),
    );
  }

  Widget _buildCatItem(Categoria categoria) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: LayoutBuilder(builder: (context, constraints) {
        return Ink(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primaryColor,
              boxShadow: [
                BoxShadow(
                    offset: Offset(3, 2),
                    blurRadius: 3,
                    color: Colors.black.withOpacity(0.5))
              ]),
          child: InkWell(
            onTap: () {
              context.pushNamed("/Oleos", args: categoria);
            },
            child: Container(
              height: context.height * 0.15,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Row(
                children: [
                  SizedBox(
                    height: context.height * 0.13,
                    width: context.height * 0.13,
                    child: Ink.image(
                      fit: BoxFit.fitHeight,
                      image: CachedNetworkImageProvider(
                        categoria.imagem != null ? categoria.imagem!.url! : "",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(
                            categoria.nome!,
                            style: TextStyle(
                                color: AppColors.background,
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          width: constraints.maxWidth * 0.65,
                          child: Text(
                            categoria.descricao!,
                            maxLines: 2,
                            style: TextStyle(
                                color: AppColors.background,
                                fontSize: 16,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
