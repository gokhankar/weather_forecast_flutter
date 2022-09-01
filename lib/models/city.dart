class City {

  const City({
    required this.name,
    required this.eng,
  });

  final String name;
  final String eng;

  @override
  String toString() {
    return 'city: $name (eng: $eng )';
  }
}