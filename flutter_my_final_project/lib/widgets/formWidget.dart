import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_my_final_project/theme.dart';
import 'package:flutter_my_final_project/widgets/textfieldWidget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget(
      {super.key, required this.nameController, required this.desController});

  final nameController;
  final desController;
  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          child: Text(
            "add a medicination to your collection",
            style: TextStyle(
              color: primaryColor,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FORM 🛑
              TextFieldWidget(
                name: "name",
                hint: "advil panadol etc",
                controller: widget.nameController,
                longText: false,
              ),
              Container(padding: EdgeInsets.symmetric(vertical: 20)),
              TextFieldWidget(
                  name: "descraption",
                  hint: 'important info about the medicination',
                  controller: widget.desController,
                  longText: true),
              // FORM 🛑
            ],
          ),
          margin: EdgeInsets.only(bottom: 180),
        ),
      ],
    );
  }
}
