import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:nikutils/widgets/nk_textfield.dart';
import 'package:nikutils/nikutils.dart';

class DilutionPage extends StatefulWidget {
  DilutionPage({Key? key}) : super(key: key);

  @override
  _DilutionPageState createState() => _DilutionPageState();
}

class _DilutionPageState extends State<DilutionPage> {
  double oleoVegetal = 0;
  double porcentagem = 0;

  RxInt resultado = 0.obs;

  void calcular() {
    var res = 25 * oleoVegetal;
    var decimals = res * (porcentagem / 100);
    int dec = int.tryParse(decimals.toString().split('.')[1].substring(0, 1))!;
    int result = decimals.toInt();
    if (dec > 0) {
      result++;
    }
    resultado.value = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Diluição"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            height: context.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: Text("25 Gotas por ml.")),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: context.width * 0.40,
                      child: NkTextField(
                        hintText: "Óleo vegetal (ml)",
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 14),
                        onChanged: (value) {
                          value = value.replaceAll(',', '.');
                          if (!value.isBlank!)
                            oleoVegetal = double.parse(value);
                          else
                            oleoVegetal = 0;
                          calcular();
                        },
                        background: (sets) {
                          return Container(
                            width: sets.constSize!.width,
                            height: sets.constSize!.height,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                )),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: context.width * 0.40,
                      child: NkTextField(
                        hintText: "Porcentagem",
                        keyboardType: TextInputType.number,
                        style: TextStyle(fontSize: 14),
                        onChanged: (value) {
                          value = value.replaceAll(',', '.');
                          if (!value.isBlank!)
                            porcentagem = double.parse(value);
                          else
                            porcentagem = 0;
                          calcular();
                        },
                        background: (sets) {
                          return Container(
                            width: sets.constSize!.width,
                            height: sets.constSize!.height,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: AppColors.primaryColor,
                                )),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 10),
                    child: Text(
                      "Total de gotas:",
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  child: Obx(() {
                    return Text(
                      resultado.toString(),
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    );
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
