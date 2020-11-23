import 'dart:convert';

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());

List<Categoria> categoriaListFromJson(String str) =>
    List<Categoria>.from(json.decode(str).map((x) => Categoria.fromJson(x)));

String categoriaListToJson(List<Categoria> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categoria {
  Categoria({
    this.id,
    this.categoriaPaiId,
    this.nome,
    this.imageUrl,
    this.descricao,
  });

  int id;
  dynamic categoriaPaiId;
  String nome;
  String imageUrl;
  String descricao;

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        id: json["id"],
        categoriaPaiId: json["categoriaPaiId"],
        nome: json["nome"],
        imageUrl: json["imageUrl"],
        descricao: json["descricao"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoriaPaiId": categoriaPaiId,
        "nome": nome,
        "imageUrl": imageUrl,
        "descricao": descricao,
      };
}
