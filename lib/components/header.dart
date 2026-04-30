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

      iconTheme: IconThemeData(
        color: iconColor ?? Colors.white,
      ),

      title: Text(
        titulo,
        style: tituloStyle, 
      ),

    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);


}
