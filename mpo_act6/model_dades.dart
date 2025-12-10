class InscripcioDades {
  String nom;
  String genere;
  List<String> interessos;

  InscripcioDades({
    required this.nom,
    required this.genere,
    required this.interessos,
  });

  @override
  String toString() {
    return 'Nom: $nom, Gènere: $genere, Interessos: $interessos';
  }
}