import 'dart:convert';
import 'dart:io';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_task_list/db/task.dart';
import 'package:my_task_list/my_widgets/my_appbar.dart';
import 'package:my_task_list/my_widgets/my_body_container.dart';
import 'package:my_task_list/my_widgets/my_button.dart';
import 'package:my_task_list/my_widgets/my_button_actualizar.dart';
import 'package:my_task_list/my_widgets/my_form_label.dart';
import 'package:my_task_list/my_widgets/my_image_text.dart';
import 'package:my_task_list/my_widgets/my_text_form_field_task.dart';
import '../../db/db.dart';
import '../my_bottom_navigation_bar.dart';

class EditTask extends StatefulWidget{
  final String titulo, descripcion, fecha, terminada, fechaTermino, imagen;
  final int? id;
  EditTask({super.key,
    required this.titulo,
    required this.descripcion,
    required this.fecha,
    required this.terminada,
    required this.fechaTermino,
    required this.imagen,
    this.id
  });

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final TextEditingController _tituloTextController = TextEditingController();
  final TextEditingController _descripcionTextController = TextEditingController();
  final TextEditingController _fechaTextController = TextEditingController();

  File? _imagen;
  String imagenRuta = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagenRuta = widget.imagen;
  }

  void getImage() async {
    var imagen = await ImagePicker().pickImage(source: ImageSource.camera);

    final bytes = File(imagen!.path).readAsBytesSync();
    final image_now = base64Encode(bytes);

    setState(() {
      _imagen = File(imagen!.path);
      imagenRuta = image_now;

      print(image_now);
    });
  }

  @override
  Widget build(BuildContext context) {
    _tituloTextController.text = widget.titulo;
    _descripcionTextController.text = widget.descripcion;
    _fechaTextController.text = widget.fecha;

    Task? task = ModalRoute.of(context)?.settings.arguments as Task?;

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
                  myImageButton(),
                  const MyImageText(text: "Click para cambiar imagen"),

                  const SizedBox(height: 10,),
                  const MyFormLabel(text: "Título"),
                  MyTextFormFieldTask(
                    controller: _tituloTextController,
                    text: "Escribe aquí el título de tu tarea",
                    height: 50,
                    maxLines: 1,
                    enabled: true,
                  ),

                  const SizedBox(height: 10,),
                  const MyFormLabel(text: "Descripción"),
                  MyTextFormFieldTask(
                    controller: _descripcionTextController,
                    text: "Describe cómo será tu tarea",
                    height: 200,
                    maxLines: 10,
                    enabled: true,
                  ),

                  const SizedBox(height: 10,),
                  const MyFormLabel(text: "Fecha"),
                  MyTextFormFieldTask(
                    controller: _fechaTextController,
                    text: "Dia mes año",
                    height: 50,
                    maxLines: 1,
                    enabled: true,
                  ),

                  const SizedBox(height: 40,),
                  MyButtonActualizar(
                    buttonText: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_outlined,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        const SizedBox(width: 5,),
                        Text(
                          "Actualizar",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    onPressed: (){ actualizarTarea(context); },
                  ),

                  const SizedBox(height: 20,),
                  MyButton(
                    buttonText: "Completar tarea",
                    onPressed: () { completarTarea(context); },
                    isBlue: true,
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
          const MyAppbar(title: "Edit Task", backButton: true,),
        ],
      ),
    );
  }

  completarTarea(BuildContext context){
    final now = DateTime.now();
    final formattedDate = DateFormat('dd/MM/yyyy').format(now);

    Task task = Task(
      id: widget.id,
      titulo: _tituloTextController.text,
      descripcion: _descripcionTextController.text,
      fecha: _fechaTextController.text,
      terminada: "true",
      fechaTermino: formattedDate,
      imagen: imagenRuta,
    );

    DB.update(
      task
    );

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Tarea completada."),
    ));



    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
    );
  }

  actualizarTarea(BuildContext context){
    Task task = Task(
      id: widget.id,
      titulo: _tituloTextController.text,
      descripcion: _descripcionTextController.text,
      fecha: _fechaTextController.text,
      terminada: "false",
      fechaTermino: "",
      imagen: imagenRuta,
    );

    DB.update(
        task
    );

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Tarea actualizada."),
    ));



    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyBottomNavigationBar()),
    );
  }

  myImageButton(){
    return Center(
      child: GestureDetector(
        onTap: (){
          getImage();
        },
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
            backgroundImage: MemoryImage(base64Decode(imagenRuta)),
          ),
        ),
      ),
    );
  }
}