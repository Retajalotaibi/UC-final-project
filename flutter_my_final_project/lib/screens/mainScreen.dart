import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_my_final_project/helpers/helper.dart';
import 'package:flutter_my_final_project/main.dart';
import 'package:flutter_my_final_project/model/medModel.dart';
import 'package:flutter_my_final_project/screens/addingScreen.dart';
import 'package:flutter_my_final_project/theme.dart';
import 'package:flutter_my_final_project/widgets/medButton.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainScreen extends ConsumerWidget {
  MainScreen({super.key});

  var isActive = false;
  void onAdd() {}
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List meds = ref.watch(medProvider);
    final DateTime date = ref.watch(dateProvider);
    final List todaysMed = getTodaysMed("$date", meds);

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
                        AddingScreen(selectedDate: date, onAdd: onAdd)),
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
                    ref.read(dateProvider.notifier).state = date;

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
                            name: todaysMed[index].name,
                            time: todaysMed[index].name,
                            isActive: todaysMed[index].isTaken,
                            onChange: () {
                              todaysMed[index].isTaken =
                                  !todaysMed[index].isTaken;
                            });
                      },
                      itemCount: todaysMed.length,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
