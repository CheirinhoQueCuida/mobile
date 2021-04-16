import 'dart:convert';

import 'imagem.dart';

Oleo oleoFromJson(String str) => Oleo.fromJson(json.decode(str));

String oleoToJson(Oleo data) => json.encode(data.toJson());

List<Oleo> oleoListFromJson(String str) =>
    List<Oleo>.from(json.decode(str).map((x) => Oleo.fromJson(x)));

String oleoListToJson(List<Oleo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Oleo {
  Oleo({
    this.id,
    this.nome,
    this.nomeCientifico,
    this.classificacao,
    this.funcaoTerapeuta,
    this.funcaoVibracional,
    this.funcaoEstetica,
    this.sinergia,
    this.seguranca,
    this.advertencia,
    this.descricao,
    this.imagemId,
    this.imagem,
  });

  int? id;
  String? nome;
  String? nomeCientifico;
  String? classificacao;
  String? funcaoTerapeuta;
  String? funcaoVibracional;
  String? funcaoEstetica;
  String? sinergia;
  String? seguranca;
  String? advertencia;
  String? descricao;
  String? imagemId;
  Imagem? imagem;

  factory Oleo.fromJson(Map<String, dynamic> json) => Oleo(
        id: json["id"],
        nome: json["nome"],
        nomeCientifico: json["nomeCientifico"],
        classificacao: json["classificacao"],
        funcaoTerapeuta: json["funcaoTerapeuta"],
        funcaoVibracional: json["funcaoVibracional"],
        funcaoEstetica: json["funcaoEstetica"],
        sinergia: json["sinergia"],
        seguranca: json["seguranca"],
        advertencia: json["advertencia"],
        descricao: json["descricao"],
        imagemId: json["imagemId"],
        imagem: json["imagem"] != null ? Imagem.fromJson(json["imagem"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "nomeCientifico": nomeCientifico,
        "classificacao": classificacao,
        "funcaoTerapeuta": funcaoTerapeuta,
        "funcaoVibracional": funcaoVibracional,
        "funcaoEstetica": funcaoEstetica,
        "sinergia": sinergia,
        "seguranca": seguranca,
        "advertencia": advertencia,
        "descricao": descricao,
        "imagemId": imagemId,
        "imagem": imagem != null ? imagem!.toJson() : null,
      };
}
