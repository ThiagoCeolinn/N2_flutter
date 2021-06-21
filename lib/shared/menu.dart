import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              icon: Icon(Icons.shopping_cart),
              label: Text(
                "Listar produtos",
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/insert", (route) => false);
              },
              icon: Icon(Icons.add_shopping_cart),
              label: Text(
                "Cadastrar produto",
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/edit", (route) => false);
              },
              icon: Icon(Icons.edit),
              label: Text(
                "Atualizar dados de produto",
              ),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/remove", (route) => false);
              },
              icon: Icon(Icons.remove_shopping_cart),
              label: Text(
                "Remover produto",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
