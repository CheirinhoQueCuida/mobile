import 'dart:convert';

import 'package:mobile/models/imagem.dart';

Oleo oleoFromJson(String str) => Oleo.fromJson(json.decode(str));

String oleoToJson(Oleo data) => json.encode(data.toJson());

List<Oleo> oleoListFromJson(String str) =>
    List<Oleo>.from(json.decode(str).map((x) => Oleo.fromJson(x)));

String oleoListToJson(List<Oleo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Oleo {
  Oleo({
    this.id,
    this.categoriaId,
    this.nome,
    this.imageUrl,
    this.descricao,
    this.categoria,
    this.fotos,
  });

  int id;
  int categoriaId;
  String nome;
  String imageUrl;
  String descricao;
  dynamic categoria;
  List<Imagem> fotos;

  factory Oleo.fromJson(Map<String, dynamic> json) => Oleo(
        id: json["id"],
        categoriaId: json["categoriaId"],
        nome: json["nome"],
        imageUrl: json["imageUrl"],
        descricao: json["descricao"],
        categoria: json["categoria"],
        fotos: List<Imagem>.from(json["fotos"].map((x) => Imagem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoriaId": categoriaId,
        "nome": nome,
        "imageUrl": imageUrl,
        "descricao": descricao,
        "categoria": categoria,
        "fotos": List<dynamic>.from(fotos.map((x) => x.toJson())),
      };
}
