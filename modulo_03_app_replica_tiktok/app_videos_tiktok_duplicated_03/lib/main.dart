import 'package:app_videos_tiktok_duplicated_03/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //quita la etiqueta de debug en la app
      debugShowCheckedModeBanner: false,
      //aplica en esta pantalla el estilo que hemos difinido en la clase
      theme: AppTheme().getTheme(),
      // TITULO DE LA APLICACION
      title: 'App TikTok Replica',
      //pantalla principal
      home: Scaffold(
        //barra de titulo de la aplicacion
        appBar: AppBar(title: Text('App TikTok Réplica'), centerTitle: true),
        //cuerpo de la aplicacion
        body: Center(child: Container(child: Text('Hello World'))),
      ),
    );
  }
}
