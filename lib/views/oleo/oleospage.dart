import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/categoria.dart';
import 'package:mobile/models/oleo.dart';
import 'package:mobile/repositories/oleorepository.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/widgets/nk_button.dart';
import 'package:mobile/widgets/itemdetailmodal.dart';

class OleosPage extends StatefulWidget {
  OleosPage(this.categoria, {Key? key}) : super(key: key);
  final Categoria categoria;

  @override
  _OleosPageState createState() => _OleosPageState();
}

class _OleosPageState extends State<OleosPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    await Get.find<OleoRepository>().loadListData(widget.categoria.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria.nome!),
        centerTitle: true,
      ),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _loadData,
          child: GetBuilder<OleoRepository>(
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
              return repo.oleos.length > 0
                  ? ListView.builder(
                      itemCount: repo.oleos.length,
                      itemBuilder: (context, i) =>
                          _buildItem(repo.oleos[i], i, repo.oleos.length))
                  : Container(
                      width: context.width,
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Nenhum óleo encontrado!",
                      ),
                    );
            },
          )),
    );
  }

  Widget _buildItem(Oleo oleo, int i, int listLength) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              oleo.nome!,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primaryColor),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: CachedNetworkImage(
              fit: BoxFit.fitHeight,
              imageUrl: oleo.imagem != null ? oleo.imagem!.url! : "",
              height: 120,
              width: 240,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // child: Image.network(
            //   oleo.imagem != null ? oleo.imagem!.url! : "",
            //   height: 120,
            //   width: 240,
            //   fit: BoxFit.fitHeight,
            // )
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              oleo.descricao!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          //
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
            child: NkButton(
              "Ver Mais",
              width: 110,
              textStyle: TextStyle(
                  color: AppColors.background,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              onClick: () {
                Navigator.of(context).push(ItemDetailModal(oleo));
              },
            ),
          ),
          i != listLength - 1
              ? Divider(
                  color: AppColors.primaryColor.withOpacity(.5),
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                )
              : Container()
        ],
      ),
    );
  }
}
