import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';
import 'package:flutter/material.dart';
import '../home_mongo.dart';

class ApiClientes {
  static const url = "https://api-agenda-dam.onrender.com/api/clientes";

  //url crear

  static const url_crear_Cliente =
      "https://api-agenda-dam.onrender.com/api/crearcliente";

  static const url_delete_Cliente =
      "https://api-agenda-dam.onrender.com/api/eliminarcliente";
  // cargar todos los clientes
  //acuerdate de poner static para compartir la funcion enm otrods sitios
  static Future<List<Cliente>> getClientes() async {
    print("LLLAMANDO LLAMANDO PROBANDO PROBAND");
    final res = await http.get(Uri.parse(url));
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

  static Future<Map<String, dynamic>?> enviarDatos({
    required String nombre,
    required String apellidos,
    required String telefono,
    required String direccion,
    required String correo,
  }) async {
    final response = await http.post(
      Uri.parse(url_crear_Cliente),
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

  static Future<Map<String, dynamic>?> eliminarcliente(String code_eliminar) async {
    // final response = await http.delete(
    //   Uri.parse('$url_delete_Cliente/$code_eliminar'),
    //   headers: {"Content-Type": "application/json"},
    // );

    // if (response.statusCode == 200 || response.statusCode == 400) {
    //   var res = jsonDecode(response.body);
    //   print('respuesta eliminar $res');
    //   return res;
    // }

    final response = await http.delete(
      Uri.parse('$url_delete_Cliente/$code_eliminar'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode== 400) {
      var res = jsonDecode(response.body);
      print('eliminar eliminar $res');
      return res;
    }
  }
}
