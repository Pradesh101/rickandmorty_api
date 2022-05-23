import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:rickandmorty_api/models/info_model.dart';
import 'package:rickandmorty_api/models/rickmorty_model.dart';

class RickMortyService {
  Future<List<RickMortyModel>> fetchRickMortyData(page) async {
    final response = await http
        .get(Uri.parse('https://rickandmortyapi.com/api/character?page=$page'));
    //print(response);
    if (response.statusCode == 200) {
      //InfoModel imodel = InfoModel.fromJson(jsonDecode(response.body[0]));
      var result = jsonDecode(response.body);
      List<RickMortyModel> rmmodel = [];
      for (var item in result['results']) {
        rmmodel.add(RickMortyModel.fromJson(item));
      }
      return rmmodel;
    } else {
      throw Exception('Failed to load Rick and Morty data');
    }
  }
}
