import 'package:flutter/material.dart';
import 'package:store/DAO/storeDAO.dart';
import 'package:store/model/product.dart';
import 'package:store/shared/menu.dart';

class FormEdit extends StatelessWidget {
  final TextEditingController registrationControle = TextEditingController();
  final TextEditingController nameControle = TextEditingController();
  final TextEditingController descricaoControle = TextEditingController();
  final TextEditingController precoControle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edição de produtos"),
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
                controller: registrationControle,
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Nome do produto"),
                keyboardType: TextInputType.name,
                controller: nameControle,
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Descrição do produto"),
                keyboardType: TextInputType.name,
                controller: descricaoControle,
              ),
              SizedBox(
                height: 5.0,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Preço do produto"),
                keyboardType: TextInputType.number,
                controller: precoControle,
              ),
              SizedBox(
                height: 5.0,
              ),
              ElevatedButton(
                child: Text("Salvar"),
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
    int registration = int.parse(registrationControle.text);
    String name = nameControle.text;
    String description = descricaoControle.text;
    String price = precoControle.text;
    String message;

    Product product = Product(
      name: name,
      description: description,
      id: registration,
      price: price,
    );
    int resultado = await StoreDAO.updateRecord(
      "products",
      product.toMap(),
    );
    if (resultado != 0) {
      message = "O aluno $name foi atualizado com sucesso!!!";
    } else {
      message = "Não foi possível atualizar o produto $name!!!";
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
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
