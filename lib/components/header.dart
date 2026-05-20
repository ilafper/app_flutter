import 'package:flutter/material.dart';
// mi conponente header o app bar en flutter 
class HeaderCustom extends StatelessWidget implements PreferredSizeWidget {
  
  // parametros que se le pasa, solo el titulo es onligatorio
  final String titulo;
  final TextStyle? tituloStyle;
  final Color? iconColor;
  final Color? backgroundColor;
  // constructor
  
 const HeaderCustom({
  super.key,
  required this.titulo,
  this.tituloStyle,
  this.iconColor,
  this.backgroundColor
 });


// vista que se mostrar en la pantalla en este caso , dibuja o construye un app bar que es el header del movil 
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.blue,
      // le añdes el icono pra ir para atras pero no tienes que configurar nada ya lo hace flutter para ti, 
      iconTheme: IconThemeData(
        color: iconColor ?? Colors.white,
      ),

      // estructura del titulo , el texto mas el estilo
      title: Text(
        titulo,
        style: tituloStyle, 
      ),

    );
  }
  
  //ocupara la altura estandar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}
