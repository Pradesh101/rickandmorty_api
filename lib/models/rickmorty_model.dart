import 'package:rickandmorty_api/models/loc_origin_model.dart';

class RickMortyModel {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final LocOrigin origin;
  final LocOrigin location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  RickMortyModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

  factory RickMortyModel.fromJson(Map<String, dynamic> json) {
    return RickMortyModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        origin: LocOrigin.fromJson(json['origin']),
        location: LocOrigin.fromJson(json['location']),
        image: json['image'],
        episode: List<String>.from(json['episode'].map((x) => x)),
        url: json['url'],
        created: json['created']);
  }
}
