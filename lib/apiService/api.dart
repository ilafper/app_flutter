import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cliente.dart';

class ApiClientes {
  static const url = "http://192.168.0.25:3000/api/clientes";

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
}