import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_task_list/my_widgets/my_appbar.dart';
import 'package:my_task_list/my_widgets/my_body_container.dart';
import 'package:my_task_list/my_widgets/my_form_label.dart';
import 'package:my_task_list/my_widgets/my_image_text.dart';
import 'package:my_task_list/my_widgets/my_text_form_field_task.dart';


class CompletedTask extends StatelessWidget{
  final TextEditingController _tituloTextController = TextEditingController();
  final TextEditingController _descripcionTextController = TextEditingController();
  final TextEditingController _fechaTextController = TextEditingController();
  final TextEditingController _fechaTerminoTextController = TextEditingController();

  final String titulo, descripcion, fecha, terminada, fechaTermino, imagen;
  final int? id;
  CompletedTask({super.key,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.terminada,
    required this.fechaTermino,
    required this.imagen,
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    _tituloTextController.text = titulo;
    _descripcionTextController.text = descripcion;
    _fechaTextController.text = fecha;
    _fechaTerminoTextController.text = fechaTermino;

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          MyBodyContainer(
            widget: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150,),
                  myImageButton(context),
                  const MyImageText(text: "Click para cambiar imagen"),

                  const SizedBox(height: 10,),
                  const MyFormLabel(text: "Título"),
                  MyTextFormFieldTask(
                    controller: _tituloTextController,
                    text: "Escribe aquí el título de tu tarea",
                    height: 50,
                    maxLines: 1,
                    enabled: false,
                  ),

                  const SizedBox(height: 10,),
                  const MyFormLabel(text: "Descripción"),
                  MyTextFormFieldTask(
                    controller: _descripcionTextController,
                    text: "Describe cómo será tu tarea",
                    height: 200,
                    maxLines: 10,
                    enabled: false,
                  ),

                  const SizedBox(height: 10,),
                  const MyFormLabel(text: "Fecha"),
                  MyTextFormFieldTask(
                    controller: _fechaTextController,
                    text: "Dia mes año",
                    height: 50,
                    maxLines: 1,
                    enabled: false,
                  ),

                  const SizedBox(height: 10,),
                  const MyFormLabel(text: "Fecha de término"),
                  MyTextFormFieldTask(
                    controller: _fechaTerminoTextController,
                    text: "Dia mes año",
                    height: 50,
                    maxLines: 1,
                    enabled: false,
                  ),

                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
          const MyAppbar(title: "Completed Task", backButton: true,),
        ],
      ),
    );
  }

  myImageButton(BuildContext context){
    return Center(
      child: Container(
        height: 120, width: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.circle,

          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 1.5,
            style: BorderStyle.none,
          ),

        ),
        child: CircleAvatar(
          radius: 65,
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          backgroundImage: MemoryImage(base64Decode(imagen)),
        ),
      ),
    );
  }

}