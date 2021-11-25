class LivroNovo {
  final String titulo;
  final String autor;

  LivroNovo({required this.titulo, required this.autor});

  Map<String, dynamic> toJson() => <String, dynamic>{
        "titulo": titulo,
        "autor": autor,
      };

  factory LivroNovo.fromJson(Map<dynamic, dynamic> json) {
    return LivroNovo(titulo: json['titulo'], autor: json['autor']);
  }
}
