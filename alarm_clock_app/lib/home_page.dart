import 'package:alarm_clock_app/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MenuButton(text: "Clock", image: "assets/clock_icon.png"),
              MenuButton(text: "Alarm", image: "assets/alarm_icon.png"),
              MenuButton(text: "Timer", image: "assets/timer_icon.png"),
              MenuButton(text: "Stopwatch", image: "assets/stopwatch_icon.png"),
            ],
          ),
          const VerticalDivider(
            color: Colors.white70,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
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
    required this.text,
    required this.image,
  });

  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: TextButton(
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              scale: 1.5,
              image,
            ),
            const SizedBox(height: 16),
            Text(
              text,
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
  }
}
