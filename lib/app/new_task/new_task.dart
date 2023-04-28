import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_task_list/db/task.dart';
import 'package:my_task_list/my_widgets/my_appbar.dart';
import 'package:my_task_list/my_widgets/my_body_container.dart';
import 'package:my_task_list/my_widgets/my_button.dart';
import 'package:my_task_list/my_widgets/my_form_label.dart';
import 'package:my_task_list/my_widgets/my_image_text.dart';
import 'package:my_task_list/my_widgets/my_text_form_field_task.dart';
import '../../db/db.dart';
import '../my_bottom_navigation_bar.dart';

class NewTask extends StatefulWidget{
  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  final TextEditingController _tituloTextController = TextEditingController();
  final TextEditingController _descripcionTextController = TextEditingController();
  final TextEditingController _fechaTextController = TextEditingController();

  File? _imagen;
  String imagenRuta = "";

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
                  const MyImageText(text: "Click para abrir galeria"),

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
                  MyButton(
                    buttonText: "Crear",
                    onPressed: () { crearTarea(context); },
                    isBlue: true,
                  ),

                ],
              ),
            ),
          ),
          const MyAppbar(title: "New Task", backButton: true,),
        ],
      ),
    );
  }

  crearTarea(BuildContext context){
    DB.insert(
      Task(
        titulo: _tituloTextController.text,
        descripcion: _descripcionTextController.text,
        fecha: _fechaTextController.text,
        terminada: "false",
        fechaTermino: "",
        imagen: imagenRuta,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Tarea creada."),
    ));

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyBottomNavigationBar())
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
            //borderRadius: BorderRadius.circular(100),
            shape: BoxShape.circle,

            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 1.5,
              style: (_imagen==null) ? BorderStyle.solid : BorderStyle.none,
            ),

          ),
          child: (_imagen==null)
              ? Icon(
                  Icons.photo_library_outlined,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 60,
                )
              : CircleAvatar(
                  radius: 65,
                  backgroundColor: Theme.of(context).colorScheme.tertiary,
                  backgroundImage: FileImage(_imagen!),
                ),
        ),
      ),
    );
  }
}