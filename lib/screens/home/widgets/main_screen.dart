import 'package:flutter/material.dart';
import 'package:store/model/product.dart';
import 'package:store/shared/menu.dart';

class MainScreen extends StatelessWidget {
  final dynamic _data;
  late final List<Product> _products;
  MainScreen(this._data);

  @override
  Widget build(BuildContext context) {
    _products = prepareProducts(this._data);
    return Scaffold(
        appBar: AppBar(
          title: Text("Carrinho"),
        ),
        drawer: Menu(),
        body: ListView.builder(
            itemBuilder: listBuilder, itemCount: this._products.length));
  }

  Widget listBuilder(BuildContext context, int index) {
    return ListTile(
      leading: Column(
        children: [
          Icon(Icons.shopping_basket),
          // Text(this._products.elementAt(index).id.toString())
        ],
      ),
      title: Text(
        "ID: ${this._products.elementAt(index).id.toString()}\nNome: ${this._products.elementAt(index).name!} \nDescrição: ${ this._products.elementAt(index).description!}\nPreço: R\$ ${this._products.elementAt(index).price.toString()}"
      ),
     
    );
  }

  List<Product> prepareProducts(dynamic data) {
    List<Product> products = [];
    for (var map in data) {
      products.add(Product.fromMap(map));
    }
    return products;
  }
}
