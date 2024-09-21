import 'package:alarm_clock_app/enums.dart';
import 'package:alarm_clock_app/models/alarm_info.dart';
import 'package:alarm_clock_app/models/menu_info.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: "Clock", imageSource: "assets/clock_icon.png"),
  MenuInfo(MenuType.alarm,
      title: "Alarm", imageSource: "assets/alarm_icon.png"),
  MenuInfo(MenuType.timer,
      title: "Timer", imageSource: "assets/timer_icon.png"),
  MenuInfo(MenuType.stopwatch,
      title: "Stopwatch", imageSource: "assets/stopwatch_icon.png"),
];

List<AlarmInfo> alarms = [
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)),
      description: "Office"),
  AlarmInfo(DateTime.now().add(const Duration(hours: 1)),
      description: "Class"),
];