import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quote_of_the_day_app/models/quote_model.dart';
import 'package:quote_of_the_day_app/widgets/quote_widget.dart';
import 'package:random_color/random_color.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var apiURL = "https://zenquotes.io/api/";
  PageController controller = PageController();

  Future<List<QuoteModel>> getQuote() async {
    final response = await http.get(Uri.parse("${apiURL}quotes"));
    
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => QuoteModel.fromJson(json)).toList();
    }
    else {
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
          future: getQuote(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return ErrorWidget(snapshot.error!);
              }
              return Stack(
                children: [
                  PageView.builder(
                      controller: controller,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        var model = snapshot.data![index];
                        return QuoteWidget(
                          quote: model.q.toString(),
                          author: model.a.toString(),
                          onPreviousClick: () {
                            controller.previousPage(
                              duration:  const Duration(milliseconds: 100),
                              curve: Curves.easeInBack
                            );
                          },
                          onNextClick: () {
                            controller.nextPage(
                                duration: const Duration(milliseconds: 100),
                                curve: Curves.easeIn
                              );
                          },
                          pageColor: _randomColor.randomColor(
                            colorHue: ColorHue.multiple(
                              colorHues: [ColorHue.red, ColorHue.blue],
                            ),
                          ),
                          onShareClick: () async {
                            final quote = snapshot.data![index].q.toString();
                            final author = snapshot.data![index].a.toString();
                            final text = '"$quote" - $author';

                            await Share.share(text);
                          },
                          onLikeClick: null,
                        );
                      }),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (kIsWeb)
                          InkWell(
                            onTap: () {
                              controller.previousPage(
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.easeOut);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              padding: const EdgeInsets.all(10),
                              child: const Icon(
                                Icons.navigate_before,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 1, color: Colors.white)),
                            padding: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if (kIsWeb)
                          InkWell(
                            onTap: () {
                              controller.nextPage(
                                  duration: const Duration(seconds: 1),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: Colors.white)),
                              padding: const EdgeInsets.all(10),
                              child: const Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}