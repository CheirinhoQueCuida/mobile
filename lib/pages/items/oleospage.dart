import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/categoria.dart';
import 'package:mobile/models/oleo.dart';
import 'package:mobile/services/oleoservice.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/extensions/nke_state.dart';
import 'package:nikutils/widgets/nk_button.dart';
import 'package:mobile/helpers/nkhelper.dart';
import 'package:mobile/widgets/itemdetailmodal.dart';

class OleosPage extends StatefulWidget {
  OleosPage({Key key, this.categoria}) : super(key: key);
  final Categoria categoria;

  @override
  _OleosPageState createState() => _OleosPageState();
}

class _OleosPageState extends State<OleosPage> {
  bool isBusy;
  final OleoService oleoService = Get.find();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<Oleo> oleos = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future _loadData() async {
    nkSetState(() => isBusy = true);

    var res = await oleoService.get(catId: widget.categoria.id);
    if (res.success) {
      nkSetState(() {
        oleos = res.data;
      });
    }
    nkSetState(() => isBusy = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoria.nome),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _loadData,
        child: !isBusy
            ? ListView.builder(
                itemCount: oleos.length,
                itemBuilder: (context, i) => _buildItem(oleos[i], i))
            : ListView.builder(
                itemCount: oleos.length,
                itemBuilder: (context, i) => Container()),
      ),
    );
  }

  Widget _buildItem(Oleo oleo, int i) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              oleo.nome,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primaryColor),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              oleo.descricao,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          oleo.fotos != null
              ? LayoutBuilder(builder: (context, constraints) {
                  return Container(
                      padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                      alignment: Alignment.center,
                      width: constraints.maxWidth,
                      height: constraints.maxWidth / 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          oleo.fotos.length >= 1
                              ? Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  height: constraints.maxWidth * 0.31,
                                  width: constraints.maxWidth * 0.31,
                                  child: CachedNetworkImage(
                                    imageUrl: oleo.fotos[0].url,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        NkHelper.shimmerWidget(
                                      h: constraints.maxWidth * 0.31,
                                      w: constraints.maxWidth * 0.31,
                                    ),
                                  ))
                              : Container(),
                          oleo.fotos.length >= 2
                              ? Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  height: constraints.maxWidth * 0.31,
                                  width: constraints.maxWidth * 0.31,
                                  child: CachedNetworkImage(
                                    imageUrl: oleo.fotos[1].url,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        NkHelper.shimmerWidget(
                                      h: constraints.maxWidth * 0.31,
                                      w: constraints.maxWidth * 0.31,
                                    ),
                                  ))
                              : Container(),
                          oleo.fotos.length >= 3
                              ? Container(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  height: constraints.maxWidth * 0.31,
                                  width: constraints.maxWidth * 0.31,
                                  child: CachedNetworkImage(
                                    imageUrl: oleo.fotos[2].url,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                        NkHelper.shimmerWidget(
                                      h: constraints.maxWidth * 0.31,
                                      w: constraints.maxWidth * 0.31,
                                    ),
                                  ))
                              : Container(),
                        ],
                      ));
                })
              : Container(),
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
            child: NkButton(
              "Ver Mais",
              width: 110,
              color: AppColors.accentColor,
              textStyle: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              onClick: () {
                Navigator.of(context).push(ItemDetailModal(oleo));
              },
            ),
          ),
          i != oleos.length - 1
              ? Divider(
                  color: AppColors.primaryColor.withOpacity(.5),
                  height: 40,
                  thickness: 2,
                  indent: 10,
                  endIndent: 10,
                )
              : Container()
        ],
      ),
    );
  }
}
