import 'package:flutter/material.dart';

class MyBodyContainer extends StatelessWidget{
  final Widget widget;
  const MyBodyContainer({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: SingleChildScrollView(
        child: widget,
      ),
    );
  }

}