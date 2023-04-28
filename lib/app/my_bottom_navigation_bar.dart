import 'package:flutter/material.dart';
import 'package:my_task_list/app/completed_task/completed_tasks.dart';
import 'package:my_task_list/app/home/home.dart';
import 'package:my_task_list/app/new_task/new_task.dart';

class MyBottomNavigationBar extends StatefulWidget{
  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int indexTap = 0;

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<Widget> menuItems = [
      Home(),
      CompletedTasks(),
    ];

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: menuItems[indexTap],
      ),
      floatingActionButton: myFloatingActionButton(),
      bottomNavigationBar: myBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  myBottomNavigationBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTapTapped,
      currentIndex: indexTap,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      elevation: 10,
      selectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.tertiary,
        size: 35,
      ),
      unselectedIconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.tertiary,
        size: 32,
      ),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          label: "",
          icon: Container(
            margin: const EdgeInsets.only(right: 40),
            child: const Icon(Icons.description_outlined),
          ),
          activeIcon: Container(
            margin: const EdgeInsets.only(right: 40),
            child: const Icon(Icons.description),
          ),
        ),
        BottomNavigationBarItem(
            label: "",
            icon: Container(
              padding: const EdgeInsets.only(left: 40),
              child: const Icon(Icons.check),
            ),
            activeIcon: Container(
              padding: const EdgeInsets.only(left: 40),
              child: (const Icon(Icons.check_circle)),
            )
        ),
      ],
    );
  }

  myFloatingActionButton(){
    return Align(
      alignment: const Alignment(0, 0.95),
      child: SizedBox(
        height: 70, width: 70,
        child: FloatingActionButton(
          splashColor: Colors.transparent,
          elevation: 1,
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewTask())
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }

}