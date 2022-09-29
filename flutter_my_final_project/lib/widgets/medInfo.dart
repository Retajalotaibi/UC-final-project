import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_final_project/theme.dart';
import 'package:flutter_my_final_project/widgets/textfieldWidget.dart';

class MedInfo extends StatefulWidget {
  final hourController;
  final minController;
  final onAmChange;
  final isAm;
  final repeat;
  final onRepeatChange;
  final consumption;
  final onConsumptionChange;

  MedInfo(
      {super.key,
      required this.hourController,
      required this.minController,
      required this.onAmChange,
      required this.isAm,
      required this.repeat,
      required this.onRepeatChange,
      required this.consumption,
      required this.onConsumptionChange});

  @override
  State<MedInfo> createState() => _MedInfoState();
}

class _MedInfoState extends State<MedInfo> {
  bool dailyIsActive = false;

  DropdownMenuItem<String> buildMenu(String item) =>
      DropdownMenuItem(value: item, child: Text(item));
  //bool isAm = true;

  final days = ["daily", "weekly", "monthly"];
  final times = ["1 per day", "2 per day", "3 per day", "4 per day"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: EdgeInsets.only(bottom: 90),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            width: 300,
            child: Text(
              "How many times does your medicination repeat",
              style: TextStyle(
                color: primaryColor,
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "time of taking",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Container(
            width: 180,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 80,
                  width: 56,
                  child: TextField(
                    maxLength: 2,
                    keyboardType: TextInputType.datetime,
                    controller: widget.hourController,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "12",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 56,
                  child: TextField(
                    controller: widget.minController,
                    maxLength: 2,
                    keyboardType: TextInputType.datetime,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      counterText: "",
                      hintText: "30",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusColor: Colors.black,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 29,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  child: GestureDetector(
                    child: Text(
                      widget.isAm ? "AM" : "PM",
                      textAlign: TextAlign.center,
                    ),
                    onTap: widget.onAmChange,
                  ),
                ),
              ],
            ),
            padding: EdgeInsets.only(bottom: 70),
          ),
          Row(
            children: [
              Column(
                children: [
                  Text(
                    "repeat",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  DropdownButton(
                      items: days.map(buildMenu).toList(),
                      value: widget.repeat,
                      onChanged: (item) => widget.onRepeatChange(item)),
                ],
              ),
              Container(padding: EdgeInsets.only(right: 70)),
              Column(
                children: [
                  Text(
                    "consumption",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  DropdownButton(
                      value: widget.consumption,
                      items: times.map(buildMenu).toList(),
                      onChanged: (item) => widget.onConsumptionChange(item)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
