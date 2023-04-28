import 'package:flutter/material.dart';
import 'package:my_task_list/my_widgets/my_button.dart';
import 'package:my_task_list/my_widgets/my_button_actualizar.dart';

class MyAlertDialog extends StatelessWidget{

  const MyAlertDialog({super.key,});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text('¿Seguro que quieres eliminar ésta tarea?',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: 15,
        ),
      ),
      titlePadding: const EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 0),

      content: Text('No podrás recuperar las tareas eliminadas',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 15,
        ),
      ),
      contentPadding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 0),

      actionsPadding: const EdgeInsets.only(bottom: 20, top: 10),
      actionsAlignment: MainAxisAlignment.spaceAround,
      actions: [
        SizedBox(
          height: 34, width: 120,
          child: MyButtonActualizar(
            buttonText: Center(
              child: Text(
                "No",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            onPressed: () { Navigator.of(context).pop(false); },
          ),
        ),
        SizedBox(
          height: 34, width: 120,
          child: MyButton(
            buttonText: "Sí",
            onPressed: () { Navigator.of(context).pop(true); },
            isBlue: true,
          ),
        ),
      ],

      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),

    );
  }
}