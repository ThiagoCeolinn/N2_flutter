import 'package:flutter/material.dart';
import 'package:store/screens/home/list_of_products.dart';
import 'package:store/screens/registers/form_edit.dart';
import 'package:store/screens/registers/form_register.dart';
import 'package:store/screens/registers/form_remove.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // blue.shade300,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => ListOfProducts(),
        "/insert": (BuildContext context) => FormRegister(),
        "/edit": (BuildContext context) => FormEdit(),
        "/remove": (BuildContext context) => FormRemove(),
      },
    ),
  );
}
