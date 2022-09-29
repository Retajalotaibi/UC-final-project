import 'package:flutter/material.dart';
import 'package:flutter_my_final_project/model/appData.dart';
import 'package:flutter_my_final_project/model/medModel.dart';
import 'package:flutter_my_final_project/screens/addingScreen.dart';
import 'package:flutter_my_final_project/screens/mainScreen.dart';
import 'package:flutter_my_final_project/screens/welcomeScreen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  static var meds = [
    MedModel(
      name: "advil",
      descraption: "fkdj",
      day: "2022-09-29 00:00:00.000",
      time: "10:20",
      repeat: "weekly",
      consumption: "2",
    ),
    MedModel(
        name: "1 advil",
        descraption: "fkdj",
        day: "2022-10-09 00:00:00.000",
        time: "10:20",
        repeat: "daily",
        consumption: "2"),
    MedModel(
        name: "2 advil",
        descraption: "fkdj",
        day: "2022-10-09 00:00:00.000",
        time: "10:20",
        repeat: "daily",
        consumption: "2"),
  ];
  dynamic tM = getTodaysMed("${DateTime.now()}", meds);

  void update(selectedDay) {
    tM = getTodaysMed("${selectedDay}", meds);
  }

  //List<MedModel>
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Cairo"),
      home: MainScreen(
          todaysMed: getTodaysMed("${DateTime.now()}", meds), update: update),
    );
  }
}

List getTodaysMed(String selectedDate, List meds) {
  //make a table of the right meds for each day

  var medTable = [];
  var w = DateTime.now().add(Duration(days: 7));
  //print(w);

  meds.forEach((med) => {
        if (med.repeat == "daily")
          {
            for (var i = 0; i < 15; i++)
              {
                medTable.add(MedModel(
                    name: med.name,
                    descraption: med.descraption,
                    day: "${DateTime.now().add(Duration(days: i))}",
                    time: med.time,
                    repeat: med.repeat,
                    consumption: med.consumption))
              }
          }
        else if (med.repeat == "weekly")
          {
            for (var i = 7; i < 60; i += 7)
              {
                medTable.add(MedModel(
                    name: med.name,
                    descraption: med.descraption,
                    day: "${DateTime.now().add(Duration(days: i))}",
                    time: med.time,
                    repeat: med.repeat,
                    consumption: med.consumption))
              }
          }
        else if (med.repeat == "monthly")
          {
            for (var i = 30; i < 120; i += 30)
              {
                medTable.add(MedModel(
                    name: med.name,
                    descraption: med.descraption,
                    day: "${DateTime.now().add(Duration(days: i))}",
                    time: med.time,
                    repeat: med.repeat,
                    consumption: med.consumption))
              }
          }
      });

  //filtter to get the current day meds
  medTable.forEach((i) => print("aasasasd ${i.name} ${i.day}"));
  var currentDayMeds = medTable
      .where((i) =>
          i.day.toString().split(" ")[0] ==
          selectedDate.toString().split(" ")[0])
      .toList();
  // print('DAy $selectedDate');
  // currentDayMeds.forEach((i) => print("MED EMD ${i.name} ${i.day}"));
  // print(medTable[0].day);
  return currentDayMeds;
}
