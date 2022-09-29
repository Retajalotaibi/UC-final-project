import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_final_project/model/medModel.dart';
import 'package:flutter_my_final_project/screens/addingScreen.dart';
import 'package:flutter_my_final_project/theme.dart';
import 'package:flutter_my_final_project/widgets/medButton.dart';

class MainScreen extends StatefulWidget {
  final todaysMed;
  final update;
  const MainScreen({super.key, required this.todaysMed, required this.update});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime selectedDate = DateTime.now();
  var isActive = false;

  void onAdd() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calender",
          style: TextStyle(
            color: Colors.black,
            fontSize: 29,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 16)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AddingScreen(selectedDate: selectedDate, onAdd: onAdd)),
              );
            },
            icon: Icon(Icons.add, color: Colors.black, size: 35),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle, color: Colors.black, size: 35),
          )
        ],

        // to make the app bar clear and wtvr
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: DatePicker(
                  DateTime.now(),
                  height: 120,
                  width: 70,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: primaryColor,
                  selectedTextColor: Colors.white,
                  dateTextStyle: TextStyle(fontSize: 20),
                  onDateChange: (date) {
                    selectedDate = date;
                    widget.update("$selectedDate");

                    print(widget.todaysMed.length);
                    // print(selectedDate);
                  },
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    width: double.infinity,
                    child: Text("up coming",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                        textAlign: TextAlign.start),
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return MedButton(
                            name: widget.todaysMed[index].name,
                            time: widget.todaysMed[index].name,
                            isActive: widget.todaysMed[index].isTaken,
                            onChange: () {
                              print("tday len ${widget.todaysMed.length}");
                              widget.todaysMed[index].isTaken =
                                  !widget.todaysMed[index].isTaken;
                              setState(() {});
                            });
                      },
                      itemCount: widget.todaysMed.length,
                    ),
                  ),
                  // MedButton(
                  //     name: "advil",
                  //     time: "8:30 daily",
                  //     isActive: isActive,
                  //     onChange: () {
                  //       getTodaysMed("$selectedDate", meds);
                  //       isActive = !isActive;
                  //       setState(() {});
                  //     }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
