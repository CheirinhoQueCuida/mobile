class Imagem {
  Imagem({
    this.id,
    this.url,
  });

  String id;
  String imageType;
  String url;

  factory Imagem.fromJson(Map<String, dynamic> json) => Imagem(
        id: json["id"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
      };
}
