import 'package:flutter/material.dart';

class MyTextFormFieldTask extends StatelessWidget{
  final TextEditingController controller;
  final String text;
  final double height;
  final int maxLines;
  final bool enabled;
  const MyTextFormFieldTask({
    super.key,
    required this.controller,
    required this.text,
    required this.height,
    required this.maxLines,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        enabled: enabled,
        textInputAction: (maxLines==1)
          ? TextInputAction.done
          : TextInputAction.newline,
        enableSuggestions: true,
        autocorrect: true,
        cursorColor: Theme.of(context).colorScheme.primary,
        textAlignVertical: TextAlignVertical.center,
        maxLines: maxLines,
        style: TextStyle(color: Theme.of(context).colorScheme.tertiary, fontSize: 14),
        decoration: InputDecoration(
          label: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                text,
                maxLines: maxLines,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 25),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
                style: BorderStyle.solid
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
                style: BorderStyle.solid
            ),
          ),
          filled: !enabled,
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                style: BorderStyle.solid,
                width: 1.5
            ),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Introduce este dato porfavor';
          }
          return null;
        },
      ),
    );
  }

}