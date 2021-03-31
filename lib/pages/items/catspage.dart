import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/categoria.dart';
import 'package:mobile/services/categoriaservice.dart';
import 'package:nikutils/nikutils.dart';
import 'package:shimmer/shimmer.dart';
import 'package:nikutils/extensions/nke_context.dart';
import 'package:nikutils/extensions/nke_state.dart';

class CatsPage extends StatefulWidget {
  CatsPage({Key key}) : super(key: key);

  @override
  _CatsPageState createState() => _CatsPageState();
}

class _CatsPageState extends State<CatsPage> {
  bool isBusy;
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
  final CategoriaService categoriaService = Get.find();

  List<Categoria> categorias = [];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future _refresh() async {
    nkSetState(() => isBusy = true);

    var res = await categoriaService.get(id: 2);
    if (res.success) {
      nkSetState(() {
        categorias = res.data.obs;
      });
    }
    nkSetState(() => isBusy = false);
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
            child: !isBusy
                ? ListView.builder(
                    itemCount: categorias.length,
                    itemBuilder: (context, i) => _buildCatItem(categorias[i]))
                : ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, i) => _buildShimmerItem()),
          )),
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
              context.pushNamed("/Items", args: categoria);
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
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(categoria.imagem != null
                          ? categoria.imagem.url
                          : "https://webcheirinho.com.br/imgs/c3413174-acce-4d4f-b74d-714af47c2e3c.png"),
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
                            categoria.nome,
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
                            categoria.descricao,
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

  Widget _buildShimmerItem() {
    return Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.grey.withOpacity(0.2),
        child: Container(
          height: 100,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
          margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
          decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ));
  }
}
