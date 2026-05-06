import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';
import 'package:flutter/material.dart';
import '../home_mongo.dart';

class ApiClientes {
  static const url = "http://10.211.0.33:3000/api/clientes";

  //url crear

  static const url_crear_Cliente = "http://10.211.0.33:3000/api/crearcliente";
  // cargar todos los clientes
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

  static Future<http.Response?> enviarDatos({
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
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response; 
    }

     return null;
  }
}
