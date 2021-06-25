import 'dart:convert';

import 'imagem.dart';

Vegetal vegetalFromJson(String str) => Vegetal.fromJson(json.decode(str));

String vegetalToJson(Vegetal data) => json.encode(data.toJson());

List<Vegetal> vegetalListFromJson(String str) =>
    List<Vegetal>.from(json.decode(str).map((x) => Vegetal.fromJson(x)));

String vegetalListToJson(List<Vegetal> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vegetal {
  Vegetal({
    this.id,
    this.nome,
    this.indicacao,
    this.descricao,
    this.imagemId,
    this.imagem,
  });

  int? id;
  String? nome;
  String? descricao;
  String? indicacao;
  String? imagemId;
  Imagem? imagem;

  factory Vegetal.fromJson(Map<String, dynamic> json) => Vegetal(
        id: json["id"],
        nome: json["nome"],
        indicacao: json["indicacao"],
        descricao: json["descricao"],
        imagemId: json["imagemId"],
        imagem: json["imagem"] != null ? Imagem.fromJson(json["imagem"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao,
        "indicacao": indicacao,
        "imagemId": imagemId,
        "imagem": imagem != null ? imagem!.toJson() : null,
      };
}
