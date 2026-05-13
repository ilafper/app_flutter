import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';
import 'package:flutter/material.dart';
import '../sql.dart';


class Apisql {
  static const clientes_sql = "https://api-sql-agenda-bien.onrender.com/api/clientesql";
  
  static const crear_cliente_sql = "https://api-sql-agenda-bien.onrender.com/api/crearclientsql";

  static Future<List<Cliente>> clienteSql() async {
    print("todos clientes sql");
    final res = await http.get(Uri.parse(clientes_sql));
    print(res);
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);

      List data = json["lista_clientes"];

      print(data);

      return data.map((e) => Cliente.fromJson(e)).toList();
    } else {
      throw Exception("Error al cargar clientes");
    }
  }
  
  // crear cliente sql
  static Future<Map<String, dynamic>?> crearClienteSql({
    required String nombre,
    required String apellidos,
    required String telefono,
    required String direccion,
    required String correo,
  }) async {
    final response = await http.post(
      Uri.parse(crear_cliente_sql),
      headers: {"Content-Type": "application/json"},



      body: jsonEncode({
        "nombre": nombre,
        "apellidos": apellidos,
        "telefono": telefono,
        "direccion": direccion,
        "correo": correo,
      }),
    );

    //print(response.body);

    if (response.statusCode == 200 || response.statusCode == 400) {
      var res = jsonDecode(response.body);
      print('respues respuesta $res');
      return res;
    }
  }
}