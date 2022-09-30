import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_my_final_project/screens/mainScreen.dart';
import 'package:flutter_my_final_project/theme.dart';
import 'package:flutter_my_final_project/widgets/formWidget.dart';
import 'package:flutter_my_final_project/widgets/loadingWidget.dart';

import 'package:flutter_my_final_project/widgets/medInfo.dart';
import 'package:flutter_my_final_project/widgets/textfieldWidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddingScreen extends ConsumerStatefulWidget {
  final selectedDate;
  final onAdd;
  const AddingScreen(
      {super.key, required this.selectedDate, required this.onAdd});

  @override
  State<AddingScreen> createState() => _AddingScreenState();
}

class _AddingScreenState extends State<AddingScreen> {
  int currentState = 0;
  final nameController = TextEditingController();
  final desController = TextEditingController();
  final hourController = TextEditingController();
  final minController = TextEditingController();
  var isAm = true;
  var repeat;
  var consumption;

  // on am chnge
  void OnAmChange() {
    isAm = !isAm;
    setState(() {});
  }

  void onRepeatChange(input) {
    repeat = input;
    setState(() {});
  }

  void onConsumptionChange(input) {
    consumption = input;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: primaryColor),
      ),
      body: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingWidget(currentState: currentState),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    currentState == 0
                        ? FormWidget(
                            nameController: nameController,
                            desController: desController,
                          )
                        : MedInfo(
                            hourController: hourController,
                            minController: minController,
                            isAm: isAm,
                            onAmChange: OnAmChange,
                            repeat: repeat,
                            onRepeatChange: onRepeatChange,
                            consumption: consumption,
                            onConsumptionChange: onConsumptionChange,
                          ),

                    // BUTTON
                    Container(
                      width: 250,
                      height: 45,
                      decoration: BoxDecoration(
                        color: primaryColor, //change when acitve 🛑
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: TextButton(
                        onPressed: () {
                          currentState += 1;
                          if (currentState == 2) {
                            print(
                                'name is ${nameController.text} des is ${desController.text} hour is ${hourController.text}:${minController.text}');
                            print(isAm);
                            print(repeat);
                            print(consumption);
                            Navigator.pop(context);
                          }
                          setState(() {});
                        },
                        child: Container(
                          child: Text(
                            currentState == 1 ? "add" : "next",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
