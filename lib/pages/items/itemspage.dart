import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/Item.dart';
import 'package:mobile/models/categoria.dart';
import 'package:mobile/services/fotoservice.dart';
import 'package:mobile/services/itemservice.dart';
import 'package:nikutils/utils/http/nk_http.dart';
import 'package:nikutils/extensions/nke_state.dart';
import 'package:nikutils/widgets/nk_button.dart';
import 'package:mobile/helpers/nkhelper.dart';
import 'package:mobile/widgets/itemdetailmodal.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key, this.categoria}) : super(key: key);
  final Categoria categoria;

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  bool isBusy;
  final ItemService itemService = Ioc().use(ItemService);
  final FotoService fotoService = Ioc().use(FotoService);
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  List<Item> items = [];

  @override
  void initState() {
    super.initState();
    _laodData();
  }

  Future _laodData() async {
    nkSetState(() => isBusy = true);

    var res = await itemService.get(catId: widget.categoria.id);
    if (res.success) {
      nkSetState(() {
        items = res.data;
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
        onRefresh: _laodData,
        child: !isBusy
            ? ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) => _buildItem(items[i], i))
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) => Container()),
      ),
    );
  }

  Widget _buildItem(Item item, int i) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Text(
              item.nome,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w300,
                  color: AppColors.primaryColor),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              item.descricao,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ),
          LayoutBuilder(builder: (context, constraints) {
            return Container(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                alignment: Alignment.center,
                width: constraints.maxWidth,
                height: constraints.maxWidth / 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    item.fotos.length >= 1
                        ? Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            height: constraints.maxWidth * 0.31,
                            width: constraints.maxWidth * 0.31,
                            child: CachedNetworkImage(
                              imageUrl: item.fotos[0].url,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  NkHelper.shimmerWidget(
                                h: constraints.maxWidth * 0.31,
                                w: constraints.maxWidth * 0.31,
                              ),
                            ))
                        : Container(),
                    item.fotos.length >= 2
                        ? Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            height: constraints.maxWidth * 0.31,
                            width: constraints.maxWidth * 0.31,
                            child: CachedNetworkImage(
                              imageUrl: item.fotos[1].url,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  NkHelper.shimmerWidget(
                                h: constraints.maxWidth * 0.31,
                                w: constraints.maxWidth * 0.31,
                              ),
                            ))
                        : Container(),
                    item.fotos.length >= 3
                        ? Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            height: constraints.maxWidth * 0.31,
                            width: constraints.maxWidth * 0.31,
                            child: CachedNetworkImage(
                              imageUrl: item.fotos[2].url,
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
          }),
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
                Navigator.of(context).push(ItemDetailModal(item));
              },
            ),
          ),
          i != items.length - 1
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
