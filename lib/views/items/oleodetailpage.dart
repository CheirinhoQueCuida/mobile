import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/helpers/colors.dart';
import 'package:mobile/models/oleo.dart';
import 'package:nikutils/extensions/nke_context.dart';
import 'package:nikutils/nikutils.dart';

class OleoDetailPage extends StatefulWidget {
  OleoDetailPage({Key? key, required this.oleo}) : super(key: key);

  final Oleo oleo;

  @override
  _OleoDetailPageState createState() => _OleoDetailPageState();
}

class _OleoDetailPageState extends State<OleoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        backgroundColor: AppColors.primaryColor,
        heroTag: null,
        child: Icon(
          Icons.keyboard_arrow_down,
          size: 40,
        ),
      ),
      body: Container(
        width: context.width,
        decoration: BoxDecoration(
            color: AppColors.background,
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, -10),
                  blurRadius: 10,
                  spreadRadius: -5,
                  color: Colors.black.withOpacity(0.15))
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  widget.oleo.nome!,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30,
                  ),
                ),
              ),
              widget.oleo.imagem != null
                  ? Container(
                      padding: EdgeInsets.only(top: 15),
                      height: 170,
                      child: CachedNetworkImage(
                          imageUrl: widget.oleo.imagem!.url!))
                  : Container(),
              _buildDivider("Sobre"),
              _buildTextTitle("Nome Científico:"),
              _buildTextValue(widget.oleo.nomeCientifico!),
              _buildTextTitle("Descrição"),
              _buildTextValue(widget.oleo.descricao!),
              _buildTextTitle("Classificação:"),
              _buildTextValue(widget.oleo.classificacao!),
              _buildDivider("Suas Funções"),
              _buildTextTitle("Função Terapêutica:"),
              _buildTextValue(widget.oleo.funcaoTerapeuta!),
              _buildTextTitle("Função Vibracional:"),
              _buildTextValue(widget.oleo.funcaoVibracional!),
              _buildTextTitle("Função Estética:"),
              _buildTextValue(widget.oleo.funcaoEstetica!),
              _buildDivider("Outros"),
              _buildTextTitle("Sinergia:"),
              _buildTextValue(widget.oleo.sinergia!),
              _buildTextTitle("Segurança de Uso:"),
              _buildTextValue(widget.oleo.seguranca!),
              _buildTextTitle("Advertencia de Uso:"),
              _buildTextValue(widget.oleo.advertencia!),
              Divider(
                color: Colors.transparent,
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextTitle(String title) {
    return Container(
      padding: EdgeInsets.only(top: 23, left: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 19,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildTextValue(String value) {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 15),
      alignment: Alignment.centerLeft,
      child: Text(
        value,
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontSize: 17,
        ),
      ),
    );
  }

  Widget _buildDivider(String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
      child: Text(
        value,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
