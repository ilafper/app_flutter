import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';
import 'package:flutter/material.dart';
import '../sql.dart';

// lo mismo que en mongo pero para sql
class Apisql {
  static const clientes_sql = "https://api-sql-agenda-bien.onrender.com/api/clientesql";
  
  static const crear_cliente_sql = "https://api-sql-agenda-bien.onrender.com/api/crearclientsql";

  static const eliminar_cliente_sql = "https://api-sql-agenda-bien.onrender.com/api/deleteclientesql";


  static const filtro_sql = "https://api-sql-agenda-bien.onrender.com/api/filtronombresql";

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

  static Future<Map<String, dynamic>?> eliminarclienteSQL(
    String code_eliminar,
  ) async {
    final response = await http.delete(
      Uri.parse('$eliminar_cliente_sql/$code_eliminar'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      var res = jsonDecode(response.body);
      print('eliminar eliminar $res');
      return res;
    }
  }

  static Future<Map<String, dynamic>> filtroBusquedaSQL(String filtro) async {
    final response = await http.get(Uri.parse('$filtro_sql/$filtro'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
    
      return data;
    } else {
      return {
      "success": false,
      "error": "Error en la petición"
    };
    }
  }

}