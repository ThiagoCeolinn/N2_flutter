import 'package:flutter/material.dart';
import 'package:store/DAO/storeDAO.dart';
import 'package:store/model/product.dart';
import 'package:store/shared/menu.dart';

class FormRegister extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de produtos"),
      ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Nome do produto"),
                keyboardType: TextInputType.name,
                controller: nameController,
              ),
                SizedBox(
                height: 5.0,
              ),
                TextField(
                decoration: InputDecoration(labelText: "Descrição do produto"),
                keyboardType: TextInputType.name,
                controller: descriptionController,
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Preço do produto"),
                keyboardType: TextInputType.emailAddress,
                controller: priceController,
              ),
              SizedBox(
                height: 5.0,
              ),
              ElevatedButton(
                child: Text("Cadastrar produto"),
                onPressed: () {
                  saveRegister(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveRegister(BuildContext mainContext) async {
    String name = nameController.text;
    String description = descriptionController.text;
    String price = priceController.text;
    String message;

    Product product =
        Product(name: name, description: description, price: price);
    int resultado = await StoreDAO.insertRecord(
      "Products",
      product.toMap(),
    );
    if (resultado != 0) {
      message = "O produto $name foi cadastrado com sucesso!!!";
    } else {
      message = "Não foi possível cadastrar o produto $name!!!";
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
