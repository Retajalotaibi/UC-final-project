import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class TextFieldWidget extends StatelessWidget {
  final String name;
  final String hint;
  final bool longText;
  final controller;
  const TextFieldWidget(
      {super.key,
      required this.name,
      required this.hint,
      required this.longText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Container(
          width: 250,
          height: 40,
          child: TextField(
            // maxLines: this.longText ? null : 1,
            controller: this.controller,
            keyboardType:
                this.longText ? TextInputType.multiline : TextInputType.name,
            style: TextStyle(fontSize: 13),
            decoration: InputDecoration(
              hintText: this.hint,
              focusColor: Colors.black,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
