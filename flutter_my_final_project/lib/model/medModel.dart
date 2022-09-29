class MedModel {
  String name;
  String descraption;
  String day;
  String time;
  String repeat;
  String consumption;
  bool isTaken;
  MedModel(
      {required this.name,
      required this.descraption,
      required this.day,
      required this.time,
      required this.repeat,
      required this.consumption,
      this.isTaken = false});
}
