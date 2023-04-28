import 'dart:convert';

import 'package:flutter/material.dart';

class MyTaskCard extends StatelessWidget{
  final String titulo, descripcion, fecha, terminada, fechaTermino, imagen;
  final int? id;
  final Widget ruta;

  const MyTaskCard({super.key,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.terminada,
    required this.id,
    required this.ruta,
    required this.fechaTermino,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, bottom: 10),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context, MaterialPageRoute(builder: (context) => ruta),
          );
        },
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 60, width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Theme.of(context).colorScheme.tertiary,
                        backgroundImage: MemoryImage(base64Decode(imagen)),
                      ),
                    ),
                    Text(titulo,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Text(descripcion,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.tertiary,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (terminada=="true")
                      ? Text("Terminado",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text("Pendiente",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.tertiary,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                    Text(fecha,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}