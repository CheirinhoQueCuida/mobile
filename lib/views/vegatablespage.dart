import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/vegetal.dart';
import 'package:mobile/repositories/vegetalrepository.dart';
import 'package:nikutils/nikutils.dart';

class VegetablesPage extends StatefulWidget {
  VegetablesPage({Key? key}) : super(key: key);

  @override
  _VegetablesPageState createState() => _VegetablesPageState();
}

class _VegetablesPageState extends State<VegetablesPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future _refresh() async {
    await Get.find<VegetalRepository>().loadListData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Óleos Vegetais"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refresh,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GetBuilder<VegetalRepository>(
                init: VegetalRepository(),
                builder: (repo) {
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
                  if (repo.isBusy)
                    return Container(
                        alignment: Alignment.topCenter,
                        child: RefreshProgressIndicator());
                  return repo.vegetais.length > 0
                      ? ListView.builder(
                          itemCount: repo.vegetais.length,
                          itemBuilder: (context, i) => _buildVegItem(
                              repo.vegetais[i], i, repo.vegetais.length))
                      : Container(
                          width: context.width,
                          height: context.height,
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Nenhum óleo vegetal encontrado!",
                          ),
                        );
                },
              ))),
    );
  }

  Widget _buildVegItem(Vegetal vegetal, int index, int listCount) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Text(
              vegetal.nome!,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryColor),
            ),
          ),
          Container(
            height: 120,
            width: 240,
            margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: CachedNetworkImage(
                imageUrl: vegetal.imagem != null ? vegetal.imagem!.url! : ""),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: Text(
              "Descrição:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor.withOpacity(0.7)),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              vegetal.descricao!,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10, top: 15),
            alignment: Alignment.topLeft,
            child: Text(
              "Indicação:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor.withOpacity(0.7)),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              vegetal.indicacao!,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ),
          index < listCount - 1
              ? Divider(
                  color: AppColors.primaryColor.withOpacity(0.7),
                  height: 60,
                  thickness: 1,
                  indent: 30,
                  endIndent: 30,
                )
              : Container()
        ],
      ),
    );
  }
}
