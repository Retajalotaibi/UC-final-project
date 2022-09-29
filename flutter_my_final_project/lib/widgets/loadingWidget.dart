import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_my_final_project/theme.dart';

class LoadingWidget extends StatelessWidget {
  final int currentState;
  const LoadingWidget({super.key, required this.currentState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 25, bottom: 10),
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        Container(
          width: 1.5,
          height: 170,
          color: primaryColor,
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 10),
          width: 11,
          height: 11,
          decoration: BoxDecoration(
            color: this.currentState >= 1 ? primaryColor : Colors.transparent,
            border: Border.all(
                color: this.currentState >= 1 ? primaryColor : Colors.grey),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
        Container(
          width: 1.5,
          height: 270,
          color: this.currentState >= 1 ? primaryColor : Colors.grey,
        ),
        // Container(
        //   margin: EdgeInsets.only(top: 10, bottom: 10),
        //   width: 11,
        //   height: 11,
        //   decoration: BoxDecoration(
        //     color: this.currentState >= 2 ? primaryColor : Colors.transparent,
        //     border: Border.all(
        //         color: this.currentState >= 2 ? primaryColor : Colors.grey),
        //     borderRadius: BorderRadius.all(
        //       Radius.circular(20),
        //     ),
        //   ),
        // ),
        // Container(
        //   width: 1.5,
        //   height: 100,
        //   color: this.currentState >= 2 ? primaryColor : Colors.grey,
        // ),
      ],
    );
  }
}
