import 'package:flutter/cupertino.dart';

class Recipe{
  final String nombre;
  final String imagen;
  final double valoracion;
  final String tiempo;

  Recipe({this.nombre, this.imagen, this.valoracion, this.tiempo});

  factory Recipe.fromJason(dynamic json){
      return Recipe(
        nombre:        json['name'] as String,
        imagen:        json['images'][0]['hostedLargeUrl'] as String,
        valoracion:    json['rating'] as double,
        tiempo:        json['totalTime'] as String,
      );
  }

  static List<Recipe> recetasFromSnapshot(List snapshot){
    return snapshot.map((data){
        return Recipe.fromJason(data);
      }).toList();
  }

  @override
  String toString(){
    return 'Receta {nombre: $nombre, imagen: $imagen, valoracion; $valoracion, tiempo: $tiempo}';
  }
}