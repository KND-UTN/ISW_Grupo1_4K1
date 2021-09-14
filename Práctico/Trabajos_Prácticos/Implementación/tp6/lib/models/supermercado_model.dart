class Supermercado {
  String imageUrl;
  String name;
  String address;

  Supermercado({
    required this.imageUrl,
    required this.name,
    required this.address,
  });
}

final List<Supermercado> supermercados = [
  Supermercado(
    imageUrl: 'assets/images/supermercado0.jpg',
    name: 'Carrefour',
    address: 'Av. Colón 488',
  ),
  Supermercado(
    imageUrl: 'assets/images/supermercado1.jpg',
    name: 'Disco',
    address: 'Av. Vélez Sarsfield 132',
  ),
  Supermercado(
    imageUrl: 'assets/images/supermercado2.jpg',
    name: 'Vea',
    address: 'Av. Emilio Olmos 78',
  ),
];
