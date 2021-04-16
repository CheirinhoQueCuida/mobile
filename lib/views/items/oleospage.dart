import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/categoria.dart';
import 'package:mobile/models/oleo.dart';
import 'package:mobile/repositories/oleorepository.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/extensions/nke_state.dart';
import 'package:nikutils/utils/http/nk_response.dart';
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
              return ListView.builder(
                  itemCount: repo.oleos.length,
                  itemBuilder: (context, i) =>
                      _buildItem(repo.oleos[i], i, repo.oleos.length));
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
              child: Image.network(
                oleo.imagem != null ? oleo.imagem!.url! : "",
                height: 120,
                width: 240,
                fit: BoxFit.fitHeight,
              )),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              oleo.descricao!,
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
