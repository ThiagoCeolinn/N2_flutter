import 'package:flutter/material.dart';
import 'package:store/DAO/storeDAO.dart';
import 'package:store/screens/home/widgets/main_screen.dart';

class ListOfProducts extends StatefulWidget {
  @override
  _ListOfProductsState createState() => _ListOfProductsState();
}

class _ListOfProductsState extends State<ListOfProducts> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: StoreDAO.listRecords("products"), builder: builder);
  }
 Widget builder(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      default:
        return MainScreen(snapshot.data);
    }
  }

}
