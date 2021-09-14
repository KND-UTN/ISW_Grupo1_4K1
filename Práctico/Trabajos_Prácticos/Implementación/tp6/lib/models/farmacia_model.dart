class Farmacia {
  String imageUrl;
  String name;
  String address;

  Farmacia({
    required this.imageUrl,
    required this.name,
    required this.address,
  });
}

final List<Farmacia> farmacias = [
  Farmacia(
    imageUrl: 'assets/images/farmacia0.jpg',
    name: 'Farmacity',
    address: 'Blvd. Chacabuco 79',
  ),
  Farmacia(
    imageUrl: 'assets/images/farmacia1.jpg',
    name: 'Líder',
    address: 'Av. Gral. Paz 258',
  ),
  Farmacia(
    imageUrl: 'assets/images/farmacia2.jpg',
    name: 'Farmacia Gral Paz',
    address: 'Av. Colón 745',
  ),
];
