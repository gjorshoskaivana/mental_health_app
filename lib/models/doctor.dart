class Doctor{
  late final String name;
  late final String types;
  late final String aboutMe;

  Doctor({required this.name, required this.types, required this.aboutMe});
}

class Appointment{
  late final String doctor;
  late final String dateAndTime;

  Appointment({required this.doctor, required this.dateAndTime});
}