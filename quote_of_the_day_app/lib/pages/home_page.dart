import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_of_the_day_app/models/quote_model.dart';
import 'package:quote_of_the_day_app/widgets/quote_widget.dart';
import 'package:random_color/random_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  String apiURL = "https://zenquotes.io/api/";

  Future<List<QuoteModel>> getQuotes() async {
    final response = await http.get(Uri.parse("${apiURL}quotes"));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      return data.map((json) => QuoteModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed to Generate a Quote");
    }
  }

  List<QuoteModel> postFromJson(String data) {
    List<QuoteModel> jsonData = json.decode(data);

    return jsonData;
  }

  final RandomColor _randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<QuoteModel>>(
          future: getQuotes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return ErrorWidget(snapshot.error!);
              }
              return Stack(
                children: [
                  PageView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var model = snapshot.data![index];
                        return QuoteWidget(
                          quote: model.q.toString(),
                          author: model.a.toString(),
                          pageColor: _randomColor.randomColor(
                            colorHue: ColorHue.multiple(
                              colorHues: [ColorHue.red, ColorHue.blue],
                            ),
                          ),
                        );
                      }),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}