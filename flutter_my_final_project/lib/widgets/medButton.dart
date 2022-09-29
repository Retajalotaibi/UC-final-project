import 'package:flutter/material.dart';
import 'package:flutter_my_final_project/theme.dart';

class MedButton extends StatefulWidget {
  final bool isActive;
  final onChange;
  final String name;
  final String time;
  MedButton(
      {super.key,
      required this.isActive,
      required this.onChange,
      required this.name,
      this.time = ""});

  @override
  State<MedButton> createState() => _MedButtonState();
}

class _MedButtonState extends State<MedButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.amber,
          height: 45,
          width: 4,
        ),
        // --- active button ---
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: widget.isActive
                      ? primaryColor
                      : Colors.grey.withOpacity(0.2), // change when active 🛑
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
              color: widget.isActive
                  ? primaryColor
                  : Colors.white, //change when acitve 🛑
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: widget.isActive
                      ? secondaryColor
                      : grayBorder)), // change here 🛑
          child: GestureDetector(
            onTap: widget.onChange,
            child: Container(child: Icon(Icons.check, color: Colors.white)),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
                textAlign: TextAlign.start,
              ),
              Text(widget.time, style: TextStyle(color: Colors.grey))
            ],
          ),
        )
      ],
    );
  }
}
