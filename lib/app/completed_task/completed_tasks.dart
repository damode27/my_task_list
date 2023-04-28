import 'package:flutter/material.dart';
import 'package:my_task_list/app/completed_task/completed_task.dart';
import 'package:my_task_list/my_widgets/my_appbar.dart';
import '../../db/db.dart';
import '../../db/task.dart';
import '../../my_widgets/my_alert_dialog.dart';
import '../../my_widgets/my_task_card.dart';

class CompletedTasks extends StatefulWidget{
  @override
  State<CompletedTasks> createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  List<Task> tasks = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cargarTasks();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 120),
          child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, i) {
                if(tasks[i].terminada=='true'){
                  return Dismissible(key: Key(i.toString()),
                    direction: DismissDirection.startToEnd,
                    background: Container (
                        color: Theme.of(context).colorScheme.secondary,
                        padding: const EdgeInsets.only(left: 5),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.delete, color: Colors.white),
                        )
                    ),
                    confirmDismiss: (direction) async {
                      return await showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return const MyAlertDialog();
                        },
                      );
                    },
                    onDismissed: (direction) {
                      DB.delete(tasks[i]);
                    },
                    child: MyTaskCard(
                      titulo: tasks[i].titulo,
                      descripcion: tasks[i].descripcion,
                      fecha: tasks[i].fecha,
                      terminada: tasks[i].terminada,
                      id: tasks[i].id,
                      fechaTermino: tasks[i].fechaTermino,
                      imagen: tasks[i].imagen,
                      ruta: CompletedTask(
                        titulo: tasks[i].titulo,
                        descripcion: tasks[i].descripcion,
                        fecha: tasks[i].fecha,
                        terminada: tasks[i].terminada,
                        id: tasks[i].id,
                        fechaTermino: tasks[i].fechaTermino,
                        imagen: tasks[i].imagen,
                      ),
                    ),
                  );
                }
                else{
                  return const SizedBox();
                }
              }
          ),
        ),
        const MyAppbar(title: "Completadas", backButton: false,),
      ],
    );
  }

  cargarTasks() async {
    List<Task> auxTask = await DB.tasks();

    setState(() {
      tasks = auxTask;
    });
  }
}