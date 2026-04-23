import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';

class ApiClientes {
  static const url = "http://10.0.2.2:3000/api/clientes";

  static Future<List<Cliente>> getClientes() async {
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      List data = jsonDecode(res.body);
      
      print(data);
      return data.map((e) => Cliente.fromJson(e)).toList();
    } else {
      throw Exception("Error al cargar clientes");
    }
  }
}