class AlarmInfo {
  AlarmInfo(this.alarmDateTime , {this.description , this.isActive = false});

  DateTime alarmDateTime;
  String? description;
  bool isActive;
}