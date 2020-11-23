import 'dart:convert';

import 'package:mobile/models/foto.dart';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

List<Item> itemListFromJson(String str) =>
    List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemListToJson(List<Item> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
  Item({
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
  List<Foto> fotos;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        categoriaId: json["categoriaId"],
        nome: json["nome"],
        imageUrl: json["imageUrl"],
        descricao: json["descricao"],
        categoria: json["categoria"],
        fotos: List<Foto>.from(json["fotos"].map((x) => Foto.fromJson(x))),
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
