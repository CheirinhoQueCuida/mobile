import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/widgets/appdrawer.dart';
import 'package:nikutils/extensions/nke_context.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/widgets/nk_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cheirinho Que Cuida"),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints c) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      "assets/images/c_logo.png",
                      width: c.maxWidth * 0.8,
                    ),
                  ),
                  Divider(
                    indent: 20,
                    endIndent: 20,
                    thickness: 2,
                    height: 60,
                  ),

                  // Aromaterapia
                  _buildItem("Aromaterapia", "Adicionar desc...", Mdi.spa),

                  // Cursos
                  _buildItem(
                      "Cursos e Formações",
                      "Contamos com cursos e formações para torna-lo um terapeuta de excelência dentro das terapias holisticas e complementares.",
                      Mdi.school),

                  // Óleos
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Icon(
                      Mdi.water,
                      color: AppColors.primaryColor,
                      size: 40,
                    ),
                  ),
                  Text(
                    "Óleos",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Text(
                      "Adicionar desc....",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColors.primaryColor, fontSize: 14),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NkButton(
                        "Óleos Essenciais",
                        width: 120,
                        textStyle: TextStyle(
                            color: AppColors.background, fontSize: 12),
                        onClick: () {
                          Get.toNamed("/Categorias");
                        },
                      ),
                      NkButton(
                        "Óleos Vegetais",
                        width: 120,
                        textStyle: TextStyle(
                            color: AppColors.background, fontSize: 12),
                        onClick: () {
                          Get.toNamed("/Vegetais");
                        },
                      ),
                    ],
                  ),

                  Divider(
                    indent: 40,
                    endIndent: 40,
                    thickness: 1,
                    height: 40,
                  ),

                  _buildItem("Diluição", "Adicionar desc...", Mdi.waterPercent,
                      btnText: "Calcular", ontap: () async {
                    await Future.delayed(Duration(milliseconds: 80));
                    Get.toNamed("/Diluicao");
                  })
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItem(String title, String desc, IconData icon,
      {String btnText = "Conheça", Function? ontap}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Icon(
            icon,
            color: AppColors.primaryColor,
            size: 40,
          ),
        ),
        Text(
          title,
          style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Text(
            desc,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black87, fontSize: 14),
          ),
        ),
        NkButton(
          btnText,
          // colors: NkColors(
          //     color: AppColors.primaryColor,
          //     splashColor: Colors.white30,
          //     highlightColor: Colors.white12),
          // textStyle: TextStyle(color: AppColors.background),
          onClick: ontap != null ? ontap : () {},
        ),
        Divider(
          indent: 40,
          endIndent: 40,
          thickness: 1,
          height: 40,
        ),
      ],
    );
  }
}
