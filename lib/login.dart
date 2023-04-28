import 'package:flutter/material.dart';
import 'package:my_task_list/app/my_bottom_navigation_bar.dart';
import 'package:my_task_list/my_widgets/my_body_container.dart';
import 'package:my_task_list/my_widgets/my_button.dart';
import 'package:my_task_list/my_widgets/my_content_text.dart';
import 'package:my_task_list/my_widgets/my_form_label.dart';
import 'package:my_task_list/my_widgets/my_text_form_field.dart';
import 'package:my_task_list/my_widgets/my_title_text.dart';
import 'package:my_task_list/singin.dart';

import 'my_widgets/my_appbar_painter.dart';

class Login extends StatefulWidget{
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _userTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: MyBodyContainer(
        widget: Column(
          children: [
            SizedBox(
              height: 350, width: double.maxFinite,
              //color: Colors.black12,
              child: CustomPaint(
                painter: MyAppbarPainter(context: context, isBlue: true),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(child: MyTitleText(text: "Iniciar Sesión")),
                    const SizedBox(height: 25,),
                    const MyFormLabel(text: "Nombre de Usuario"),
                    MyTextFormField(

                      controller: _userTextController,
                      text: "Coloca tu nombre de usuario",
                      icon: Icons.person_outline_rounded,
                      isPassword: false,
                    ),
                    const SizedBox(height: 25,),
                    const MyFormLabel(text: "Contraseña"),
                    MyTextFormField(
                      controller: _passwordTextController,
                      text: "Escribe tu contraseña",
                      icon: Icons.lock_outline_rounded,
                      isPassword: true,
                    ),
                    const SizedBox(height: 25,),
                    MyContentText(
                      text1: "¿No tienes una cuenta?",
                      text2: "Puedes ",
                      text3: "Crear una nueva",
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Singin())
                        );
                      },
                    ),
                    const SizedBox(height: 80,),
                    MyButton(
                      buttonText: "Continuar",
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyBottomNavigationBar())
                        );
                      },
                      isBlue: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}