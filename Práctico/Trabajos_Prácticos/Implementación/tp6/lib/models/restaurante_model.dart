import 'package:tp6/models/activity_model.dart';

class Restaurante {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Restaurante({
    required this.imageUrl,
    required this.city,
    required this.country,
    required this.description,
    required this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/hamburguesa.jpg',
    name: 'TripleMac',
    type: 'Hamburguesa con triple carne, queso cheddar, salsa Big Mac',
    //startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 520,
  ),
  Activity(
    imageUrl: 'assets/images/cajitaFeliz.jpg',
    name: 'Cajita Feliz McFiesta Jr',
    type: 'Hamburguesa con papas, bebida y yogurt',
    //startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 620,
  ),
  Activity(
    imageUrl: 'assets/images/postre.jpg',
    name: 'McFlurry Oreo',
    type: 'Helado con trocitos de galletas Oreo',
    //startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 299,
  ),
];

List<Restaurante> restaurantes = [
  Restaurante(
    imageUrl: 'assets/images/mcDonald.jpg',
    city: 'McDonald\'s',
    country: 'Córdoba',
    description: '15 - 20 min',
    activities: activities,
  ),
  Restaurante(
    imageUrl: 'assets/images/rapanui.jpg',
    city: 'Rapanui',
    country: 'Córdoba',
    description: '20 - 35 min',
    activities: activities,
  ),
  Restaurante(
    imageUrl: 'assets/images/clubMilanesa.jpg',
    city: 'El Club de la Milanesa',
    country: 'Córdoba',
    description: '30 - 45 min',
    activities: activities,
  ),
  Restaurante(
    imageUrl: 'assets/images/grido.jpg',
    city: 'Grido',
    country: 'Córdoba',
    description: '26 - 41 min',
    activities: activities,
  ),
  Restaurante(
    imageUrl: 'assets/images/papanato.jpg',
    city: 'Papanato',
    country: 'Córdoba',
    description: '35 - 50 min',
    activities: activities,
  ),
];
