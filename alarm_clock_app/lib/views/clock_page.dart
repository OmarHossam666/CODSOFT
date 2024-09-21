import 'package:alarm_clock_app/views/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockPage extends StatefulWidget {
  const ClockPage({super.key});

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String formattedTime = DateFormat("HH:mm").format(dateTime);
    String formattedDate = DateFormat("EEE, d MMM").format(dateTime);
    String timeZone = dateTime.timeZoneOffset.toString().split(".").first;
    String offsetSign = !timeZone.startsWith("-") ? "+" : "";

    return Container(
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
              child: ClockView(size: MediaQuery.of(context).size.height / 3),
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
  }
}