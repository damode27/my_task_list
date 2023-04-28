import 'package:flutter/material.dart';

import 'app/my_bottom_navigation_bar.dart';
import 'my_widgets/my_appbar_painter.dart';
import 'my_widgets/my_body_container.dart';
import 'my_widgets/my_button.dart';
import 'my_widgets/my_content_text.dart';
import 'my_widgets/my_form_label.dart';
import 'my_widgets/my_text_form_field.dart';
import 'my_widgets/my_title_text.dart';

class Singin extends StatefulWidget{
  @override
  State<Singin> createState() => _SinginState();
}

class _SinginState extends State<Singin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _passwordTextController1 = TextEditingController();
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
                painter: MyAppbarPainter(context: context, isBlue: false),
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
                    const Center(child: MyTitleText(text: "Crear una Cuenta")),
                    const SizedBox(height: 20,),
                    const MyFormLabel(text: "Nombre de Usuario"),
                    MyTextFormField(
                      controller: _userTextController,
                      text: "Escribe un nombre de usuario",
                      icon: Icons.person_outline_rounded,
                      isPassword: false,
                    ),
                    const SizedBox(height: 20,),
                    const MyFormLabel(text: "Escoge una Contraseña"),
                    MyTextFormField(
                      controller: _passwordTextController,
                      text: "Contraseña mayor a 8 digitos",
                      icon: Icons.lock_outline_rounded,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20,),
                    const MyFormLabel(text: "Confirma tu Contraseña"),
                    MyTextFormField(
                      controller: _passwordTextController1,
                      text: "Verifica tu contraseña",
                      icon: Icons.lock_outline_rounded,
                      isPassword: true,
                    ),
                    const SizedBox(height: 20,),
                    MyContentText(
                      text1: "¿Ya tienes una contraseña?",
                      text2: "Puedes ",
                      text3: "Ingresar con tu cuenta",
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 30,),
                    MyButton(
                      buttonText: "Continuar",
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyBottomNavigationBar())
                        );
                      },
                      isBlue: false,
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