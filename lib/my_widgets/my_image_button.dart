//NOT USED

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImageButton extends StatefulWidget{
  const MyImageButton({super.key});

  @override
  State<MyImageButton> createState() => _MyImageButtonState();
}

class _MyImageButtonState extends State<MyImageButton> {
  File? _imagen;

  void getImage() async {
    var imagen = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _imagen = File(imagen!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  backgroundImage: FileImage(_imagen!),
                ),
        ),
      ),
    );
  }
}