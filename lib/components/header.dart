import 'package:flutter/material.dart';

class HeaderCustom extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  final TextStyle? tituloStyle;
  final Color? iconColor;
  final Color? backgroundColor;

 const HeaderCustom({
  super.key,
  required this.titulo,
  this.tituloStyle,
  this.iconColor,
  this.backgroundColor
 });

 @override
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
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


}
