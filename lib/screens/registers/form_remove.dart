
import 'package:flutter/material.dart';
import 'package:store/DAO/storeDAO.dart';
import 'package:store/model/product.dart';
import 'package:store/shared/menu.dart';


class FormRemove extends StatelessWidget {
  final TextEditingController registrationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remoção de produtos"),
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "ID do produto"),
                keyboardType: TextInputType.number,
                controller: registrationController,
              ),
              SizedBox(
                height: 5.0,
              ),
              ElevatedButton(
                child: Text("Remover produto"),
                onPressed: () {
                  remove(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void remove(BuildContext mainContext) async {
    int registration = int.parse(registrationController.text);
    String message;

    Product product = Product(id: registration);
    int result = await StoreDAO.removeRecord(
      "products",
      product.toMap(),
    );
    if (result != 0) {
      message = "O produto foi removido com sucesso!!!";
    } else {
      message = "Não foi possível remover o produto!!!";
    }
    showDialog(
      context: mainContext,
      builder: (context) => AlertDialog(
        content: Text(message),
        title: Text("Mensagem do sistema"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"))
        ],
      ),
    );
  }
}
