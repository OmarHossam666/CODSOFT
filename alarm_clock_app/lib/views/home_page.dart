import 'package:alarm_clock_app/menu_info.dart';
import 'package:alarm_clock_app/views/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    DateTime dateTime = DateTime.now();
    String formattedTime = DateFormat("HH:mm").format(dateTime);
    String formattedDate = DateFormat("EEE, d MMM").format(dateTime);
    String timeZone = dateTime.timeZoneOffset.toString().split(".").first;
    String offsetSign = !timeZone.startsWith("-") ? "+" : "";

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
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text(
                          "Clock",
                          style: TextStyle(
                            fontFamily: "Avenir",
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          children: [
                            Text(
                              formattedTime,
                              style: const TextStyle(
                                fontFamily: "Avenir",
                                color: Colors.white,
                                fontSize: 60,
                              ),
                            ),
                            Text(
                              formattedDate,
                              style: const TextStyle(
                                fontFamily: "Avenir",
                                color: Colors.white,
                                fontSize: 32,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 4,
                        fit: FlexFit.tight,
                        child: Align(
                          alignment: Alignment.center,
                          child: ClockView(
                              size: MediaQuery.of(context).size.height / 3),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "TimeZone",
                              style: TextStyle(
                                fontFamily: "Avenir",
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                const Icon(
                                  Icons.language,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 16),
                                Text(
                                  "UTC$offsetSign$timeZone",
                                  style: const TextStyle(
                                    fontFamily: "Avenir",
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
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