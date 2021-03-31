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
        this.categoriaId,
        this.nome,
        this.descricao,
        this.cor,
        this.aroma,
        this.imagemId,
        this.imagem,
    });

    int id;
    int categoriaId;
    String nome;
    String descricao;
    String cor;
    String aroma;
    String imagemId;
    Imagem imagem;

    factory Oleo.fromJson(Map<String, dynamic> json) => Oleo(
        id: json["id"],
        categoriaId: json["categoriaId"],
        nome: json["nome"],
        descricao: json["descricao"],
        cor: json["cor"],
        aroma: json["aroma"],
        imagemId: json["imagemId"],
        imagem: Imagem.fromJson(json["imagem"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "categoriaId": categoriaId,
        "nome": nome,
        "descricao": descricao,
        "cor": cor,
        "aroma": aroma,
        "imagemId": imagemId,
        "imagem": imagem.toJson(),
    };
}
