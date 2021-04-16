import 'dart:convert';

import 'package:mobile/models/imagem.dart';

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());

List<Categoria> categoriaListFromJson(String str) =>
    List<Categoria>.from(json.decode(str).map((x) => Categoria.fromJson(x)));

String categoriaListToJson(List<Categoria> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoria {
  Categoria({
    this.id = 0,
    this.nome,
    this.descricao,
    this.imagem,
  });

  int id;
  String? nome;
  String? descricao;
  Imagem? imagem;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        nome: json["nome"],
        descricao: json["descricao"],
        imagem: json["imagem"] != null ? Imagem.fromJson(json["imagem"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "imagem": imagem!.toJson(),
      };
}
