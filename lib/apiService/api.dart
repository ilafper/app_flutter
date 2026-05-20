import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';
import 'package:flutter/material.dart';
import '../home_mongo.dart';
// clase cliente para crud en
class ApiClientes {
  static const url = "https://api-agenda-dam.onrender.com/api/clientes";

  //url crear

  static const url_crear_Cliente =
      "https://api-agenda-dam.onrender.com/api/crearcliente";

  static const url_delete_Cliente =
      "https://api-agenda-dam.onrender.com/api/eliminarcliente";

  static const url_filtro =
      "https://api-agenda-dam.onrender.com/api/filtronombre";

  // cargar todos los clientes
  //acuerdate de poner static para compartir la funcion enm otrods sitios
  static Future<List<Cliente>> getClientes() async {
    print("LLLAMANDO LLAMANDO PROBANDO PROBAND");
    // peticion a la api para cargar clientes
    final res = await http.get(Uri.parse(url));
    print(res);
    // si fue exitosa manda la lista
    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      // guardamos la lista
      List data = json["lista_clientes"];

      print(data);
      //devolvemos al lista
      return data.map((e) => Cliente.fromJson(e)).toList();
    } else {
      throw Exception("Error al cargar clientes");
    }
  }
  // funcion para crear nuevo ciente
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

  // funcion para eliminar cliente
  static Future<Map<String, dynamic>?> eliminarcliente(
    String code_eliminar,
  ) async {
    final response = await http.delete(
      Uri.parse('$url_delete_Cliente/$code_eliminar'),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200 || response.statusCode == 400) {
      var res = jsonDecode(response.body);
      print('eliminar eliminar $res');
      return res;
    }
  }
  // funcion filtro busqueda por nombre 
  static Future<Map<String, dynamic>> filtroBusqueda(String filtro) async {
    final response = await http.get(Uri.parse('$url_filtro/$filtro'));

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
