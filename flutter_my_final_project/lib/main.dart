import 'package:flutter/material.dart';
import 'package:flutter_my_final_project/helpers/helper.dart';
import 'package:flutter_my_final_project/model/appData.dart';
import 'package:flutter_my_final_project/model/medModel.dart';
import 'package:flutter_my_final_project/screens/addingScreen.dart';
import 'package:flutter_my_final_project/screens/mainScreen.dart';
import 'package:flutter_my_final_project/screens/welcomeScreen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod/riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

final medProvider = StateProvider((ref) => [
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
    ]);

final medFamily = FutureProvider.family((ref, date) {
  final meds = ref.watch(medProvider.notifier).state;

  return getTodaysMed("$date", meds);
});
final dateProvider = StateProvider((ref) => DateTime.now());
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //List<MedModel>
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: "Cairo"),
        home: MainScreen());
  }
}
