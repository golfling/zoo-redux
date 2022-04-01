import 'dart:convert';
import 'dart:io';
import 'package:zoo_redux/logic/model.dart';

class ApiRepository {
  static const url = 'https://zoo-animal-api.herokuapp.com/animals/rand';
  static const count = '10';
  final client = HttpClient();

  Future<List<Animal>> getAnimals() async {
    const strUrl = '$url/$count';
    try {
      final url = Uri.parse(strUrl);
      final request = await client.getUrl(url);
      final response = await request.close();
      if (response.statusCode == 200) {
        final jsonStrings = await response.transform(utf8.decoder).toList();
        final jsonString = jsonStrings.join();
        final result = animalsListFromJson(jsonString);
        return result;
      } else {
        throw ApiException('exc in api');
      }
    } catch (e) {
      throw ApiException('smth was wrong');
    }
  }
}

class ApiException {
  final String message;

  ApiException(this.message);
}
