import 'package:flutter/material.dart';
import 'package:recetas/models/receta.dart';
import 'package:recetas/models/receta_api.dart';
import 'package:recetas/views/widgets/card_recetas.dart';

class RecetasScreen extends StatefulWidget {

  @override
  _RecetasScreenState createState() => _RecetasScreenState();
}

class _RecetasScreenState extends State<RecetasScreen> {

  List<Recipe> _recetas;
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    getRecetas();
  }

  Future<void> getRecetas() async{
    _recetas = await RecetaAPI.getReceta();
    setState(() {
      _cargando = false;
    });
    print(_recetas);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10),
            Text('Recetas de Comida'),
          ],
        ),
      ),
      body: _cargando ? Center(child: CircularProgressIndicator()) 
        : ListView.builder(
          itemCount: _recetas.length,
          itemBuilder: (context, index){
            return RecipeCard(
              nombre: _recetas[index].nombre,
              tiempo: _recetas[index].tiempo,
              valoracion: _recetas[index].valoracion.toString(),
              imagen: _recetas[index].imagen,
            );
          },
        ));
  }
}