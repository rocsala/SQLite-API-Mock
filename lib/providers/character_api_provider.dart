import 'package:todo_mock/models/character_model.dart';
import 'package:todo_mock/providers/db_provider.dart';
import 'package:dio/dio.dart';

class CharacterApiProvider {
  Future<List<Character>> getAllCharacters() async {
    var url = "http://demo5637287.mockable.io/attacktitan";
    Response response = await Dio().get(url);

    return (response.data as List).map((character) {
      // ignore: avoid_print
      print('Inserting $character');
      DBProvider.db.createCharacter(Character.fromJson(character));
    }).toList();
  }
}
