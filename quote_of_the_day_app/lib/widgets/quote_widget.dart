import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteWidget extends StatelessWidget {
  final String quote;
  final String author;
  final VoidCallback? onShareClick;
  final VoidCallback? onLikeClick;
  final VoidCallback? onNextClick;
  final VoidCallback? onPreviousClick;
  final Color pageColor;

  const QuoteWidget({
    super.key,
    required this.pageColor,
    required this.quote,
    required this.author,
    required this.onNextClick,
    required this.onPreviousClick,
    required this.onShareClick,
    required this.onLikeClick
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: pageColor,
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Image.asset(
            "assets/quote.png",
            height: 30,
            width: 30,
            color: Colors.white,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            quote,
            style: GoogleFonts.playfairDisplay(
              textStyle: const TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            author,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}