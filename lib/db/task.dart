class Task {
  int? id;
  String titulo;
  String descripcion;
  String fecha;
  String terminada;
  String fechaTermino;
  String imagen;

  Task({
    this.id,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.terminada,
    required this.fechaTermino,
    required this.imagen,
  });

  Map<String, dynamic> toMap() {
    return {
      'id' : id,
      'titulo' : titulo,
      'descripcion' : descripcion,
      'fecha' : fecha,
      'terminada' : terminada,
      'fechaTermino' : fechaTermino,
      'imagen' : imagen,
    };
  }
}