import 'dart:math';
import 'package:flutter/material.dart';
import 'package:consumir_api/providers/respuesta_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void showResponse(RespuestaProvider respuestaProvider, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        final respuesta = respuestaProvider.respuestas[index];

        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (respuesta.value.isNotEmpty)
                  Text(
                    'id:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                if (respuesta.value.isNotEmpty)
                  Text(
                    respuesta.value,
                    style: TextStyle(fontSize: 16),
                  ),
                
                if (respuesta.icon_url.isNotEmpty)
                  Image.network(
                    respuesta.icon_url,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final respuestaProvider = context.watch<RespuestaProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea'),
        backgroundColor: Color.fromARGB(255, 114, 91, 218),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await respuestaProvider.loadRespuesta();
                  if (respuestaProvider.respuestas.isNotEmpty) {
                    final randomIndex =
                        Random().nextInt(respuestaProvider.respuestas.length);
                    showResponse(respuestaProvider, randomIndex);
                  }
                },
                child: Text('Presentar'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
  );
  }
}
