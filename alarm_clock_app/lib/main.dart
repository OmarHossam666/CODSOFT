import 'package:alarm_clock_app/enums.dart';
import 'package:alarm_clock_app/models/menu_info.dart';
import 'package:alarm_clock_app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<MenuInfo>(
        create: (BuildContext context) => MenuInfo(MenuType.clock),
        child: const HomePage(),
      ),
    );
  }
}