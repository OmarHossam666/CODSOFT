import 'package:alarm_clock_app/enums.dart';
import 'package:alarm_clock_app/models/menu_info.dart';
import 'package:alarm_clock_app/views/alarm_page.dart';
import 'package:alarm_clock_app/views/clock_page.dart';
import 'package:alarm_clock_app/views/stopwatch_page.dart';
import 'package:alarm_clock_app/views/timer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alarm_clock_app/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems
                .map((currentMenuInfo) =>
                    MenuButton(currentMenuInfo: currentMenuInfo))
                .toList(),
          ),
          const VerticalDivider(
            color: Colors.white70,
            width: 1,
          ),
          Expanded(
            child: Consumer<MenuInfo>(
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if (value.menuType == MenuType.clock) {
                  return const ClockPage();
                }
                else if (value.menuType == MenuType.alarm) {
                  return const AlarmPage();
                }
                else if (value.menuType == MenuType.timer) {
                  return const TimerPage();
                }
                else if(value.menuType == MenuType.stopwatch) {
                  return const StopwatchPage();
                }
                else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.currentMenuInfo,
  });

  final MenuInfo currentMenuInfo;

  @override
  Widget build(BuildContext context) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: TextButton(
            style: ButtonStyle(
                backgroundColor: currentMenuInfo.menuType == value.menuType
                    ? const WidgetStatePropertyAll(Colors.deepPurpleAccent)
                    : const WidgetStatePropertyAll(Colors.transparent)),
            onPressed: () {
              MenuInfo menuInfo = Provider.of<MenuInfo>(context, listen: false);
              menuInfo.updateMenu(currentMenuInfo);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  scale: 1.5,
                  currentMenuInfo.imageSource.toString(),
                ),
                const SizedBox(height: 16),
                Text(
                  currentMenuInfo.title.toString(),
                  style: const TextStyle(
                    fontFamily: "Avenir",
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}