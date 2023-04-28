import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget{
  final TextEditingController controller;
  final String text;
  final IconData icon;
  final bool isPassword;
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.text,
    required this.icon,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        enableSuggestions: !isPassword,
        autocorrect: !isPassword,
        cursorColor: Theme.of(context).colorScheme.primary,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(color: Theme.of(context).colorScheme.primary,),
        decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
            suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: (){},
                )
              : IconButton(
                  icon: const Icon(
                    Icons.remove_red_eye_rounded,
                    color: Colors.transparent,
                  ),
                onPressed: (){},
              ),
            labelText: text,
            labelStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 15,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            contentPadding: const EdgeInsets.only(left: 10, right: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                  style: BorderStyle.solid
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                style: BorderStyle.solid,
                width: 1.5
              ),
            ),
            //errorStyle: const TextStyle(color: Colors.red),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Introduce este dato porfavor';
          }
          return null;
        },
        keyboardType: isPassword
            ? TextInputType.visiblePassword
            : TextInputType.name,
      ),
    );
  }

}