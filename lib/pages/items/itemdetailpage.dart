import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/Item.dart';
import 'package:nikutils/extensions/nke_context.dart';
import 'package:nikutils/widgets/nk_grid.dart';

class ItemDetailPage extends StatefulWidget {
  ItemDetailPage({Key key, @required this.item}) : super(key: key);

  final Item item;

  @override
  _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backgroundLightColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(2, -1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3))
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    widget.item.nome,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 15),
                    height: 170,
                    child: CachedNetworkImage(imageUrl: widget.item.imageUrl)),
                Container(
                  padding: EdgeInsets.only(top: 30, left: 15),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.item.descricao,
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return NkGrid(
                        columns: 3,
                        children: [
                          for (var i = 0; i < widget.item.fotos.length; i++)
                            Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
                                height: constraints.maxWidth * .27,
                                width: constraints.maxWidth * .27,
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: widget.item.fotos[i].url))
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () => context.pop(),
              backgroundColor: AppColors.primaryColor,
              heroTag: null,
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 40,
              ),
            ),
          )
        ],
      ),
    );
  }
}
