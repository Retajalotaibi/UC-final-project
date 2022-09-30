import 'package:flutter_my_final_project/model/medModel.dart';

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
