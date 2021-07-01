import 'dart:convert';
import 'package:recetas/models/receta.dart';
import 'package:http/http.dart' as http;

class RecetaAPI{

  static Future<List<Recipe>> getReceta() async{

    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {
        "limit": "18",
        "start": "0",
        "tag": "list.recipe.popular"
    });

    final response = await http.get(uri, headers: {
        "x-rapidapi-key": "d730f1f076msh4f1de01c1350b88p199618jsn8eb018f5fa06",
        "x-rapidapi-host": "yummly2.p.rapidapi.com",
        "useQueryString": "true",
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recetasFromSnapshot(_temp);
  }

}